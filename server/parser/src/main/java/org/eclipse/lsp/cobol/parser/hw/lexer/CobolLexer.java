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
package org.eclipse.lsp.cobol.parser.hw.lexer;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Predicate;

/** COBOL language lexer. */
public class CobolLexer {
  private final List<Token> tokens = new ArrayList<>();
  private final TokenScanner scanner;
  private int tokenIndex = 0;

  public CobolLexer(String source) {
    this.scanner = new TokenScanner(source);
  }

  /**
   * Check if we have more tokens.
   *
   * @return true if there are more tokens.
   */
  public boolean hasMore() {
    return !scanner.isAtEnd();
  }

  /**
   * Return one token and move forward.
   *
   * @return token.
   */
  public Token forward() {
    if (tokenIndex == tokens.size()) {
      Token next = scanner.next();
      tokens.add(next);
      tokenIndex++;
      return next;
    }
    return tokens.get(tokenIndex++);
  }

  /**
   * Return one token but don't move forward.
   *
   * @return Next token.
   */
  public Token peek() {
    if (tokenIndex == tokens.size()) {
      Token next = scanner.next();
      tokens.add(next);
      return next;
    }
    return tokens.get(tokenIndex);
  }

  /**
   * Find a sequence of tokens ignoring one that passes skip predicate.
   *
   * @param count how many tokens to take.
   * @param skip predicate to ignore tokens.
   * @return a list of tokens.
   */
  public List<Token> peekSeq(int count, Predicate<Token> skip) {
    List<Token> result = new ArrayList<>();
    int idx = tokenIndex;
    if (idx == tokens.size()) {
      tokens.add(scanner.next());
    }
    if (tokens.get(idx).getType() == TokenType.EOF) {
      return Collections.singletonList(peek());
    }

    while (result.size() < count) {
      Token token = tokens.get(idx);
      if (!skip.test(token)) {
        result.add(token);
      }
      idx++;
      if (idx == tokens.size()) {
        tokens.add(scanner.next());
      }
      if (tokens.get(idx).getType() == TokenType.EOF) {
        return result;
      }
    }
    return result;
  }
}
