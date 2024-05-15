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

import org.eclipse.lsp.cobol.parser.hw.GrammarRule;
import org.junit.jupiter.api.Test;
import static org.eclipse.lsp.cobol.lexer.LexerTestUtils.*;

/**
 * test hw lexer
 */
class HwCobolLexerTest {

  @Test
  void identificationDivision() {
    CobolLexer lexer = new CobolLexer("Id DIVISION. PROGRAM-ID. Pr1.");
    assertEquals("Id", tokenContent(lexer));
    assertEquals(" ", tokenContent(lexer));
    assertEquals("DIVISION", tokenContent(lexer));
    assertEquals(".", tokenContent(lexer));
    assertEquals(" ", tokenContent(lexer));
    assertEquals("PROGRAM-ID", tokenContent(lexer));
    assertEquals(".", tokenContent(lexer));
    assertEquals(" ", tokenContent(lexer));
    assertEquals("Pr1", tokenContent(lexer));
    assertEquals(".", tokenContent(lexer));
    assertFalse(lexer.hasMore());
  }

  @Test
  void newLine() {
    CobolLexer lexer = new CobolLexer("A \n B");
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "A", 0, 0, 0);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), " ", 0, 1, 1);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "\n", 0, 2, 2);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), " ", 1, 0, 3);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "B", 1, 1, 4);
    assertFalse(lexer.hasMore());
  }

  @Test
  void quotes() {
    CobolLexer lexer = new CobolLexer("A '\n B'");
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "A", 0, 0, 0);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), " ", 0, 1, 1);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "'\n B'", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void quotesEscape() {
    CobolLexer lexer = new CobolLexer("A '''\n B'");
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "A", 0, 0, 0);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), " ", 0, 1, 1);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "'''\n B'", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void doubleQuotes() {
    CobolLexer lexer = new CobolLexer("A \"\n B\"");
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "A", 0, 0, 0);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), " ", 0, 1, 1);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "\"\n B\"", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void doubleQuotesEscape() {
    CobolLexer lexer = new CobolLexer("A \"\"\"\n B\"");
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "A", 0, 0, 0);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), " ", 0, 1, 1);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "\"\"\"\n B\"", 0, 2, 2);
    assertFalse(lexer.hasMore());
  }

  @Test
  void peekTest() {
    CobolLexer lexer = new CobolLexer("Aa\n  B");
    assertToken(lexer.peek(GrammarRule.ProgramUnit).get(0), "Aa", 0, 0, 0);
    assertToken(lexer.peek(GrammarRule.ProgramUnit).get(0), "Aa", 0, 0, 0);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "Aa", 0, 0, 0);
    assertToken(lexer.peek(GrammarRule.ProgramUnit).get(0), "\n", 0, 2, 2);
    assertToken(lexer.forward(GrammarRule.ProgramUnit).get(0), "\n", 0, 2, 2);
    assertToken(lexer.peek(GrammarRule.ProgramUnit).get(0), "  ", 0, 0, 3);
  }
}
