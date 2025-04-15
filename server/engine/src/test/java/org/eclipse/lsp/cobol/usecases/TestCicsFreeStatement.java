/*
 * Copyright (c) 2025 Broadcom.
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

import java.util.*;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test FREE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-free">FREE Command</a>
 *
 * <p>This class tests all variations of the FREE command found in the link above.
 */
public class TestCicsFreeStatement {

  // Test Strings
  private static final String FREE_VALID_1 = "FREE";
  private static final String FREE_VALID_2 = "FREE CONVID({$varOne})";
  private static final String FREE_VALID_3 = "FREE CONVID({$varOne}) STATE({$varOne})";
  private static final String FREE_VALID_4 = "FREE CHILD({$varOne})";

  private static final String FREE_INVALID_1 =
      "FREE CONVID({$varOne}) {SESSION|errorOne}({$varOne})";
  private static final String FREE_INVALID_2 = "FREE CHILD({$varOne}) {STATE|errorOne}({$varOne})";

  // Test Functions
  @Test
  void testCicsFreeValid() {
    CICSTestUtils.noErrorTest(FREE_VALID_1);
    CICSTestUtils.noErrorTest(FREE_VALID_2);
    CICSTestUtils.noErrorTest(FREE_VALID_3);
    CICSTestUtils.noErrorTest(FREE_VALID_4);
  }

  // Invalid Tests
  @Test
  void testCicsFreeInvalid_1() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Options \"CONVID or SESSION\" are mutually exclusive.",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(FREE_INVALID_1, expectedDiagnostics);
  }

  @Test
  void testCicsFreeInvalid_2() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Invalid option provided: STATE",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(FREE_INVALID_2, expectedDiagnostics);
  }
}
