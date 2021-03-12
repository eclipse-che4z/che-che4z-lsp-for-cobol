/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This use case checks if the position of error underscored correctly. There is a typo in the TEXT
 * in the line 6, but as designed the following token should be underscored as unexpected, because
 * in this case "PERORM" recognized as a variable.
 */
class TestCorrectErrorUnderscorePosition extends NegativeUseCase {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           PERORM VARYING A FROM 10 BY 10 UNTIL A > 40\r\n" // Typo in "PERORM",
          // offending token is
          // "VARYING"
          + "               PERFORM VARYING b FROM 1 BY 1 UNTIL B > 4\r\n"
          + "               END-PERFORM\r\n"
          + "            END-PERFORM.\r\n"
          + "            STOP RUN.";

  TestCorrectErrorUnderscorePosition() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertDiagnostics(List<Diagnostic> diagnostics) {
    // The keywords between "PERORM" and "END-PERFORM" cannot be recognized, so they are marked as
    // errors
    assertEquals(11, diagnostics.size(), "Number of diagnostics");

    Diagnostic diagnostic = diagnostics.get(0);
    assertEquals("Syntax error on 'VARYING' expected SECTION", diagnostic.getMessage());

    Range range = diagnostic.getRange();
    assertEquals(5, range.getStart().getLine(), "Diagnostic start line");
    assertEquals(18, range.getStart().getCharacter(), "Diagnostic start character");
    assertEquals(5, range.getEnd().getLine(), "Diagnostic end line");
    assertEquals(25, range.getEnd().getCharacter(), "Diagnostic end character");
  }
}
