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
import com.ca.lsp.core.cobol.parser.CobolParser.*;
import com.ca.lsp.core.cobol.parser.CobolParserBaseVisitor;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorStringUtils;
import com.ca.lsp.core.cobol.semantics.CobolVariableContext;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.ca.lsp.core.cobol.semantics.SubContext;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.ca.lsp.core.cobol.model.ErrorSeverity.INFO;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.WARNING;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link com.ca.lsp.core.cobol.parser.CobolParser}. It requires a
 * semantic context with defined elements to add the usages or throw a warning on an invalid
 * definition. If there is a misspelled keyword, the visitor finds it and throws a warning.
 */
@Slf4j
public class CobolVisitor extends CobolParserBaseVisitor<Class> {
  private static final String AREA_A_WARNING_MSG = "The following token must start in Area A: ";
  private static final String AREA_B_WARNING_MSG = "The following token must start in Area B: ";
  private static final String IDENTICAL_PROGRAM_MSG =
      "Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: ";
  private static final String DECLARATIVE_SAME_MSG =
      "The following token cannot be on the same line as a DECLARATIVE token: ";
  private static final String INVALID_DEF_MSG = "Invalid definition for: ";
  private static final String MISSPELLED_WORD = "A misspelled word, maybe you want to put ";

  @Getter private List<SyntaxError> errors = new ArrayList<>();

  private SubContext<String> paragraphs = new NamedSubContext();
  private CobolVariableContext variables = new CobolVariableContext();

  private String programName = null;

  private NamedSubContext copybooks;
  private CommonTokenStream tokenStream;
  private Map<Token, Position> positionMapping;

  public CobolVisitor(
      @Nonnull NamedSubContext copybooks,
      @Nonnull CommonTokenStream tokenStream,
      @Nonnull Map<Token, Position> positionMapping) {
    this.copybooks = copybooks;
    this.positionMapping = positionMapping;
    this.tokenStream = tokenStream;
  }

  /**
   * Get the semantic context of the document as an output of th semantic analysis
   *
   * @return the semantic context of the document, containing all the definitions and usages of
   *     paragraphs, variables and copybooks
   */
  @Nonnull
  public SemanticContext getSemanticContext() {
    return new SemanticContext(
        variables.getDefinitions().asMap(),
        variables.getUsages().asMap(),
        paragraphs.getDefinitions().asMap(),
        paragraphs.getUsages().asMap(),
        copybooks.getDefinitions().asMap(),
        copybooks.getUsages().asMap());
  }

