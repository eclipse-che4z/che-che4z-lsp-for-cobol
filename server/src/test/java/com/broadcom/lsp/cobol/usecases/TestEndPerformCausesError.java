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
package com.broadcom.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This use case checks if there is an error thrown if the END-PERFORM token is missing */
class TestEndPerformCausesError extends NegativeUseCase {
  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.\n"
          + "000200 PROGRAM-ID.   TEST1.\n"
          + "000301 AUTHOR.       A PROGRAMMER.\n"
          + "000302 DATA DIVISION.\n"
          + "000303 WORKING-STORAGE SECTION.\n"
          + "000304 01 ID1 PIC 9.\n"
          + "000305 01 ID2 PIC 9.\n"
          + "000305 01 ID3 PIC 9.\n"
          + "000305 01 ID4 PIC 9.\n"
          + "000306 01 ID5 PIC 9.\n"
          + "000307 01 ID6 PIC 9.\n"
          + "000308 01 ID7.\n"
          + "000309     02 ROW-SUB PIC 9.\n"
          + "000400 PROCEDURE DIVISION.\n"
          + "000500     MOVE ID1 TO ID2.\n"
          + "000700     PERFORM VARYING ROW-SUB FROM 1 BY 1 UNTIL ROW-SUB > 20\n"
          + "000800      INITIALIZE ID3(ROW-SUB)\n"
          + "000900      INITIALIZE ID4(ROW-SUB).\n"
          + "001100     MOVE ID5 TO ID6 ID7.\n"
          + "001300 000-START-EXIT.\n"
          + "001400     EXIT.";

  TestEndPerformCausesError() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals(1, diagnostics.size(), "Number of diagnostics");
    Diagnostic diagnostic = diagnostics.get(0);
    assertEquals(
        "Extraneous input '.\\r\\n           ' expected END TERMINATOR", diagnostic.getMessage());

    // The position of dot at the end of line "INITIALIZE ID4(ROW-SUB)."
    Range range = diagnostic.getRange();
    assertEquals(17, range.getStart().getLine(), "Diagnostic start line");
    assertEquals(35, range.getStart().getCharacter(), "Diagnostic start character");
    assertEquals(17, range.getEnd().getLine(), "Diagnostic end line");
    // Lines 17 and 18 are concatenated with line 16 from the parser point of view because there is
    // no terminating token
    assertEquals(49, range.getEnd().getCharacter(), "Diagnostic end character");
  }
}
