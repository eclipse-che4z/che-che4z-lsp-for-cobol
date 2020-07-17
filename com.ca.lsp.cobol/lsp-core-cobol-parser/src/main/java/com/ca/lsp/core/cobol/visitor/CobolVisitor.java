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
import com.ca.lsp.core.cobol.model.DocumentHierarchyLevel;
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
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nullable;
import java.util.*;

import static com.ca.lsp.core.cobol.model.ErrorSeverity.INFO;
import static com.ca.lsp.core.cobol.model.ErrorSeverity.WARNING;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static org.apache.commons.lang3.StringUtils.isEmpty;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link com.ca.lsp.core.cobol.parser.CobolParser}. It requires a
 * semantic context with defined elements to add the usages or throw a warning on an invalid
 * definition. If there is a misspelled keyword, the visitor finds it and throws a warning.
 */
public class CobolVisitor extends CobolParserBaseVisitor<Class> {

  @Getter private List<SyntaxError> errors = new ArrayList<>();
  @Getter private Map<Token, Position> mapping = new HashMap<>();
  @Getter private SubContext<String, Token> paragraphs = new NamedSubContext<>();
  @Getter private CobolVariableContext<Token> variables = new CobolVariableContext<>();

  @Getter private NamedSubContext<Position> copybooks;

  private Deque<DocumentHierarchyLevel> documentHierarchyStack = new ArrayDeque<>();
  private Map<String, List<Position>> documentPositions;

  public CobolVisitor(String documentUri, ExtendedDocument extendedDocument) {
    copybooks = extendedDocument.getCopybooks();
    documentPositions = extendedDocument.getDocumentPositions();
    documentHierarchyStack.push(
        new DocumentHierarchyLevel(
            documentUri, new ArrayList<>(documentPositions.get(documentUri))));
  }

  @Nullable
  private Position calculatePosition(Token token) {
    DocumentHierarchyLevel currentDocument = documentHierarchyStack.peek();
    if (currentDocument == null) {
      return null;
    }
    String tokenText = token.getText();
    List<Position> positions = currentDocument.getPositions();
    Position position = findPosition(tokenText, positions);
    if (position != null) {
      currentDocument.setPositions(
          positions.subList(positions.indexOf(position) + 1, positions.size()));
    } else {
      position = applyReversePositionLookUp(tokenText, currentDocument.getName(), positions.size());
    }
    return position;
  }

  private Position applyReversePositionLookUp(
      String tokenText, String docName, int numberOfCurrentPositions) {

    List<Position> initialPositions = documentPositions.get(docName);
    if (initialPositions == null) {
      return null;
    }

    List<Position> subList =
        initialPositions.subList(0, initialPositions.size() - numberOfCurrentPositions);
    Collections.reverse(subList);

    return findPosition(tokenText, subList);
  }

  private Position findPosition(String tokenText, List<Position> subList) {
    return subList.stream().filter(it -> it.getToken().equals(tokenText)).findFirst().orElse(null);
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
    paragraphs.define(ctx.getText().toUpperCase(), ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {

    String levelNumber = ctx.otherLevel().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable -> defineVariable(levelNumber, variable.getText(), variable.getStart()));
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {

    String levelNumber = ctx.LEVEL_NUMBER_66().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable -> defineVariable(levelNumber, variable.getText(), variable.getStart()));
    return visitChildren(ctx);
  }

  @Override
  public Class visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    String levelNumber = ctx.LEVEL_NUMBER_88().getText();
    ofNullable(ctx.dataName1())
        .ifPresent(
            variable -> defineVariable(levelNumber, variable.getText(), variable.getStart()));
    return visitChildren(ctx);
  }

  private void defineVariable(String level, String name, Token token) {
    variables.define(new Variable(level, name), token);
  }

  @Override
  public Class visitParagraphNameUsage(ParagraphNameUsageContext ctx) {
    String name = ctx.getText().toUpperCase();
    addUsage(paragraphs, name, ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public Class visitQualifiedDataNameFormat1(QualifiedDataNameFormat1Context ctx) {
    ofNullable(ctx.dataName())
        .map(it -> it.getText().toUpperCase())
        .ifPresent(variable -> checkForVariable(variable, ctx));
    return visitChildren(ctx);
  }

  @Override
  public Class visitTerminal(TerminalNode node) {
    Token token = node.getSymbol();
    Position position = calculatePosition(token);
    mapping.put(token, position);
    checkControlSymbol(token.getText());
    return super.visitTerminal(node);
  }

  @Override
  public Class visitErrorNode(ErrorNode node) {
    Token token = node.getSymbol();
    Position position = calculatePosition(token);
    mapping.put(token, position);
    checkControlSymbol(token.getText());
    return super.visitTerminal(node);
  }

  private void checkControlSymbol(String terminal) {
    if (isEmpty(terminal)) return;
    if (terminal.startsWith("*>CPYENTER")) {
      moveToNextLevel(terminal);
    } else if ("*>CPYEXIT".equals(terminal)) {
      moveToPreviousLevel();
    }
  }

  private void moveToNextLevel(String cpy) {
    documentHierarchyStack.push(
        nextDocLevel(cpy.substring(10).replace("<URI>", "").replace("</URI>", "")));
  }

  private DocumentHierarchyLevel nextDocLevel(String cpyName) {
    return new DocumentHierarchyLevel(
        cpyName, ofNullable(documentPositions.get(cpyName)).orElse(emptyList()));
  }

  private void moveToPreviousLevel() {
    documentHierarchyStack.pop();
  }

  private void checkForVariable(String variable, QualifiedDataNameFormat1Context ctx) {
    checkVariableDefinition(variable, ctx.getStart());
    addUsage(variables, variable, ctx.getStart());

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

      checkVariableDefinition(parent, parentToken);
      checkVariableStructure(parent, child, childToken);

      childToken = parentToken;
      child = parent;

      addUsage(variables, child, parentToken);
    }
  }

  private void checkVariableDefinition(String name, Token position) {
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

  private void checkVariableStructure(String parent, String child, Token startToken) {
    if (!variables.parentContainsSpecificChild(parent, child)) {
      reportVariableNotDefined(child, startToken, startToken);
    }
  }

  private void addUsage(SubContext<?, Token> langContext, String name, Token token) {
    langContext.addUsage(name.toUpperCase(), token);
  }

  private void reportVariableNotDefined(String dataName, Token startToken, Token stopToken) {
    errors.add(
        SyntaxError.syntaxError()
            .suggestion("Invalid definition for: " + dataName)
            .severity(INFO)
            .startToken(startToken)
            .stopToken(stopToken)
            .build());
  }

  private void throwWarning(Token token) {
    MisspelledKeywordDistance.calculateDistance(token.getText().toUpperCase())
        .ifPresent(correctWord -> reportMisspelledKeyword(correctWord, token));
  }

  private void reportMisspelledKeyword(String suggestion, Token token) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion("A misspelled word, maybe you want to put " + suggestion)
            .severity(WARNING)
            .startToken(token)
            .build();
    errors.add(error);
  }
}
