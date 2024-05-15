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
 */
package org.eclipse.lsp.cobol.parser.hw.lexer;

import lombok.Data;

import java.util.Optional;

/** Class helps to group characters into tokens (TODO: it will be part of the lexer) */
public class TokenScanner {
  private final String source;
  private final Position currentPosition = new Position();

  public TokenScanner(String source) {
    this.source = source;
  }

  private Optional<Character> peek() {
    return currentPosition.index + 1 < source.length()
        ? Optional.of(source.charAt(currentPosition.index + 1))
        : Optional.empty();
  }

  private Character forward() {
    return currentPosition.forward();
  }

  /**
   * Produces the next token.
   *
   * @return the next token.
   */
  public Token next() {
    if (currentPosition.index == source.length()) {
      return currentPosition.produceToken(TokenType.EOF);
    }
    Position start = new Position(currentPosition);
    switch (at()) {
      case '\'':
      case '"':
        // TBD STRING_LITERAL
        return null;
      case '\n':
        forward();
        if (at() != null && at() == '\r') {
          forward();
        }
        return start.produceToken(TokenType.NEW_LINE);
      case ' ':
        do {
          forward();
        } while (isWhitespace(at()));
        return start.produceToken(TokenType.WHITESPACE);
      default:
        do {
          forward();
        } while (!isTerminal(at()));
        return start.produceToken(null);
    }
  }

  private Character at() {
    if (currentPosition.index == source.length()) {
      return null;
    }
    return source.charAt(currentPosition.index);
  }

  private boolean isTerminal(Character character) {
    if (character == null) {
      return true;
    }
    return isWhitespace(character) || isSeparator(character);
  }

  private boolean isSeparator(char c) {
    return c == '.';
  }

  private boolean isLiteral(Character c) {
    return c == '"' || c == '\'';
  }

  private boolean isWhitespace(Character c) {
    if (c == null) {
      return false;
    }
    return c == ' ' || c == '\t';
  }

  private boolean isNewLine(Character c) {
    return c == '\n' || c == '\r';
  }

  /** A class to hold position data */
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

    Position() {}

    Token produceToken(TokenType type) {
      return new Token(line, character, index, currentPosition.index, type, source);
    }

    Character forward() {
      if (source.charAt(index) == '\n') {
        line++;
        character = 0;
      } else if (source.charAt(index) != '\r') {
        character++;
      }
      index++;
      return source.charAt(index - 1);
    }
  }
}
