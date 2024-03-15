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
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.cst.*;
import org.eclipse.lsp.cobol.core.cst.base.CstNode;
import org.eclipse.lsp.cobol.core.cst.IdentificationDivision;
import org.eclipse.lsp.cobol.core.cst.procedure.Paragraph;
import org.eclipse.lsp.cobol.core.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.core.cst.procedure.Section;
import org.eclipse.lsp.cobol.core.cst.procedure.Statement;
import org.eclipse.lsp.cobol.core.hw.TokenType;

import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
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
  private CharStream charStream;

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
    this.charStream = CharStreams.fromString(su.toText());
    traversePrograms(su, p -> replaceWithAntlr(p, convertProgramNode(p)));
    CobolParser.StartRuleContext startRuleContext = convertSourceUnit(su);
    startRuleContext.addChild(new TerminalNodeImpl(new CommonToken(Token.EOF, "")));
    return startRuleContext;
  }

  private static CobolParser.ProgramUnitContext replaceWithAntlr(ProgramUnit p, CobolParser.ProgramUnitContext result) {
    org.eclipse.lsp.cobol.core.hw.Token token = Utils.findStartToken(p).get();
    int startLine = token.getLine();
    int startPos = token.getStartPositionInLine();
    int stopPos = 0;
    int stopLine = startLine;
    char[] chars = p.toText().toCharArray();
    for (int i = 0; i < chars.length; i++) {
      if (chars[i] == '\n') {
        stopLine++;
        // ignore last new line.
        if (i != chars.length - 1) {
          stopPos = 0;
        }
        ;
      } else {
        stopPos++;
        chars[i] = ' ';
      }
    }
    String lexeme = new String(chars);
    p.getChildren().clear();
    AntlrAdapted antlr = new AntlrAdapted(result);
    antlr.getChildren().add(new org.eclipse.lsp.cobol.core.hw.Token(lexeme, startLine, startPos, token.getIndex(), TokenType.WHITESPACE));
    // End empty token, im not sure why antrl have it.
    antlr.getChildren().add(
            new org.eclipse.lsp.cobol.core.hw.Token("",
                    stopLine - 1,
                    stopPos - 1,
                    token.getIndex() + lexeme.length() - 2,
                    null));
    p.getChildren().add(antlr);
    return result;
  }

  private void traversePrograms(CstNode node, Function<ProgramUnit, CobolParser.ProgramUnitContext> processor) {
    node.getChildren().forEach(s -> traversePrograms(s, processor));
    if (node instanceof ProgramUnit) {
      processor.apply((ProgramUnit) node);
    }
  }

  private CobolParser.StartRuleContext convertSourceUnit(SourceUnit cstNode) {
    CobolParser.StartRuleContext start = new CobolParser.StartRuleContext(null, 0);
    initNode(cstNode, start, charStream);
    CobolParser.CompilationUnitContext compilationUnit = new CobolParser.CompilationUnitContext(start, 0);
    initNode(cstNode, compilationUnit, charStream);
    start.addChild(compilationUnit);
    processChildNodes(cstNode, compilationUnit);
    return start;
  }

  private CobolParser.ProgramUnitContext convertProgramNode(CstNode programUnit) {
    CobolParser.ProgramUnitContext program = new CobolParser.ProgramUnitContext(null, 0);
    initNode(programUnit, program, charStream);
    processChildNodes(programUnit, program);
    Optional<List<org.eclipse.lsp.cobol.core.hw.Token>> endProgramName = getEndProgramName(programUnit);
    if (endProgramName.isPresent()) {
      CobolParser.EndProgramStatementContext endProgramStatementContext = new CobolParser.EndProgramStatementContext(program, 0);
      endProgramStatementContext.start = toAntlrToken(findStartToken(programUnit).get(), charStream);
      endProgramStatementContext.stop = toAntlrToken(findStopToken(programUnit).get(), charStream);
      CobolParser.ProgramNameContext nameContext = new CobolParser.ProgramNameContext(endProgramStatementContext, 0);
      org.eclipse.lsp.cobol.core.hw.Token nameToken = endProgramName.get().get(0);
      nameContext.start = toAntlrToken(nameToken, charStream);
      nameContext.stop = toAntlrToken((endProgramName.get().get(endProgramName.get().size() - 1)), charStream);
      endProgramStatementContext.children = new ArrayList<>();
      endProgramStatementContext.children.add(nameContext);
      nameContext.addChild(new TerminalNodeImpl(toAntlrToken(nameToken, charStream)));


      program.addChild(endProgramStatementContext);
    }
    return program;
  }

  private ParserRuleContext convertNode(CstNode cstNode) {
    if (cstNode instanceof ProgramUnit) {
      // All programs should be adapted to this point
      return ((AntlrAdapted) cstNode.getChildren().get(0)).getRuleContext();
    } else if (cstNode instanceof DataDivision) {
      CobolDataDivisionParser.DataDivisionContext dataDivisionContext = antlrDataDivisionParser(cstNode).dataDivision();
      return dataDivisionContext;
    } else if (cstNode instanceof IdentificationDivision) {
      CobolIdentificationDivisionParser.IdentificationDivisionContext identificationDivisionContext = antlrIdDivisionParser(cstNode).identificationDivision();
      return identificationDivisionContext;
    } else if (cstNode instanceof EnvironmentDivision) {
      CobolParser.EnvironmentDivisionContext environmentDivisionContext = antlrParser(cstNode).environmentDivision();
      return environmentDivisionContext;
    } else if (cstNode instanceof ProcedureDivision) {
      return processProcedureDivisionContext((ProcedureDivision) cstNode);
    } else {
      return null;
    }
  }

  private CobolProcedureDivisionParser.ProcedureDivisionContext processProcedureDivisionContext(ProcedureDivision cstNode) {
    long startTime = System.currentTimeMillis();
    CobolProcedureDivisionParser.ProcedureDivisionContext pdCtx = initNode(cstNode, new CobolProcedureDivisionParser.ProcedureDivisionContext(null, 0), charStream);
    TerminalNodeImpl tNode = new TerminalNodeImpl(new CommonToken(0, ""));
    pdCtx.addChild(tNode);
    pdCtx.addChild(tNode);
    pdCtx.addChild(tNode);
    pdCtx.addChild(createProcedureDivisionBodyContext(cstNode));
    System.out.println("> ProcedureDivision: " + (System.currentTimeMillis() - startTime));
    return pdCtx;
  }

  private int skipTo(List<CstNode> nodes, int from, Predicate<CstNode> predicate) {
    for (int i = from; i < nodes.size(); i++) {
      if (predicate.test(nodes.get(i))) {
        return i;
      }
    }
    return nodes.size();
  }

  private CobolProcedureDivisionParser.ProcedureDivisionBodyContext createProcedureDivisionBodyContext(ProcedureDivision cstNode) {
    CobolProcedureDivisionParser.ProcedureDivisionBodyContext pdbCtx = initNode(cstNode, new CobolProcedureDivisionParser.ProcedureDivisionBodyContext(null, 0), charStream);
    pdbCtx.start = toAntlrToken(cstNode.getBodyStartToken(), charStream);
    List<CstNode> children = cstNode.getChildren();
    // Find first non token node index
    int idx = skipTo(children, 0, n -> !(n instanceof org.eclipse.lsp.cobol.core.hw.Token));
    CobolProcedureDivisionParser.ParagraphsContext sectionParagraphs = null;

    CobolProcedureDivisionParser.ParagraphsContext currentParagraphs = null;
    while (idx < children.size()) {
      CstNode node = children.get(idx);
      if (node instanceof Paragraph) {
        if (currentParagraphs == null) {
          currentParagraphs = createParagraphs(pdbCtx, node.getChildren());
        }

        int start = idx + 1;
        // Flat the tree. I hope it's throw away code, and I'll implement it better next time.
        children.addAll(node.getChildren());
        idx = skipTo(children, start, n -> !(n instanceof Statement));
        adaptParagraph(node, children, start, idx, sectionParagraphs, currentParagraphs);
      } else if (node instanceof Section) {
        int start = idx + 1;
        // Flat the tree. I hope it's throw away code, and I'll implement it better next time.
        children.addAll(node.getChildren());
        idx = skipTo(children, start, n -> (n instanceof Paragraph) || (n instanceof Section) || (n instanceof Statement));
        sectionParagraphs = createSectionParagraphsCtx(node, children, start, idx, currentParagraphs, pdbCtx);
        currentParagraphs = sectionParagraphs;

      } else if (node instanceof Statement) {
        int start = idx;
        idx = skipTo(children, idx, n -> (n instanceof Paragraph) || (n instanceof Section));
        if (start < idx) {
          List<CstNode> cstNodes = children.subList(start, Math.min(idx, children.size()));
          if (!cstNodes.isEmpty()) {
            currentParagraphs = createParagraphs(pdbCtx, children.subList(start, children.size()));
            parseStatements(cstNodes, currentParagraphs);
          }
        } else {
          idx++;
        }
      } else if (node instanceof org.eclipse.lsp.cobol.core.hw.Token) {
        idx++;
      }
    }
    if (sectionParagraphs != null) {
      sectionParagraphs.getParent().stop = toAntlrToken(findStopToken(children, true).get(), charStream);
    }
    return pdbCtx;
  }

  private CobolProcedureDivisionParser.ParagraphsContext createParagraphs(CobolProcedureDivisionParser.ProcedureDivisionBodyContext pdbCtx, List<CstNode> cstNodes) {
    CobolProcedureDivisionParser.ParagraphsContext currentParagraphs;
    currentParagraphs =
            new CobolProcedureDivisionParser.ParagraphsContext(pdbCtx, 0);
    currentParagraphs.start =
            findStartToken(cstNodes.get(0))
                    .map(token -> toAntlrToken(token, charStream))
                    .orElse(null);
    currentParagraphs.stop =
            findStopToken(cstNodes, true)
                    .map(token -> toAntlrToken(token, charStream))
                    .orElse(null);
    currentParagraphs.children = new ArrayList<>();
    currentParagraphs.setParent(pdbCtx);
    pdbCtx.addChild(currentParagraphs);
    return currentParagraphs;
  }

  private CobolProcedureDivisionParser.ParagraphsContext createSectionParagraphsCtx(CstNode node, List<CstNode> children, int start, int idx, CobolProcedureDivisionParser.ParagraphsContext paragraphs, CobolProcedureDivisionParser.ProcedureDivisionBodyContext pdbCtx) {
    org.eclipse.lsp.cobol.core.hw.Token name = (org.eclipse.lsp.cobol.core.hw.Token) node.getChildren().get(0);
    org.eclipse.lsp.cobol.core.hw.Token section = (org.eclipse.lsp.cobol.core.hw.Token) node.getChildren().get(2);
    org.eclipse.lsp.cobol.core.hw.Token dot = (org.eclipse.lsp.cobol.core.hw.Token) node.getChildren().get(3);

    if (paragraphs != null) {
      paragraphs.getParent().stop = toAntlrToken(findStopToken(node, true).get(), charStream);
    }

    CobolProcedureDivisionParser.ProcedureSectionHeaderContext header = createSectionHeader(node, name, section);
    CobolProcedureDivisionParser.ProcedureSectionContext sectionContext =
            initNode(node, new CobolProcedureDivisionParser.ProcedureSectionContext(pdbCtx, 0), charStream);

    CobolProcedureDivisionParser.ParagraphsContext paragraphsContext =
            initNode(((Section) node).getBodyStartToken(), new CobolProcedureDivisionParser.ParagraphsContext(null, 0), charStream);
    paragraphsContext.setParent(sectionContext);
    CstNode endNode = children.get(skipTo(children, start, Section.class::isInstance) - 1);
    paragraphsContext.stop = toAntlrToken(findStopToken(endNode, true).get(), charStream);
    parseStatements(children.subList(start, Math.min(idx, children.size())), paragraphsContext);
    sectionContext.addChild(header);
    sectionContext.addChild(new TerminalNodeImpl(toAntlrToken(dot, charStream)));
    sectionContext.addChild(paragraphsContext);

    if (paragraphs != null) {
      if (paragraphs.getParent() instanceof CobolProcedureDivisionParser.ProcedureSectionContext) {
        paragraphs.getParent().getParent().addChild(sectionContext);
      } else {
        paragraphs.getParent().addChild(sectionContext);
      }
    } else {
      pdbCtx.addChild(sectionContext);
    }
    return paragraphsContext;
  }

  private CobolProcedureDivisionParser.ProcedureSectionHeaderContext createSectionHeader(CstNode node, org.eclipse.lsp.cobol.core.hw.Token name, org.eclipse.lsp.cobol.core.hw.Token section) {
    CobolProcedureDivisionParser.ProcedureSectionHeaderContext header =
            initNode(node, new CobolProcedureDivisionParser.ProcedureSectionHeaderContext(null, 0), charStream);

    CobolProcedureDivisionParser.SectionNameContext sectionNameContext = initNode(name, new CobolProcedureDivisionParser.SectionNameContext(null, 0), charStream);
    sectionNameContext.addChild(new TerminalNodeImpl(toAntlrToken(name, charStream)));
    header.addChild(sectionNameContext);
    header.addChild(new TerminalNodeImpl(toAntlrToken(section, charStream)));
    return header;
  }

  private void adaptParagraph(CstNode node, List<CstNode> children, int start, int idx, CobolProcedureDivisionParser.ParagraphsContext paragraphsContext, ParserRuleContext pdbCtx) {
    CobolProcedureDivisionParser.ParagraphContext paragraphContext =
            initNode(node, new CobolProcedureDivisionParser.ParagraphContext(null, 0), charStream);
    org.eclipse.lsp.cobol.core.hw.Token name = (org.eclipse.lsp.cobol.core.hw.Token) node.getChildren().get(0);
    CobolProcedureDivisionParser.ParagraphDefinitionNameContext paragraphDefinitionNameContext
            = initNode(name, new CobolProcedureDivisionParser.ParagraphDefinitionNameContext(null, 0), charStream);
    TerminalNodeImpl nameTN = new TerminalNodeImpl(toAntlrToken(name, charStream));
    paragraphDefinitionNameContext.addChild(nameTN);
    paragraphDefinitionNameContext.setParent(paragraphContext);
    paragraphContext.addChild(paragraphDefinitionNameContext);
    paragraphContext.addChild(
            new TerminalNodeImpl(
                    toAntlrToken((org.eclipse.lsp.cobol.core.hw.Token)
                            node.getChildren().get(dotIdx(node.getChildren())), charStream)));
    parseStatements(children.subList(start, Math.min(idx, children.size())), paragraphContext);
    if (paragraphsContext != null) {
      paragraphsContext.addChild(paragraphContext);
    } else {
      pdbCtx.addChild(paragraphContext);
    }
  }

  private int dotIdx(List<CstNode> nodes) {
    for (int i = 0; i < nodes.size(); i++) {
      if (".".equals(nodes.get(i).toText())) {
        return i;
      }
    }
    return -1;
  }

  private ParserRuleContext parseStatements(List<CstNode> cstNodes, ParserRuleContext parent) {
    if (cstNodes.isEmpty()) {
      return parent;
    }

    for (CstNode node : cstNodes) {
      if (node instanceof Statement) {
        org.eclipse.lsp.cobol.core.hw.Token startToken = findStartToken(node).get();
        String input = generatePrefix(charStream, startToken) + node.toText();
        CobolProcedureDivisionLexer antlrLexer = new CobolProcedureDivisionLexer(CharStreams.fromString(input));
        antlrLexer.removeErrorListeners();
        antlrLexer.addErrorListener(errorListener);
        CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
        CobolProcedureDivisionParser antlrParser = new CobolProcedureDivisionParser(tokens);
        antlrParser.removeErrorListeners();
        antlrParser.addErrorListener(errorListener);
        antlrParser.setErrorHandler(errorStrategy);
        antlrParser.addParseListener(treeListener);
        CobolProcedureDivisionParser.SentenceContext sentence = antlrParser.sentence();
        parent.addChild(sentence);
        sentence.setParent(parent);
      }
    }
    return parent;
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
    String input = generatePrefix(charStream, startToken) + node.toText();
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
    String input = generatePrefix(charStream, startToken) + node.toText();
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
    String input = generatePrefix(charStream, startToken) + node.toText();
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
    String input = generatePrefix(charStream, startToken) + node.toText();
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

  private String generatePrefix(CharStream charStream, org.eclipse.lsp.cobol.core.hw.Token startToken) {
    String prefix = charStream.getText(Interval.of(0, startToken.getIndex() - 1));
    char[] chars = prefix.toCharArray();
    for (int i = 0; i < chars.length; i++) {
      chars[i] = chars[i] != '\n' ? ' ' : '\n';
    }
    return new String(chars);

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
            .map(token -> Utils.toAntlrToken(token, charStream)).collect(Collectors.toList())));
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
