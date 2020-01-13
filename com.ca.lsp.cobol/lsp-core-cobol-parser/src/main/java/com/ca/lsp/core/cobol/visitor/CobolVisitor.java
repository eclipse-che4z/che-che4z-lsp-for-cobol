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

import com.broadcom.lsp.domain.cobol.event.model.Position;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.CobolParserBaseVisitor;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.semantics.SubContext;
import org.antlr.v4.runtime.ParserRuleContext;
import org.apache.commons.lang3.StringUtils;

import java.util.Comparator;
import java.util.Optional;

public class CobolVisitor extends CobolParserBaseVisitor<Class> {
  private static final Keywords KEYWORDS = new Keywords();
  private static final int SEVERITY_LEVEL = 3;
  private SemanticListener semanticListener = null;
  private SemanticContext semanticContext = null;

  private static int getWrongTokenStopPosition(String wrongToken, int charPositionInLine) {
    return charPositionInLine + wrongToken.length() - 1;
  }

  private static Optional<String> addDistance(String wrongToken) {
    return KEYWORDS.getList().stream()
        .map(item -> new Object[] {item, StringUtils.getLevenshteinDistance(wrongToken, item)})
        .sorted(Comparator.comparingInt(o -> (int) o[1]))
        .filter(item -> !wrongToken.equals(item[0]))
        .filter(item -> (int) item[1] < 2)
        .map(item -> item[0].toString())
        .findFirst();
  }

  public void setSemanticErrors(SemanticListener semanticErrors) {
    semanticListener = semanticErrors;
  }

  public void setSemanticContext(SemanticContext context) {
    semanticContext = context;
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

  @Override
  public Class visitQualifiedDataNameFormat1(CobolParser.QualifiedDataNameFormat1Context ctx) {
    if (ctx.dataName() != null) {
      String variable = ctx.dataName().getText().toUpperCase();
      checkForVariable(
          variable,
          ctx.getStart().getLine(),
          ctx.dataName().getStart().getCharPositionInLine(),
          ctx);
    }
    return visitChildren(ctx);
  }

  public Class visitDataName2(
      CobolParser.DataName2Context ctx, String child, int childStartLine, int childPositionInLine) {
    if (checkForVariable(
        ctx.getText(), ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine(), null)) {
      checkParentContainsChildren(ctx.getText(), child, childStartLine, childPositionInLine);
    }
    return visitChildren(ctx);
  }

  public Class visitInData(
      String child, int childStartLine, int childPositionInLine, CobolParser.InDataContext ctx) {
    checkForDataName2(ctx.dataName2(), child, childStartLine, childPositionInLine);
    return visitChildren(ctx);
  }

  public Class visitInTable(
      String child, int childStartLine, int childPositionInLine, CobolParser.InTableContext ctx) {
    checkForDataName2(ctx.tableCall().dataName2(), child, childStartLine, childPositionInLine);
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraphNameUsage(CobolParser.ParagraphNameUsageContext ctx) {
    addUsage(semanticContext.getParagraphs(), ctx);
    return visitChildren(ctx);
  }

  private void checkForDataName2(
      CobolParser.DataName2Context ctx, String child, int childStartLine, int childPositionInLine) {
    if (ctx != null) {
      visitDataName2(ctx, child, childStartLine, childPositionInLine);
    }
  }

  private void throwWarning(String wrongToken, int startLine, int charPositionInLine) {
    if (!semanticListener.getErrorsPipe().isEmpty()) {
      addDistance(wrongToken)
          .ifPresent(
              correctWord ->
                  getSemanticError(wrongToken, startLine, charPositionInLine, correctWord));
    }
  }

  private void throwSuggestion(String wrongToken, int startLine, int charPositionInLine) {
    semanticListener.syntaxError(
        null,
        startLine,
        charPositionInLine,
        getWrongTokenStopPosition(wrongToken, charPositionInLine),
        "Invalid definition for: " + wrongToken,
        SEVERITY_LEVEL);
  }

  private void getSemanticError(
      String wrongToken, int startLine, int charPositionInLine, String correctWord) {
    semanticListener.syntaxError(
        null,
        startLine,
        charPositionInLine,
        getWrongTokenStopPosition(wrongToken, charPositionInLine),
        "Misspelled word, maybe you want to put " + correctWord);
  }

  private boolean checkForVariable(
      String variable, int startLine, int charPositionInLine, ParserRuleContext ctx) {
    if (!semanticContext.getVariables().contains(variable)) {
      throwSuggestion(variable, startLine, charPositionInLine);
      return false;
    } else if (ctx instanceof CobolParser.QualifiedDataNameFormat1Context
        && ((CobolParser.QualifiedDataNameFormat1Context) ctx).qualifiedInData() != null) {
      iterateOverQualifiedDataNames(
          (CobolParser.QualifiedDataNameFormat1Context) ctx,
          variable,
          startLine,
          charPositionInLine);
      addUsage(semanticContext.getVariables(), variable, ctx);
    }
    return true;
  }

  private void iterateOverQualifiedDataNames(
      CobolParser.QualifiedDataNameFormat1Context ctx,
      String variable,
      int startLine,
      int charPositionInLine) {
    for (CobolParser.QualifiedInDataContext node : ctx.qualifiedInData()) {
      if (node.inData() != null) {
        visitInData(variable, startLine, charPositionInLine, node.inData());
        CobolParser.DataName2Context context = node.inData().dataName2();
        variable = context.getText();
        addUsage(semanticContext.getVariables(), context);
      } else {
        visitInTable(variable, startLine, charPositionInLine, node.inTable());
        CobolParser.DataName2Context context = node.inTable().tableCall().dataName2();
        variable = context.getText();
        addUsage(semanticContext.getVariables(), context);
      }
    }
  }

  private void checkParentContainsChildren(
      String parent, String children, int startLine, int charPositionInLine) {
    if (!semanticContext.getVariables().parentContainsSpecificChild(parent, children)) {
      throwSuggestion(children, startLine, charPositionInLine);
    }
  }

  private void addUsage(SubContext<?> langContext, String name, ParserRuleContext ctx) {
    langContext.addUsage(name.toUpperCase(), retrievePosition(ctx));
  }

  private void addUsage(SubContext<?> langContext, ParserRuleContext ctx) {
    langContext.addUsage(ctx.getText().toUpperCase(), retrievePosition(ctx));
  }

  private Position retrievePosition(ParserRuleContext ctx) {
    return new Position(
        null,
        ctx.getStart().getTokenIndex(),
        ctx.getStart().getStartIndex(),
        ctx.getStart().getStopIndex(),
        ctx.getStart().getLine(),
        ctx.getStart().getCharPositionInLine());
  }
}
