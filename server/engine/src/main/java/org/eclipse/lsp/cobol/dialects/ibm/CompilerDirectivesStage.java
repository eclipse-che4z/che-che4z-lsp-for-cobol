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

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.CompilerDirectivesLexer;
import org.eclipse.lsp.cobol.core.CompilerDirectivesParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesErrorListener;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesVisitor;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Process compiler options statements in the source file and substitute them with empty lines.
 */
public class CompilerDirectivesStage implements Stage<AnalysisContext, List<Node>, List<CompilerDirectiveNode>> {
  private static final Pattern COMPILER_DIRECTIVE_LINE =
          Pattern.compile("(?i)(\\d.{5}.*|\\s*+)\\*?(CBL|PROCESS)\\s+(?<compilerOptions>.+)|JAVA-CALLABLE|JAVA-SHAREABLE\\s+(ON|OFF)\\s*");
  private static final Pattern NEW_LINE_PATTERN = Pattern.compile("\n\r?");
  private static final Pattern DIALECT_FILLER_PATTERN = Pattern.compile(String.format("^[%s%s]*$", "\\s", CobolDialect.FILLER));
  private final MessageService messageService;

  public CompilerDirectivesStage(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public StageResult<List<Node>> run(AnalysisContext ctx, StageResult<List<CompilerDirectiveNode>> prevStageResult) {
    String text = ctx.getExtendedDocument().getCurrentText().toString();
    List<Node> nodes = new ArrayList<>();
    String[] lines = NEW_LINE_PATTERN.split(text);
    for (int i = 0; i < lines.length; i++) {
      Matcher directivesLine = COMPILER_DIRECTIVE_LINE.matcher(lines[i]);
      if (!directivesLine.find()) {
        // we could stop on "IDENTIFICATION DIVISION"
        continue;
      }

      String compilerOptions = directivesLine.group("compilerOptions");
      if (compilerOptions != null) {
        process(compilerOptions, ctx, new Position(i, directivesLine.start("compilerOptions")), "compilerOptions");
      }
      if (Pattern.compile("(?i).*JAVA-SHAREABLE\\s+ON.*").matcher(lines[i]).matches()) {
        nodes.addAll(process(text, ctx, new Position(i, directivesLine.start()), "compilerDirectives"));
      } else if (Pattern.compile("(?i).*JAVA-CALLABLE.*").matcher(lines[i]).matches()) {
        nodes.addAll(process(lines[i], ctx, new Position(i, directivesLine.start()), "compilerDirectives"));
      }

      String newText = new String(new char[lines[i].length()]).replace('\0', ' ');
      Range range = new Range(
              new Position(i, 0),
              new Position(i, lines[i].length()));
      ctx.getExtendedDocument().replace(range, newText);
    }

    return new StageResult<>(nodes);
  }

  private List<Node> process(String directiveText, AnalysisContext ctx, Position startPosition, String parserRule) {
    if (!DIALECT_FILLER_PATTERN.matcher(directiveText).matches()) {
      CompilerDirectivesLexer lexer = new CompilerDirectivesLexer(CharStreams.fromString(directiveText));
      lexer.removeErrorListeners();

      CompilerDirectivesParser parser = new CompilerDirectivesParser(new CommonTokenStream(lexer));
      parser.removeErrorListeners();
      parser.setErrorHandler(new CobolErrorStrategy(messageService));
      parser.addErrorListener(new CompilerDirectivesErrorListener(ctx, startPosition));

      CompilerDirectivesVisitor visitor = new CompilerDirectivesVisitor(ctx, messageService, startPosition);

      if (parserRule.equals("compilerOptions")) {
        visitor.visitCompilerOptions(parser.compilerOptions());
      } else if (parserRule.equals("compilerDirectives")) {
//        visitor.visit(parser.compilerDirectives());
        List<Node> nodes = new ArrayList<>(visitor.visitCompilerDirectives(parser.compilerDirectives()));
        List<SyntaxError> parseError = new ArrayList<>(visitor.getErrors());
        parseError.forEach(error -> error.getLocation().getLocation().setRange(
                ctx.getExtendedDocument().mapLocation(error.getLocation().getLocation().getRange()).getRange()));

        ctx.getAccumulatedErrors().addAll(parseError);
        return nodes;

      }
    }
    return ImmutableList.of();
  }

  @Override
  public String getName() {
    return "Compiler Directives processing";
  }
}
