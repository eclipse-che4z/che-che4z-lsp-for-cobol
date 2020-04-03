/*
 * Copyright (c) 2020 Broadcom.
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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.model.Variable;
import com.ca.lsp.core.cobol.parser.CobolParserBaseVisitor;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.semantics.SubContext;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

import static com.ca.lsp.core.cobol.parser.CobolParser.*;
import static java.util.Optional.ofNullable;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link com.ca.lsp.core.cobol.parser.CobolParser}. It requires a
 * semantic context with defined elements to add the usages or throw a warning on an invalid
 * definition. If there is a misspelled keyword, the visitor finds it and throws a warning.
 */
public class CobolVisitor extends CobolParserBaseVisitor<Class> {
  private static final int WARNING_LEVEL = 2;
  private static final int INFO_LEVEL = 3;

  private String documentUri;
  @Getter private SemanticContext semanticContext;
  @Getter private List<SyntaxError> errors = new ArrayList<>();

  public CobolVisitor(String documentUri, SemanticContext semanticContext) {
    this.documentUri = documentUri;
    this.semanticContext = semanticContext;
  }

  @Override
  public Class visitProcedureSection(ProcedureSectionContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitStatement(StatementContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfThen(IfThenContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfElse(IfElseContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitPerformInlineStatement(PerformInlineStatementContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitSentence(SentenceContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIdentifier(IdentifierContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEvaluateWhenOther(EvaluateWhenOtherContext ctx) {
    String wrongToken = ctx.getStart().getText();
    throwWarning(wrongToken, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitQualifiedDataNameFormat1(QualifiedDataNameFormat1Context ctx) {
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

  @Override
  public Class visitParagraphName(ParagraphNameContext ctx) {
    semanticContext.getParagraphs().define(ctx.getText().toUpperCase(), retrievePosition(ctx));
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    createVariableAndDefine(ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {
    createVariableAndDefine(ctx);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    createVariableAndDefine(ctx);
    return visitChildren(ctx);
  }

  private void createVariableAndDefine(@Nonnull ParserRuleContext ctx) {
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

  private void defineVariableIfPresent(
      @Nullable String levelNumber, @Nullable DataName1Context dataName) {
    ofNullable(dataName)
        .ifPresent(
            variable ->
                semanticContext
                    .getVariables()
                    .define(
                        new Variable(levelNumber, variable.getText()), retrievePosition(dataName)));
    semanticContext.getVariables().createRelationBetweenVariables();
  }

  public Class visitDataName2(
      DataName2Context ctx, String child, int childStartLine, int childPositionInLine) {
    if (checkForVariable(
        ctx.getText(), ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine(), null)) {
      checkParentContainsChildren(ctx.getText(), child, childStartLine, childPositionInLine);
    }
    return visitChildren(ctx);
  }

  public Class visitInData(
      String child, int childStartLine, int childPositionInLine, InDataContext ctx) {
    checkForDataName2(ctx.dataName2(), child, childStartLine, childPositionInLine);
    return visitChildren(ctx);
  }

  public Class visitInTable(
      String child, int childStartLine, int childPositionInLine, InTableContext ctx) {
    checkForDataName2(ctx.tableCall().dataName2(), child, childStartLine, childPositionInLine);
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraphNameUsage(ParagraphNameUsageContext ctx) {
    addUsage(semanticContext.getParagraphs(), ctx);
    return visitChildren(ctx);
  }

  private void checkForDataName2(
      DataName2Context ctx, String child, int childStartLine, int childPositionInLine) {
    if (ctx != null) {
      visitDataName2(ctx, child, childStartLine, childPositionInLine);
    }
  }

  private void throwWarning(String wrongToken, int startLine, int charPositionInLine) {
    MisspelledKeywordDistance.calculateDistance(wrongToken.toUpperCase())
        .ifPresent(
            correctWord ->
                getSemanticError(wrongToken, startLine, charPositionInLine, correctWord));
  }

  private void throwSuggestion(String wrongToken, int startLine, int charPositionInLine) {
    errors.add(
        SyntaxError.syntaxError()
            .position(
                new Position(
                    documentUri,
                    charPositionInLine,
                    getWrongTokenStopPosition(wrongToken, charPositionInLine),
                    startLine,
                    charPositionInLine))
            .suggestion("Invalid definition for: " + wrongToken)
            .severity(INFO_LEVEL)
            .build());
  }

  private void getSemanticError(
      String wrongToken, int startLine, int charPositionInLine, String correctWord) {
    errors.add(
        SyntaxError.syntaxError()
            .position(
                new Position(
                    documentUri,
                    charPositionInLine,
                    getWrongTokenStopPosition(wrongToken, charPositionInLine),
                    startLine,
                    charPositionInLine))
            .suggestion("A misspelled word, maybe you want to put " + correctWord)
            .severity(WARNING_LEVEL)
            .build());
  }

  private boolean checkForVariable(
      String variable, int startLine, int charPositionInLine, ParserRuleContext ctx) {
    if (!semanticContext.getVariables().contains(variable)) {
      throwSuggestion(variable, startLine, charPositionInLine);
      return false;
    } else if (ctx instanceof QualifiedDataNameFormat1Context
        && ((QualifiedDataNameFormat1Context) ctx).qualifiedInData() != null) {
      iterateOverQualifiedDataNames(
          (QualifiedDataNameFormat1Context) ctx, variable, startLine, charPositionInLine);
      addUsage(semanticContext.getVariables(), variable, ctx);
    }
    return true;
  }

  private void iterateOverQualifiedDataNames(
      QualifiedDataNameFormat1Context ctx, String variable, int startLine, int charPositionInLine) {
    for (QualifiedInDataContext node : ctx.qualifiedInData()) {
      if (node.inData() != null) {
        visitInData(variable, startLine, charPositionInLine, node.inData());
        DataName2Context context = node.inData().dataName2();
        variable = context.getText();
        addUsage(semanticContext.getVariables(), context);
      } else {
        visitInTable(variable, startLine, charPositionInLine, node.inTable());
        DataName2Context context = node.inTable().tableCall().dataName2();
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

  private static int getWrongTokenStopPosition(String wrongToken, int charPositionInLine) {
    return charPositionInLine + wrongToken.length() - 1;
  }

  private Position retrievePosition(ParserRuleContext ctx) {
    return new Position(
        documentUri,
        ctx.getStart().getStartIndex(),
        ctx.getStart().getStopIndex(),
        ctx.getStart().getLine(),
        ctx.getStart().getCharPositionInLine());
  }
}
