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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS Dequeue DML statement */
class TestIdmsDcStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_TASK} PIC X(388) SYNC.\n"
          + "        01 {$*WK_PROGRAM} PIC X(8) SYNC.\n"
          + "        01 {$*WK_TIME} PIC S9(4) COMP SYNC.\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String DC_RETURN = "            DC RETURN.\r\n";

  private static final String DC_RETURN_TIMEOUT_INTERVAL_WITH_ALL =
      "           MOVE 0030 TO {$WK_TIME}.\r\n "
          + "           DC RETURN NEXT TASK CODE 'TSTTASK' NORMAL\r\n"
          + "           TIMEOUT INTERVAL 12\r\n"
          + "           NEXT TASK INTERVAL 10 EVENT TYPE INTERNAL\r\n"
          + "           EVENT NAME 'TSTEVENT'.\r\n";

  private static final String DC_RETURN_TIMEOUT_INTERVAL_WITH_ALL_2 =
      "           MOVE 30 TO {$WK_TIME}.\r\n "
          + "           DC RETURN NEXT TASK CODE 'TSTTASK' NORMAL TIMEOUT INTERVAL\r\n"
          + "           {$WK_TIME} NEXT TASK INTERVAL 10 EVENT TYPE INTERNAL EVENT\r\n"
          + "           NAME 'TSTEVENT'.\r\n";

  private static final String DC_RETURN_PROGRAM_LITERAL_WITH_ALL =
      "           MOVE 30 TO {$WK_TIME}.\r\n "
          + "           DC RETURN NEXT TASK CODE 'TSTTASK' NORMAL TIMEOUT PROGRAM\r\n"
          + "           'TSTPROG' NEXT TASK INTERVAL 10 EVENT TYPE INTERNAL EVENT\r\n"
          + "           NAME 'TSTEVENT'.\r\n";

  private static final String DC_RETURN_PROGRAM_VARB_WITH_ALL =
      "           MOVE 30 TO {$WK_TIME}.\r\n "
          + "           MOVE 'TESTPROG' TO {$WK_PROGRAM}.\r\n "
          + "           DC RETURN NEXT TASK CODE 'TSTTASK' NORMAL TIMEOUT PROGRAM\r\n"
          + "           {$WK_PROGRAM} NEXT TASK INTERVAL 10 EVENT TYPE\r\n"
          + "           INTERNAL EVENT NAME 'TSTEVENT'.\r\n";

  private static final String DC_RETURN_TIMEOUT_ALL =
      "           MOVE 30 TO {$WK_TIME}.\r\n "
          + "           MOVE 'TESTPROG' TO {$WK_PROGRAM}.\r\n "
          + "           DC RETURN NEXT TASK CODE 'TSTTASK' NORMAL TIMEOUT PROGRAM\r\n"
          + "           {$WK_PROGRAM} INTERVAL 10 NEXT TASK INTERVAL 10 EVENT TYPE\r\n"
          + "           INTERNAL EVENT NAME 'TSTEVENT'.\r\n";

  private static final String DC_RETURN_TIMEOUT_ALL_2 =
      "           MOVE 30 TO {$WK_TIME}.\r\n "
          + "           MOVE 'TESTPROG' TO {$WK_PROGRAM}.\r\n "
          + "           DC RETURN NEXT TASK CODE 'TSTTASK' NORMAL\r\n"
          + "           TIMEOUT INTERVAL 10\r\n"
          + "           PROGRAM {$WK_PROGRAM} NEXT TASK INTERVAL 10 EVENT TYPE\r\n"
          + "           INTERNAL EVENT NAME 'TSTEVENT'.\r\n";

  private static final String DC_RETURN_TIMEOUT_ALL_3 =
      "           MOVE 30 TO {$WK_TIME}.\r\n "
          + "           MOVE 'TESTPROG' TO {$WK_PROGRAM}.\r\n "
          + "           DC RETURN NEXT TASK CODE 'TSTTASK' NORMAL\r\n"
          + "           TIMEOUT INTERVAL 10\r\n"
          + "           PROGRAM {$WK_PROGRAM} INTERVAL 10\r\n"
          + "           NEXT TASK INTERVAL 10 EVENT\r\n"
          + "           TYPE INTERNAL EVENT NAME 'TSTEVENT'.\r\n";

  private static final String DC_RETURN_TASK_VARB_WITH_ALL =
      "           MOVE 'TEST' TO {$WK_TASK}.\r\n "
          + "           MOVE 'TESTPROG' TO {$WK_PROGRAM}.\r\n "
          + "           DC RETURN NEXT TASK CODE {$WK_TASK} NORMAL\r\n"
          + "           TIMEOUT INTERVAL 10\r\n"
          + "           NEXT TASK INTERVAL 10 EVENT TYPE INTERNAL EVENT\r\n"
          + "           NAME 'TSTEVENT'.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + DC_RETURN,
        BOILERPLATE + DC_RETURN_TIMEOUT_INTERVAL_WITH_ALL,
        BOILERPLATE + DC_RETURN_TIMEOUT_INTERVAL_WITH_ALL_2,
        BOILERPLATE + DC_RETURN_PROGRAM_LITERAL_WITH_ALL,
        BOILERPLATE + DC_RETURN_PROGRAM_VARB_WITH_ALL,
        BOILERPLATE + DC_RETURN_TIMEOUT_ALL,
        BOILERPLATE + DC_RETURN_TIMEOUT_ALL_2,
        BOILERPLATE + DC_RETURN_TIMEOUT_ALL_3,
        BOILERPLATE + DC_RETURN_TASK_VARB_WITH_ALL);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS DC dml tests")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
