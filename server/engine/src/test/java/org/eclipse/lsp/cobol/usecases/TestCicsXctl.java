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
import java.util.Map;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS XCTL command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-xctl">XCTL Command</a>
 *
 * <p>This class tests all variations of the XCTL command found in the link above.
 */
public class TestCicsXctl {
  private static final String ALL_OPTIONS_VALID_ONE =
      "XCTL PROGRAM({$varOne}) COMMAREA({$varTwo}) LENGTH({$varFour}) INPUTMSG({$varFive})"
          + " INPUTMSGLEN({$varSix})";
  private static final String ALL_OPTIONS_VALID_TWO =
      "XCTL PROGRAM({$varOne}) CHANNEL({$varThree}) INPUTMSG({$varFive}) INPUTMSGLEN({$varSix})";

  private static final String SOME_OPTIONS_VALID_ONE =
      "XCTL PROGRAM({$varOne}) CHANNEL({$varThree}) INPUTMSG({$varFive})";
  private static final String SOME_OPTIONS_VALID_TWO =
      "XCTL PROGRAM({$varOne}) COMMAREA({$varFour}) INPUTMSG({$varFive}) INPUTMSGLEN({$varSix})";

  private static final String BARE_VALID = "XCTL PROGRAM({$varOne})";

  private static final String INVALID_ONE =
      "XCTL PROGRAM({$varOne}) {COMMAREA|error1}({$varTwo}) {CHANNEL|error1}({$varThree})"
          + " LENGTH({$varFour}) INPUTMSG({$varFive}) INPUTMSGLEN({$varSix})";
  private static final String INVALID_TWO =
      "XCTL {_PROGRAM({$varOne}) CHANNEL({$varThree}) INPUTMSGLEN({$varSix})|error1_}";
  private static final String INVALID_THREE =
      "XCTL {_PROGRAM({$varOne}) LENGTH({$varThree})|error1_}";
  private static final String XCTL_NOLENGTH_INVALID =
      "XCTL {_PROGRAM({$varOne}) COMMAREA({$varTwo})  INPUTMSG({$varFive})|error|errorTwo_}";

  @Test
  void testAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testAllOptionsValidTwo() {
    CICSTestUtils.noErrorTest(ALL_OPTIONS_VALID_TWO);
  }

  @Test
  void testSomeOptionsValidOne() {
    CICSTestUtils.noErrorTest(SOME_OPTIONS_VALID_ONE);
  }

  @Test
  void testSomeOptionsValidTwo() {
    CICSTestUtils.noErrorTest(SOME_OPTIONS_VALID_TWO);
  }

  @Test
  void testBareValid() {
    CICSTestUtils.noErrorTest(BARE_VALID);
  }

  @Test
  void testInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: COMMAREA or CHANNEL",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(INVALID_ONE, expectedDiagnostic);
  }

  @Test
  void testInvalidTwo() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Missing required option: INPUTMSGLEN without INPUTMSG",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(INVALID_TWO, expectedDiagnostic);
  }

  @Test
  void testInvalidThree() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Missing required option: LENGTH without COMMAREA",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(INVALID_THREE, expectedDiagnostic);
  }

  @Test
  void testNoLengthInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: LENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Missing required option: INPUTMSGLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(XCTL_NOLENGTH_INVALID, expectedDiagnostic, "NOLENGTH");
  }
}
