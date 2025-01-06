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
 * Test CICS SYNCPOINT commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-syncpoint-rollback">SYNCPOINT Command</a>
 *
 * <p>This class tests all variations of the SYNCPOINT command: standard and ROLLBACK.
 */
public class TestCICSSyncPoint {
  private static final String SYNCPOINT_STANDARD_VALID =
          "SYNCPOINT";

  private static final String SYNCPOINT_ROLLBACK_VALID =
          "SYNCPOINT ROLLBACK";

  private static final String SYNCPOINT_ROLLBACK_INVALID =
          "SYNCPOINT ROLLBACK {ROLLBACK|errorOne}";

  @Test
  void testSyncpointStandardValid() {
    CICSTestUtils.noErrorTest(SYNCPOINT_STANDARD_VALID);
  }

  @Test
  void testSyncpointRollbackValid() {
    CICSTestUtils.noErrorTest(SYNCPOINT_ROLLBACK_VALID);
  }

  @Test
  void testSyncpointRollbackInvalid() {
    CICSTestUtils.errorTest(
            SYNCPOINT_ROLLBACK_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: ROLLBACK",
                            DiagnosticSeverity.Warning,
                            ErrorSource.PARSING.getText())));
  }
}
