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
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesErrorListener;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesErrorStrategy;
import org.eclipse.lsp.cobol.core.engine.directives.CompilerDirectivesVisitor;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.parser.AntlrCobolParser;
import org.eclipse.lsp.cobol.parser.AstBuilder;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;

/** Parser stage */
@RequiredArgsConstructor
public class ParserStage implements Stage<AnalysisContext, ParserStageResult, DialectOutcome> {
  private final MessageService messageService;
  private final ParseTreeListener treeListener;

  @Override
  public StageResult<ParserStageResult> run(
      AnalysisContext context, StageResult<DialectOutcome> prevStageResult) {
    // Run parser;
    context.setDialectNodes(
        ImmutableList.<Node>builder()
            .addAll(context.getDialectNodes())
            .addAll(prevStageResult.getData().getDialectNodes())
            .build());
    ParserListener listener =
        new ParserListener(context.getExtendedDocument(), context.getCopybooksRepository());
    DefaultErrorStrategy errorStrategy = new CobolErrorStrategy(messageService);
    AstBuilder parser =
        new AntlrCobolParser(
            CharStreams.fromString(context.getExtendedDocument().toString()),
            listener,
            errorStrategy,
            treeListener);
    CobolParser.StartRuleContext tree = parser.runParser();
    context.getAccumulatedErrors().addAll(listener.getErrors());
    context.getAccumulatedErrors().addAll(getParsingError(context, parser));
    processCobolJavaInteroperabilityDirectives(context, parser.getTokens());
    return new StageResult<>(new ParserStageResult(parser.getTokens(), tree));
  }

  private List<SyntaxError> getParsingError(AnalysisContext context, AstBuilder parser) {
    return parser.diagnostics().stream()
        .map(
            diagnostic -> {
              Location location = context.getExtendedDocument().mapLocation(diagnostic.getRange());
              String copybookId =
                  context.getCopybooksRepository().getCopybookIdByUri(location.getUri());
              return SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(new OriginalLocation(location, copybookId))
                  .suggestion(diagnostic.getMessage())
                  .build();
            })
        .collect(Collectors.toList());
  }

  @Override
  public String getName() {
    return "Parsing stage";
  }

  private void processCobolJavaInteroperabilityDirectives(
      AnalysisContext context, CommonTokenStream tokenStream) {
    List<Token> compilerLineTokens =
        tokenStream.getTokens().stream()
            .filter(token -> token.getType() == CobolLexer.COMPILERLINE || == IDENTIFICATION  ||  ==DATA || PROCEDURE)
            .collect(Collectors.toList());

    List<Token> sectionLineTokens =
        tokenStream.getTokens().stream()
            .filter(token -> token.getChannel() == Lexer.DEFAULT_MODE)
            .filter(
                token ->
                    token.getType() == CobolLexer.DATA
                        || token.getType() == CobolLexer.WORKING_STORAGE
                        || token.getType() == CobolLexer.PROCEDURE)
            .collect(Collectors.toList());

    boolean isJavaShareableOn = false;

    CompilerDirectivesLexer lexer = new CompilerDirectivesLexer(null);
    lexer.removeErrorListeners();

    CompilerDirectivesParser parser = new CompilerDirectivesParser(null);
    parser.removeErrorListeners();
    parser.setErrorHandler(new CompilerDirectivesErrorStrategy(messageService));

    List<Node> mutableDialectNodes = new ArrayList<>(context.getDialectNodes());

    for (Token token : compilerLineTokens) {
      String tokenText = token.getText();
      String currentSection = getCurrentSection(sectionLineTokens, token);

      if (tokenText.matches("(?i)\\s*>>\\s?JAVA-SHAREABLE\\s+ON\\s*")) {
        isJavaShareableOn = true;
      }

      Matcher matcher = Pattern.compile("(?i)>>\\s*(?<content>.+)").matcher(tokenText);
      if (matcher.find()) {
        String directiveContent = matcher.group("content");
        if (directiveContent != null && !directiveContent.trim().isEmpty()) {
          Position startPosition =
              new Position(
                  token.getLine() - 1, token.getCharPositionInLine() + matcher.start("content"));

          List<Node> directiveNodes =
              processCompilerDirective(
                  directiveContent,
                  context,
                  startPosition,
                  currentSection,
                  tokenText,
                  isJavaShareableOn,
                  lexer,
                  parser);

          mutableDialectNodes.addAll(directiveNodes);
        }
      }
    }
    context.setDialectNodes(mutableDialectNodes);
  }

  private String getCurrentSection(List<Token> sectionLineTokens, Token compilerLineToken) {
    int compilerLineNumber = compilerLineToken.getLine();

    return sectionLineTokens.stream()
        .filter(token -> token.getLine() < compilerLineNumber)
        .max(Comparator.comparingInt(Token::getLine))
        .map(this::mapTokenToSection)
        .orElse("");
  }

  private String mapTokenToSection(Token token) {
    switch (token.getText()) {
      case "DATA":
        return DivisionType.DATA_DIVISION.getDivName();
      case "WORKING-STORAGE":
        return SectionType.WORKING_STORAGE.getType();
      case "PROCEDURE":
        return DivisionType.PROCEDURE_DIVISION.getDivName();
      default:
        return "";
    }
  }

  private List<Node> processCompilerDirective(
      String directiveText,
      AnalysisContext ctx,
      Position startPosition,
      String section,
      String directiveLineText,
      boolean isJavaShareableOn,
      CompilerDirectivesLexer lexer,
      CompilerDirectivesParser parser) {

    lexer.setInputStream(CharStreams.fromString(directiveText));
    lexer.reset();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    parser.setTokenStream(tokens);
    parser.reset();

    parser.removeErrorListeners();
    parser.addErrorListener(new CompilerDirectivesErrorListener(ctx, startPosition));

    CompilerDirectivesVisitor visitor =
        new CompilerDirectivesVisitor(
            ctx, messageService, startPosition, section, directiveLineText, isJavaShareableOn);

    return visitor.visitCompilerDirectives(parser.compilerDirectives());
  }
}
