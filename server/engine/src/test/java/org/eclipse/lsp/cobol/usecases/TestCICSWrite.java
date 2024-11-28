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
 * Test CICS WRITE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-write">WRITE Command</a>
 *
 * <p>This class tests all variations of the WRITE command: FILE, JOURNALNAME, and OPERATOR.
 */
public class TestCICSWrite {
  private static final String WRITE_FILE_VALID_ONE =
          "WRITE FILE({$varOne}) FROM({$varTwo}) RIDFLD({$varThree})";

  private static final String WRITE_DATASET_VALID_ONE =
          "WRITE DATASET({$varOne}) FROM({$varTwo}) RIDFLD({$varThree})";

  private static final String WRITE_FILE_VALID_TWO =
          "WRITE FILE({$varOne}) FROM({$varTwo}) RIDFLD({$varThree}) KEYLENGTH({$varThree}) RBA NOSUSPEND";

  private static final String WRITE_FILE_INVALID_ONE =
          "WRITE {_FILE({$varOne}) FROM(123)|errorOne_}";

  private static final String WRITE_FILE_INVALID_TWO =
          "WRITE FILE({$varOne}) FROM({$varTwo}) RIDFLD({$varTwo}) {RBA|errorOne} {RRN|errorTwo} {XRBA|errorThree}";

  private static final String WRITE_JOURNALNAME_VALID_ONE =
          "WRITE JOURNALNAME({$varOne}) JTYPEID({$varTwo}) FROM({$varThree}) FLENGTH({$varFour})";

  private static final String WRITE_JOURNALNAME_VALID_TWO =
          "WRITE JOURNALNAME({$varOne}) JTYPEID({$varTwo}) FROM({$varTwo}) FLENGTH({$varThree}) PREFIX({$varFour}) PFXLENG({$varFive}) WAIT";

  private static final String WRITE_JOURNALNAME_INVALID_ONE =
          "WRITE {_JOURNALNAME({$varOne}) FROM({$varTwo}) FLENGTH(123)|errorOne_}";

  private static final String WRITE_JOURNALNAME_INVALID_TWO =
          "WRITE {_JOURNALNAME({$varOne}) FROM({$varTwo}) FLENGTH(123)|errorOne_}";

  private static final String WRITE_OPERATOR_VALID_ONE =
          "WRITE OPERATOR TEXT({$varOne}) TEXTLENGTH({$varTwo}) ROUTECODES({$varThree}) NUMROUTES({$varThree})";

  private static final String WRITE_OPERATOR_VALID_TWO =
          "WRITE OPERATOR TEXT({$varOne}) REPLY({$varTwo}) MAXLENGTH({$varThree})";

  private static final String WRITE_OPERATOR_INVALID_ONE =
          "WRITE {_OPERATOR TEXTLENGTH(123)|errorOne_}";

  private static final String WRITE_OPERATOR_INVALID_TWO =
          "WRITE {_OPERATOR TEXT({$varOne}) REPLY(123)|errorOne_}";

  private static final String WRITE_OPERATOR_INVALID_THREE =
          "WRITE OPERATOR TEXT({$varOne}) {EVENTUAL|errorOne} {CRITICAL|errorTwo} {IMMEDIATE|errorThree}";

  private static final String WRITE_OPERATOR_INVALID_FOUR =
          "WRITE {_OPERATOR TEXT({$varOne}) EVENTUAL TIMEOUT(123)|errorOne_}";

  private static final String WRITE_OPERATOR_INVALID_FIVE =
          "WRITE {_OPERATOR TEXT({$varOne}) {EVENTUAL|errorTwo} {REPLY|errorThree}({$varTwo}) TIMEOUT(123)|errorOne_}";

  @Test
  void testWriteFileValidOne() {
    CICSTestUtils.noErrorTest(WRITE_FILE_VALID_ONE);
  }

  @Test
  void testWriteDatasetValidOne() {
    CICSTestUtils.noErrorTest(WRITE_DATASET_VALID_ONE);
  }

  @Test
  void testWriteFileValidTwo() {
    CICSTestUtils.noErrorTest(WRITE_FILE_VALID_TWO);
  }

  @Test
  void testWriteFileInvalidOne() {
    CICSTestUtils.errorTest(
            WRITE_FILE_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: RIDFLD",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteFileInvalidTwo() {
    CICSTestUtils.errorTest(
            WRITE_FILE_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: RBA or RRN or XRBA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: RBA or RRN or XRBA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: RBA or RRN or XRBA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteJournalnameValidOne() {
    CICSTestUtils.noErrorTest(WRITE_JOURNALNAME_VALID_ONE);
  }

  @Test
  void testWriteJournalnameValidTwo() {
    CICSTestUtils.noErrorTest(WRITE_JOURNALNAME_VALID_TWO);
  }

  @Test
  void testWriteJournalnameInvalidOne() {
    CICSTestUtils.errorTest(
            WRITE_JOURNALNAME_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: JTYPEID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteJournalnameInvalidTwo() {
    CICSTestUtils.errorTest(
            WRITE_JOURNALNAME_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: JTYPEID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteOperatorValidOne() {
    CICSTestUtils.noErrorTest(WRITE_OPERATOR_VALID_ONE);
  }

  @Test
  void testWriteOperatorValidTwo() {
    CICSTestUtils.noErrorTest(WRITE_OPERATOR_VALID_TWO);
  }

  @Test
  void testWriteOperatorInvalidOne() {
    CICSTestUtils.errorTest(
            WRITE_OPERATOR_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: TEXT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteOperatorInvalidTwo() {
    CICSTestUtils.errorTest(
            WRITE_OPERATOR_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: MAXLENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteOperatorInvalidThree() {
    CICSTestUtils.errorTest(
            WRITE_OPERATOR_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EVENTUAL or ACTION or CRITICAL or IMMEDIATE or REPLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EVENTUAL or ACTION or CRITICAL or IMMEDIATE or REPLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EVENTUAL or ACTION or CRITICAL or IMMEDIATE or REPLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteOperatorInvalidFour() {
    CICSTestUtils.errorTest(
            WRITE_OPERATOR_INVALID_FOUR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: REPLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteOperatorInvalidFive() {
    CICSTestUtils.errorTest(
            WRITE_OPERATOR_INVALID_FIVE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: MAXLENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EVENTUAL or ACTION or CRITICAL or IMMEDIATE or REPLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EVENTUAL or ACTION or CRITICAL or IMMEDIATE or REPLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}

