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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS RESET commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-reset-acqprocess">RESET Command</a>
 *
 * <p>This class tests all variations of the RESET command: ACQPROCESS and ACTIVITY.
 */
public class TestCICSReset {
  private static final String RESET_ACQPROCESS_VALID =
          "RESET ACQPROCESS";

  private static final String RESET_ACTIVITY_VALID =
          "RESET ACTIVITY({$varOne})";

  private static final String RESET_INVALID =
          "RESET ";

  @Test
  void testResetAcqprocessValid() {
    CICSTestUtils.noErrorTest(RESET_ACQPROCESS_VALID);
  }

   @Test
  void testResetActivityValid() {
    CICSTestUtils.noErrorTest(RESET_ACTIVITY_VALID);
  }

  @Test
  void testResetInvalid() {
    CICSTestUtils.errorTestWithEndExecError(
            RESET_INVALID,
            ImmutableList.of(),
            ImmutableMap.of(
                    "end-exec-error",
                    new Diagnostic(
                            new Range(),
                            "Syntax error on 'END-EXEC'",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
