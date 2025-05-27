/*
 * Copyright (c) 2023 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.dialects.ibm;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.CompilerDirectivesLexer;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesErrorListener;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesErrorStrategy;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesVisitor;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorContext;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Preprocessor stage */
@RequiredArgsConstructor
public class PreprocessorStage
    implements Stage<AnalysisContext, CopybooksRepository, DialectOutcome> {
  private final GrammarPreprocessor grammarPreprocessor;
  private final CleanerPreprocessor preprocessor;
  private final MessageService messageService;
  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(?i)(?:\\d.{5}.*|\\s*)>>\\s*(?<compilerDirectives>.+)");
  private static final Pattern NEW_LINE_PATTERN = Pattern.compile("\r?\n");
  private static final Pattern SECTION_PATTERN =
      Pattern.compile(
          "(?i)\\s*DATA\\s+DIVISION.*|\\s*WORKING-STORAGE.*|\\s*PROCEDURE\\s+DIVISION.*");
  private static final Pattern JAVA_SHAREABLE_ON_PATTERN =
      Pattern.compile("(?i)\\s*>>\\s?JAVA-SHAREABLE\\s+ON\\s*");
  private static final Pattern DIALECT_FILLER_PATTERN =
      Pattern.compile(String.format("^[%s%s]*$", "\\s", CobolDialect.FILLER));

  @Override
  public StageResult<CopybooksRepository> run(
      AnalysisContext context, StageResult<DialectOutcome> prevStageResult) {
    // Preprocessor (replacement, copybooks)
    CopybooksRepository copybooksRepository =
        runPreprocessor(context.getExtendedDocument().getUri(), context);
    applyDialectCopybooks(copybooksRepository, prevStageResult.getData().getDialectNodes());

    context.setDialectNodes(prevStageResult.getData().getDialectNodes());
    context.setCopybooksRepository(copybooksRepository);

    processCobolJavaInteroperabilityDirectives(context);

    return new StageResult<>(copybooksRepository);
  }

  @Override
  public String getName() {
    return "Preprocessing";
  }

  private void applyDialectCopybooks(
      CopybooksRepository copybooksRepository, List<Node> dialectNodes) {
    dialectNodes.stream()
        .filter(n -> n instanceof CopyNode)
        .map(CopyNode.class::cast)
        .filter(n -> n.getUri() != null)
        .forEach(
            n -> {
              copybooksRepository.addStatement(n.getName(), n.getDialect(), n.getLocality());
              copybooksRepository.define(
                  n.getName(), n.getDialect(), n.getNameLocation().getUri(), n.getUri());
            });
  }

  private CopybooksRepository runPreprocessor(String programDocumentUri, AnalysisContext ctx) {
    List<SyntaxError> preprocessorErrors = new ArrayList<>();
    ExtendedDocument extendedDocument = ctx.getExtendedDocument();
    PreprocessorContext context =
        new PreprocessorContext(
            programDocumentUri,
            extendedDocument,
            ctx.getConfig().getCopybookProcessingMode(),
            new CopybookHierarchy(),
            new CopybooksRepository());

    CopybooksRepository copybooks =
        grammarPreprocessor.preprocess(context, preprocessor).unwrap(preprocessorErrors::addAll);
    extendedDocument.commitTransformations();

    ctx.getAccumulatedErrors().addAll(preprocessorErrors);
    return copybooks;
  }

  private void processCobolJavaInteroperabilityDirectives(AnalysisContext ctx) {
    String text = ctx.getExtendedDocument().getCurrentText().toString();

    String[] lines = NEW_LINE_PATTERN.split(text);
    String section = "";
    boolean isJavaShareableOn = false;
    StringBuilder lineBuffer = new StringBuilder();
    final int bufferSize = 100;

    for (int i = 0; i < lines.length; i++) {
      Matcher directivesLine = COMPILER_DIRECTIVE_LINE.matcher(lines[i]);

      lineBuffer.append(" ").append(lines[i].trim());
      if (lineBuffer.length() > bufferSize) {
        lineBuffer.delete(0, lineBuffer.length() - bufferSize);
      }

      String bufferText = lineBuffer.toString().trim();
      Matcher sectionMatcher = SECTION_PATTERN.matcher(bufferText);
      if (sectionMatcher.find()) {
        section = sectionMatcher.group();
        lineBuffer.setLength(0);
      }

      if (!isJavaShareableOn && JAVA_SHAREABLE_ON_PATTERN.matcher(lines[i]).matches()) {
        isJavaShareableOn = true;
      }
      if (!directivesLine.matches()) {
        continue;
      }

      String compilerDirectives = directivesLine.group("compilerDirectives");
      if (compilerDirectives != null) {
        ctx.getDialectNodes()
            .addAll(
                process(
                    compilerDirectives,
                    ctx,
                    new Position(i, directivesLine.start("compilerDirectives")),
                    section,
                    directivesLine.group(),
                    isJavaShareableOn));
      }

      String newText = new String(new char[lines[i].length()]).replace('\0', ' ');
      Range range = new Range(new Position(i, 0), new Position(i, lines[i].length()));
      ctx.getExtendedDocument().replace(range, newText);
    }
  }

  private List<Node> process(
      String directiveText,
      AnalysisContext ctx,
      Position startPosition,
      String section,
      String directiveLineText,
      boolean isJavaShareableOn) {
    if (!DIALECT_FILLER_PATTERN.matcher(directiveText).matches()) {
      CompilerDirectivesLexer lexer =
          new CompilerDirectivesLexer(CharStreams.fromString(directiveText));
      lexer.removeErrorListeners();

      CompilerDirectivesParser parser = new CompilerDirectivesParser(new CommonTokenStream(lexer));
      parser.removeErrorListeners();
      parser.setErrorHandler(new CompilerDirectivesErrorStrategy(messageService));
      parser.addErrorListener(new CompilerDirectivesErrorListener(ctx, startPosition));

      CompilerDirectivesVisitor visitor =
          new CompilerDirectivesVisitor(
              ctx, messageService, startPosition, section, directiveLineText, isJavaShareableOn);

      return visitor.visitCompilerDirectives(parser.compilerDirectives());
    }
    return ImmutableList.of();
  }
}
