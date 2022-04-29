/*
 * Copyright (c) 2021 Broadcom.
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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS SET DML statements */
class TestIdmsSetStatement {

  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_PROG} PIC X(8).\n"
          + "        01 {$*WK_INT} PIC S9(8).\n"
          + "        01 {$*WK_EVENT} PIC S9(8) COMP SYNC.\n"
          + "        01 {$*WK_TIMER} PIC S9(8) COMP SYNC.\n"
          + "        01 {$*WK_AREA1} PIC X(8).\n"
          + "        01 {$*WK_TASK} PIC X(8).\n"
          + "        01 {$*WK_LENGTH} PIC X(8).\n"
          + "        01 {$*ERROR-STATUS} PIC X(4) VALUE '1400'.\n"
          + "           88 {$*ANY-ERROR-STATUS} VALUE '0001' THRU '9999'.\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String SET_ABEND_LIT = DEFS + "           SET ABEND EXIT PROGRAM 'TSTPROG'.";

  private static final String SET_ABEND_VARB =
      DEFS
          + "           MOVE 'TSTPROG' TO {$WK_PROG}.\r\n"
          + "           SET ABEND EXIT ON PROGRAM {$WK_PROG}.";

  private static final String SET_TIMER_WAIT_LIT = DEFS + "           SET TIMER WAIT INTERVAL 10.";

  private static final String SET_TIMER_WAIT_VARB =
      DEFS
          + "           MOVE 10 TO {$WK_INT}.\r\n"
          + "           SET TIMER WAIT INTERVAL {$WK_INT}.";

  private static final String SET_TIMER_POST = DEFS + "           SET TIMER POST INTERVAL 10.";

  private static final String SET_TIMER_POST_ALL_CLAUSES =
      DEFS + "           SET TIMER POST INTERVAL 10 EVENT {$WK_EVENT} TIMER ID {$WK_TIMER}.";

  private static final String SET_TIMER_START_LIT =
      DEFS
          + "           SET TIMER START INTERVAL 10 TASK CODE 'TSTTASK' PRIORITY 100\r\n"
          + "           TIMER ID {$WK_TIMER} DATA FROM {$WK_AREA1} LENGTH 10.";

  private static final String SET_TIMER_START_LIT_NO_PRIORITY =
      DEFS
          + "           SET TIMER START INTERVAL 10 TASK CODE 'TSTTASK' TIMER ID\r\n"
          + "           {$WK_TIMER} DATA FROM {$WK_AREA1} LENGTH 10.";

  private static final String SET_TIMER_START_VARIABLE_NO_PRIORITY =
      DEFS
          + "           MOVE 10 TO {$WK_INT}.\r\n"
          + "           MOVE 8 TO {$WK_LENGTH}.\r\n"
          + "           MOVE 'TSTTAKE' TO {$WK_TASK}.\r\n"
          + "           SET TIMER START INTERVAL {$WK_INT} TASK CODE {$WK_TASK}\r\n"
          + "           TIMER ID {$WK_TIMER} DATA FROM {$WK_AREA1} LENGTH 10.";

  private static final String SET_ABEND_ON =
      DEFS
          + "           SET ABEND EXIT PROGRAM 'TSTPROG'\r\n"
          + "             ON {$ANY-ERROR-STATUS} DISPLAY 'SET ERROR'.\r\n";
  private static final String SET_TIMER_ON =
      DEFS
          + "           SET TIMER POST INTERVAL 10 EVENT {$WK_EVENT} TIMER ID {$WK_TIMER} \r\n"
          + "             ON {$ANY-ERROR-STATUS} DISPLAY 'SET ERROR'.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        SET_ABEND_LIT,
        SET_ABEND_VARB,
        SET_TIMER_WAIT_LIT,
        SET_TIMER_WAIT_VARB,
        SET_TIMER_POST,
        SET_TIMER_POST_ALL_CLAUSES,
        SET_TIMER_START_LIT,
        SET_TIMER_START_LIT_NO_PRIORITY,
        SET_TIMER_START_VARIABLE_NO_PRIORITY,
        SET_ABEND_ON,
        SET_TIMER_ON);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS set tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), IdmsBase.getAnalysisConfig());
  }
}
