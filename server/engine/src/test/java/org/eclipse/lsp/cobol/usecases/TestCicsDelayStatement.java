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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

/**
 * Test CICS DELAY commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.1?topic=summary-delay">DELAY Command</a>
 *
 * <p>This class tests all variations of the DELAY command found in the link above.
 */
public class TestCicsDelayStatement {
  private static final String PREFIX =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEXTEX.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*CHECK} pic x(9).\n"
          + "       PROCEDURE DIVISION.\n";
  public static final String TEXT =
      PREFIX
          + "           EXEC CICS \n"
          + "               DELAY FOR MILLISECS(500) REQID({$CHECK})\n"
          + "               NOHANDLE \n"
          + "           END-EXEC.";

  public static final String TEXT2 =
      PREFIX
          + "           EXEC CICS \n"
          + "               DELAY INTERVAL({$CHECK}) REQID({$CHECK})\n"
          + "               NOHANDLE \n"
          + "           END-EXEC.";

  public static final String TEXT3 =
      PREFIX
          + "           EXEC CICS \n"
          + "               DELAY UNTIL HOURS(500) MINUTES(800) REQID({$CHECK})\n"
          + "               NOHANDLE \n"
          + "           END-EXEC.";

  @Test
  void test_delayStatement_flow1() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_delayStatement_flow2() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_delayStatement_flow3() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }

  private static final String DELAY_VALID =
          "DELAY REQID({$varFour})";
  private static final String DELAY_VALID_ALL =
          "DELAY FOR HOURS(100) MINUTES(20) SECONDS(10) MILLISECS(1)";
  private static final String DELAY_FOR_UNTIL_INVALID =
          "DELAY { FOR | error2 } HOURS(1) {UNTIL | error} ";
  private static final String DELAY_INTERVAL_TIME_INVALID =
          "DELAY { INTERVAL | errorIntervalTime2 }(100) {TIME | errorIntervalTime }(100)";

  private static final String DELAY_UNTIL_MILLISEC_INVALID =
          "DELAY UNTIL HOURS({$varFour}) {MILLISECS |  errorMillisecs}(100)";
  private static final String DELAY_UNTIL_MISSING_INVALID =
          "DELAY {UNTIL|errorMissingTimeInterval}";
  private static final String DELAY_FOR_MISSING_INVALID =
          "DELAY {FOR|errorMissingTimeIntervalFor}";
  @Test
  void testDelayReqidValid() {
    CICSTestUtils.noErrorTest(DELAY_VALID);
  }
  @Test
  void testDelayAllValid() {
    CICSTestUtils.noErrorTest(DELAY_VALID_ALL);
  }
  @Test
  void testDelayForUntilInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error",
                    new Diagnostic(
                            new Range(new Position(15, 12), new Position(15, 17)),
                            "Exactly one option required, options are mutually exclusive: INTERVAL, TIME, UNTIL, FOR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTERVAL, TIME, UNTIL, FOR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELAY_FOR_UNTIL_INVALID, expectedDiagnostic);
  }
  @Test
  void testDelayIntervalTimeInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "errorIntervalTime",
                    new Diagnostic(
                            new Range(new Position(14, 12), new Position(14, 16)),
                            "Exactly one option required, options are mutually exclusive: INTERVAL, TIME, UNTIL, FOR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorIntervalTime2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTERVAL, TIME, UNTIL, FOR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELAY_INTERVAL_TIME_INVALID, expectedDiagnostic);
  }

  @Test
  void testDelayUntilMillisecsInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "errorMillisecs",
                    new Diagnostic(
                            new Range(),
                            "Invalid option provided: MILLISECS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELAY_UNTIL_MILLISEC_INVALID, expectedDiagnostic);
  }
  @Test
  void testDelayUntilMissingTimeIntervalInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "errorMissingTimeInterval",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: HOURS or MINUTES or SECONDS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELAY_UNTIL_MISSING_INVALID, expectedDiagnostic);
  }
  @Test
  void testDelayForMissingTimeIntervalInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "errorMissingTimeIntervalFor",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: HOURS or MINUTES or SECONDS or MILLISECS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELAY_FOR_MISSING_INVALID, expectedDiagnostic);
  }
}
