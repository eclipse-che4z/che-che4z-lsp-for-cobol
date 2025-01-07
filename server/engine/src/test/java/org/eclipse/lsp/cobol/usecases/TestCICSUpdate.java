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
 * Test CICS UPDATE COUNTER and UPDATE DCOUNTER commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-update-counter-update-dcounter">UPDATE COUNTER DCOUNTER Command</a>
 *
 * <p>This class tests all variations of the UPDATE command: COUNTER and DCOUNTER.
 */
public class TestCICSUpdate {
  private static final String UPDATE_COUNTER_VALID =
          "UPDATE COUNTER({$varOne}) POOL({$varTwo}) VALUE({$varThree}) COMPAREMIN({$varFour}) COMPAREMAX({$varFive})";

  private static final String UPDATE_COUNTER_INVALID =
          "UPDATE {_POOL({$varTwo})|errorOne|errorTwo_}";

  private static final String UPDATE_DCOUNTER_VALID =
          "UPDATE DCOUNTER({$varOne}) POOL({$varTwo}) VALUE({$varThree}) COMPAREMIN({$varFour}) COMPAREMAX({$varFive})";

  private static final String UPDATE_DCOUNTER_INVALID =
          "UPDATE DCOUNTER({$varOne}) {DCOUNTER|errorOne}({$varOne}) POOL({$varTwo}) VALUE({$varThree})";

  @Test
  void testUpdateCounterValid() {
    CICSTestUtils.noErrorTest(UPDATE_COUNTER_VALID);
  }

  @Test
  void testUpdateCounterInvalid() {
    CICSTestUtils.errorTest(
            UPDATE_COUNTER_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, none provided: COUNTER or DCOUNTER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: VALUE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testUpdateDcounterValid() {
    CICSTestUtils.noErrorTest(UPDATE_DCOUNTER_VALID);
  }

  @Test
  void testUpdateDcounterInvalid() {
    CICSTestUtils.errorTest(
            UPDATE_DCOUNTER_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: DCOUNTER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
