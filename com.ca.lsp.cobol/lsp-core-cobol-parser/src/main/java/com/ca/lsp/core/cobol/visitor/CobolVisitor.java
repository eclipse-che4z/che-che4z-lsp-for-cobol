/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.core.cobol.visitor;

import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.CobolParserBaseVisitor;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import org.apache.commons.lang3.StringUtils;

import java.util.Comparator;
import java.util.Optional;

/** @author ilise01 */
public class CobolVisitor extends CobolParserBaseVisitor<Class> {
  private static final Keywords KEYWORDS = new Keywords();
  private SemanticListener semanticListener = null;

  public void setSemanticErrors(SemanticListener semanticErrors) {
    this.semanticListener = semanticErrors;
  }

  @Override
  public Class visitProcedureSection(CobolParser.ProcedureSectionContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitStatement(CobolParser.StatementContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfThen(CobolParser.IfThenContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfElse(CobolParser.IfElseContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitPerformInlineStatement(CobolParser.PerformInlineStatementContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitSentence(CobolParser.SentenceContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIdentifier(CobolParser.IdentifierContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEvaluateWhenOther(CobolParser.EvaluateWhenOtherContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  private void throwWarning(String wrongToken, int startLine, int charPositionInLine) {
    if (!this.semanticListener.getErrorsPipe().isEmpty()) {
      addDistance(wrongToken)
          .ifPresent(
              correctWord ->
                  getSemanticError(wrongToken, startLine, charPositionInLine, correctWord));
    }
  }

  private void getSemanticError(
      String wrongToken, int startLine, int charPositionInLine, String correctWord) {
    semanticListener.syntaxError(
        startLine,
        charPositionInLine,
        getWrongTokenStopPosition(wrongToken, charPositionInLine),
        "Misspelled word, maybe you want to put " + correctWord);
  }

  private static int getWrongTokenStopPosition(String wrongToken, int charPositionInLine) {
    return charPositionInLine + wrongToken.length() - 1;
  }

  private static Optional<String> addDistance(String wrongToken) {
    return KEYWORDS
        .getList()
        .stream()
        .map(item -> new Object[] {item, StringUtils.getLevenshteinDistance(wrongToken, item)})
        .sorted(Comparator.comparingInt(o -> (int) o[1]))
        .filter(item -> !wrongToken.equals(item[0]))
        .filter(item -> (int) item[1] < 2)
        .map(item -> item[0].toString())
        .findFirst();
  }
}
