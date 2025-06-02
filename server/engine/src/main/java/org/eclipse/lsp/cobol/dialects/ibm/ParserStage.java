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
import java.util.List;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.parser.AntlrCobolParser;
import org.eclipse.lsp.cobol.parser.AstBuilder;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Parser stage */
@RequiredArgsConstructor
public class ParserStage implements Stage<AnalysisContext, ParserStageResult, DialectOutcome> {
  private final MessageService messageService;
  private final ParseTreeListener treeListener;
  private static final Pattern JAVA_CALLABLE_PATTERN =
      Pattern.compile("(?i)\\s*(>>)(\\s*)(JAVA-CALLABLE)(?:\\s+(.+))?\\s*$");
  private static final Pattern JAVA_SHAREABLE_ON_PATTERN =
      Pattern.compile("(?i)\\s*(>>)(\\s*)(JAVA-SHAREABLE\\s+ON)(?:\\s+(.+))?\\s*$");
  private static final Pattern JAVA_SHAREABLE_OFF_PATTERN =
      Pattern.compile("(?i)\\s*(>>)(\\s*)(JAVA-SHAREABLE\\s+OFF)(?:\\s+(.+))?\\s*$");

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
            .filter(
                token ->
                    token.getType() == CobolLexer.COMPILERLINE
                        || token.getType() == CobolLexer.IDENTIFICATION
                        || token.getType() == CobolLexer.DATA
                        || token.getType() == CobolLexer.WORKING_STORAGE
                        || token.getType() == CobolLexer.PROCEDURE)
            .collect(Collectors.toList());

    validateJavaInteroperabilityDirectives(context, compilerLineTokens);
  }

  private void validateJavaInteroperabilityDirectives(
      AnalysisContext analysisContext, List<Token> compilerLineTokens) {
    Stack<Integer> shareableOnStack = new Stack<>();
    String currentSection = "";

    for (int i = 0; i < compilerLineTokens.size(); i++) {
      Token token = compilerLineTokens.get(i);

      switch (token.getType()) {
        case CobolLexer.IDENTIFICATION:
          currentSection = "IDENTIFICATION";
          continue;
        case CobolLexer.DATA:
          currentSection = "DATA";
          continue;
        case CobolLexer.WORKING_STORAGE:
          currentSection = "WORKING-STORAGE";
          continue;
        case CobolLexer.PROCEDURE:
          currentSection = "PROCEDURE";
          continue;
        default:
      }

      if (token.getType() == CobolLexer.COMPILERLINE) {
        String tokenText = token.getText();

        Matcher callableMatcher = JAVA_CALLABLE_PATTERN.matcher(tokenText);
        if (callableMatcher.matches()) {
          validateDirective(
              analysisContext,
              token,
              callableMatcher,
              currentSection.equals("DATA") || currentSection.equals("WORKING-STORAGE"),
              "compilerDirective.validation.dataSection");
          continue;
        }

        Matcher shareableOnMatcher = JAVA_SHAREABLE_ON_PATTERN.matcher(tokenText);
        if (shareableOnMatcher.matches()) {
          shareableOnStack.push(i);
          validateDirective(
              analysisContext,
              token,
              shareableOnMatcher,
              currentSection.equals("WORKING-STORAGE"),
              "compilerDirective.validation.workingSection");
          continue;
        }

        Matcher shareableOffMatcher = JAVA_SHAREABLE_OFF_PATTERN.matcher(tokenText);
        if (shareableOffMatcher.matches()) {
          if (shareableOnStack.isEmpty()) {
            createError(
                analysisContext,
                token,
                callOffsetForToken(tokenText),
                messageService.getMessage(
                    "compilerDirective.validation.javaShareableOff",
                    tokenText.replaceAll(">>\\s?", "")));
          } else {
            shareableOnStack.pop();
          }

          validateDirective(
              analysisContext,
              token,
              shareableOffMatcher,
              currentSection.equals("WORKING-STORAGE"),
              "compilerDirective.validation.workingSection");
        }
      }
    }
  }

  private void validateDirective(
      AnalysisContext analysisContext,
      Token token,
      Matcher matcher,
      boolean isValidPosition,
      String positionErrorKey) {
    String spaces = matcher.group(2);
    String extraText =
        matcher.groupCount() >= 4 && matcher.group(4) != null ? matcher.group(4).trim() : "";

    if (spaces.length() > 1) {
      int offset = token.getText().indexOf(">>") + 2 + spaces.length();
      createError(
          analysisContext,
          token,
          offset,
          messageService.getMessage("compilerDirective.invalid", matcher.group(3).trim()));
      return;
    }

    if (!isValidPosition) {
      createError(
          analysisContext,
          token,
          callOffsetForToken(token.getText()),
          messageService.getMessage(positionErrorKey, token.getText().replaceAll(">>\\s?", "")));
    }

    if (!extraText.isEmpty()) {
      String tokenText = token.getText();
      int extraTextStartPos = tokenText.lastIndexOf(extraText);
      createError(
          analysisContext,
          token,
          extraTextStartPos,
          messageService.getMessage("compilerOption.invalid", extraText));
    }
  }

  private int callOffsetForToken(String tokenText) {
    return tokenText.startsWith(">> ") ? 3 : 2;
  }

  private void createError(
      AnalysisContext analysisContext, Token token, int startOffset, String message) {
    Range range =
        new Range(
            new Position(token.getLine() - 1, token.getCharPositionInLine() + startOffset),
            new Position(
                token.getLine() - 1, token.getCharPositionInLine() + token.getText().length()));
    Location location = analysisContext.getExtendedDocument().mapLocation(range);

    throwException(analysisContext, locationToLocality(analysisContext, location), message);
  }

  private Locality locationToLocality(AnalysisContext analysisContext, Location location) {
    Locality.LocalityBuilder builder =
        Locality.builder().range(location.getRange()).uri(location.getUri());
    if (analysisContext.getCopybooksRepository() != null) {
      builder.copybookId(
          analysisContext.getCopybooksRepository().getCopybookIdByUri(location.getUri()));
    }
    return builder.build();
  }

  private void throwException(
      AnalysisContext analysisContext, @NonNull Locality locality, String message) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(locality.toOriginalLocation())
            .suggestion(message)
            .severity(ErrorSeverity.ERROR)
            .build();

    if (!analysisContext.getAccumulatedErrors().contains(error)) {
      analysisContext.getAccumulatedErrors().add(error);
    }
  }
}
