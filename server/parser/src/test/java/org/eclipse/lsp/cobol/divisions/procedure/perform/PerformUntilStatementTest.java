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
package org.eclipse.lsp.cobol.divisions.procedure.perform;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.eclipse.lsp.cobol.cst.procedure.Statement;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.junit.jupiter.api.Test;

/** Test perform with until */
public class PerformUntilStatementTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";


  @Test
  void untilOutOfLine() {
    String source =
            HEADER
                    + "           PERFORM PROC1 UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 UNTIL EXIT.\n"
                    + "           PERFORM PROC1 TEST BEFORE UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 TEST AFTER UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 WITH TEST BEFORE UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 WITH TEST AFTER UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 TEST BEFORE UNTIL EXIT.\n"
                    + "           PERFORM PROC1 TEST AFTER UNTIL EXIT.\n"
                    + "           PERFORM PROC1 WITH TEST BEFORE UNTIL EXIT.\n"
                    + "           PERFORM PROC1 WITH TEST AFTER UNTIL EXIT.\n"

                    + "           PERFORM PROC1 THROUGH PROC2 UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 TEST BEFORE UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 TEST AFTER UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 WITH TEST BEFORE UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 WITH TEST AFTER UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 TEST BEFORE UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 TEST AFTER UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 WITH TEST BEFORE UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 WITH TEST AFTER UNTIL EXIT.\n"

                    + "           PERFORM PROC1 THRU PROC2 UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THRU PROC2 UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THRU PROC2 TEST BEFORE UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THRU PROC2 TEST AFTER UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THRU PROC2 WITH TEST BEFORE UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THRU PROC2 WITH TEST AFTER UNTIL A GREATER THAN 15.\n"
                    + "           PERFORM PROC1 THRU PROC2 TEST BEFORE UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THRU PROC2 TEST AFTER UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THRU PROC2 WITH TEST BEFORE UNTIL EXIT.\n"
                    + "           PERFORM PROC1 THRU PROC2 WITH TEST AFTER UNTIL EXIT.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(30, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void untilInline() {
    String source =
        HEADER
                + "           PERFORM WITH TEST BEFORE UNTIL A LESS THAN 2 DISPLAY A END-PERFORM.\n"
                + "           PERFORM WITH TEST AFTER  UNTIL A LESS THAN 2 DISPLAY A END-PERFORM.\n"

                + "           PERFORM WITH TEST BEFORE UNTIL A LESS THAN 2 END-PERFORM\n"
                + "           PERFORM WITH TEST AFTER  UNTIL A LESS THAN 2 END-PERFORM\n"

                + "           PERFORM TEST BEFORE UNTIL A LESS THAN 2 DISPLAY A END-PERFORM.\n"
                + "           PERFORM TEST AFTER  UNTIL A LESS THAN 2 DISPLAY A END-PERFORM.\n"
                + "           PERFORM TEST BEFORE UNTIL A LESS THAN 2 END-PERFORM\n"
                + "           PERFORM TEST AFTER  UNTIL A LESS THAN 2 END-PERFORM\n"

                + "           PERFORM UNTIL A LESS THAN 2 DISPLAY A END-PERFORM.\n"
                + "           PERFORM UNTIL A LESS THAN 2 END-PERFORM\n"
                + "           PERFORM UNTIL A LESS THAN 2 END-PERFORM\n"

                + "           PERFORM WITH TEST BEFORE UNTIL EXIT DISPLAY A END-PERFORM.\n"
                + "           PERFORM WITH TEST AFTER  UNTIL EXIT DISPLAY A END-PERFORM.\n"

                + "           PERFORM WITH TEST BEFORE UNTIL EXIT END-PERFORM\n"
                + "           PERFORM WITH TEST AFTER  UNTIL EXIT END-PERFORM\n"

                + "           PERFORM TEST BEFORE UNTIL EXIT DISPLAY A END-PERFORM.\n"
                + "           PERFORM TEST AFTER  UNTIL EXIT DISPLAY A END-PERFORM.\n"
                + "           PERFORM TEST BEFORE UNTIL EXIT END-PERFORM\n"
                + "           PERFORM TEST AFTER  UNTIL EXIT END-PERFORM\n"

                + "           PERFORM UNTIL EXIT DISPLAY A END-PERFORM.\n"
                + "           PERFORM UNTIL EXIT END-PERFORM\n"
                + "           PERFORM UNTIL EXIT END-PERFORM\n";

    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(22, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case1() {
    String source = HEADER
            + "           PERFORM T-1 THRU T-2 UNTIL E-1 (IDX-1, IDX-6) EQUAL TO \"II\".\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }
  @Test
  void case2() {
    String source = HEADER
            + "           PERFORM CREATE-1 VARYING RECORD-COUNTER FROM 1 BY 1 UNTIL RECORD-COUNTER IS GREATER THAN 10.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case3() {
    String source =
        HEADER
            + "           PERFORM UNTIL WRK-DU-6V0-1 = 99\n"
            + "                        ADD      6 TO   WRK-DU-6V0-1\n"
            + "                        SUBTRACT 3 FROM WRK-DU-6V0-1\n"
            + "           END-PERFORM\n";
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
            + "           PERFORM F-17 UNTIL FUNCTION REM(5, ARG2) >= 2.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }


}
