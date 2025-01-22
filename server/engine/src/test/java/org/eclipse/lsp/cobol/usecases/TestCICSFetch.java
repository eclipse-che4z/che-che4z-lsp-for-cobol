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
 * Test CICS HANDLE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-fetch-any">FETCH Command</a>
 *
 * <p>This class tests all variations of the HANDLE command: ANY and CHILD.
 */
public class TestCICSFetch {
  // FETCH ANY tests
  private static final String FETCH_ANY_VALID_ONE =
          "FETCH ANY({$varOne}) CHANNEL({$varTwo}) COMPSTATUS({$varThree}) ABCODE({$varFour})";

  private static final String FETCH_ANY_VALID_TWO =
          "FETCH ANY({$varOne}) COMPSTATUS({$varThree}) TIMEOUT({$varTwo})";

  private static final String FETCH_ANY_INVALID_ONE =
          "FETCH ANY({$varOne}) COMPSTATUS({$varThree}) {NOSUSPEND|errorOne} {TIMEOUT|errorTwo}({$varTwo})";

  private static final String FETCH_ANY_INVALID_TWO =
          "FETCH {_ANY({$varOne})|errorOne_}";

  // FETCH CHILD tests
  private static final String FETCH_CHILD_VALID_ONE =
          "FETCH CHILD({$varOne}) CHANNEL({$varTwo}) COMPSTATUS({$varThree}) ABCODE({$varFour})";

  private static final String FETCH_CHILD_VALID_TWO =
          "FETCH CHILD({$varOne}) COMPSTATUS({$varThree}) NOSUSPEND";

  private static final String FETCH_CHILD_INVALID_ONE =
          "FETCH CHILD({$varOne}) COMPSTATUS({$varThree}) {NOSUSPEND|errorOne} {TIMEOUT|errorTwo}({$varTwo})";

  private static final String FETCH_CHILD_INVALID_TWO =
          "FETCH {_CHILD({$varOne})|errorOne_}";

  private static final String FETCH_CHILD_INVALID_THREE =
          "FETCH ANY({$varOne}) COMPSTATUS({$varThree}) {ANY|errorOne}({$varTwo}) CHANNEL({$varThree})";

  private static final String FETCH_CHILD_INVALID_FOUR =
          "FETCH CHILD({$varOne}) CHANNEL({$varTwo}) {CHANNEL|errorOne}({$varThree}) COMPSTATUS({$varThree})";

  @Test
  void testFetchAnyValidOne() {
    CICSTestUtils.noErrorTest(FETCH_ANY_VALID_ONE);
  }

  @Test
  void testFetchAnyValidTwo() {
    CICSTestUtils.noErrorTest(FETCH_ANY_VALID_TWO);
  }

  @Test
  void testFetchAnyInvalidOne() {
    CICSTestUtils.errorTest(
            FETCH_ANY_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: NOSUSPEND or TIMEOUT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: NOSUSPEND or TIMEOUT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testFetchAnyInvalidTwo() {
    CICSTestUtils.errorTest(
            FETCH_ANY_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: COMPSTATUS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testFetchChildValidOne() {
    CICSTestUtils.noErrorTest(FETCH_CHILD_VALID_ONE);
  }

  @Test
  void testFetchChildValidTwo() {
    CICSTestUtils.noErrorTest(FETCH_CHILD_VALID_TWO);
  }

  @Test
  void testFetchChildInvalidOne() {
    CICSTestUtils.errorTest(
            FETCH_CHILD_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: NOSUSPEND or TIMEOUT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: NOSUSPEND or TIMEOUT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testFetchChildInvalidTwo() {
    CICSTestUtils.errorTest(
            FETCH_CHILD_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: COMPSTATUS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testFetchAnyDuplicateOptions() {
    CICSTestUtils.errorTest(
            FETCH_CHILD_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: ANY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testFetchChildDuplicateOptions() {
    CICSTestUtils.errorTest(
            FETCH_CHILD_INVALID_FOUR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: CHANNEL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}

