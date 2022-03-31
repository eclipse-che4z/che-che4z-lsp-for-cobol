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

/** Test IDMS WAIT DML statement */
class TestIdmsWaitStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK1} PIC X(8).\n"
          + "        01 {$*WK_ECB1}.\n"
          + "            02 {$*WK_ECB1FLD1} PIC S9(8) COMP SYNC.\n"
          + "            02 {$*WK_ECB1FLD2} PIC S9(8) COMP SYNC.\n"
          + "            02 {$*WK_ECB1FLD3} PIC S9(8) COMP SYNC.\n"
          + "        01 {$*WK_ECB2}.\n"
          + "            02 {$*WK_ECB2FLD1} PIC S9(8) COMP SYNC.\n"
          + "            02 {$*WK_ECB2FLD2} PIC S9(8) COMP SYNC.\n"
          + "            02 {$*WK_ECB2FLD3} PIC S9(8) COMP SYNC.\n"
          + "        PROCEDURE DIVISION. \n";

  private static final String WAIT_1 = "            WAIT EVENT NAME 'TESTID'.\r\n";

  private static final String WAIT_2 =
      "           MOVE 'TESTID' TO {$WK1}.\n" + "           WAIT EVENT NAME {$WK1}.\r\n";

  private static final String WAIT_3 =
      "            WAIT LONG EVENT {$WK_ECB1} EVENT {$WK_ECB2}.\r\n";

  private static final String WAIT_4 =
      "            WAIT REDISPATCH EVENT {$WK_ECB1} EVENT {$WK_ECB2}.\r\n";

  private static final String WAIT_5 = "            WAIT REDISPATCH EVENT NAME 'TSTEVENT'.\r\n";

  private static final String WAIT_6 =
      "            WAIT LONG EVENT {$WK_ECB1} EVENT {$WK_ECB2}.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + WAIT_1,
        BOILERPLATE + WAIT_2,
        BOILERPLATE + WAIT_3,
        BOILERPLATE + WAIT_4,
        BOILERPLATE + WAIT_5,
        BOILERPLATE + WAIT_6);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS read tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), IdmsBase.getAnalysisConfig());
  }
}
