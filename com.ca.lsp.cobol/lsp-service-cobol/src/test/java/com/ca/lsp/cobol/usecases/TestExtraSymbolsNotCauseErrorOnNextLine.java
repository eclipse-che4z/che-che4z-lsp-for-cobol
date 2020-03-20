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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

/** This use case checks if extra symbols on one line do not cause any errors on the next line. */
public class TestExtraSymbolsNotCauseErrorOnNextLine extends NegativeUseCase {

  private static final String TEXT =
      "000000 Identification DIVISION.                                         23323232extra\r\n" // Extra symbols at the end of this line
          + "002800 Program-ID.                                                      23323232\r\n" // Should not show an error on this line
          + "002800  HELLOWORLD.                                                     23323232\r\n"
          + "024200 PROCEDURE DIVISION .                                             CM1014.2";

  public TestExtraSymbolsNotCauseErrorOnNextLine() {
    super(TEXT);
  }

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Number of diagnostics", 1, diagnostics.size());
    Diagnostic diagnostic = diagnostics.get(0);
    assertEquals("The line doesn't match the fixed format", diagnostic.getMessage());

    // The position of dot at the end of line "INITIALIZE ID4(ROW-SUB)."
    Range range = diagnostic.getRange();
    assertEquals("Diagnostic start line", 0, range.getStart().getLine());
    assertEquals("Diagnostic start character", 80, range.getStart().getCharacter());
    assertEquals("Diagnostic end line", 0, range.getEnd().getLine());
    assertEquals("Diagnostic end character", 86, range.getEnd().getCharacter());
  }
}
