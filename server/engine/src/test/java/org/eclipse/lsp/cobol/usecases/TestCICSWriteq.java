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
 * Test CICS WRITEQ commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-writeq-td">WRITEQ TD Command</a>
 * and <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-writeq-ts">WRITEQ TS Command</a>
 *
 * <p>This class tests all variations of the WRITEQ command: TD and TS.
 */
public class TestCICSWriteq {
  private static final String WRITEQ_TD_VALID_ONE =
          "WRITEQ TD QUEUE({$varOne}) FROM({$varTwo}) LENGTH({$varThree})";

  private static final String WRITEQ_TD_VALID_TWO =
          "WRITEQ TD QUEUE({$varOne}) FROM({$varTwo}) SYSID({$varThree})";

  private static final String WRITEQ_TD_INVALID_ONE =
          "WRITEQ {_TD FROM(123)|errorOne_}";

  private static final String WRITEQ_TD_INVALID_TWO =
          "WRITEQ {_TD QUEUE(123)|errorOne_}";

  private static final String WRITEQ_TS_VALID_ONE =
          "WRITEQ TS QUEUE({$varOne}) FROM({$varTwo}) LENGTH({$varThree})";

  private static final String WRITEQ_TS_VALID_TWO =
          "WRITEQ TS QNAME({$varOne}) FROM({$varTwo}) ITEM({$varThree}) REWRITE AUXILIARY";

  private static final String WRITEQ_TS_INVALID_ONE =
          "WRITEQ TS {QUEUE|errorOne}({$varOne}) {QNAME|errorTwo}({$varTwo}) FROM({$varThree})";

  private static final String WRITEQ_TS_INVALID_TWO =
          "WRITEQ TS QUEUE({$varOne}) FROM({$varTwo}) {AUXILIARY|errorOne} {MAIN|errorTwo}";

  @Test
  void testWriteqTdValidOne() {
    CICSTestUtils.noErrorTest(WRITEQ_TD_VALID_ONE);
  }

  @Test
  void testWriteqTdValidTwo() {
    CICSTestUtils.noErrorTest(WRITEQ_TD_VALID_TWO);
  }

  @Test
  void testWriteqTdInvalidOne() {
    CICSTestUtils.errorTest(
            WRITEQ_TD_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: QUEUE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteqTdInvalidTwo() {
    CICSTestUtils.errorTest(
            WRITEQ_TD_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteqTsValidOne() {
    CICSTestUtils.noErrorTest(WRITEQ_TS_VALID_ONE);
  }

  @Test
  void testWriteqTsValidTwo() {
    CICSTestUtils.noErrorTest(WRITEQ_TS_VALID_TWO);
  }

  @Test
  void testWriteqTsInvalidOne() {
    CICSTestUtils.errorTest(
            WRITEQ_TS_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: QUEUE or QNAME",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: QUEUE or QNAME",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWriteqTsInvalidTwo() {
    CICSTestUtils.errorTest(
            WRITEQ_TS_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: AUXILIARY or MAIN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: AUXILIARY or MAIN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
