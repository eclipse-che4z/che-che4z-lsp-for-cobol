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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks the positive scenario of using GETMAIN in EXEC CICS statement. Note, the order
 * of parameters inside the grammar relaxed comparing to the CICS specification to avoid
 * false-positive errors caused by CICS preprocessor.
 */
class TestExecCicsGetMainStatementArgumentsOrder {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  {$*VARAA}                          PIC 9 VALUE 0.\n"
          + "       01  {$*DFHCOMMAREA}.\n"
          + "          05  {$*LAST-MAP}                     PIC x.\n"
          + "              88  {$*SENT-MENU}                VALUE 'M'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*NACT}.\n"
          + "           IF  {$VARAA} = 0\n"
          + "               EXEC CICS GETMAIN\n"
          + "                    LENGTH(LENGTH OF {$DFHCOMMAREA})\n"
          + "                    SET   (ADDRESS OF {$DFHCOMMAREA})\n"
          + "                    END-EXEC\n"
          + "               PERFORM {@SEND-EMPTY-MENU}\n"
          + "           ELSE\n"
          + "               EVALUATE TRUE\n"
          + "               WHEN {$SENT-MENU}\n"
          + "                    PERFORM {@SEND-EMPTY-MENU}\n"
          + "               WHEN OTHER\n"
          + "                    PERFORM {@UNEXPECTED-ERROR}\n"
          + "               END-EVALUATE\n"
          + "           END-IF.\n"
          + "       {@*SEND-EMPTY-MENU} SECTION.\n"
          + "           DISPLAY \"HELLO\".\n"
          + "       {@*UNEXPECTED-ERROR} SECTION.\n"
          + "           DISPLAY \"HELLO\".";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
