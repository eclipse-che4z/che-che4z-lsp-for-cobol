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
import com.ca.lsp.core.cobol.parser.CobolParser.DataDescriptionEntryFormat1Context;
import com.ca.lsp.core.cobol.parser.CobolParser.DataDescriptionEntryFormat2Context;
import com.ca.lsp.core.cobol.parser.CobolParser.DataDescriptionEntryFormat3Context;
import com.ca.lsp.core.cobol.parser.CobolParser.DataName1Context;
import com.ca.lsp.core.cobol.parser.CobolParserBaseVisitor;
import com.ca.lsp.core.cobol.model.Position;
import com.ca.lsp.core.cobol.parser.listener.SemanticListener;
import com.ca.lsp.core.cobol.semantics.CobolParagraphContext;
import com.ca.lsp.core.cobol.semantics.CobolVariableContext;
import com.ca.lsp.core.cobol.semantics.LanguageContext;
import com.ca.lsp.core.cobol.model.Variable;
import java.util.Comparator;
import java.util.Optional;
import org.antlr.v4.runtime.ParserRuleContext;
import org.apache.commons.lang3.StringUtils;

/** @author ilise01 */
public class CobolVisitor extends CobolParserBaseVisitor<Class> {
  private static final Keywords KEYWORDS = new Keywords();
  private static final int SEVERITY_LEVEL = 3;
  private SemanticListener semanticListener = null;
  private CobolVariableContext variableContext = null;
  private CobolParagraphContext paragraphContext = null;

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
    this.semanticListener = semanticErrors;
  }

  public void setVariableContext(CobolVariableContext variableContext) {
    this.variableContext = variableContext;
  }

  public void setParagraphContext(CobolParagraphContext paragraphContext) {
    this.paragraphContext = paragraphContext;
  }

  @Override
  public Class visitProcedureSection(CobolParser.ProcedureSectionContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1(
      CobolParser.DataDescriptionEntryFormat1Context ctx) {
    createVariableAndDefine(ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat2(
      CobolParser.DataDescriptionEntryFormat2Context ctx) {
    createVariableAndDefine(ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat3(
      CobolParser.DataDescriptionEntryFormat3Context ctx) {
    createVariableAndDefine(ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureDivision(CobolParser.ProcedureDivisionContext ctx) {
    // in this section the engine will apply a semantic logic to understand the level of grouping of
    // data
    variableContext.createRelationBetweenVariables();

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
  public Class visitParagraphNameDefinition(CobolParser.ParagraphNameDefinitionContext ctx) {
    paragraphContext.define(ctx.getText().toUpperCase(), retrievePosition(ctx));
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraphName(CobolParser.ParagraphNameContext ctx) {
    addUsage(paragraphContext, ctx);
    return visitChildren(ctx);
  }

  private void checkForDataName2(
      CobolParser.DataName2Context ctx, String child, int childStartLine, int childPositionInLine) {
    if (ctx != null) {
      visitDataName2(ctx, child, childStartLine, childPositionInLine);
    }
  }

  private void throwWarning(String wrongToken, int startLine, int charPositionInLine) {
    if (!this.semanticListener.getErrorsPipe().isEmpty()) {
      addDistance(wrongToken)
          .ifPresent(
              correctWord ->
                  getSemanticError(wrongToken, startLine, charPositionInLine, correctWord));
    }
  }

  private void throwSuggestion(String wrongToken, int startLine, int charPositionInLine) {
    semanticListener.syntaxError(
        startLine,
        charPositionInLine,
        getWrongTokenStopPosition(wrongToken, charPositionInLine),
        "Invalid definition for: " + wrongToken,
        SEVERITY_LEVEL);
  }

  private void getSemanticError(
      String wrongToken, int startLine, int charPositionInLine, String correctWord) {
    semanticListener.syntaxError(
        startLine,
        charPositionInLine,
        getWrongTokenStopPosition(wrongToken, charPositionInLine),
        "Misspelled word, maybe you want to put " + correctWord);
  }

  private boolean checkForVariable(
      String variable, int startLine, int charPositionInLine, ParserRuleContext ctx) {
    if (!this.variableContext.contains(variable)) {
      throwSuggestion(variable, startLine, charPositionInLine);
      return false;
    } else if (ctx instanceof CobolParser.QualifiedDataNameFormat1Context
        && ((CobolParser.QualifiedDataNameFormat1Context) ctx).qualifiedInData() != null) {
      iterateOverQualifiedDataNames(
          (CobolParser.QualifiedDataNameFormat1Context) ctx,
          variable,
          startLine,
          charPositionInLine);
      addUsage(variableContext, variable, ctx);
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
        addUsage(variableContext, context);
      } else {
        visitInTable(variable, startLine, charPositionInLine, node.inTable());
        CobolParser.DataName2Context context = node.inTable().tableCall().dataName2();
        variable = context.getText();
        addUsage(variableContext, context);
      }
    }
  }

  private void checkParentContainsChildren(
      String parent, String children, int startLine, int charPositionInLine) {
    if (!this.variableContext.parentContainsSpecificChild(parent, children)) {
      throwSuggestion(children, startLine, charPositionInLine);
    }
  }

  private void createVariableAndDefine(ParserRuleContext ctx) {
    String levelNumber;

    if (ctx instanceof DataDescriptionEntryFormat1Context) {
      DataDescriptionEntryFormat1Context ctxDataDescF1 = (DataDescriptionEntryFormat1Context) ctx;
      levelNumber = ctxDataDescF1.otherLevel().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF1.dataName1());

    } else if (ctx instanceof DataDescriptionEntryFormat2Context) {
      DataDescriptionEntryFormat2Context ctxDataDescF2 = (DataDescriptionEntryFormat2Context) ctx;
      levelNumber = ctxDataDescF2.LEVEL_NUMBER_66().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF2.dataName1());
    } else {
      DataDescriptionEntryFormat3Context ctxDataDescF3 = (DataDescriptionEntryFormat3Context) ctx;
      levelNumber = ctxDataDescF3.LEVEL_NUMBER_88().getText();
      defineVariableIfPresent(levelNumber, ctxDataDescF3.dataName1());
    }
  }

  private void defineVariableIfPresent(String levelNumber, DataName1Context dataName1) {
    Optional.ofNullable(dataName1)
        .ifPresent(
            variable -> {
              Position position =
                  new Position(
                      dataName1.getStart().getTokenIndex(),
                      dataName1.getStart().getStartIndex(),
                      dataName1.getStop().getStopIndex(),
                      dataName1.getStart().getLine(),
                      dataName1.getStart().getCharPositionInLine());
              variableContext.define(new Variable(levelNumber, variable.getText()), position);
            });
  }

  private void addUsage(LanguageContext<?> langContext, String name, ParserRuleContext ctx) {
    langContext.addUsage(name.toUpperCase(), retrievePosition(ctx));
  }

  private void addUsage(LanguageContext<?> langContext, ParserRuleContext ctx) {
    langContext.addUsage(ctx.getText().toUpperCase(), retrievePosition(ctx));
  }

  private Position retrievePosition(ParserRuleContext ctx) {
    return new Position(
        ctx.getStart().getTokenIndex(),
        ctx.getStart().getStartIndex(),
        ctx.getStart().getStopIndex(),
        ctx.getStart().getLine(),
        ctx.getStart().getCharPositionInLine());
  }
}
