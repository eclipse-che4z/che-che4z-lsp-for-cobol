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

/** Test Call statement */
public class AddTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

  @Test
  void case1() {
    String source =
        HEADER
            + "           ADD DNAME-1\n"
            + "               DNAME-2\n"
            + "               DNAME-3\n"
            + "               DNAME-4\n"
            + "               DNAME-5\n"
            + "               DNAME-6\n"
            + "               DNAME-7\n"
            + "               DNAME-8\n"
            + "               DNAME-9\n"
            + "               DNAME-10 TO ACCUM-1 ROUNDED ON SIZE ERROR\n"
            + "                   MOVE 0 TO ACCUM-1.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
    // Statement should be nested
    assertEquals(
        1, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case2() {
    String source = HEADER + "           ADD 01 TO INVKEY-COUNTER.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case3() {
    String source =
        HEADER + "           ADD CORRESPONDING GRP-FOR-ADD-CORR-1 TO GRP-FOR-ADD-CORR-R.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case4() {
    String source =
        HEADER
            + "           ADD CORRESPONDING CORR-DATA-7 TO CORR-DATA-5 ROUNDED\n"
            + "             ON SIZE ERROR MOVE \"W\" TO WRK-AN-00001.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
    // Statement should be nested
    assertEquals(
        1, result.getSourceUnit().list(Statement.class).get(0).list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }
}
