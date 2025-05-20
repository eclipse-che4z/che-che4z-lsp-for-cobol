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

import com.google.common.collect.ImmutableMap;
import java.util.*;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test RETURN commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-return">RETURN Command</a>
 *
 * <p>This class tests all variations of the RETURN command found in the link above.
 */
public class TestCicsReturnStatement {

  // Test Strings
  private static final String RETURN_VALID_1 =
      "RETURN TRANSID({$varOne}) COMMAREA({$varOne}) LENGTH({$varOne}) IMMEDIATE"
          + " INPUTMSG({$varOne}) INPUTMSGLEN({$varOne})";
  private static final String RETURN_VALID_2 = "RETURN";

  private static final String RETURN_INVALID_1 =
      "RETURN TRANSID({$varOne}) COMMAREA({$varOne}) {CHANNEL|errorOne}({$varOne})";
  private static final String RETURN_INVALID_2 = "RETURN {_CHANNEL({$varOne})|errorOne_}";
  private static final String RETURN_INVALID_3 =
      "RETURN TRANSID({$varOne}) COMMAREA({$varOne}) LENGTH({$varOne}) IMMEDIATE"
          + " INPUTMSG({$varOne}) INPUTMSGLEN({$varOne}) {ENDACTIVITY|errorOne}";
  private static final String RETURN_TRANS_NOLENGTH_INVALID =
      "RETURN {_TRANSID({$varOne}) COMMAREA({$varOne}) IMMEDIATE"
          + " INPUTMSG({$varOne})|error|errorTwo_}";

  // Test Functions
  @Test
  void testCicsReturnValid() {
    CICSTestUtils.noErrorTest(RETURN_VALID_1);
    CICSTestUtils.noErrorTest(RETURN_VALID_2);
  }

  // Invalid Tests
  @Test
  void testCicsReturnInvalid_1() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Options \"COMMAREA or CHANNEL\" are mutually exclusive.",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RETURN_INVALID_1, expectedDiagnostics);
  }

  @Test
  void testCicsReturnInvalid_2() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option for: CHANNEL without TRANSID",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RETURN_INVALID_2, expectedDiagnostics);
  }

  @Test
  void testCicsReturnInvalid_3() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Options \"TRANSID or ENDACTIVITY\" are mutually exclusive.",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RETURN_INVALID_3, expectedDiagnostics);
  }

  @Test
  void testCicsReturnNoLengthInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: INPUTMSGLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Missing required option: LENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RETURN_TRANS_NOLENGTH_INVALID, expectedDiagnostic, "NOLENGTH");
  }
}
