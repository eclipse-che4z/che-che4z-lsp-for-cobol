/*
 * Copyright (c) 2025 Broadcom.
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
 *
 */
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import java.util.function.Predicate;

/** CBL Lexer */
public class CblLexer {
  private final String uri;
  private final String input;
  private final int line;
  private final boolean full;

  private Integer pos = 0;
  private CblToken peeked = null;

  public CblLexer(String uri, String input, int line, boolean full) {
    this.uri = uri;
    this.input = input;
    this.line = line;
    this.full = full;
  }

  public CblLexer(String uri, String input, int line) {
    this.uri = uri;
    this.input = input;
    this.line = line;
    this.full = false;
  }

  CblToken peek() {
    if (peeked == null) {
      peeked = nextToken(false);
    }
    return peeked;
  }

  /**
   * Get the next token.
   *
   * @return the next token
   */
  public CblToken next() {
    return nextToken(true);
  }

  private CblToken nextToken(boolean consume) {
    int counter = pos;
    try {
      if (counter == input.length()) {
        return CblToken.eof(uri, line);
      }
      if (Character.isWhitespace(input.charAt(counter))) {
        CblToken cblToken = consumeWhile(counter, Character::isWhitespace, CblTokenType.WHITESPACE);
        counter = cblToken.getEnd();
        if (full) {
          return cblToken;
        }
      }
      // do we actually have a token?
      if (counter == input.length()) {
        return CblToken.eof(uri, line);
      }
      switch (input.charAt(pos)) {
        case '(':
          return new CblToken(uri, "(", line, counter, ++counter, CblTokenType.PARENTHESIS_OPEN);
        case ')':
          return new CblToken(uri, ")", line, counter, ++counter, CblTokenType.PARENTHESIS_CLOSE);
        case ',':
          return new CblToken(uri, ",", line, counter, ++counter, CblTokenType.COMMA);
        case '\'':
          return new CblToken(uri, "'", line, counter, ++counter, CblTokenType.APOSTROPHE);
        case '"':
          return new CblToken(uri, "\"", line, counter, ++counter, CblTokenType.QUOTE);
        default:
          CblToken cblToken =
              consumeWhile(counter, Character::isLetterOrDigit, CblTokenType.GENERAL);
          counter = cblToken.getEnd();
          return cblToken;
      }
    } finally {
      if (consume) {
        pos = counter;
        peeked = null;
      }
    }
  }

  /**
   * Checks whether there are more tokens.
   *
   * @return whether there are more tokens
   */
  public boolean hasMore() {
    return !peek().getTokenType().equals(CblTokenType.EOF);
  }

  private CblToken consumeWhile(int start, Predicate<Character> until, CblTokenType type) {
    int counter = start;
    while (counter < input.length() && until.test(input.charAt(counter))) {
      counter++;
    }
    return new CblToken(uri, input.substring(start, counter), line, start, counter, type);
  }

  public int getPos() {
    return pos;
  }
}
