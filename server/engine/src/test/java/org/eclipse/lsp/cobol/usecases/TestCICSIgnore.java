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
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
