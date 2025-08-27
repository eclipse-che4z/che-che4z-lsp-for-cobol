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

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

/** CBL lexer test */
class CblLexerTest {
  static final String URI = "file://document.cbl";

  @Test
  void testLexerEof() {
    CblLexer cblLexer = new CblLexer(URI, "", 0);
    assertToken(cblLexer.next(), null, -1, -1, CblTokenType.EOF);
  }

  @Test
  void testLexerWhitespace() {
    CblLexer cblLexer = new CblLexer(URI, "  ", 0, true);
    assertEquals("  ", cblLexer.next().getText());
    assertEquals(CblTokenType.EOF, cblLexer.next().getTokenType());
    CblLexer cblLexer2 = new CblLexer(URI, "  ", 0);
    assertEquals(CblTokenType.EOF, cblLexer2.next().getTokenType());
  }

  @Test
  void testLexerCbls() {
    CblLexer cblLexer = new CblLexer(URI, "      CBL XOPTS(DLI), NOADATA, XOPTS(DLI)\n", 0, true);
    assertToken(cblLexer.next(), "      ", 0, 6, CblTokenType.WHITESPACE);
    assertToken(cblLexer.next(), "CBL", 6, 9, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), " ", 9, 10, CblTokenType.WHITESPACE);
    assertToken(cblLexer.next(), "XOPTS", 10, 15, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), "(", 15, 16, CblTokenType.PARENTHESIS_OPEN);
    assertToken(cblLexer.next(), "DLI", 16, 19, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), ")", 19, 20, CblTokenType.PARENTHESIS_CLOSE);
    assertToken(cblLexer.next(), ",", 20, 21, CblTokenType.COMMA);
    assertToken(cblLexer.next(), " ", 21, 22, CblTokenType.WHITESPACE);
    assertToken(cblLexer.next(), "NOADATA", 22, 29, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), ",", 29, 30, CblTokenType.COMMA);
    assertToken(cblLexer.next(), " ", 30, 31, CblTokenType.WHITESPACE);
    assertToken(cblLexer.next(), "XOPTS", 31, 36, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), "(", 36, 37, CblTokenType.PARENTHESIS_OPEN);
    assertToken(cblLexer.next(), "DLI", 37, 40, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), ")", 40, 41, CblTokenType.PARENTHESIS_CLOSE);
    assertToken(cblLexer.next(), "\n", 41, 42, CblTokenType.WHITESPACE);
    assertEquals(CblTokenType.EOF, cblLexer.next().getTokenType());
  }

  @Test
  void testLexerCbls2() {
    CblLexer cblLexer = new CblLexer(URI, "      CBL XOPTS('DLI'), NOADATA, XOPTS(\"DLI\")\n", 0);
    assertToken(cblLexer.next(), "CBL", 6, 9, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), "XOPTS", 10, 15, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), "(", 15, 16, CblTokenType.PARENTHESIS_OPEN);
    assertToken(cblLexer.next(), "'", 16, 17, CblTokenType.APOSTROPHE);
    assertToken(cblLexer.next(), "DLI", 17, 20, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), "'", 20, 21, CblTokenType.APOSTROPHE);
    assertToken(cblLexer.next(), ")", 21, 22, CblTokenType.PARENTHESIS_CLOSE);
    assertToken(cblLexer.next(), ",", 22, 23, CblTokenType.COMMA);
    assertToken(cblLexer.next(), "NOADATA", 24, 31, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), ",", 31, 32, CblTokenType.COMMA);

    assertToken(cblLexer.next(), "XOPTS", 33, 38, CblTokenType.GENERAL);
    assertToken(cblLexer.next(), "(", 38, 39, CblTokenType.PARENTHESIS_OPEN);
    assertToken(cblLexer.next(), "\"", 39, 40, CblTokenType.QUOTE);
    assertToken(cblLexer.next(), "DLI", 40, 43, CblTokenType.GENERAL);

    assertToken(cblLexer.next(), "\"", 43, 44, CblTokenType.QUOTE);
    assertToken(cblLexer.next(), ")", 44, 45, CblTokenType.PARENTHESIS_CLOSE);
    assertEquals(CblTokenType.EOF, cblLexer.next().getTokenType());
  }

  private static void assertToken(
      CblToken next, String text, int start, int end, CblTokenType type) {
    assertEquals(text, next.getText());
    assertEquals(start, next.getStart());
    assertEquals(end, next.getEnd());
    assertEquals(type, next.getTokenType());
    assertEquals(0, next.getLine());
  }
}
