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
package org.eclipse.lsp.cobol.core.hw.antlradapter;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.cst.*;
import org.eclipse.lsp.cobol.core.cst.base.CstNode;
import org.eclipse.lsp.cobol.core.cst.IdentificationDivision;
import org.eclipse.lsp.cobol.core.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.core.hw.TokenType;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.hw.antlradapter.Utils.*;

/**
 * Reconstruct the AST
 */
public class AntlrAdapter {
  public static final int INT = 6;
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
    traversePrograms(su, p -> replaceWithAntlr(p, convertProgramNode(p)));
    CobolParser.StartRuleContext startRuleContext = convertSourceUnit(su);
    startRuleContext.addChild(new TerminalNodeImpl(new CommonToken(Token.EOF, "")));
    return startRuleContext;
  }

  private static CobolParser.ProgramUnitContext replaceWithAntlr(ProgramUnit p, CobolParser.ProgramUnitContext result) {
    org.eclipse.lsp.cobol.core.hw.Token token = Utils.findStartToken(p).get();
    int startLine = token.getLine();
    int startPos = token.getStartPositionInLine();
    char[] chars = p.toText().toCharArray();
    for (int i = 0; i < chars.length; i++) {
      chars[i] = chars[i] != '\n' ? ' ' : '\n';
    }
    String lexeme = new String(chars);
    p.getChildren().clear();
    AntlrAdapted antlr = new AntlrAdapted(result);
    antlr.getChildren().add(new org.eclipse.lsp.cobol.core.hw.Token(lexeme, startLine, startPos, token.getIndex(), TokenType.WHITESPACE));
    p.getChildren().add(antlr);
    return result;
  }

  private void traversePrograms(CstNode su, Function<ProgramUnit, CobolParser.ProgramUnitContext> processor) {
    su.getChildren().forEach(s -> traversePrograms(s, processor));
    if (su instanceof ProgramUnit) {
      processor.apply((ProgramUnit) su);
    }
  }

  private CobolParser.StartRuleContext convertSourceUnit(SourceUnit cstNode) {
    CobolParser.StartRuleContext start = new CobolParser.StartRuleContext(null, 0);
    initNode(cstNode, start);
    CobolParser.CompilationUnitContext compilationUnit = new CobolParser.CompilationUnitContext(start, 0);
    initNode(cstNode, compilationUnit);
    start.addChild(compilationUnit);
    processChildNodes(cstNode, compilationUnit);
    return start;
  }

  private CobolParser.ProgramUnitContext convertProgramNode(CstNode programUnit) {
    CobolParser.ProgramUnitContext program = new CobolParser.ProgramUnitContext(null, 0);
    initNode(programUnit, program);
    processChildNodes(programUnit, program);
    Optional<List<org.eclipse.lsp.cobol.core.hw.Token>> endProgramName = getEndProgramName(programUnit);
    if (endProgramName.isPresent()) {
      CobolParser.EndProgramStatementContext endProgramStatementContext = new CobolParser.EndProgramStatementContext(program, 0);
      endProgramStatementContext.start = toAntlrToken(findStartToken(programUnit).get());
      endProgramStatementContext.stop = toAntlrToken(findStopToken(programUnit).get());
      CobolParser.ProgramNameContext nameContext = new CobolParser.ProgramNameContext(endProgramStatementContext, 0);
      nameContext.start = toAntlrToken(endProgramName.get().get(0));
      nameContext.stop = toAntlrToken((endProgramName.get().get(endProgramName.get().size() - 1)));
      endProgramStatementContext.children = new ArrayList<>();
      endProgramStatementContext.children.add(nameContext);
      program.addChild(endProgramStatementContext);
    }
    return program;
  }

  private ParserRuleContext convertNode(CstNode cstNode) {
    if (cstNode instanceof ProgramUnit) {
      // All programs should be adapted to this point
      return ((AntlrAdapted) cstNode.getChildren().get(0)).getRuleContext();
    } else if (cstNode instanceof DataDivision) {
      long startTime = System.currentTimeMillis();
      CobolDataDivisionParser.DataDivisionContext dataDivisionContext = antlrDataDivisionParser(cstNode).dataDivision();
      System.out.println("> DataDivision: " + (System.currentTimeMillis() - startTime));
      return dataDivisionContext;
    } else if (cstNode instanceof IdentificationDivision) {
      long startTime = System.currentTimeMillis();
      CobolIdentificationDivisionParser.IdentificationDivisionContext identificationDivisionContext = antlrIdDivisionParser(cstNode).identificationDivision();
      System.out.println("> IdentificationDivision: " + (System.currentTimeMillis() - startTime));
      return identificationDivisionContext;
    } else if (cstNode instanceof EnvironmentDivision) {
      long startTime = System.currentTimeMillis();
      CobolParser.EnvironmentDivisionContext environmentDivisionContext = antlrParser(cstNode).environmentDivision();
      System.out.println("> EnvironmentDivision: " + (System.currentTimeMillis() - startTime));
      return environmentDivisionContext;
    } else if (cstNode instanceof ProcedureDivision) {
      return processProcedureDivisionContext(cstNode);
    } else {
      return null;
    }
  }

  private CobolProcedureDivisionParser.ProcedureDivisionContext processProcedureDivisionContext(CstNode cstNode) {

    CobolProcedureDivisionParser cobolProcedureDivisionParser = antlrProcedureDivisionParser(cstNode);
    long startTime = System.currentTimeMillis();
    CobolProcedureDivisionParser.ProcedureDivisionContext procedureDivisionContext = cobolProcedureDivisionParser.procedureDivision();
    System.out.println("> ProcedureDivision: " + (System.currentTimeMillis() - startTime));
    return procedureDivisionContext;
  }

  void processChildNodes(CstNode cstNode, ParserRuleContext parent) {
    parent.children = new ArrayList<>();
    for (CstNode child : cstNode.getChildren()) {
      ParserRuleContext ruleContext = convertNode(child);
      if (ruleContext == null) {
        continue;
      }
      parent.addChild(ruleContext);
    }
  }

  private CobolIdentificationDivisionParser antlrIdDivisionParser(CstNode node) {
    org.eclipse.lsp.cobol.core.hw.Token startToken = findStartToken(node).get();
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
    org.eclipse.lsp.cobol.core.hw.Token startToken = findStartToken(node).get();
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

  private CobolProcedureDivisionParser antlrProcedureDivisionParser(CstNode node) {
    org.eclipse.lsp.cobol.core.hw.Token startToken = findStartToken(node).get();
    String input = generatePrefix(startToken.getLine(), startToken.getStartPositionInLine()) + node.toText();
    CobolProcedureDivisionLexer antlrLexer = new CobolProcedureDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolProcedureDivisionParser antlrParser = new CobolProcedureDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    return antlrParser;
  }

  private CobolParser antlrParser(CstNode node) {
    org.eclipse.lsp.cobol.core.hw.Token startToken = findStartToken(node).get();
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
            .map(org.eclipse.lsp.cobol.core.hw.Token.class::cast)
            .map(Utils::toAntlrToken).collect(Collectors.toList())));
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
  static Optional<List<org.eclipse.lsp.cobol.core.hw.Token>> getEndProgramName(CstNode cstNode) {
    List<org.eclipse.lsp.cobol.core.hw.Token> result = new ArrayList<>();
    if (!(cstNode instanceof ProgramUnit)) {
      return Optional.empty();
    }
    boolean nextName = false;
    int skip = 1;
    for (CstNode n : cstNode.getChildren()) {
      if (!(n instanceof org.eclipse.lsp.cobol.core.hw.Token) || ((org.eclipse.lsp.cobol.core.hw.Token) n).getType() == TokenType.WHITESPACE) {
        continue;
      }
      if (nextName) {
        if (skip == 0) {
          result.add((org.eclipse.lsp.cobol.core.hw.Token) n);
        } else {
          skip--;
        }
      }
      if ("END".equalsIgnoreCase(((org.eclipse.lsp.cobol.core.hw.Token) n).getLexeme())) {
        nextName = true;
      }
    }

    return result.isEmpty() ? Optional.empty() : Optional.of(result);
  }

}
