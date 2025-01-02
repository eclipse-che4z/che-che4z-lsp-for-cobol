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
 * Test CICS MONITOR command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-monitor">MONITOR Command</a>
 *
 * <p>This class tests the MONITOR command.
 */
public class TestCICSMonitor {
  private static final String MONITOR_VALID_MINIMAL =
          "MONITOR POINT({$varOne})";

  private static final String MONITOR_VALID_FULL =
          "MONITOR POINT({$varOne}) DATA1({$varTwo}) DATA2({$varThree}) ENTRYNAME({$varFour})";

  private static final String MONITOR_INVALID_NO_POINT =
          "MONITOR {_DATA1({$varTwo})|errorOne_} ";

  private static final String MONITOR_INVALID_DUPLICATE_DATA1 =
          "MONITOR POINT({$varOne}) DATA1({$varTwo}) {DATA1|errorOne}({$varThree})";

  @Test
  void testMonitorValidMinimal() {
    CICSTestUtils.noErrorTest(MONITOR_VALID_MINIMAL);
  }

  @Test
  void testMonitorValidFull() {
    CICSTestUtils.noErrorTest(MONITOR_VALID_FULL);
  }

  @Test
  void testMonitorInvalidNoPoint() {
    CICSTestUtils.errorTest(
            MONITOR_INVALID_NO_POINT,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: POINT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testMonitorInvalidDuplicateData1() {
    CICSTestUtils.errorTest(
            MONITOR_INVALID_DUPLICATE_DATA1,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: DATA1",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