  @Override
  public Class visitIdentificationDivision(IdentificationDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitProgramIdParagraph(ProgramIdParagraphContext ctx) {
    if (ctx.programName() != null) {
      programName = ctx.programName().getText();
    }
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureDivision(ProcedureDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEnvironmentDivision(EnvironmentDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDivision(DataDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDivisionSection(DataDivisionSectionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEnvironmentDivisionBody(EnvironmentDivisionBodyContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureSectionHeader(ProcedureSectionHeaderContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitProcedureSection(ProcedureSectionContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraph(ParagraphContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitFileDescriptionEntry(FileDescriptionEntryContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  /**
   * In this method, first condition is checking if there is any other element present on the same
   * line as DECLARATIVES token and throws an error if the condition is true; In the PROCEDURE
   * DIVISION, each of the keywords DECLARATIVES and END DECLARATIVES must begin in Area A and be
   * followed immediately by a separator period; no other text can appear on the same line. After
   * the keywords END DECLARATIVES, no text can appear before the following section header.
   */
  @Override
  public Class visitProcedureDeclaratives(ProcedureDeclarativesContext ctx) {
    Token firstDeclarative = ctx.getStart();
    int firstDeclLine = firstDeclarative.getLine();
    Token declarativeBody = ctx.procedureDeclarative(0).getStart();
    Token endToken = ctx.END().getSymbol();

    if (firstDeclLine == declarativeBody.getLine()) {
      throwException(declarativeBody.getText(), getPosition(declarativeBody), DECLARATIVE_SAME_MSG);
    }

    areaAWarning(firstDeclarative);
    areaAWarning(endToken);
    return visitChildren(ctx);
  }

  @Override
  public Class visitEndProgramStatement(EndProgramStatementContext ctx) {
    Token endProgramNameToken = ctx.programName().getStart();
    checkProgramName(endProgramNameToken);
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitStatement(StatementContext ctx) {
    List<Token> tokenList =
        tokenStream.getTokens(ctx.getStart().getTokenIndex(), ctx.getStop().getTokenIndex());
    areaBWarning(tokenList);

    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfThen(IfThenContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitIfElse(IfElseContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitPerformInlineStatement(PerformInlineStatementContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitSentence(SentenceContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitGeneralIdentifier(GeneralIdentifierContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitEvaluateWhenOther(EvaluateWhenOtherContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitParagraphName(ParagraphNameContext ctx) {
    Position position = getPosition(ctx.getStart());
    if (position != null) paragraphs.define(ctx.getText().toUpperCase(), position);
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    Token token = ctx.getStart();
    String tokenText = token.getText();
    if (tokenText.equals("01") || tokenText.equals("1") || tokenText.equals("77")) {
      areaAWarning(token);
    }
    String levelNumber = ctx.otherLevel().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable ->
                defineVariable(levelNumber, variable.getText(), getPosition(variable.getStart())));
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {

    String levelNumber = ctx.LEVEL_NUMBER_66().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable ->
                defineVariable(levelNumber, variable.getText(), getPosition(variable.getStart())));
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    String levelNumber = ctx.LEVEL_NUMBER_88().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable ->
                defineVariable(levelNumber, variable.getText(), getPosition(variable.getStart())));
    return visitChildren(ctx);
  }

  private void defineVariable(String level, String name, Position position) {
    if (position == null) return;
    variables.define(new Variable(level, name), position);
  }

  @Override
  public Class visitParagraphNameUsage(ParagraphNameUsageContext ctx) {
    String name = ctx.getText().toUpperCase();
    addUsage(paragraphs, name, getPosition(ctx.getStart()));
    return visitChildren(ctx);
  }

  @Override
  public Class visitQualifiedDataNameFormat1(QualifiedDataNameFormat1Context ctx) {
    ofNullable(ctx.dataName())
        .map(it -> it.getText().toUpperCase())
        .ifPresent(variable -> checkForVariable(variable, ctx));
    return visitChildren(ctx);
  }

  private void checkForVariable(String variable, QualifiedDataNameFormat1Context ctx) {
    Position position = getPosition(ctx.getStart());
    checkVariableDefinition(variable, position);
    addUsage(variables, variable, position);

    if (ctx.qualifiedInData() != null) {
      iterateOverQualifiedDataNames(ctx, variable);
    }
  }

  private void iterateOverQualifiedDataNames(QualifiedDataNameFormat1Context ctx, String variable) {
    String child = variable;
    Token childToken = ctx.getStart();
    for (QualifiedInDataContext node : ctx.qualifiedInData()) {

      DataName2Context context = getDataName2Context(node);
      if (context == null) continue;

      String parent = context.getText().toUpperCase();
      Token parentToken = context.getStart();
      Position parentPosition = getPosition(parentToken);

      checkVariableDefinition(parent, parentPosition);
      checkVariableStructure(parent, child, childToken, parentToken);

      childToken = parentToken;
      child = parent;

      addUsage(variables, child, parentPosition);
    }
  }

  private void throwException(String wrongToken, @Nullable Position position, String message) {
    if (position == null) return;
    SyntaxError syntaxError =
        SyntaxError.syntaxError()
            .position(position)
            .suggestion(message + wrongToken)
            .severity(WARNING)
            .build();

    LOG.debug("Syntax error by CobolVisitor#throwException: " + syntaxError.toString());
    if (!errors.contains(syntaxError)) {
      errors.add(syntaxError);
    }
  }

  @Nullable
  private Position getPosition(Token childToken) {
    return positionMapping.get(childToken);
  }

  private void checkVariableDefinition(String name, @Nullable Position position) {
    if (position == null) return;
    if (!variables.contains(name)) {
      reportVariableNotDefined(name, position, position); // starts and finishes in one token
    }
  }

  private DataName2Context getDataName2Context(QualifiedInDataContext node) {
    return ofNullable(node.inData())
        .map(InDataContext::dataName2)
        .orElse(
            ofNullable(node.inTable())
                .map(InTableContext::tableCall)
                .map(TableCallContext::dataName2)
                .orElse(null));
  }

  private void checkVariableStructure(
      String parent, String child, Token childToken, Token parentToken) {
    Position childPosition = getPosition(childToken);
    Position parentPosition = getPosition(parentToken);
    if (childPosition == null || parentPosition == null) return;
    if (!variables.parentContainsSpecificChild(parent, child)) {
      reportVariableNotDefined(
          extractErrorStatementText(childToken, parentToken), childPosition, parentPosition);
    }
  }

  private String extractErrorStatementText(Token childToken, Token parentToken) {
    return tokenStream.getTokens(childToken.getTokenIndex(), parentToken.getTokenIndex()).stream()
        .map(Token::getText)
        .collect(joining())
        .replaceAll(" +", " ");
  }

  private void addUsage(SubContext<?> langContext, String name, @Nullable Position position) {
    if (position == null) return;
    langContext.addUsage(name.toUpperCase(), position);
  }

  private Position getIntervalPosition(Position start, Position stop) {
    return new Position(
        start.getDocumentURI(),
        start.getStartPosition(),
        stop.getStopPosition(),
        start.getLine(),
        start.getCharPositionInLine(),
        start.getToken());
  }

  private void reportVariableNotDefined(String dataName, Position start, Position stop) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(INVALID_DEF_MSG + dataName)
            .severity(INFO)
            .position(getIntervalPosition(start, stop))
            .build();
    LOG.debug("Syntax error by CobolVisitor#reportVariableNotDefined: " + error.toString());
    errors.add(error);
  }

  private void throwWarning(Token token) {
    MisspelledKeywordDistance.calculateDistance(token.getText().toUpperCase())
        .ifPresent(correctWord -> reportMisspelledKeyword(correctWord, getPosition(token)));
  }

  private void reportMisspelledKeyword(String suggestion, Position position) {
    if (position == null) return;
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(MISSPELLED_WORD + suggestion)
            .severity(WARNING)
            .position(position)
            .build();
    LOG.debug("Syntax error by CobolVisitor#reportMisspelledKeyword: " + error.toString());
    errors.add(error);
  }

  private void areaAWarning(Token token) {
    Position position = getPosition(token);
    if (position == null) return;
    if (position.getCharPositionInLine() > 10) {
      throwException(token.getText(), position, AREA_A_WARNING_MSG);
    }
  }

  private void areaBWarning(List<Token> tokenList) {
    for (Token token : tokenList) {
      Position position = getPosition(token);
      if (position == null) continue;
      int charPosition = position.getCharPositionInLine();
      if (charPosition > 6 && charPosition < 11 && token.getChannel() != 1) {
        throwException(token.getText(), position, AREA_B_WARNING_MSG);
      }
    }
  }

  private void checkProgramName(Token token) {
    if (programName == null) {
      throwException("", getPosition(token), "There is an issue with PROGRAM-ID paragraph");
    } else {
      checkProgramNameIdentical(token);
    }
  }

  private void checkProgramNameIdentical(Token token) {
    String text = PreprocessorStringUtils.trimQuotes(token.getText());
    if (!programName.equals(text)) {
      throwException(programName, getPosition(token), IDENTICAL_PROGRAM_MSG);
    }
  }
}
