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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This test checks the positive scenario of using FORMATTIME and ASKTIME in EXEC CICS statement.
 * Note, the order of parameters inside the grammar relaxed comparing to the CICS specification to
 * avoid false-positive errors caused by CICS preprocessor.
 */
class TestExecCicsFormatTimeStatementsArgumentsOrder {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*WS-TIME}                     PIC S9(08) COMP VALUE +0.\n"
          + "       01  {$*DATEO}                             PIC X(008).\n"
          + "       01  {$*TIMEO}                             PIC X(008).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC CICS ASKTIME\n"
          + "                     ABSTIME({$WS-TIME})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS FORMATTIME\n"
          + "                     ABSTIME({$WS-TIME})\n"
          + "                     MMDDYY({$DATEO})\n"
          + "                     YYMMDD({$DATEO})\n"
          + "                     DATESEP('/')\n"
          + "                     TIME({$TIMEO})\n"
          + "                     TIMESEP(':')\n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
