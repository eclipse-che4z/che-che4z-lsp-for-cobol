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
package org.eclipse.lsp.cobol.divisions.procedure;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.eclipse.lsp.cobol.cst.procedure.Statement;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.junit.jupiter.api.Test;

/** Test if statement */
public class IfTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

  @Test
  void case1() {
    String source =
        HEADER
            + "           IF C NOT EQUAL TO SPACE \n"
            + "                 MOVE LT TO CD\n"
            + "                 GO TO B-WRITE"
            + "             ELSE"
            + "                 GO TO B-ERROR\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(4, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case2() {
    String source =
        HEADER
            + "           SET WF TO TRUE\n"
            + "           IF C NOT EQUAL TO SPACE \n"
            + "                 MOVE LT TO CD\n"
            + "                 GO TO B-WRITE"
            + "           ELSE\n"
            + "                 MOVE D (1:LENGTH OF CC) TO CAR-COM\n"
            + "                 GO TO B-ERROR\n"
            + "           END-IF\n"
            + "           PERFORM Y-S-P THRU Y-S-P-EXIT";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(7, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case3() {
    String source =
        HEADER
            + "           IF A OF b = '*'\n"
            + "               MOVE LOW-VALUES TO CC-ACC CCID\n"
            + "           ELSE\n"
            + "               MOVE AC OF CCI TO CC-ACCT-ID CCUP-NEW-ACCTID\n"
            + "           END-IF";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(3, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case4() {
    String source =
        HEADER
            + "           IF C NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.\n"
            + "           MOVE A TO B.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(3, result.getSourceUnit().list(Statement.class).size());
    // IF has only one statement in it
    assertEquals(
        1, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case5() {
    String source = HEADER + "           IF      ACCUMULATOR1 EQUAL TO 10 PERFORM PASS.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
    // IF has only one statement in it
    assertEquals(
        1, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }
}
