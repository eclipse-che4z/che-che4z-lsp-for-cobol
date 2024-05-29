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

/** Test perform with varying */
public class PerformVaryingStatementTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

  @Test
  void varyingOutOfLine() {
    String source =
            HEADER
                    + "           PERFORM PROC1 THROUGH PROC2 WITH TEST AFTER VARYING A FROM 1 BY 100 UNTIL A LESS B AFTER A2 FROM 1 BY 100 UNTIL A2 LESS B2 AFTER C2 FROM D2 BY 10 UNTIL D2 LESS 10\n"
                    + "           PERFORM PROC1 VARYING A FROM 1 BY 100 UNTIL A LESS B AFTER C FROM D BY 10 UNTIL D LESS 10\n"
                    + "           PERFORM PROC1 THRU PROC2.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(3, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void varyingInline() {
    String source =
        HEADER
            + "           PERFORM VARYING A FROM B BY C UNTIL D ALTER B FROM 1 BY 4 UNTIL B LESS 100 END-PERFORM\n"
            + "           PERFORM WITH TEST BEFORE VARYING A FROM 10 BY 1 UNTIL A LESS 10 AFTER B FROM 1 BY 3 UNTIL B LESS 100 DISPLAY \"Iteration: \" WS-I\n END-PERFORM.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case1() {
    String source = HEADER
            + "           PERFORM CREATE-1 VARYING RECORD-COUNTER FROM 1 BY 1 UNTIL RECORD-COUNTER IS GREATER THAN 10.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void case2() {
    String source =
            HEADER
                    + "           PERFORM  PFM-A-4-6 VARYING WRK-DS-02V00 FROM A02TWOS-DS-02V00 BY A02TWOS-DS-02V00 UNTIL (WRK-DS-02V00 + 12) = 100.\n";
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
                    + "           PERFORM  PFM-A-4-6 VARYING WRK-DS-02V00 FROM A02TWOS-DS-02V00 BY A02TWOS-DS-02V00 UNTIL WRK-DS-02V00 + 12 > 100.\n";
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
            + "           PERFORM VARYING COUNTER FROM 100 BY 4\n"
            + "                  UNTIL COUNTER NOT GREATER THAN 15\n"
            + "                        ADD 1 TO ANS\n"
            + "                        ADD 1 TO ANS2\n"
            + "           END-PERFORM.";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(1, result.getSourceUnit().list(Statement.class).size()); // should be 3, but for now it's one
    assertEquals(source, result.getSourceUnit().toText());
  }


}
