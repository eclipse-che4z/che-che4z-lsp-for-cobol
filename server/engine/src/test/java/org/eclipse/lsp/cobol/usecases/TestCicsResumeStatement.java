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
 * Test RESUME commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-resume">RESUME Command</a>
 *
 * <p>This class tests all variations of the RESUME command found in the link above.
 */
public class TestCicsResumeStatement {

  // Test Strings
  private static final String RESUME_VALID_1 = "RESUME ACQACTIVITY";
  private static final String RESUME_VALID_2 = "RESUME ACQPROCESS";

  private static final String RESUME_INVALID_1 =
      "RESUME {ACQACTIVITY|errorOne} {ACQPROCESS|errorTwo}";
  private static final String RESUME_INVALID_2 = "RESUME {NOHANDLE|errorOne}";

  // Test Functions
  @Test
  void testCicsResumeValid() {
    CICSTestUtils.noErrorTest(RESUME_VALID_1);
    CICSTestUtils.noErrorTest(RESUME_VALID_2);
  }

  // Invalid Tests
  @Test
  void testCicsResumeInvalid_1() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Exactly one option required, options are mutually exclusive: ACQACTIVITY, ACQPROCESS"
                + " or ACTIVITY",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    expectedDiagnostics.put(
        "errorTwo",
        new Diagnostic(
            new Range(),
            "Exactly one option required, options are mutually exclusive: ACQACTIVITY, ACQPROCESS"
                + " or ACTIVITY",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RESUME_INVALID_1, expectedDiagnostics);
  }

  @Test
  void testCicsResumeInvalid_2() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Exactly one option required, none provided: ACQACTIVITY, ACQPROCESS or ACTIVITY",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RESUME_INVALID_2, expectedDiagnostics);
  }
}
