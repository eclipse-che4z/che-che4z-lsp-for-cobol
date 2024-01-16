/*
 * Copyright (c) 2024 Broadcom.
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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.core.hw;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.cst.*;
import org.eclipse.lsp.cobol.core.cst.base.CstNode;
import org.eclipse.lsp.cobol.core.cst.IdentificationDivision;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Reconstruct the AST
 */
public class AntlrAdapter {
  private final BaseErrorListener errorListener;
  private final DefaultErrorStrategy errorStrategy;
  private final ParseTreeListener treeListener;

  public AntlrAdapter(BaseErrorListener errorListener, DefaultErrorStrategy errorStrategy, ParseTreeListener treeListener) {
    this.errorListener = errorListener;
    this.errorStrategy = errorStrategy;
    this.treeListener = treeListener;
  }

  /**
   * Convert HW source unit to ANTLR Start rule
   *
   * @param su root of CST
   * @return ANTLR AST
   */
  public CobolParser.StartRuleContext sourceUnitToStartRule(SourceUnit su) {
    CobolParser.StartRuleContext startRuleContext = (CobolParser.StartRuleContext) convertNode(su, null);
    startRuleContext.children.add(new TerminalNodeImpl(new CommonToken(Token.EOF, "")));
    return startRuleContext;
  }

  private ParserRuleContext convertNode(CstNode cstNode, ParserRuleContext parent) {
    ParserRuleContext result = null;
    if (cstNode instanceof SourceUnit) {
      CobolParser.StartRuleContext start = new CobolParser.StartRuleContext(null, 0);
      initNode(cstNode, start);
      CobolParser.CompilationUnitContext compilationUnit = new CobolParser.CompilationUnitContext(start, 0);
      initNode(cstNode, compilationUnit);
      start.children.add(compilationUnit);
      processChildNodes(cstNode, compilationUnit);
      return start;
    } else if (cstNode instanceof ProgramUnit) {
      return processProgramNode(cstNode, parent);
    } else if (cstNode instanceof DataDivision) {
      return antlrDataDivisionParser(cstNode).dataDivision();
    } else if (cstNode instanceof IdentificationDivision) {
      return antlrIdDivisionParser(cstNode).identificationDivision();
    } else if (cstNode instanceof EnvironmentDivision) {
      return antlrParser(cstNode).environmentDivision();
    } else if (cstNode instanceof ProcedureDivision) {
      return antlrParser(cstNode).procedureDivision();
    } else {
      return null;
    }
  }

  private ParserRuleContext processProgramNode(CstNode cstNode, ParserRuleContext parent) {
    CobolParser.ProgramUnitContext program = new CobolParser.ProgramUnitContext(parent, 0);
    program.children = new ArrayList<>();

    program.start = toAntlrToken(findStartToken(cstNode));

    CstNode stopToken = findStopToken(cstNode);
    program.stop = toAntlrToken(stopToken);
    processChildNodes(cstNode, program);

    if (parent instanceof CobolParser.CompilationUnitContext) {
      return program;
    }

    parent.children.add(program);
    CobolParser.EndProgramStatementContext end = new CobolParser.EndProgramStatementContext(parent, 0);
//    end.start =
//    end.stop =
    return end;
  }

  private void initNode(CstNode cstNode, ParserRuleContext start) {
    start.start = toAntlrToken(findStartToken(cstNode));
    start.stop = toAntlrToken(findStopToken(cstNode));
    start.children = new ArrayList<>();
  }

  private Token toAntlrToken(CstNode node) {
    CommonToken commonToken = new CommonToken(0, node.toText());
    org.eclipse.lsp.cobol.core.hw.Token token = (org.eclipse.lsp.cobol.core.hw.Token) node;
    commonToken.setLine(token.getLine() + 1);
    commonToken.setCharPositionInLine(token.getStartPositionInLine());
    if (token.getType() == TokenType.WHITESPACE || token.getType() == TokenType.NEW_LINE) {
      commonToken.setChannel(Token.HIDDEN_CHANNEL);
    }
    return commonToken;
  }

  private CstNode findStartToken(CstNode cstNode) {
    if (cstNode.getChildren().isEmpty()) {
      return cstNode;
    }
    return findStartToken(cstNode.getChildren().get(0));
  }

  private CstNode findStopToken(CstNode cstNode) {
    if (cstNode.getChildren().isEmpty()) {
      return cstNode;
    }
    return findStartToken(cstNode.getChildren().get(cstNode.getChildren().size() - 1));
  }

  private void processChildNodes(CstNode cstNode, ParserRuleContext result) {
    result.children = new ArrayList<>();
    for (CstNode child : cstNode.getChildren()) {
      ParserRuleContext ruleContext = convertNode(child, result);
      if (ruleContext != null) {

        ruleContext.setParent(result);
        result.children.add(ruleContext);
      }
    }
  }

  private CobolIdentificationDivisionParser antlrIdDivisionParser(CstNode node) {
    org.eclipse.lsp.cobol.core.hw.Token startToken = (org.eclipse.lsp.cobol.core.hw.Token) findStartToken(node);
    String input = generatePrefix(startToken.getLine(), startToken.getStartPositionInLine()) + node.toText();
    CobolIdentificationDivisionLexer antlrLexer = new CobolIdentificationDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolIdentificationDivisionParser antlrParser = new CobolIdentificationDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    return antlrParser;
  }

  private CobolDataDivisionParser antlrDataDivisionParser(CstNode node) {
    org.eclipse.lsp.cobol.core.hw.Token startToken = (org.eclipse.lsp.cobol.core.hw.Token) findStartToken(node);
    String input = generatePrefix(startToken.getLine(), startToken.getStartPositionInLine()) + node.toText();
    CobolDataDivisionLexer antlrLexer = new CobolDataDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolDataDivisionParser antlrParser = new CobolDataDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    return antlrParser;
  }

  private CobolParser antlrParser(CstNode node) {
    org.eclipse.lsp.cobol.core.hw.Token startToken = (org.eclipse.lsp.cobol.core.hw.Token) findStartToken(node);
    String input = generatePrefix(startToken.getLine(), startToken.getStartPositionInLine()) + node.toText();
    org.eclipse.lsp.cobol.core.CobolLexer antlrLexer = new org.eclipse.lsp.cobol.core.CobolLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    org.eclipse.lsp.cobol.core.CobolParser antlrParser = new org.eclipse.lsp.cobol.core.CobolParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    return antlrParser;
  }

  private String generatePrefix(int line, int startPositionInLine) {
    return new String(new char[line]).replace('\0', '\n')
            + new String(new char[startPositionInLine]).replace('\0', ' ');
  }

  /**
   * Collect tokens
   *
   * @param su CST root
   * @return ANTLR token stream
   */
  public CommonTokenStream adaptTokens(SourceUnit su) {
    List<CstNode> tokens = new ArrayList<>();
    collectTokens(su, tokens);
    CommonTokenStream commonTokenStream = new CommonTokenStream(new ListTokenSource(tokens.stream()
            .filter(t -> ((org.eclipse.lsp.cobol.core.hw.Token) t).getType() != TokenType.WHITESPACE)
            .map(this::toAntlrToken).collect(Collectors.toList())));
    commonTokenStream.fill();
    return commonTokenStream;
  }

  private void collectTokens(CstNode su, List<CstNode> result) {
    if (su instanceof org.eclipse.lsp.cobol.core.hw.Token) {
      result.add(su);
    }
    for (CstNode node : su.getChildren()) {
      collectTokens(node, result);
    }
  }
}
