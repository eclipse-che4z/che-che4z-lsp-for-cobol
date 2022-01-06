/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp.cobol.core.CobolPreprocessorBaseListener;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.TokenUtils;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.function.Consumer;

import static org.antlr.v4.runtime.Token.EOF;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;

/**
 * ANTLR listener, which deals only with the REPLACE compiler directives. So, that the rest of the
 * pre-processing works on the replaced source.
 */
@Slf4j
public class ReplacePreProcessorListener extends CobolPreprocessorBaseListener
    implements GrammarPreprocessorListener {
  private final List<SyntaxError> errors = new ArrayList<>();
  private final ReplacingService replacingService;
  private final List<Pair<String, String>> replacingClauses;
  private final BufferedTokenStream tokens;
  private final MessageService messageService;
  private final String documentUri;
  Deque<StringBuilder> textAccumulator = new ArrayDeque<>();

  public ReplacePreProcessorListener(
      ReplacingService replacingService,
      MessageService messageService,
      BufferedTokenStream tokens,
      String documentUri,
      List<Pair<String, String>> replacingClauses) {
    this.replacingService = replacingService;
    this.tokens = tokens;
    this.messageService = messageService;
    this.documentUri = documentUri;
    this.replacingClauses = replacingClauses;
    textAccumulator.push(new StringBuilder());
  }

  @Override
  public Deque<StringBuilder> getTextAccumulator() {
    return textAccumulator;
  }

  @Override
  public ResultWithErrors<ExtendedDocument> getResult() {
    if (!replacingClauses.isEmpty()) {
      replace();
    }
    return new ResultWithErrors<>(new ExtendedDocument(accumulate(), null, null, null), errors);
  }

  private void replace() {
    String content = applyReplacing(pop(), replacingClauses);
    replacingClauses.clear();
    if (getTextAccumulator().isEmpty()) push();
    write(content);
  }

  @Override
  public void enterReplaceAreaStart(@NonNull CobolPreprocessor.ReplaceAreaStartContext ctx) {
    if (!replacingClauses.isEmpty()) {
      replace();
    }
    push();
  }

  @Override
  public void enterReplacePseudoText(CobolPreprocessor.ReplacePseudoTextContext ctx) {
    push();
  }

  @Override
  public void exitReplacePseudoText(CobolPreprocessor.ReplacePseudoTextContext ctx) {
    if ((ctx.getParent() instanceof CobolPreprocessor.ReplaceAreaStartContext)) {
      @NonNull
      ResultWithErrors<Pair<String, String>> clauseResponse =
          replacingService.retrievePseudoTextReplacingPattern(read());
      if (clauseResponse.getErrors().isEmpty()) {
        replacingClauses.add(clauseResponse.getResult());
      } else {
        clauseResponse.getErrors().forEach(storeSyntaxErrorConsumer(ctx));
      }
      push();
    } else {
      write(pop());
    }
  }

  private Consumer<SyntaxError> storeSyntaxErrorConsumer(
      CobolPreprocessor.ReplacePseudoTextContext ctx) {
    return error -> {
      Locality locality = retrievePosition(ctx);
      errors.add(
          SyntaxError.syntaxError()
              .severity(ERROR)
              .suggestion(messageService.getMessage(error.getSuggestion()))
              .locality(locality)
              .build());
      LOG.error("pseudo text can't have COPY ");
    };
  }

  private Locality retrievePosition(CobolPreprocessor.ReplacePseudoTextContext ctx) {
    return Locality.builder()
        .uri(documentUri)
        .range(
            new Range(
                new Position(ctx.getStart().getLine() - 1, ctx.getStart().getCharPositionInLine()),
                new Position(ctx.getStop().getLine() - 1, ctx.getStop().getCharPositionInLine())))
        .recognizer(GrammarPreprocessorListenerImpl.class)
        .build();
  }

  @Override
  public void enterReplaceOffStatement(CobolPreprocessor.ReplaceOffStatementContext ctx) {
    push();
  }

  @Override
  public void exitReplaceOffStatement(CobolPreprocessor.ReplaceOffStatementContext ctx) {
    String replaceOffStmt = pop();
    String content = applyReplacing(read(), replacingClauses);
    replacingClauses.clear();
    mergeAndUpdateTopTwoElement(content + replaceOffStmt);
  }

  private String applyReplacing(String rawContent, List<Pair<String, String>> replacePatterns) {
    return replacingService.applyReplacing(rawContent, replacePatterns);
  }

  @Override
  public void visitTerminal(TerminalNode node) {
    int tokPos = node.getSourceInterval().a;
    write(TokenUtils.retrieveHiddenTextToLeft(tokPos, tokens));

    if (node.getSymbol().getType() != EOF) {
      write(node.getText());
    } else {
      write(TokenUtils.retrieveHiddenTextToRight(tokPos, tokens));
    }
  }
}
