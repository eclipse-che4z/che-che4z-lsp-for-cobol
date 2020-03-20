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

import com.ca.lsp.cobol.positive.CobolText;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.List;

import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;
/**
 * This test checks that the error shown if the copybook that is used in the Cobol file contains a
 * link to itself.
 */
public class TestCopybookWithRecursiveDependencyIsDetected extends NegativeUseCase {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        COPY RECURSIVE-COPY.\n\n"
          + "        PROCEDURE DIVISION.\n\n";

  private static final String RECURSIVE_COPY = "        COPY RECURSIVE-COPY.";

  public TestCopybookWithRecursiveDependencyIsDetected() {
    super(TEXT);
  }

  @Override
  @Test
  public void test() {
    super.test(singletonList(new CobolText("RECURSIVE-COPY", RECURSIVE_COPY)));
  }

  @Override
  protected void assertDiagnostics(List<Diagnostic> diagnostics) {
    assertEquals("Number of diagnostics", 1, diagnostics.size());
    Diagnostic diagnostic = diagnostics.get(0);
    assertEquals("Recursive copybook declaration for: RECURSIVE-COPY", diagnostic.getMessage());

    Range range = diagnostic.getRange();
    assertEquals("Diagnostic start line", 4, range.getStart().getLine());
    assertEquals("Diagnostic start character", 13, range.getStart().getCharacter());
    assertEquals("Diagnostic end line", 4, range.getEnd().getLine());
    assertEquals("Diagnostic end character", 27, range.getEnd().getCharacter());
  }
}
