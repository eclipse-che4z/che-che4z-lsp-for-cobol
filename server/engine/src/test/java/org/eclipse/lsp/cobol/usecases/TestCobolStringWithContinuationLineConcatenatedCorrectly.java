/*
 * Copyright (c) 2020 Broadcom.
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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/**
 * This test checks that there are no errors thrown if a string literal split and concatenated by a
 * concatenation line.
 */
class TestCobolStringWithContinuationLineConcatenatedCorrectly {

  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.\n"
          + "000200 PROGRAM-ID.   TEST1.\n"
          + "000301 AUTHOR.       A PROGRAMMER.\n"
          + "000000 DATA DIVISION.\n"
          + "000000 WORKING-STORAGE SECTION.\n"
          + "000000  01 {$*ID1} pic x.\n"
          + "000000  01 {$*ID2} pic x.\n"
          + "000400 PROCEDURE DIVISION.\n"
          + "078070 000-MAIN.\n"
          + "078089                 MOVE 'PRESS \"CLEAR\" OR \"ENTER\" TO RETURN TO THE M\n"
          + "078089-                     'ENU WHEN FINISHED' TO {$ID2}.\n"
          + "000000 PROGRAM2.\n"
          + "000000       DISPLAY 'HELLO'.";

  public static final String TEXT2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. testas.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "       01  FILLER  PIC  X(62) VALUE                                     \n"
          + "           '  then it must be either ''CLOSE'', ''NOCLOSE'', ''ENHANCED'\n"
          + "      -    '''.    \n"
          + "        LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.";

  public static final String TEXT3 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. testabb.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-COND-UPD} pic x(232).\n"
          + "       01 {$*RANDOMV} pic x(2).\n"
          + "       PROCEDURE DIVISION.\n"
          + "               display 'tetsing....'\n"
          + "                 IF {$WS-COND-UPD} = SPACES OR '= ' OR      \n"
          + "              '< ' OR '> ' OR '¬=' OR '<=' OR '>=' OR \"P'\" OR       \n"
          + "              \"T'\" OR \"C'\" OR \"N'\" OR \"X'\"                          \n"
          + "            MOVE 'Y' TO {$RANDOMV}    \n"
          + "           END-IF  . ";

  @Disabled("Mapping Issue for the continued line variables")
  // TODO: #414
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test1() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }
}
