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
package org.eclipse.lsp.cobol.parser.hw.antlradapter;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.cst.*;
import org.eclipse.lsp.cobol.cst.base.CstNode;
import org.eclipse.lsp.cobol.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;

/** Reconstruct the AST */
public class AntlrAdapter {
  public static final int INT = 6;
  private final BaseErrorListener errorListener;
  private final DefaultErrorStrategy errorStrategy;
  private final ParseTreeListener treeListener;
  private CharStream charStream;

  public AntlrAdapter(
      BaseErrorListener errorListener,
      DefaultErrorStrategy errorStrategy,
      ParseTreeListener treeListener) {
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
    this.charStream = CharStreams.fromString(su.toText());
    traversePrograms(su, p -> replaceWithAntlr(p, convertProgramNode(p)));
    CobolParser.StartRuleContext startRuleContext = convertSourceUnit(su);
    startRuleContext.addChild(new TerminalNodeImpl(new CommonToken(Token.EOF, "")));
    return startRuleContext;
  }

  private static CobolParser.ProgramUnitContext replaceWithAntlr(
      ProgramUnit p, CobolParser.ProgramUnitContext result) {
    org.eclipse.lsp.cobol.parser.hw.lexer.Token token = Utils.findStartToken(p).get();
    int startLine = token.getLine();
    int startPos = token.getStartPositionInLine();
    char[] chars = p.toText().toCharArray();
    for (int i = 0; i < chars.length; i++) {
      if (chars[i] != '\n') {
        chars[i] = ' ';
      }
    }
    p.getChildren().clear();
    AntlrAdapted antlr = new AntlrAdapted(result);
    antlr
        .getChildren()
        .add(
            new org.eclipse.lsp.cobol.parser.hw.lexer.Token(
                startLine,
                startPos,
                token.getIndexStart(),
                token.getIndexStop(),
                TokenType.WHITESPACE,
                token.getSource()));
    p.getChildren().add(antlr);
    return result;
  }

  private void traversePrograms(
      CstNode node, Function<ProgramUnit, CobolParser.ProgramUnitContext> processor) {
    node.getChildren().forEach(s -> traversePrograms(s, processor));
    if (node instanceof ProgramUnit) {
      processor.apply((ProgramUnit) node);
    }
  }

  private CobolParser.StartRuleContext convertSourceUnit(SourceUnit cstNode) {
    CobolParser.StartRuleContext start = new CobolParser.StartRuleContext(null, 0);
    start.children = new ArrayList<>();
    start.start = Utils.toAntlrToken(Utils.findStartToken(cstNode, true).get(), charStream);
    start.stop = Utils.toAntlrToken(Utils.findStopToken(cstNode, true).get(), charStream);
    CobolParser.CompilationUnitContext compilationUnit =
        new CobolParser.CompilationUnitContext(start, 0);
    Utils.initNode(cstNode, compilationUnit, charStream);
    start.addChild(compilationUnit);
    processChildNodes(cstNode, compilationUnit);
    return start;
  }

  private CobolParser.ProgramUnitContext convertProgramNode(CstNode programUnit) {
    CobolParser.ProgramUnitContext program = new CobolParser.ProgramUnitContext(null, 0);
    Utils.initNode(programUnit, program, charStream);
    processChildNodes(programUnit, program);
    Optional<List<org.eclipse.lsp.cobol.parser.hw.lexer.Token>> endProgramName =
        getEndProgramName(programUnit);
    if (endProgramName.isPresent()) {
      CobolParser.EndProgramStatementContext endProgramStatementContext =
          new CobolParser.EndProgramStatementContext(program, 0);
      endProgramStatementContext.start =
          Utils.toAntlrToken(Utils.findStartToken(programUnit).get(), charStream);
      endProgramStatementContext.stop =
          Utils.toAntlrToken(Utils.findStopToken(programUnit).get(), charStream);
      CobolParser.ProgramNameContext nameContext =
          new CobolParser.ProgramNameContext(endProgramStatementContext, 0);
      org.eclipse.lsp.cobol.parser.hw.lexer.Token nameToken = endProgramName.get().get(0);
      nameContext.start = Utils.toAntlrToken(nameToken, charStream);
      nameContext.stop =
          Utils.toAntlrToken(
              (endProgramName.get().get(endProgramName.get().size() - 1)), charStream);
      endProgramStatementContext.children = new ArrayList<>();
      endProgramStatementContext.children.add(nameContext);
      nameContext.addChild(new TerminalNodeImpl(Utils.toAntlrToken(nameToken, charStream)));
      program.addChild(endProgramStatementContext);
    }
    return program;
  }

