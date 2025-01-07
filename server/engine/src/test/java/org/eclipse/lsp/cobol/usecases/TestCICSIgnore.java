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
 * Test CICS IGNORE CONDITION command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-ignore-condition">IGNORE CONDITION Command</a>
 *
 * <p>This class tests the IGNORE CONDITION command.
 */
public class TestCICSIgnore {
  private static final String IGNORE_CONDITION_VALID_ONE =
          "IGNORE CONDITION ERROR";

  private static final String IGNORE_CONDITION_VALID_MULTIPLE =
          "IGNORE CONDITION ERROR MAPFAIL PARTNFAIL";

  private static final String IGNORE_CONDITION_INVALID_ONE =
          "IGNORE {ERROR|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_TWO =
          "IGNORE CONDITION {CONDITION|errorOne} ERROR";

  private static final String IGNORE_CONDITION_INVALID_THREE =
          "IGNORE CONDITION NORMAL {NORMAL|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_WRBRK =
          "IGNORE CONDITION WRBRK {WRBRK|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_INBFMH =
          "IGNORE CONDITION INBFMH {INBFMH|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_ENDINPT =
          "IGNORE CONDITION ENDINPT {ENDINPT|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_NONVAL =
          "IGNORE CONDITION NONVAL {NONVAL|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_NOSTART =
          "IGNORE CONDITION NOSTART {NOSTART|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_TERMIDERR =
          "IGNORE CONDITION TERMIDERR {TERMIDERR|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_FILENOTFOUND =
          "IGNORE CONDITION FILENOTFOUND {FILENOTFOUND|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_NOTFND =
          "IGNORE CONDITION NOTFND {NOTFND|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_DUPKEY =
          "IGNORE CONDITION DUPKEY {DUPKEY|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_INVREQ =
          "IGNORE CONDITION INVREQ {INVREQ|errorOne}";

  private static final String IGNORE_CONDITION_INVALID_IOERR =
          "IGNORE CONDITION IOERR {IOERR|errorOne}";

  @Test
  void testIgnoreConditionValidOne() {
    CICSTestUtils.noErrorTest(IGNORE_CONDITION_VALID_ONE);
  }

  @Test
  void testIgnoreConditionValidMultiple() {
    CICSTestUtils.noErrorTest(IGNORE_CONDITION_VALID_MULTIPLE);
  }

  @Test
  void testIgnoreConditionInvalidOne() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: CONDITION",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidTwo() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: CONDITION",
                            DiagnosticSeverity.Warning,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidThree() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NORMAL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidWrbrk() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_WRBRK,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: WRBRK",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidInbfmh() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_INBFMH,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: INBFMH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidEndinpt() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_ENDINPT,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: ENDINPT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidNonval() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_NONVAL,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NONVAL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidNostart() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_NOSTART,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NOSTART",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidTermiderr() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_TERMIDERR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: TERMIDERR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidFilenotfound() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_FILENOTFOUND,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: FILENOTFOUND",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidNotfnd() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_NOTFND,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: NOTFND",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidDupkey() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_DUPKEY,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: DUPKEY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidInvreq() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_INVREQ,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: INVREQ",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testIgnoreConditionInvalidIoerr() {
    CICSTestUtils.errorTest(
            IGNORE_CONDITION_INVALID_IOERR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: IOERR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
