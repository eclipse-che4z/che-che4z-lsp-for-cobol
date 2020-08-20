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

package com.ca.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This use case checks that there is no NullPointerException thrown if END-PERFORM missing. */
class TestPerformWithoutEndNotCauseNPE extends NegativeUseCase {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 PARENT.\n"
          + "         02 CHILD PIC 9. \n"
          + "       PROCEDURE DIVISION.\n"
          + "       MAINLINE.\n"
          + "       PERFORM MOVE 0 TO CHILD OF PARENT.\n"
          + "       GOBACK. ";

  TestPerformWithoutEndNotCauseNPE() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertDiagnostics(List<Diagnostic> diagnostics) {
    {
      assertEquals(1, diagnostics.size(), "Number of diagnostics");

      Diagnostic diagnostic = diagnostics.get(0);
      assertEquals("No viable alternative at input OF PARENT.\r\n       ", diagnostic.getMessage());

      Range range = diagnostic.getRange();
      assertEquals(8, range.getStart().getLine(), "Diagnostic start line");
      assertEquals(40, range.getStart().getCharacter(), "Diagnostic start character");
      assertEquals(8, range.getEnd().getLine(), "Diagnostic end line");
      assertEquals(50, range.getEnd().getCharacter(), "Diagnostic end character");
    }
  }
}
