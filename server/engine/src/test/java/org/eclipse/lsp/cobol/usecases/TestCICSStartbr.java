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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS STARTBR command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-startbr">STARTBR Command</a>
 *
 * <p>This class tests the STARTBR command.
 */
public class TestCICSStartbr {
  private static final String STARTBR_VALID_MINIMAL =
          "STARTBR FILE({$varOne}) RIDFLD({$varTwo})";

  private static final String STARTBR_DATASET_VALID =
          "STARTBR DATASET({$varOne}) RIDFLD({$varTwo})";

  private static final String STARTBR_INVALID_NO_KEYLENGTH =
          "STARTBR {_FILE({$varOne}) RIDFLD({$varTwo}) GENERIC|errorOne_}";

  private static final String STARTBR_VALID_FULL =
          "STARTBR FILE({$varOne}) RIDFLD({$varTwo}) KEYLENGTH({$varThree}) GENERIC REQID({$varFour}) SYSID({$varFive}) DEBKEY GTEQ";

  private static final String STARTBR_SYSID_INVALID =
          "STARTBR {_FILE({$varOne}) RIDFLD({$varTwo}) SYSID({$varFive}) GTEQ|errorOne_}";

  private static final String STARTBR_INVALID_NO_FILE =
          "STARTBR {_RIDFLD({$varTwo}) KEYLENGTH({$varOne}) GENERIC|errorOne_}";

  private static final String STARTBR_INVALID_NO_RIDFLD =
          "STARTBR {_FILE({$varOne}) KEYLENGTH({$varTwo}) GENERIC|errorOne_}";

  private static final String STARTBR_INVALID_MULTIPLE_POSITIONING =
          "STARTBR FILE({$varOne}) RIDFLD({$varTwo}) {DEBKEY|errorOne} {RBA|errorTwo}";

  private static final String STARTBR_INVALID_MULTIPLE_COMPARISON =
          "STARTBR FILE({$varOne}) RIDFLD({$varTwo}) {GTEQ|errorOne} {EQUAL|errorTwo}";

  @Test
  void testStartbrValidMinimal() {
    CICSTestUtils.noErrorTest(STARTBR_VALID_MINIMAL);
  }

  @Test
  void testStartbrDatasetValid() {
    CICSTestUtils.noErrorTest(STARTBR_DATASET_VALID);
  }

  @Test
  void testStartbrInvalidNoKeylength() {
    CICSTestUtils.errorTest(
            STARTBR_INVALID_NO_KEYLENGTH,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: KEYLENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testStartbrSysidInvalid() {
    CICSTestUtils.errorTest(
            STARTBR_SYSID_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, none provided: KEYLENGTH, RBA, RRN, or XRBA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testStartbrValidFull() {
    CICSTestUtils.noErrorTest(STARTBR_VALID_FULL);
  }

  @Test
  void testStartbrInvalidNoFile() {
    CICSTestUtils.errorTest(
            STARTBR_INVALID_NO_FILE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, none provided: FILE or DATASET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testStartbrInvalidNoRidfld() {
    CICSTestUtils.errorTest(
            STARTBR_INVALID_NO_RIDFLD,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: RIDFLD",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testStartbrInvalidMultiplePositioning() {
    CICSTestUtils.errorTest(
            STARTBR_INVALID_MULTIPLE_POSITIONING,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: DEBKEY, DEBREC, RBA, RRN, or XRBA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: DEBKEY, DEBREC, RBA, RRN, or XRBA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testStartbrInvalidMultipleComparison() {
    CICSTestUtils.errorTest(
            STARTBR_INVALID_MULTIPLE_COMPARISON,
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
}
