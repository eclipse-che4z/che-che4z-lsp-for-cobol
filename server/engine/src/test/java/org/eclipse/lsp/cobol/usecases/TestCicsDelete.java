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

import java.util.Map;

/**
 * Test CICS DELETE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-delete">DELETE
 * Command</a>
 *
 * <p>This class tests all variations of the DELETE command found in the link above.
 */
public class TestCicsDelete {
  private static final String GROUP_ONE_ALL_OPTIONS_VALID_ONE =
          "DELETE FILE({$varFour}) TOKEN({$varFive}) SYSID({$varSix}) NOSUSPEND RBA";

  private static final String GROUP_ONE_ALL_OPTIONS_VALID_TWO =
          "DELETE FILE({$varFour}) RIDFLD({$varFive}) KEYLENGTH({$varSix}) GENERIC RRN";
  private static final String GROUP_ONE_NUMREC_INVALID =
          "DELETE FILE({$varFour}) RIDFLD({$varFive}) KEYLENGTH({$varSix}) {NUMREC|error1}({$varSix})";

  private static final String GROUP_ONE_ALL_OPTIONS_VALID_THREE =
          "DELETE FILE({$varFour}) RIDFLD({$varFive}) KEYLENGTH({$varSix}) GENERIC NUMREC({$varSix}) RRN";

  private static final String GROUP_ONE_ALL_OPTIONS_VALID_FOUR =
          "DELETE FILE({$varFour}) RIDFLD({$varFive}) KEYLENGTH({$varSix}) GENERIC SYSID({$varSix}) NOSUSPEND RBA";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_ONE = "DELETE FILE({$varFour})";
  private static final String GROUP_ONE_DELETE_TOKEN_INVALID = "DELETE {TOKEN(123)|error1}";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_TWO = "DELETE FILE({$varFour}) TOKEN({$varFive})";
  private static final String GROUP_ONE_PARTIAL_OPTIONS_INVALID = "DELETE FILE({$varFour}) {TOKEN|error1}({$varFive}) {RIDFLD|error2}({$varFive})";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_THREE = "DELETE FILE({$varFour}) RIDFLD({$varFive})";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_FOUR = "DELETE FILE({$varFour}) SYSID({$varFive}) RRN";
  private static final String GROUP_ONE_RBA_RRN_INVALID = "DELETE FILE({$varFour}) SYSID({$varFive}) {RBA|error1} {RRN|error2}";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_FIVE = "DELETE FILE({$varFour}) SYSID({$varFive}) RBA";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_SIX = "DELETE FILE({$varFour}) SYSID({$varFive}) NOSUSPEND";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_SEVEN = "DELETE FILE({$varFour}) RBA";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_EIGHT = "DELETE FILE({$varFour}) RRN";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_NINE = "DELETE FILE({$varFour}) NOSUSPEND RBA";

  private static final String GROUP_ONE_PARTIAL_OPTIONS_VALID_TEN = "DELETE FILE({$varFour}) NOSUSPEND RRN";

  private static final String GROUP_TWO_ACTIVITY_INVALID = "DELETE {ACTIVITY(123)|error1}";

  private static final String GROUP_TWO_CHANNEL_VALID = "DELETE CHANNEL({$varFour})";

  private static final String GROUP_TWO_EVENT_VALID = "DELETE EVENT({$varFour})";

  private static final String GROUP_TWO_TIMER_VALID = "DELETE TIMER({$varFour})";

  private static final String GROUP_THREE_CONTAINER_BTS_VALID = "DELETE CONTAINER({$varFour})";

  private static final String GROUP_THREE_CONTAINER_BTS_ACTIVITY_VALID = "DELETE CONTAINER({$varFour}) ACTIVITY({$varFive})";

  private static final String GROUP_THREE_CONTAINER_BTS_ACQACTIVITY_VALID = "DELETE CONTAINER({$varFour}) ACQACTIVITY";

  private static final String GROUP_THREE_CONTAINER_BTS_PROCESS_VALID = "DELETE CONTAINER({$varFour}) PROCESS";

  private static final String GROUP_THREE_CONTAINER_BTS_ACQPROCESS_VALID = "DELETE CONTAINER({$varFour}) ACQPROCESS";

  private static final String GROUP_THREE_CONTAINER_CHANNEL_VALID = "DELETE CONTAINER({$varFour}) CHANNEL({$varSix})";

  private static final String GROUP_FOUR_DELETE_COUNTER_VALID = "DELETE COUNTER({$varFour})";

  private static final String GROUP_FOUR_DELETE_COUNTER_POOL_VALID = "DELETE COUNTER({$varFour}) POOL({$varFive})";

  private static final String GROUP_FOUR_DELETE_COUNTER_NOSUSPEND_VALID = "DELETE COUNTER({$varFour}) NOSUSPEND";

  private static final String GROUP_FOUR_DELETE_COUNTER_POOL_NOSUSPEND_VALID = "DELETE COUNTER({$varFour}) POOL({$varFive}) NOSUSPEND";

  private static final String GROUP_FOUR_DCOUNTER_VALID = "DELETE DCOUNTER({$varFour})";
  private static final String GROUP_FOUR_DCOUNTER_INVALID = "DELETE DCOUNTER({$varFour}) {DCOUNTER|error1}({$varFour})";

  private static final String GROUP_FOUR_DCOUNTER_POOL_VALID = "DELETE DCOUNTER({$varFour}) POOL({$varFive})";

  private static final String GROUP_FOUR_DCOUNTER_NOSUSPEND_VALID = "DELETE DCOUNTER({$varFour}) NOSUSPEND";

