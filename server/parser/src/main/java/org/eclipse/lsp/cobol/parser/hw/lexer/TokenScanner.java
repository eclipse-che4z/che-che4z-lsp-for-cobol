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

import java.util.function.Predicate;
import java.util.regex.Pattern;

/** Class helps to group characters into tokens (TODO: it will be part of the lexer) */
public class TokenScanner {
  private final String source;
  private final Position currentPosition = new Position();

  public TokenScanner(String source) {
    this.source = source;
  }

  private boolean peek(char ch) {
    return peek(c -> c == ch);
  }

  private boolean peek(Predicate<Character> predicate) {
    return peek(predicate, 1);
  }

  private boolean peek(Predicate<Character> predicate, int shift) {
    int nextPos = currentPosition.index + shift;
    if (isAtEnd() || source.length() <= nextPos) {
      return false;
    }
    return predicate.test(source.charAt(nextPos));
  }

  private void forward() {
    currentPosition.forward();
  }

  /**
   * Produces the next token.
   *
   * @return the next token.
   */
  public Token next() {
    if (isAtEnd()) {
      return currentPosition.produceToken(TokenType.EOF);
    }

    Position start = new Position(currentPosition);

    if (match(' ')) {
      return whitespace(start);
    }
    if (match('\n')) {
      return newLine(start);
    }
    if (match('\'') || match('"')) {
      return stringLiteral(start);
    }
    if (mayBeNumericLiteral()) {
      return numericLiteral(start);
    }

    return cobolWord(start);
  }

  private Token stringLiteral(Position start) {
    char q = at();
    do {
      forward();
      // skip escape
      if (match(q) && peek(q)) {
        forward();
        forward();
      }
    } while (!match(q));
    forward(); // consume q
    return start.produceToken(TokenType.STRING_LITERAL);
  }

  private Token numericLiteral(Position start) {
    do {
      forward();
    } while (match(Character::isDigit));
    if (match('.') && peek(Character::isDigit)) {
      do {
        forward();
      } while (match(Character::isDigit));
    }
    if (match('E') && (peek(Character::isDigit) || peek('-') || peek('+'))) {
      if (peek('-') || peek('+')) {
        forward();
      }
      do {
        forward();
      } while (match(Character::isDigit));
    }
    return start.produceToken(TokenType.NUMBER_LITERAL);
  }

  private boolean mayBeNumericLiteral() {
    if (match(Character::isDigit)) {
      return true;
    }
    if (match('-')) {
      return peek(Character::isDigit);
    }
    if (match('+') || match('.')) {
      return peek(Character::isDigit);
    } else {
      return false;
    }
  }

  private Token cobolWord(Position start) {
    do {
      forward();
    } while (!isAtEnd() && isCobolWord());

    return start.produceToken(TokenType.COBOL_WORD);
  }

  private static final Pattern COBOL_WORD_CHAR = Pattern.compile("[-_a-zA-Z0-9]");

  private boolean isCobolWord() {
    return COBOL_WORD_CHAR.matcher(String.valueOf(source.charAt(currentPosition.index))).matches();
  }

  private Token newLine(Position start) {
    forward();
    if (match('\r')) {
      forward();
    }
    return start.produceToken(TokenType.NEW_LINE);
  }

  private Token whitespace(Position start) {
    do {
      forward();
    } while (match(' ') || match('\t'));
    return start.produceToken(TokenType.WHITESPACE);
  }

  private char at() {
    return source.charAt(currentPosition.index);
  }

  boolean match(Predicate<Character> predicate) {
    if (isAtEnd()) {
      return false;
    }
    return predicate.test(source.charAt(currentPosition.index));
  }

  boolean match(char ch) {
    return match(c -> ch == c);
  }

  public boolean isAtEnd() {
    return currentPosition.index == source.length();
  }

  /** A class to hold position data */
  @Data
  private class Position {
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

    void forward() {
      if (source.charAt(index) == '\n') {
        line++;
        character = 0;
      } else if (source.charAt(index) != '\r') {
        character++;
      }
      index++;
    }
  }
}
