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

/** Perform tests */
public class PerformBasicStatementTest {
  private static final String HEADER =
      "       ID DIVISION. PROGRAM-ID. perf.\n" + "       PROCEDURE DIVISION.\n";

  @Test
  void basicOutOfLine() {
    String source =
            HEADER
                    + "           PERFORM PROC1.\n"
                    + "           PERFORM PROC1 THROUGH PROC2.\n"
                    + "           PERFORM PROC1 THRu PROC2.\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(3, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }

  @Test
  void basicInline() {
    String source =
        HEADER
            + "           PERFORM\n"
            + "              DISPLAY \"Iteration: \" WS-I\n"
            + "              COMPUTE WS-I = WS-I + 1.\n"
            + "           END-PERFORM.\n"
            + "           PERFORM END-PERFORM\n";
    CobolParser parser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult result = parser.parse();
    assertEquals(0, result.getDiagnostics().size());
    assertEquals(2, result.getSourceUnit().list(Statement.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }
}
