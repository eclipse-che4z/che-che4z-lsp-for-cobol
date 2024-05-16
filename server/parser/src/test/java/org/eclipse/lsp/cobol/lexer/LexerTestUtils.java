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
package org.eclipse.lsp.cobol.lexer;

import org.eclipse.lsp.cobol.parser.hw.lexer.Token;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** Utilities for lexer tests */
public final class LexerTestUtils {
  private LexerTestUtils() {
    // no-op
  }

  /**
   * Assert a token
   *
   * @param token the token
   * @param lexeme token text
   * @param line token line
   * @param charPos token position in line
   * @param index token position in source
   */
  public static void assertToken(Token token, String lexeme, int line, int charPos, int index) {
    assertEquals(lexeme, token.getLexeme(), "lexeme");
    assertEquals(line, token.getLine(), "line");
    assertEquals(charPos, token.getStartPositionInLine(), "char in line position");
    assertEquals(index, token.getIndexStart(), "indexStart");
    assertEquals(index + lexeme.length(), token.getIndexStop(), "indexStop");
  }

}
