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

import lombok.Data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Predicate;

/**
 * COBOL language lexer.
 */
public class CobolLexer {
  private final String source;
  private Position position = new Position();
  private Position lastTokenStartPosition = new Position();

  public CobolLexer(String source) {
    this.source = source;
  }

  /**
   * Check if we have more tokens.
   * @return true if there are more tokens.
   */
  public boolean hasMore() {
    return position.getIndex() < source.length();
  }

  /**
   * Return one token and move forward.
   * @param rule current syntax rule.
   * @return list of possible tokens (at least one).
   */
  public List<Token> forward(GrammarRule rule) {
    if (position.getIndex() == source.length()) {
      return Collections.singletonList(new Token("", position.getLine(), position.getCharacter(), position.getIndex(), TokenType.EOF));
    }
    String lexeme = scan(rule, false);
    Token token = new Token(lexeme, lastTokenStartPosition.getLine(), lastTokenStartPosition.getCharacter(), position.getIndex(), detectType(rule, lexeme));
    return Collections.singletonList(token);
  }

  /**
   * Return one token but don't move forward.
   * @param rule current syntax rule.
   * @return list of possible tokens (at least one).
   */
  public List<Token> peek(GrammarRule rule) {
    if (position.getIndex() == source.length()) {
      return Collections.singletonList(new Token("", position.getLine(), position.getCharacter(), position.getIndex(), TokenType.EOF));
    }
    String lexeme = scan(rule, true);
    Token token = new Token(lexeme, lastTokenStartPosition.getLine(), lastTokenStartPosition.getCharacter(), position.getIndex(), detectType(rule, lexeme));
    return Collections.singletonList(token);
  }

  private TokenType detectType(GrammarRule rule, String lexeme) {
    if (lexeme.trim().isEmpty()) {
      return TokenType.WHITESPACE;
    }
    return null;
  }

  private String scan(GrammarRule rule, boolean look) {
    if (isWhitespace(source.charAt(position.getIndex()))) {
      return consumeUntil(c -> !isWhitespace(c), look);
    }
    if (isNewLine(source.charAt(position.getIndex()))) {
      return consumeUntil(c -> !isNewLine(c), look);
    }
    if (isSeparator(source.charAt(position.getIndex()))) {
      return consumeUntil(c -> !isSeparator(c), look);
    }
    return consumeUntil(c -> isSeparator(c) || isWhitespace(c) || isNewLine(c), look);
  }

  private String consumeUntil(Predicate<Character> predicate, boolean look) {
    StringBuilder sb = new StringBuilder();
    Position localPos = new Position(position);
    while (localPos.getIndex() < source.length()) {
      char charAt = source.charAt(localPos.getIndex());
      if (predicate.test(charAt)) {
        break;
      }
      sb.append(charAt);
      localPos.updateLinePosition(charAt);
    }
    if (!look) {
      lastTokenStartPosition = position;
      position = localPos;
    }
    return sb.toString();
  }

  private boolean isSeparator(char c) {
    return c == '.';
  }

  private boolean isWhitespace(char c) {
    return c == ' ' || c == '\t';
  }

  private boolean isNewLine(char c) {
    return c == '\n' || c == '\r';
  }

  /**
   * Find a sequence of tokens ignoring one that passes skip predicate.
   * @param rule current syntax rule.
   * @param count how many tokens to take.
   * @param skip predicate to ignore tokens.
   * @return a list of tokens.
   */
  // TODO: it should return a list of lists
  public List<Token> peekSeq(GrammarRule rule, int count, Predicate<Token> skip) {
    List<Token> result = new ArrayList<>();
    Position localPos = new Position(position);
    while (result.size() < count && position.getIndex() < source.length()) {
      Token token = forward(rule).get(0);
      if (!skip.test(token)) {
        result.add(token);
      }
    }
    position = localPos;

    return result;
  }
}

/**
 * A class to hold position data
 */
@Data
class Position {
  int index = 0;
  int line = 0;
  int character = 0;

  Position(Position position) {
    index = position.index;
    line = position.line;
    character = position.character;
  }
  Position() {
  }
  void updateLinePosition(char charAt) {
    index++;
    if (charAt == '\n') {
      line++;
      character = 0;
    } else if (charAt != '\r') {
      character++;
    }
  }
}
