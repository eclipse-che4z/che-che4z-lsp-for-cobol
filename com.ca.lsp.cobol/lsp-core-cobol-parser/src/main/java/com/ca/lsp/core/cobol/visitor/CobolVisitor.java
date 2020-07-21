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
import com.ca.lsp.core.cobol.parser.CobolParserBaseVisitor;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.semantics.SubContext;
import lombok.Getter;
import lombok.Setter;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;

import java.util.ArrayList;
import java.util.List;

import static com.ca.lsp.core.cobol.parser.CobolParser.*;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link com.ca.lsp.core.cobol.parser.CobolParser}. It requires a
 * semantic context with defined elements to add the usages or throw a warning on an invalid
 * definition. If there is a misspelled keyword, the visitor finds it and throws a warning.
 */
public class CobolVisitor extends CobolParserBaseVisitor<Class> {
  private static final int WARNING_LEVEL = 2;
  private static final int INFO_LEVEL = 3;

  @Getter private List<SyntaxError> errors = new ArrayList<>();
  @Getter @Setter private String programName;

  private String documentUri;
  private SemanticContext semanticContext;
  private CommonTokenStream tokenStream;

  public CobolVisitor(
      String documentUri, SemanticContext semanticContext, CommonTokenStream tokenStream) {
    this.documentUri = documentUri;
    this.semanticContext = semanticContext;
    this.tokenStream = tokenStream;
  }

  @Override
  public Class visitIdentificationDivision(IdentificationDivisionContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitProgramIdParagraph(ProgramIdParagraphContext ctx) {
    if (ctx.programName() != null) {
      setProgramName(ctx.programName().getText());
    }
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureDivision(ProcedureDivisionContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEnvironmentDivision(EnvironmentDivisionContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDivision(DataDivisionContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDivisionSection(DataDivisionSectionContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEnvironmentDivisionBody(EnvironmentDivisionBodyContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureSectionHeader(ProcedureSectionHeaderContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureSection(ProcedureSectionContext ctx) {
    String token = ctx.getStart().getText();
    throwWarning(token, ctx.getStart().getLine(), ctx.getStart().getCharPositionInLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraph(ParagraphContext ctx) {
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    String token = ctx.getStart().getText();
    if (token.equals("01") || token.equals("1") || token.equals("77")) {
      areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    } else {
      List<Token> tokenList =
          tokenStream.getTokens(ctx.getStart().getTokenIndex(), ctx.getStop().getTokenIndex());
      areaBWarning(tokenList);
    }
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureDeclaratives(ProcedureDeclarativesContext ctx) {
    Token firstDeclarative = ctx.getStart();
    int firstDeclLine = firstDeclarative.getLine();
    Token declarativeBody = ctx.procedureDeclarative(0).getStart();
    Token endToken = ctx.END().getSymbol();

    if (firstDeclLine == declarativeBody.getLine()) {
      throwException(
          declarativeBody.getText(),
          declarativeBody.getLine(),
          declarativeBody.getCharPositionInLine(),
          "Following token can not be on the same line with DECLARATIVE token: ",
          WARNING_LEVEL);
    }

    areaAWarning(
        firstDeclarative.getCharPositionInLine(), firstDeclarative.getText(), firstDeclLine);
    areaAWarning(endToken.getCharPositionInLine(), endToken.getText(), endToken.getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEndProgramStatement(EndProgramStatementContext ctx) {
    Token programName = ctx.programName().getStart();
    checkProgramName(programName);
    String token = ctx.getStart().getText();
    areaAWarning(ctx.start.getCharPositionInLine(), token, ctx.getStart().getLine());
    return visitChildren(ctx);
  }

  @Override
  public Class visitStatement(StatementContext ctx) {
    List<Token> tokenList =
        tokenStream.getTokens(ctx.getStart().getTokenIndex(), ctx.getStop().getTokenIndex());
    areaBWarning(tokenList);

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

  private void throwException(
      String wrongToken, int startLine, int charPositionInLine, String message, int severity) {
    SyntaxError syntaxError =
        SyntaxError.syntaxError()
            .position(
                new Position(
                    documentUri,
                    charPositionInLine,
                    getWrongTokenStopPosition(wrongToken, charPositionInLine),
                    startLine,
                    charPositionInLine))
            .suggestion(message + wrongToken)
            .severity(severity)
            .build();

    if (!errors.contains(syntaxError)) {
      errors.add(syntaxError);
    }
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
      throwException(
          variable, startLine, charPositionInLine, "Invalid definition for: ", INFO_LEVEL);
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
      throwException(
          children, startLine, charPositionInLine, "Invalid definition for: ", INFO_LEVEL);
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

  private void areaAWarning(int charPosition, String token, int startLine) {
    if (charPosition > 10) {
      throwException(
          token, startLine, charPosition, "Following token must start in Area A: ", WARNING_LEVEL);
    }
  }

  private void areaBWarning(List<Token> tokenList) {
    for (Token token : tokenList) {
      int charPosition = token.getCharPositionInLine();
      if (charPosition > 6 && charPosition < 11 && token.getChannel() != 1) {
        throwException(
            token.getText(),
            token.getLine(),
            charPosition,
            "Following token must start in Area B: ",
            WARNING_LEVEL);
      }
    }
  }

  private void checkProgramName(Token token) {
    if (getProgramName() == null) {
      throwException(
          "",
          token.getLine(),
          token.getCharPositionInLine(),
          "There is an issue with PROGRAM-ID paragraph",
          WARNING_LEVEL);
    } else {
      checkProgramNameIdentical(token);
    }
  }

  private void checkProgramNameIdentical(Token token) {
    if (!getProgramName().equals(token.getText())) {
      throwException(
          getProgramName(),
          token.getLine(),
          token.getCharPositionInLine(),
          "Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: ",
          WARNING_LEVEL);
    }
  }
}
