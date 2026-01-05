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
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.DefaultErrorStrategy;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
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
    final CommonTokenStream tokenStream = parser.getTokens();
    appendUnknownExecDiags(context, tokenStream);
    return new StageResult<>(new ParserStageResult(tokenStream, tree));
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

  private static void appendUnknownExecDiags(
      AnalysisContext context, CommonTokenStream tokenStream) {
    tokenStream.getTokens().stream()
        .filter(ParserStage::unknownExecToken)
        .map(t -> unknownExecMessage(context, t, tokenStream))
        .forEach(context.getAccumulatedErrors()::add);
  }

  private static boolean unknownExecToken(Token t) {
    return t.getType() == CobolLexer.UNKNOWN_EXEC
        && t.getChannel() != CobolLexer.DEFAULT_TOKEN_CHANNEL;
  }

  private static SyntaxError unknownExecMessage(
      AnalysisContext context, Token t, CommonTokenStream tokenStream) {
    final boolean error = t.getChannel() == CobolLexer.HIDDEN_ERROR;
    final ErrorSeverity severity = error ? ErrorSeverity.ERROR : ErrorSeverity.HINT;
    final String messageTemplateName =
        error ? "cobolParser.unknownExecBlockUnterminated" : "cobolParser.unknownExecBlock";

    Location location =
        context.getExtendedDocument().mapLocation(constructMultiLineRange(t, tokenStream));
    String copybookId = context.getCopybooksRepository().getCopybookIdByUri(location.getUri());

    return SyntaxError.syntaxError()
        .errorSource(ErrorSource.PARSING)
        .severity(severity)
        .location(new OriginalLocation(location, copybookId))
        .messageTemplate(MessageTemplate.of(messageTemplateName))
        .build();
  }

  private static Range constructMultiLineRange(Token t, CommonTokenStream tokenStream) {
    final Token next = tokenStream.get(t.getTokenIndex() + 1); // There should be at least EOF
    final Position start = new Position(t.getLine() - 1, t.getCharPositionInLine());
    final Position end = new Position(next.getLine() - 1, next.getCharPositionInLine());
    return new Range(start, end);
  }

  @Override
  public String getName() {
    return "Parsing stage";
  }
}
