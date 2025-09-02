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
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;

/** CBL lexer test */
class CblLexerTest {
  static final String URI = "file://document.cbl";

  @Test
  void testLexerEof() {
    CblLexer cblLexer = new CblLexer(URI, "", 0);
    assertToken(cblLexer.next(), null, -1, -1);
  }

  @Test
  void testLexerWhitespace() {
    CblLexer cblLexer = new CblLexer(URI, "  ", 0, true);
    assertEquals("  ", cblLexer.next().getText());
    assertNull(cblLexer.next().getText());
    CblLexer cblLexer2 = new CblLexer(URI, "  ", 0);
    assertNull(cblLexer2.next().getText());
  }

  @Test
  void testLexerCbls() {
    CblLexer cblLexer = new CblLexer(URI, "      CBL XOPTS(DLI), NOADATA, XOPTS(DLI)\n", 0, true);
    assertToken(cblLexer.next(), "      ", 0, 6);
    assertToken(cblLexer.next(), "CBL", 6, 9);
    assertToken(cblLexer.next(), " ", 9, 10);
    assertToken(cblLexer.next(), "XOPTS", 10, 15);
    assertToken(cblLexer.next(), "(", 15, 16);
    assertToken(cblLexer.next(), "DLI", 16, 19);
    assertToken(cblLexer.next(), ")", 19, 20);
    assertToken(cblLexer.next(), ",", 20, 21);
    assertToken(cblLexer.next(), " ", 21, 22);
    assertToken(cblLexer.next(), "NOADATA", 22, 29);
    assertToken(cblLexer.next(), ",", 29, 30);
    assertToken(cblLexer.next(), " ", 30, 31);
    assertToken(cblLexer.next(), "XOPTS", 31, 36);
    assertToken(cblLexer.next(), "(", 36, 37);
    assertToken(cblLexer.next(), "DLI", 37, 40);
    assertToken(cblLexer.next(), ")", 40, 41);
    assertToken(cblLexer.next(), "\n", 41, 42);
    assertNull(cblLexer.next().getText());
  }

  @Test
  void testLexerCbls2() {
    CblLexer cblLexer = new CblLexer(URI, "      CBL XOPTS('DLI'), NOADATA, XOPTS(\"DLI\")\n", 0);
    assertToken(cblLexer.next(), "CBL", 6, 9);
    assertToken(cblLexer.next(), "XOPTS", 10, 15);
    assertToken(cblLexer.next(), "(", 15, 16);
    assertToken(cblLexer.next(), "'", 16, 17);
    assertToken(cblLexer.next(), "DLI", 17, 20);
    assertToken(cblLexer.next(), "'", 20, 21);
    assertToken(cblLexer.next(), ")", 21, 22);
    assertToken(cblLexer.next(), ",", 22, 23);
    assertToken(cblLexer.next(), "NOADATA", 24, 31);
    assertToken(cblLexer.next(), ",", 31, 32);

    assertToken(cblLexer.next(), "XOPTS", 33, 38);
    assertToken(cblLexer.next(), "(", 38, 39);
    assertToken(cblLexer.next(), "\"", 39, 40);
    assertToken(cblLexer.next(), "DLI", 40, 43);

    assertToken(cblLexer.next(), "\"", 43, 44);
    assertToken(cblLexer.next(), ")", 44, 45);
    assertNull(cblLexer.next().getText());
  }

  private static void assertToken(CblToken next, String text, int start, int end) {
    assertEquals(text, next.getText());
    assertEquals(start, next.getStart());
    assertEquals(end, next.getEnd());
    assertEquals(0, next.getLine());
  }
}
