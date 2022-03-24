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

/** Test IDMS SNAP DML statement */
class TestIdmsSnapStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK1} PIC X(8).\r\n"
          + "        01 {$*WK2} PIC X(8).\r\n"
          + "        01 {$*WK3} PIC X(8).\r\n"
          + "        01 {$*WK4} PIC X(8).\r\n"
          + "        01 {$*WK5} PIC X(8).\r\n"
          + "        01 {$*WK6} PIC X(8).\r\n"
          + "        01 {$*WK_TITLE} PIC X(134).\r\n"
          + "        01 {$*WK_LENGTH} PIC S9(8) COMP SYNC.\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String SNAP = "            SNAP.\r\n";

  private static final String SNAP_ALL_PARMS_VARB =
      "           MOVE '   TITLE' TO {$WK_TITLE}.\r\n"
          + "           SNAP TITLE IS {$WK_TITLE} SYSTEM FROM {$WK1} TO {$WK2}\r\n"
          + "           FROM {$WK3} TO {$WK4}.";

  private static final String SNAP_ALL_PARMS_VARB2 =
      "            MOVE '  TITLE' TO {$WK_TITLE}.\n"
          + "            SNAP FROM {$WK1} LENGTH \n"
          + "            {$WK2} FROM {$WK3} TO {$WK4}.\n";

  private static final String SNAP_ALL_PARMS_LITERAL =
      "            MOVE '  TITLE' TO {$WK_TITLE}.\r\n"
          + "            SNAP TITLE IS {$WK_TITLE} SYSTEM FROM {$WK1} LENGTH 10\r\n"
          + "            FROM {$WK3} LENGTH 10.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + SNAP,
        BOILERPLATE + SNAP_ALL_PARMS_VARB,
        BOILERPLATE + SNAP_ALL_PARMS_VARB2,
        BOILERPLATE + SNAP_ALL_PARMS_LITERAL);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS read tests")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        IdmsBase.getAnalysisConfig());
  }
}
