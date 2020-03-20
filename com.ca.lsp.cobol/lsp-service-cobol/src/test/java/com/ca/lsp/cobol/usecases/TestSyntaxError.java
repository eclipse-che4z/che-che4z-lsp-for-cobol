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

/**
 * This test checks if the parser recognizes typo on the "DIVISIONs" token. The correct is
 * "DIVISION".
 */
public class TestSyntaxError extends NegativeUseCase {
  public TestSyntaxError() {
    super(TEXT);
  }

  private static final String TEXT =
      "        IDENTIFICATION DIVISIONs.\r\n" // Typo on DIVISIONs
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "        END PROGRAM test1.";

  @Test
  public void test() {
    super.test();
  }

  @Override
  protected void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Number of diagnostics", 1, diagnostics.size());
    Diagnostic diagnostic = diagnostics.get(0);
    assertEquals("Syntax error on 'DIVISIONs' expected DIVISION", diagnostic.getMessage());

    Range range = diagnostic.getRange();
    assertEquals("Diagnostic start line", 23, range.getStart().getCharacter());
    assertEquals("Diagnostic start character", 32, range.getEnd().getCharacter());
    assertEquals("Diagnostic end line", 0, range.getStart().getLine());
    assertEquals("Diagnostic end character", 0, range.getEnd().getLine());
  }
}
