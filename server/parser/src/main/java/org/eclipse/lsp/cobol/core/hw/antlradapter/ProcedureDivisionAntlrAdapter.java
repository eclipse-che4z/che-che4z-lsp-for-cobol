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
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;
import org.eclipse.lsp.cobol.core.CobolProcedureDivisionLexer;
import org.eclipse.lsp.cobol.core.CobolProcedureDivisionParser;
import org.eclipse.lsp.cobol.core.CobolProcedureDivisionParser.*;
import org.eclipse.lsp.cobol.core.cst.base.CstNode;
import org.eclipse.lsp.cobol.core.cst.procedure.*;
import org.eclipse.lsp.cobol.core.hw.Token;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.eclipse.lsp.cobol.core.hw.antlradapter.Utils.*;

/**
 * Procedure division mapping to antlr logic
 */
public class ProcedureDivisionAntlrAdapter {
  private final CharStream charStream;
  private final ANTLRErrorListener errorListener;
  private final ANTLRErrorStrategy errorStrategy;
  private final ParseTreeListener treeListener;
  private CommonToken lastToken = null;

  public ProcedureDivisionAntlrAdapter(
          CharStream charStream,
          ANTLRErrorListener errorListener,
          ANTLRErrorStrategy errorStrategy,
          ParseTreeListener treeListener) {
    this.charStream = charStream;
    this.errorListener = errorListener;
    this.errorStrategy = errorStrategy;
    this.treeListener = treeListener;
  }

  ProcedureDivisionContext processProcedureDivisionContext(ProcedureDivision cstNode) {
    ProcedureDivisionContext pdCtx = parseProcedureDivision(cstNode);
    createProcedureDivisionBodyContext(pdCtx, cstNode);
    // Remove EOF token if eny
    ParseTree lastChild = pdCtx.children.get(pdCtx.children.size() - 1);
    if (lastChild instanceof TerminalNodeImpl
            && ((TerminalNodeImpl) lastChild).getSymbol().getType() == org.antlr.v4.runtime.Token.EOF) {
      pdCtx.removeLastChild();
    }
    return pdCtx;
  }

  private ProcedureDivisionBodyContext createProcedureDivisionBodyContext(ProcedureDivisionContext pdCtx, ProcedureDivision cstNode) {
    Optional<ParseTree> opt = findChild(pdCtx, ProcedureDivisionBodyContext.class);
    ProcedureDivisionBodyContext pdbCtx;
    pdCtx.stop = findStopToken(cstNode, true).map(token -> toAntlrToken(token, charStream)).orElse(null);
    if (opt.isPresent()) {
      pdbCtx = (ProcedureDivisionBodyContext) opt.get();
      pdbCtx.children = new ArrayList<>();
    } else {
      pdbCtx = initNode(cstNode, new ProcedureDivisionBodyContext(null, 0), charStream);
      pdCtx.addChild(pdbCtx);
      pdbCtx.start = toAntlrToken(cstNode.getBodyStartToken(), charStream);
    }

    LinkedList<ParserRuleContext> genStack = new LinkedList<>();
    genStack.push(pdbCtx);

    // make a free flat
    List<CstNode> nodes = cstNode.getChildren().stream()
            .flatMap(m -> (m instanceof Section) ? Stream.concat(Stream.of(m), m.getChildren().stream()) : Stream.of(m))
            .flatMap(m -> (m instanceof Paragraph) ? Stream.concat(Stream.of(m), m.getChildren().stream()) : Stream.of(m))
            .collect(Collectors.toList());

    lastToken = null;

    for (int idx = 0; idx < nodes.size(); idx++) {
      CstNode node = nodes.get(idx);

      if (node instanceof Token) {
        continue;
      }

      if (node instanceof Paragraph) {
        assureParagraphsCtx(genStack, pdbCtx, node);
        handleParagraphNode(genStack, node);
      }

      if (node instanceof Section) {
        handleSectionNode(genStack, node);
      }

      if (node instanceof Statement) {
        assureParagraphsCtx(genStack, pdbCtx, node);
        ParserRuleContext s = parseSentence((Statement) node);
        lastToken = (CommonToken) s.stop;
        s.setParent(genStack.peek());
        genStack.peek().addChild(s);
      }

      if (node instanceof Declaratives) {
        handleDeclaratives(genStack, (Declaratives) node);
      }

    }
    while (!genStack.isEmpty()) {
      genStack.pop().stop = toAntlrToken(findStopToken(nodes, true).get(), charStream);
    }
    return pdbCtx;

  }

  private Optional<ParseTree> findChild(ProcedureDivisionContext pdCtx, Class<?> expectedClass) {
    return pdCtx.children.stream().filter(c -> c.getClass() == expectedClass).findFirst();
  }

  private void handleDeclaratives(LinkedList<ParserRuleContext> genStack, Declaratives node) {
    Token startToken = findStartToken(node).get();
    String input = generatePrefix(charStream, startToken) + node.toText();
    CobolProcedureDivisionLexer antlrLexer =
            new CobolProcedureDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolProcedureDivisionParser antlrParser = new CobolProcedureDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    genStack.peek().addChild(antlrParser.procedureDeclaratives());
  }