  private static final String GROUP_FOUR_DCOUNTER_POOL_NOSUSPEND_VALID = "DELETE DCOUNTER({$varFour}) POOL({$varFive}) NOSUSPEND";

  private static final String GROUP_FOUR_COUNTER_DCOUNTER_POOL_NOSUSPEND_INVALID = "DELETE {COUNTER|error1}(123) {DCOUNTER|error2}(123) POOL({$varFive}) NOSUSPEND";

   @Test
  void testGroupOneDeleteCICSCommand_withAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(GROUP_ONE_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withAllOptionsValidTwo() {
    CICSTestUtils.noErrorTest(GROUP_ONE_ALL_OPTIONS_VALID_TWO);
  }

  @Test
  void testGroupOneNumrecInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Invalid option provided: NUMREC",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GROUP_ONE_NUMREC_INVALID, expectedDiagnostic);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withAllOptionsValidThree() {
    CICSTestUtils.noErrorTest(GROUP_ONE_ALL_OPTIONS_VALID_THREE);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withAllOptionsValidFour() {
    CICSTestUtils.noErrorTest(GROUP_ONE_ALL_OPTIONS_VALID_FOUR);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_ONE);
  }

  @Test
  void testGroupOneDeleteTokenInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FILE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GROUP_ONE_DELETE_TOKEN_INVALID, expectedDiagnostic);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidTwo() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_TWO);
  }

  @Test
  void testGroupOnePartialOptionsInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TOKEN or RIDFLD",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TOKEN or RIDFLD",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GROUP_ONE_PARTIAL_OPTIONS_INVALID, expectedDiagnostic);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidThree() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_THREE);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidFour() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_FOUR);
  }

  @Test
  void testGroupOneRbaRrnInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: RBA or RRN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: RBA or RRN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GROUP_ONE_RBA_RRN_INVALID, expectedDiagnostic);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidFive() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_FIVE);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidSix() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_SIX);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidSeven() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_SEVEN);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidEight() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_EIGHT);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidNine() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_NINE);
  }

  @Test
  void testGroupOneDeleteCICSCommand_withPartialOptionsValidTen() {
    CICSTestUtils.noErrorTest(GROUP_ONE_PARTIAL_OPTIONS_VALID_TEN);
  }

  @Test
  void testGroupTwoActivityInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: CONTAINER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GROUP_TWO_ACTIVITY_INVALID, expectedDiagnostic);
  }

  @Test
  void testGroupTwoChannelValid() {
    CICSTestUtils.noErrorTest(GROUP_TWO_CHANNEL_VALID);
  }

  @Test
  void testGroupTwoEventValid() {
    CICSTestUtils.noErrorTest(GROUP_TWO_EVENT_VALID);
  }

  @Test
  void testGroupTwoTimerValid() {
    CICSTestUtils.noErrorTest(GROUP_TWO_TIMER_VALID);
  }

  @Test
  void testGroupThreeContainerValid() {
    CICSTestUtils.noErrorTest(GROUP_THREE_CONTAINER_BTS_VALID);
  }

  @Test
  void testGroupThreeContainerActivityValid() {
    CICSTestUtils.noErrorTest(GROUP_THREE_CONTAINER_BTS_ACTIVITY_VALID);
  }

  @Test
  void testGroupThreeContainerAcqactivityValid() {
    CICSTestUtils.noErrorTest(GROUP_THREE_CONTAINER_BTS_ACQACTIVITY_VALID);
  }

  @Test
  void testGroupThreeContainerProcessValid() {
    CICSTestUtils.noErrorTest(GROUP_THREE_CONTAINER_BTS_PROCESS_VALID);
  }

  @Test
  void testGroupThreeContainerAcqprocessValid() {
    CICSTestUtils.noErrorTest(GROUP_THREE_CONTAINER_BTS_ACQPROCESS_VALID);
  }

  @Test
  void testGroupThreeContainerChannelValid() {
    CICSTestUtils.noErrorTest(GROUP_THREE_CONTAINER_CHANNEL_VALID);
  }

  @Test
  void testGroupFourDeleteCounterValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DELETE_COUNTER_VALID);
  }

  @Test
  void testGroupFourDeleteCounterPoolValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DELETE_COUNTER_POOL_VALID);
  }

  @Test
  void testGroupFourDeleteCounterNosuspendValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DELETE_COUNTER_NOSUSPEND_VALID);
  }

  @Test
  void testGroupFourDeleteCounterPoolNosuspendValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DELETE_COUNTER_POOL_NOSUSPEND_VALID);
  }

  @Test
  void testGroupFourDcounterValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DCOUNTER_VALID);
  }

  @Test
  void testGroupFourDcounterInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: DCOUNTER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GROUP_FOUR_DCOUNTER_INVALID, expectedDiagnostic);
  }

  @Test
  void testGroupFourDcounterPoolValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DCOUNTER_POOL_VALID);
  }

  @Test
  void testGroupFourDcounterNosuspendValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DCOUNTER_NOSUSPEND_VALID);
  }

  @Test
  void testGroupFourDcounterPoolNosuspendValid() {
    CICSTestUtils.noErrorTest(GROUP_FOUR_DCOUNTER_POOL_NOSUSPEND_VALID);
  }

  @Test
  void testGroupFourCounterDcounterPoolNosuspendInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: COUNTER or DCOUNTER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: COUNTER or DCOUNTER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GROUP_FOUR_COUNTER_DCOUNTER_POOL_NOSUSPEND_INVALID, expectedDiagnostic);
  }
}
