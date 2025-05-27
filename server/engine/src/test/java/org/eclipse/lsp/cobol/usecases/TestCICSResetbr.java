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
 * Test CICS RESETBR command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-resetbr">RESETBR Command</a>
 *
 * <p>This class tests the RESETBR command.
 */
public class TestCICSResetbr {
  private static final String RESETBR_VALID_MINIMAL = "RESETBR FILE({$varOne}) RIDFLD({$varTwo})";

  private static final String RESETBR_VALID_FULL =
      "RESETBR FILE({$varOne}) RIDFLD({$varTwo}) KEYLENGTH({$varThree}) GENERIC REQID({$varFour})"
          + " SYSID({$varFive}) GTEQ";

  private static final String RESETBR_INVALID_FULL =
      "RESETBR FILE({$varOne}) RIDFLD({$varTwo}) {KEYLENGTH|errorOne}({$varThree}) GENERIC"
          + " REQID({$varFour}) SYSID({$varFive}) GTEQ {RBA|errorTwo}";

  private static final String RESETBR_INVALID_NO_FILE =
      "RESETBR {_RIDFLD({$varOne}) REQID({$varTwo}) EQUAL|errorOne_}";

  private static final String RESETBR_INVALID_NO_RIDFLD =
      "RESETBR {_FILE({$varOne}) KEYLENGTH({$varTwo}) GTEQ|errorOne_}";

  private static final String RESETBR_INVALID_NO_KEYLENGTH =
      "RESETBR {_FILE({$varOne}) RIDFLD({$varTwo}) GENERIC GTEQ|errorOne_}";

  private static final String RESETBR_INVALID_MULTIPLE_RBA_RRN =
      "RESETBR FILE({$varOne}) RIDFLD({$varTwo}) {RBA|errorOne} {RRN|errorTwo}";

  private static final String RESETBR_INVALID_MULTIPLE_COMPARISON_OPTIONS =
      "RESETBR FILE({$varOne}) RIDFLD({$varTwo}) {GTEQ|errorOne} {EQUAL|errorTwo}";

  private static final String RESETBR_SYSID_WITHOUT_REQUIRED_OPTION =
      "RESETBR {_FILE({$varFour}) RIDFLD({$varFive}) SYSID({$varFour})|error1_}";

  @Test
  void testResetbrValidMinimal() {
    CICSTestUtils.noErrorTest(RESETBR_VALID_MINIMAL);
  }

  @Test
  void testResetbrValidFull() {
    CICSTestUtils.noErrorTest(RESETBR_VALID_FULL);
  }

  @Test
  void testResetbrInvalidFull() {
    CICSTestUtils.errorTest(
        RESETBR_INVALID_FULL,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: RBA, RRN, XRBA or"
                    + " KEYLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: RBA, RRN, XRBA or"
                    + " KEYLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testResetbrInvalidNoFile() {
    CICSTestUtils.errorTest(
        RESETBR_INVALID_NO_FILE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: FILE or DATASET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testResetbrInvalidNoRidfld() {
    CICSTestUtils.errorTest(
        RESETBR_INVALID_NO_RIDFLD,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: RIDFLD",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testResetbrInvalidNoKeyLength() {
    CICSTestUtils.errorTest(
        RESETBR_INVALID_NO_KEYLENGTH,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option for: GENERIC",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testResetbrInvalidMultipleRbaRrn() {
    CICSTestUtils.errorTest(
        RESETBR_INVALID_MULTIPLE_RBA_RRN,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: RBA, RRN, XRBA or"
                    + " KEYLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: RBA, RRN, XRBA or"
                    + " KEYLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testResetbrInvalidMultipleComparisonOptions() {
    CICSTestUtils.errorTest(
        RESETBR_INVALID_MULTIPLE_COMPARISON_OPTIONS,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: GTEQ or EQUAL",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: GTEQ or EQUAL",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testReadprevSysidWithoutRequiredOption() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: RBA, RRN, XRBA or KEYLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(RESETBR_SYSID_WITHOUT_REQUIRED_OPTION, expectedDiagnostics);
  }
}