  private void assureParagraphsCtx(LinkedList<ParserRuleContext> genStack, ProcedureDivisionBodyContext pdbCtx, CstNode node) {
    if (!(genStack.peek() instanceof ParagraphsContext) && !(genStack.peek() instanceof ParagraphContext)) {
      ParagraphsContext paragraphsCtx = new ParagraphsContext(pdbCtx, 0);
      paragraphsCtx.start = findStartToken(node).map(token -> toAntlrToken(token, charStream)).orElse(null);
      paragraphsCtx.children = new ArrayList<>();
      paragraphsCtx.setParent(genStack.peek());
      genStack.peek().addChild(paragraphsCtx);
      genStack.push(paragraphsCtx);
    }
  }

  private void handleParagraphNode(LinkedList<ParserRuleContext> genStack, CstNode node) {
    if (genStack.peek() instanceof ParagraphContext) {
      genStack.pop().stop = lastToken;
    }
    ParagraphContext context = new ParagraphContext(genStack.peek(), 0);
    genStack.peek().addChild(context);
    genStack.push(context);
    genStack.peek().children = new ArrayList<>();
    genStack.peek().start = toAntlrToken(findStartToken(node).get(), charStream);
    Token name = (Token) node.getChildren().get(0);
    ParagraphDefinitionNameContext paragraphDefinitionNameContext =
            initNode(name, new ParagraphDefinitionNameContext(null, 0), charStream);
    TerminalNodeImpl nameTN = new TerminalNodeImpl(toAntlrToken(name, charStream));
    paragraphDefinitionNameContext.addChild(nameTN);
    paragraphDefinitionNameContext.setParent(genStack.peek());
    genStack.peek().addChild(paragraphDefinitionNameContext);
    TerminalNodeImpl terminalNode = new TerminalNodeImpl(toAntlrToken((Token) node.getChildren().get(dotIdx(node.getChildren())), charStream));
    lastToken = (CommonToken) terminalNode.getSymbol();
    genStack.peek().addChild(terminalNode);
  }

  private void handleSectionNode(LinkedList<ParserRuleContext> genStack, CstNode node) {
    if (genStack.peek() instanceof ParagraphContext) {
      genStack.pop().stop = lastToken;
    }
    if (genStack.peek() instanceof ParagraphsContext) {
      genStack.pop().stop = lastToken;
    }
    if (genStack.peek() instanceof ProcedureSectionContext) {
      genStack.pop().stop = lastToken;
    }
    Token name = (Token) node.getChildren().get(0);
    Token section = (Token) node.getChildren().get(2);
    Token dot = (Token) node.getChildren().get(3);

    ProcedureSectionContext sectionContext =
            initNode(node, new ProcedureSectionContext(genStack.peek(), 0), charStream);
    genStack.peek().addChild(sectionContext);
    genStack.push(sectionContext);


    ProcedureSectionHeaderContext header = createSectionHeader(node, name, section);
    sectionContext.addChild(header);

    TerminalNodeImpl terminalNode = new TerminalNodeImpl(toAntlrToken(dot, charStream));
    sectionContext.addChild(terminalNode);

    ParagraphsContext paragraphsContext =
            initNode(((Section) node).getBodyStartToken(), new ParagraphsContext(null, 0), charStream);
    paragraphsContext.setParent(sectionContext);
    sectionContext.addChild(paragraphsContext);
    lastToken = (CommonToken) terminalNode.getSymbol();
    genStack.push(paragraphsContext);
  }

  private ParserRuleContext parseSentence(Statement node) {
    Token startToken = findStartToken(node).get();
    String input = generatePrefix(charStream, startToken) + node.toText();
    CobolProcedureDivisionLexer antlrLexer =
            new CobolProcedureDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolProcedureDivisionParser antlrParser = new CobolProcedureDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    return antlrParser.sentence();
  }

  private ProcedureDivisionContext parseProcedureDivision(ProcedureDivision node) {
    StringBuilder sb = new StringBuilder();
    for (CstNode c : node.getChildren()) {
      if (hasToken(c, node.getBodyStartToken())) {
        break;
      }
      sb.append(c.toText());
    }
    String input = generatePrefix(charStream, findStartToken(node).get()) + sb;
    CobolProcedureDivisionLexer antlrLexer =
            new CobolProcedureDivisionLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    antlrLexer.addErrorListener(errorListener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    CobolProcedureDivisionParser antlrParser = new CobolProcedureDivisionParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(errorListener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
    return antlrParser.procedureDivision();
  }

  private boolean hasToken(CstNode node, Token token) {
    if (node.equals(token)) {
      return true;
    }
    for (CstNode c : node.getChildren()) {
      if (hasToken(c, token)) {
        return true;
      }
    }
    return false;
  }

  private ProcedureSectionHeaderContext createSectionHeader(CstNode node, Token name, Token section) {
    ProcedureSectionHeaderContext headerContext = new ProcedureSectionHeaderContext(null, 0);
    headerContext.start = findStartToken(node).map(token -> toAntlrToken(token, charStream)).orElse(null);
    headerContext.stop = findStopToken(node, true).map(token -> toAntlrToken(token, charStream)).orElse(null);
    headerContext.children = new ArrayList<>();

    SectionNameContext sectionNameContext =
            initNode(name, new SectionNameContext(null, 0), charStream);
    sectionNameContext.addChild(new TerminalNodeImpl(toAntlrToken(name, charStream)));
    headerContext.addChild(sectionNameContext);
    headerContext.addChild(new TerminalNodeImpl(toAntlrToken(section, charStream)));
    return headerContext;
  }

  private int dotIdx(List<CstNode> nodes) {
    for (int i = 0; i < nodes.size(); i++) {
      if (".".equals(nodes.get(i).toText())) {
        return i;
      }
    }
    return -1;
  }
}
