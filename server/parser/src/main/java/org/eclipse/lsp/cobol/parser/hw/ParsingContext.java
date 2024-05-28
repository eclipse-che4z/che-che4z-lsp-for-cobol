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
package org.eclipse.lsp.cobol.parser.hw;

import lombok.Getter;
import org.apache.commons.text.similarity.JaroWinklerSimilarity;
import org.eclipse.lsp.cobol.cst.base.CstNode;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.parser.hw.lexer.Token;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.function.Predicate;

/** Parsing context */
public class ParsingContext {
  public static final Predicate<Token> SKIP_WHITESPACE_AND_NEWLINE = t -> t.getType() == TokenType.WHITESPACE || t.getType() == TokenType.NEW_LINE;
  @Getter private final CobolLexer lexer;
  private final JaroWinklerSimilarity sim = new JaroWinklerSimilarity();
  @Getter private final List<Diagnostic> diagnostics = new ArrayList<>();
  private final LinkedList<CstNode> nodeStack = new LinkedList<>();
  private final ParserSettings settings;
  private static final int SIZE_THRESHOLD = 4;

  public ParsingContext(CobolLexer lexer, ParserSettings settings) {
    this.lexer = lexer;
    this.settings = settings;
  }

  /**
   * Put on stack current node
   *
   * @param node a node to stack
   */
  public void push(CstNode node) {
    nodeStack.push(node);
  }

  /**
   * Remove a node from the tome of the stack
   *
   * @return the node
   */
  public CstNode pop() {
    return nodeStack.pop();
  }

  /**
   * Remove a node from the tome of the stack and make it a child of the new stack top
   *
   * @return the node
   */
  public CstNode popAndAttach() {
    CstNode node = pop();
    peek().getChildren().add(node);
    return node;
  }

  /** Consume spaces */
  public void spaces() {
    Token token = lexer.peek();
    while (token.getType() != TokenType.EOF
        && (token.getType() == TokenType.WHITESPACE || token.getType() == TokenType.NEW_LINE)) {
      peek().getChildren().add(lexer.forward());
      skipSkipToken();
      token = getLexer().peek();
    }
  }

  /**
   * Consume a token.
   *
   * @return a token.
   */
  public Token consume() {
    Token forward = lexer.forward();
    peek().getChildren().add(forward);
    skipSkipToken();
    return forward;
  }

  /**
   * Consume expected token
   *
   * @param expectedLexeme expected lexeme
   */
  public void consume(String expectedLexeme) {
    Token token = lexer.peek();
    if (!sameLexeme(token, expectedLexeme, 1.0)) {
      error(
          token, "Unexpected token: '" + token.getLexeme() + "'. Expect: '" + expectedLexeme + "'");
    }
    peek().getChildren().add(lexer.forward());
  }

  private void skipSkipToken() {
    if (match("SKIP1") || match("SKIP2") || match("SKIP3")) {
      consume();
      if (match(".")) {
        consume();
      }
    }
  }

  /**
   * Try to match sequence of lexemes.
   *
   * @param lexemes the sequence of lexemes.
   * @return true if successful
   */
  public boolean match(String... lexemes) {
    Token token = lexer.peek();
    for (String l : lexemes) {
      if (sameLexeme(token, l, 1.0)) {
        return true;
      }
    }
    return false;
  }

  /**
   * Optionally consume a token
   *
   * @param lexeme a token
   */
  public void optional(String lexeme) {
    if (match(lexeme)) {
      peek().getChildren().add(lexer.forward());
    }
  }

  /**
   * Optionally consume a token
   *
   * @param type a token type
   */
  public void optional(TokenType type) {
    if (lexer.peek().getType() == type) {
      peek().getChildren().add(lexer.forward());
    }
  }

  /**
   * Take a look at the top of the stack
   *
   * @return the nedo on the top
   */
  public CstNode peek() {
    return nodeStack.peek();
  }

  /**
   * Check for a sequence of tokens ignoring whitespaces.
   *
   * @param lexemes a sequence of expected tokens
   * @return true if we have a match
   */
  public boolean matchSeq(String... lexemes) {
    List<Token> tokens = lexer.peekSeq(lexemes.length, SKIP_WHITESPACE_AND_NEWLINE);
    if (tokens.size() != lexemes.length) {
      return false;
    }
    if (settings.getFuzzyMatchThreshold() < 1) {
      double d = calcDistance(tokens, lexemes);
      return d > settings.getFuzzyMatchThreshold();
    } else {
      for (int i = 0; i < tokens.size(); i++) {
        if (!sameLexeme(tokens.get(i), lexemes[i], 1.0)) {
          return false;
        }
      }
      return true;
    }
  }

  private double calcDistance(List<Token> tokens, String[] lexemes) {
    Double d = 0.0;
    for (int i = 0; i < tokens.size(); i++) {
      Token lexemeToken = tokens.get(i);
      d += sim.apply(lexemeToken.getLexeme().toUpperCase(), lexemes[i].toUpperCase());
    }
    return d / tokens.size();
  }

  /**
   * Expect one of the tokens.
   *
   * @param expectedTokens tokens to expect.
   */
  public void or(String... expectedTokens) {
    Token next = lexer.peek();
    if (next.getType() == TokenType.EOF) {
      return;
    }
    for (String content : expectedTokens) {
      if (sameLexeme(next, content, null)) {
        Token id = lexer.forward();
        peek().getChildren().add(id);
        return;
      }
    }
    error(
        next,
        "Unexpected token: '"
            + next.getLexeme()
            + "'. Expected: "
            + String.join(",", expectedTokens));
  }

  boolean sameLexeme(Token lexemeToken, String expectedLexeme, Double threshold) {
    threshold = threshold == null ? settings.getFuzzyMatchThreshold() : threshold;
    // TODO: better matchers, for now it's ANY token when it's null
    if (expectedLexeme == null) {
      return true;
    }
    if (lexemeToken.getLexeme() == null) {
      return false;
    }
    /*
     * It's not clear what heuristic to use here, but for short lexemes SIMILARITY_THRESHOLD gives false errors.
     */
    if (threshold == 1.0 || expectedLexeme.length() < SIZE_THRESHOLD) {
      return Objects.equals(lexemeToken.getLexeme().toUpperCase(), expectedLexeme.toUpperCase());
    }
    Double apply = sim.apply(lexemeToken.getLexeme().toUpperCase(), expectedLexeme.toUpperCase());
    if (apply == 1) {
      return true;
    }
    if (apply > threshold) {
      diagnostics.add(getSimilarKeywordPassedSyntaxError(lexemeToken, expectedLexeme));
      return true;
    }
    return false;
  }

  /**
   * Report an error.
   *
   * @param token tocken related to the problem.
   * @param message an error message.
   */
  public void error(Token token, String message) {
    Diagnostic syntaxError = new Diagnostic(getTokenRange(token), message);
    diagnostics.add(syntaxError);
    throw new ParseError(message);
  }

  private Diagnostic getSimilarKeywordPassedSyntaxError(Token lexemeToken, String expectedLexeme) {
    return new Diagnostic(
        getTokenRange(lexemeToken),
        String.format("provided %s but expected %s", lexemeToken.getLexeme(), expectedLexeme));
  }

  private static Range getTokenRange(Token token) {
    return new Range(
        new org.eclipse.lsp4j.Position(token.getLine(), token.getStartPositionInLine()),
        new Position(token.getLine(), token.getStartPositionInLine() + token.getLexeme().length()));
  }
}
