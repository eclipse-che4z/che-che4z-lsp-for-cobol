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

/** Test perform with times */
public class PerformTimesStatementTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

  @Test
  void timesOutOfLine() {
    String source =
            HEADER
                    + "           PERFORM PROC1 A TIMES.\n"
                    + "           PERFORM PROC1 3 TIMES.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 A TIMES.\n"
                    + "           PERFORM PROC1 THROUGH PROC2 4 TIMES.\n"
                    + "           PERFORM PROC1 THRU PROC2 B TIMES.\n"
                    + "           PERFORM PROC1 THRU PROC2 67 TIMES.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(6, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void timesInline() {
    String source =
        HEADER
                + "           PERFORM A TIMES\n"
                + "              DISPLAY \"Iteration: \" WS-I\n"
                + "              COMPUTE WS-I = WS-I + 1.\n"
                + "           END-PERFORM.\n"
                + "           PERFORM 1000 TIMES\n"
                + "              DISPLAY \"Iteration: \" WS-I\n"
                + "              COMPUTE WS-I = WS-I + 1.\n"
                + "           END-PERFORM.\n"
                + "           PERFORM ZOO TIMES END-PERFORM.\n"
                + "           PERFORM 100 TIMES END-PERFORM.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(4, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }
}