  private ParserRuleContext convertNode(CstNode cstNode) {
    if (cstNode instanceof ProgramUnit) {
      // All programs should be adapted to this point
      return ((AntlrAdapted) cstNode.getChildren().get(0)).getRuleContext();
    } else if (cstNode instanceof DataDivision) {
      CobolDataDivisionParser.DataDivisionContext dataDivisionContext =
          antlrDataDivisionParser(cstNode).dataDivision();
      Utils.removeEofNode(dataDivisionContext);
      return dataDivisionContext;
    } else if (cstNode instanceof IdentificationDivision) {
      CobolIdentificationDivisionParser.IdentificationDivisionContext
          identificationDivisionContext = antlrIdDivisionParser(cstNode).identificationDivision();
      Utils.removeEofNode(identificationDivisionContext);
      return identificationDivisionContext;
    } else if (cstNode instanceof EnvironmentDivision) {
      CobolParser.EnvironmentDivisionContext environmentDivisionContext =
          antlrParser(cstNode).environmentDivision();
      Utils.removeEofNode(environmentDivisionContext);
      return environmentDivisionContext;
    } else if (cstNode instanceof ProcedureDivision) {
      ProcedureDivisionAntlrAdapter adapter =
          new ProcedureDivisionAntlrAdapter(charStream, errorListener, errorStrategy, treeListener);
      CobolProcedureDivisionParser.ProcedureDivisionContext procedureDivisionContext =
          adapter.processProcedureDivisionContext((ProcedureDivision) cstNode);
      Utils.removeEofNode(procedureDivisionContext);
      return procedureDivisionContext;
    } else {
      return null;
    }
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
    org.eclipse.lsp.cobol.parser.hw.lexer.Token startToken = Utils.findStartToken(node).get();
    String input = Utils.generatePrefix(charStream, startToken) + node.toText().trim();
    CobolIdentificationDivisionLexer antlrLexer =
        new CobolIdentificationDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolIdentificationDivisionParser antlrParser = new CobolIdentificationDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.addParseListener(treeListener);
    antlrParser.setErrorHandler(errorStrategy);
    return antlrParser;
  }

  private CobolDataDivisionParser antlrDataDivisionParser(CstNode node) {
    org.eclipse.lsp.cobol.parser.hw.lexer.Token startToken = Utils.findStartToken(node).get();
    String input = Utils.generatePrefix(charStream, startToken) + node.toText();
    CobolDataDivisionLexer antlrLexer = new CobolDataDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolDataDivisionParser antlrParser = new CobolDataDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.addParseListener(treeListener);
    antlrParser.setErrorHandler(errorStrategy);
    return antlrParser;
  }

  private CobolParser antlrParser(CstNode node) {
    org.eclipse.lsp.cobol.parser.hw.lexer.Token startToken = Utils.findStartToken(node).get();
    String input = Utils.generatePrefix(charStream, startToken) + node.toText();
    org.eclipse.lsp.cobol.core.CobolLexer antlrLexer =
        new org.eclipse.lsp.cobol.core.CobolLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    org.eclipse.lsp.cobol.core.CobolParser antlrParser =
        new org.eclipse.lsp.cobol.core.CobolParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    return antlrParser;
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
    CommonTokenStream commonTokenStream =
        new CommonTokenStream(
            new ListTokenSource(
                tokens.stream()
                    .map(org.eclipse.lsp.cobol.parser.hw.lexer.Token.class::cast)
                    .map(token -> Utils.toAntlrToken(token, charStream))
                    .collect(Collectors.toList())));
    commonTokenStream.fill();
    return commonTokenStream;
  }

  private void collectTokens(CstNode su, List<CstNode> result) {
    if (su instanceof org.eclipse.lsp.cobol.parser.hw.lexer.Token) {
      result.add(su);
    }
    for (CstNode node : su.getChildren()) {
      collectTokens(node, result);
    }
  }

  static Optional<List<org.eclipse.lsp.cobol.parser.hw.lexer.Token>> getEndProgramName(
      CstNode cstNode) {
    List<org.eclipse.lsp.cobol.parser.hw.lexer.Token> result = new ArrayList<>();
    if (!(cstNode instanceof ProgramUnit)) {
      return Optional.empty();
    }
    boolean nextName = false;
    int skip = 1;
    for (CstNode n : cstNode.getChildren()) {
      if (!(n instanceof org.eclipse.lsp.cobol.parser.hw.lexer.Token)
          || ((org.eclipse.lsp.cobol.parser.hw.lexer.Token) n).getType() == TokenType.WHITESPACE) {
        continue;
      }
      if (nextName) {
        if (skip == 0) {
          result.add((org.eclipse.lsp.cobol.parser.hw.lexer.Token) n);
        } else {
          skip--;
        }
      }
      if ("END".equalsIgnoreCase(((org.eclipse.lsp.cobol.parser.hw.lexer.Token) n).getLexeme())) {
        nextName = true;
      }
    }
    return result.isEmpty() ? Optional.empty() : Optional.of(result);
  }
}
