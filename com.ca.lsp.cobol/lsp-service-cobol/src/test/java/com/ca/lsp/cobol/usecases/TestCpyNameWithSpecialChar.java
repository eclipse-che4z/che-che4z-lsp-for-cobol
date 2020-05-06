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
 */

package com.ca.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * This test proves that special chars (@,#,$) in copybook name recognized correctly, and the error
 * appears because of the missing copybook.
 */
public class TestCpyNameWithSpecialChar extends NegativeUseCase {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        01 VAR1.\r\n"
          + "          02 VAR2.\r\n"
          + "        COPY @SPE#-$.\r\n"
          + "        PROCEDURE DIVISION.\r\n";

  public TestCpyNameWithSpecialChar() {
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
    assertEquals("@SPE#-$: Copybook not found", diagnostic.getMessage());

    Range range = diagnostic.getRange();
    assertEquals("Diagnostic start line", 6, range.getStart().getLine());
    assertEquals("Diagnostic start character", 13, range.getStart().getCharacter());
    assertEquals("Diagnostic end line", 6, range.getEnd().getLine());
    assertEquals("Diagnostic end character", 20, range.getEnd().getCharacter());
  }
}
