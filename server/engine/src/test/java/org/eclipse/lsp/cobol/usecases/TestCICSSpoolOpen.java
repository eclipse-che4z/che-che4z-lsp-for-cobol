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
 * Test CICS SPOOLOPEN commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-spoolopen-input">SPOOLOPEN Command</a>
 *
 * <p>This class tests all variations of the SPOOLOPEN command: INPUT and OUTPUT.
 */
public class TestCICSSpoolOpen {
  private static final String SPOOLOPEN_INPUT_VALID =
          "SPOOLOPEN INPUT TOKEN({$varOne}) USERID({$varTwo}) CLASS({$varThree})";

  private static final String SPOOLOPEN_INPUT_INVALID_ONE =
          "SPOOLOPEN  {_USERID({$varTwo})|errorOne|errorTwo_}";

  private static final String SPOOLOPEN_INPUT_INVALID_TWO =
          "SPOOLOPEN {_INPUT TOKEN({$varOne}) CLASS(123)|errorOne_}";

  private static final String SPOOLOPEN_OUTPUT_VALID =
          "SPOOLOPEN OUTPUT TOKEN({$varOne}) USERID({$varTwo}) NODE({$varThree}) CLASS({$varFour}) PRINT RECORDLENGTH({$varFive})";

  private static final String SPOOLOPEN_OUTPUT_INVALID_ONE =
          "SPOOLOPEN {_USERID({$varThree}) PRINT|errorOne|errorTwo|errorThree_}";

  private static final String SPOOLOPEN_OUTPUT_INVALID_TWO =
          "SPOOLOPEN OUTPUT TOKEN({$varOne}) USERID({$varTwo}) NODE({$varTwo}) {NOCC|errorOne} {ASA|errorTwo} {MCC|errorThree}";

  private static final String SPOOLOPEN_OUTPUT_INVALID_THREE =
          "SPOOLOPEN OUTPUT TOKEN({$varOne}) USERID({$varTwo}) NODE({$varTwo}) {PRINT|errorOne} {PUNCH|errorTwo}";

  private static final String SPOOLOPEN_OUTPUT_INVALID_FOUR =
          "SPOOLOPEN {_OUTPUT TOKEN({$varOne}) USERID({$varTwo}) NODE({$varThree}) CLASS({$varFour}) RECORDLENGTH(123)|errorOne_}";

  private static final String SPOOLOPEN_OUTPUT_INVALID_FIVE =
          "SPOOLOPEN {_OUTPUT TOKEN({$varOne}) NODE(123)|errorOne_}";

  @Test
  void testSpoolopenInputValid() {
    CICSTestUtils.noErrorTest(SPOOLOPEN_INPUT_VALID);
  }

  @Test
  void testSpoolopenInputInvalidOne() {
    CICSTestUtils.errorTest(
            SPOOLOPEN_INPUT_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: INPUT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: TOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolopenInputInvalidTwo() {
    CICSTestUtils.errorTest(
            SPOOLOPEN_INPUT_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: USERID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolopenOutputValid() {
    CICSTestUtils.noErrorTest(SPOOLOPEN_OUTPUT_VALID);
  }

  @Test
  void testSpoolopenOutputInvalidOne() {
    CICSTestUtils.errorTest(
            SPOOLOPEN_OUTPUT_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: OUTPUT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: TOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: NODE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolopenOutputInvalidTwo() {
    CICSTestUtils.errorTest(
            SPOOLOPEN_OUTPUT_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: NOCC, ASA, or MCC",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: NOCC, ASA, or MCC",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: NOCC, ASA, or MCC",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolopenOutputInvalidThree() {
    CICSTestUtils.errorTest(
            SPOOLOPEN_OUTPUT_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: PRINT or PUNCH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: PRINT or PUNCH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolopenOutputInvalidFour() {
    CICSTestUtils.errorTest(
            SPOOLOPEN_OUTPUT_INVALID_FOUR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: PRINT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolopenOutputInvalidFive() {
    CICSTestUtils.errorTest(
            SPOOLOPEN_OUTPUT_INVALID_FIVE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: USERID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
