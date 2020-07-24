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
import com.ca.lsp.core.cobol.model.ExtendedDocument;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.model.Variable;
import com.ca.lsp.core.cobol.parser.CobolParser.*;
import com.ca.lsp.core.cobol.parser.CobolParserBaseVisitor;
import com.ca.lsp.core.cobol.semantics.CobolVariableContext;
import com.ca.lsp.core.cobol.semantics.NamedSubContext;
import com.ca.lsp.core.cobol.semantics.SubContext;
import lombok.Getter;
import org.antlr.v4.runtime.Token;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.ca.lsp.core.cobol.model.ErrorSeverity.INFO;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.WARNING;
import static java.util.Optional.ofNullable;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link com.ca.lsp.core.cobol.parser.CobolParser}. It requires a
 * semantic context with defined elements to add the usages or throw a warning on an invalid
 * definition. If there is a misspelled keyword, the visitor finds it and throws a warning.
 */
public class CobolVisitor extends CobolParserBaseVisitor<Class> {

  @Getter private List<SyntaxError> errors = new ArrayList<>();
  @Getter private SubContext<String> paragraphs = new NamedSubContext();
  @Getter private CobolVariableContext variables = new CobolVariableContext();

  @Getter private NamedSubContext copybooks;

  private Map<Token, Position> positionMapping;

  public CobolVisitor(ExtendedDocument extendedDocument, Map<Token, Position> positionMapping) {
    copybooks = extendedDocument.getCopybooks();
    this.positionMapping = positionMapping;
  }

  @Override
  public Class visitProcedureSection(ProcedureSectionContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitStatement(StatementContext ctx) {
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
    paragraphs.define(ctx.getText().toUpperCase(), getPosition(ctx.getStart()));
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {

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
      checkVariableStructure(parent, child, getPosition(childToken));

      childToken = parentToken;
      child = parent;

      addUsage(variables, child, parentPosition);
    }
  }

  private Position getPosition(Token childToken) {
    return positionMapping.get(childToken);
  }

  private void checkVariableDefinition(String name, Position position) {
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

  private void checkVariableStructure(String parent, String child, Position position) {
    if (!variables.parentContainsSpecificChild(parent, child)) {
      reportVariableNotDefined(child, position, position);
    }
  }

  private void addUsage(SubContext<?> langContext, String name, Position position) {
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
    errors.add(
        SyntaxError.syntaxError()
            .suggestion("Invalid definition for: " + dataName)
            .severity(INFO)
            .position(getIntervalPosition(start, stop))
            .build());
  }

  private void throwWarning(Token token) {
    MisspelledKeywordDistance.calculateDistance(token.getText().toUpperCase())
        .ifPresent(correctWord -> reportMisspelledKeyword(correctWord, getPosition(token)));
  }

  private void reportMisspelledKeyword(String suggestion, Position position) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion("A misspelled word, maybe you want to put " + suggestion)
            .severity(WARNING)
            .position(position)
            .build();
    errors.add(error);
  }
}
