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

import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;

import static org.junit.jupiter.api.Assertions.*;

import org.eclipse.lsp.cobol.parser.hw.lexer.Token;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;
import org.junit.jupiter.api.Test;
import static org.eclipse.lsp.cobol.lexer.LexerTestUtils.*;

/**
 * test hw lexer
 */
class HwCobolLexerTest {

  @Test
  void identificationDivision() {
    CobolLexer lexer = new CobolLexer("Id DIVISION.\nPROGRAM-ID. Pr1.\n");
    assertToken(lexer.forward(), "Id", 0, 0, 0);
    assertToken(lexer.forward(), " ", 0, 2, 2);
    assertToken(lexer.forward(), "DIVISION", 0, 3, 3);
    assertToken(lexer.forward(), ".", 0, 11, 11);
    assertToken(lexer.forward(), "\n", 0, 12, 12);
    assertToken(lexer.forward(), "PROGRAM-ID", 1,  0, 13);
    assertToken(lexer.forward(), ".", 1,  10, 23);
    assertToken(lexer.forward(), " ", 1,  11, 24);
    assertToken(lexer.forward(), "Pr1", 1,  12, 25);
    assertToken(lexer.forward(), ".", 1,  15, 28);
    assertToken(lexer.forward(), "\n", 1,  16, 29);
    assertToken(lexer.forward(), "", 2,  0, 30);
    assertFalse(lexer.hasMore());
  }

  @Test
  void newLine() {
    CobolLexer lexer = new CobolLexer("A \n B");
    assertToken(lexer.forward(), "A", 0, 0, 0);
    assertToken(lexer.forward(), " ", 0, 1, 1);
    assertToken(lexer.forward(), "\n", 0, 2, 2);
    assertToken(lexer.forward(), " ", 1, 0, 3);
    assertToken(lexer.forward(), "B", 1, 1, 4);
    assertFalse(lexer.hasMore());
  }

  @Test
  void quotes() {
    CobolLexer lexer = new CobolLexer("A '\n B'");
    assertToken(lexer.forward(), "A", 0, 0, 0);
    assertToken(lexer.forward(), " ", 0, 1, 1);
    assertToken(lexer.forward(), "'\n B'", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void quotesEscape() {
    CobolLexer lexer = new CobolLexer("A '''\n B'");
    assertToken(lexer.forward(), "A", 0, 0, 0);
    assertToken(lexer.forward(), " ", 0, 1, 1);
    assertToken(lexer.forward(), "'''\n B'", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void doubleQuotes() {
    CobolLexer lexer = new CobolLexer("A \"\n B\"");
    assertToken(lexer.forward(), "A", 0, 0, 0);
    assertToken(lexer.forward(), " ", 0, 1, 1);
    assertToken(lexer.forward(), "\"\n B\"", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void doubleQuotesEscape() {
    CobolLexer lexer = new CobolLexer("A \"\"\"\n B\"");
    assertToken(lexer.forward(), "A", 0, 0, 0);
    assertToken(lexer.forward(), " ", 0, 1, 1);
    assertToken(lexer.forward(), "\"\"\"\n B\"", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void dotIsNotAWord() {
    CobolLexer lexer = new CobolLexer(".");
    Token dot = lexer.forward();
    assertNotEquals(TokenType.COBOL_WORD, dot.getType());
  }

  @Test
  void peekTest() {
    CobolLexer lexer = new CobolLexer("Aa\n  B");
    assertToken(lexer.peek(), "Aa", 0, 0, 0);
    assertToken(lexer.peek(), "Aa", 0, 0, 0);
    assertToken(lexer.forward(), "Aa", 0, 0, 0);
    assertToken(lexer.peek(), "\n", 0, 2, 2);
    assertToken(lexer.forward(), "\n", 0, 2, 2);
    assertToken(lexer.peek(), "  ", 1, 0, 3);
  }
}
