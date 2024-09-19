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
 * Test CICS DEFINE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-define-activity">DEFINE Command</a>
 *
 * <p>This class tests all variations of the DEFINE command found in the link above.
 */
public class TestCICSDefine {

  private static final String DEFINE_ACTIVITY_ALL_OPTIONS_VALID_ONE =
      "DEFINE ACTIVITY({$varOne}) EVENT({$varTwo}) TRANSID({$varThree}) PROGRAM({$varFour}) USERID({$varFive}) ACTIVITYID({$varSix})";

  private static final String DEFINE_ACTIVITY_PARTIAL_OPTIONS_VALID_ONE =
      "DEFINE ACTIVITY({$varOne}) TRANSID({$varThree}) PROGRAM({$varFour}) ACTIVITYID({$varSix})";

  private static final String DEFINE_ACTIVITY_INVALID_ONE =
      "DEFINE {ACTIVITY(100) PROGRAM(200) ACTIVITYID(300)|errorOne} ";

  private static final String DEFINE_COMPOSITE_EVENT_ALL_OPTIONS_VALID_ONE =
      "DEFINE COMPOSITE EVENT({$varOne}) AND SUBEVENT1({$varTwo}) SUBEVENT2({$varThree})";

  private static final String DEFINE_COMPOSITE_EVENT_PARTIAL_OPTIONS_VALID_ONE =
      "DEFINE COMPOSITE EVENT({$varOne}) AND";

  private static final String DEFINE_COMPOSITE_EVENT_INVALID_ONE =
      "DEFINE {_COMPOSITE EVENT('ERROR') SUBEVENT1(100) SUBEVENT2(200)|errorOne_}";

  private static final String DEFINE_COUNTER_ALL_OPTIONS_VALID_ONE =
      "DEFINE COUNTER({$varFive}) POOL({$varFour}) VALUE({$varOne}) MINIMUM({$varTwo}) MAXIMUM({$varThree}) NOSUSPEND";

  private static final String DEFINE_DCOUNTER_PARTIAL_OPTIONS_VALID_ONE =
      "DEFINE DCOUNTER({$varOne}) POOL({$varTwo}) NOSUSPEND";

  private static final String DEFINE_COUNTER_INVALID_ONE =
      "DEFINE COUNTER {MAXIMUM|errorOne}(100) NOSUSPEND";

  private static final String DEFINE_INPUT_EVENT_ALL_OPTIONS_VALID_ONE =
      "DEFINE INPUT EVENT({$varOne})";

  private static final String DEFINE_INPUT_EVENT_INVALID_ONE = "DEFINE {INPUT|errorOne} ";

  private static final String DEFINE_PROCESS_ALL_OPTIONS_VALID_ONE =
      "DEFINE PROCESS({$varOne}) PROCESSTYPE({$varTwo}) TRANSID({$varThree}) PROGRAM({$varFour}) USERID({$varFive}) NOCHECK";

  private static final String DEFINE_PROCESS_PARTIAL_OPTIONS_VALID_ONE =
      "DEFINE PROCESS({$varOne}) PROCESSTYPE({$varTwo}) TRANSID({$varThree})";

  private static final String DEFINE_PROCESS_INVALID_ONE =
      "DEFINE {PROCESS(10) PROCESSTYPE(100) USERID(1000)|errorOne}";

  private static final String DEFINE_PROCESS_TIMER_ALL_OPTIONS_VALID_ONE =
      "DEFINE TIMER({$varOne}) EVENT({$varTwo}) AT HOURS({$varThree}) MINUTES({$varFour}) ON YEAR({$varfive}) MONTH({$varSix}) DAYOFMONTH({$varSix})";

  private static final String DEFINE_PROCESS_TIMER_PARTIAL_OPTIONS_VALID_ONE =
      "DEFINE TIMER({$varOne}) AFTER DAYS({$varTwo})";

  private static final String DEFINE_PROCESS_TIMER_INVALID_ONE = "DEFINE {TIMER(100) AT|errorOne}";

  @Test
  void testDefineActivityAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_ACTIVITY_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineActivityPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_ACTIVITY_PARTIAL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineActivityInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: TRANSID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEFINE_ACTIVITY_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testDefineCompositeEventAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_COMPOSITE_EVENT_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineCompositeEventPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_COMPOSITE_EVENT_PARTIAL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineCompositeEventInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: AND or OR",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEFINE_COMPOSITE_EVENT_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testDefineCounterAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_COUNTER_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineDCounterPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_DCOUNTER_PARTIAL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineCounterInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Extraneous input MAXIMUM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEFINE_COUNTER_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testDefineInputEventAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_INPUT_EVENT_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineInputEventInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: EVENT",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEFINE_INPUT_EVENT_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testDefineProcessAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_PROCESS_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineProcessPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_PROCESS_PARTIAL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineProcessInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: TRANSID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEFINE_PROCESS_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testDefineProcessTimerAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_PROCESS_TIMER_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineProcessTimerPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(DEFINE_PROCESS_TIMER_PARTIAL_OPTIONS_VALID_ONE);
  }

  @Test
  void testDefineProcessTimerInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: HOURS or MINUTES or SECONDS",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEFINE_PROCESS_TIMER_INVALID_ONE, expectedDiagnostics);
  }
}
