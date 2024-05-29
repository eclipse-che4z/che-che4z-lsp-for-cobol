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

/** Test EVALUATE statement */
public class EvaluateTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

  @Test
  void case1() {
    String source =
        HEADER
            + "           EVALUATE TRUE\n"
            + "                WHEN FK\n"
            + "                  CONTINUE";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case2() {
    String source =
            HEADER
                    + "       10-SETUP\n."
                    + "           EVALUATE TRUE\n"
                    + "                WHEN FK\n"
                    + "                WHEN FK1\n"
                    + "                  CONTINUE\n"
                    + "                WHEN FK2 AND FK3\n"
                    + "                  IF  CASHOWN AND CAEXIST\n "
                    + "                    SET CASHOWN TO TRUE\n"
                    + "                    MOVE 'NO MORE PAGES TO DISPLAY' TO ERROR\n"
                    + "                  END-IF"
                    + "                WHEN OTHER\n"
                    + "                  SET WS TO TRUE\n"
                    + "           END-EVALUATE";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(6, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case3() {
    String source =
            HEADER
                    + "           EVALUATE A\n"
                    + "           WHEN FK2 AND FK3\n"
                    + "                          PERFORM PASS\n"
                    + "           WHEN OTHER\n"
                    + "                          PERFORM FAIL.\n";
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
                    + "           EVALUATE FUNCTION ACOS(0)\n"
                    + "           WHEN 1.57076 THRU 1.57082\n"
                    + "                          PERFORM PASS\n"
                    + "           WHEN OTHER\n"
                    + "                          PERFORM FAIL.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(3, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }
}
