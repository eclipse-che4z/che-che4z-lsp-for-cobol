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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks the positive scenario of using READ FILE and WRITE FILE in EXEC CICS statement.
 * Note, the order of parameters inside the grammar relaxed comparing to the CICS specification to
 * avoid false-positive errors caused by CICS preprocessor.
 */
class TestExecCicsReadFileStatementPositive {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       77  {$*RESP}     PIC 9(9)  COMP.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  {$*PARENT}.\n"
          + "           05  FILLER.\n"
          + "             10 {$*LINK-COMM}.\n"
          + "               20  {$*RCODE}           PIC 9(9)  COMP.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*MAINLINE}.\n"
          + "           EXEC CICS RETURN END-EXEC.\n"
          + "       {#*READ-FILEA}.\n"
          + "           EXEC CICS READ FILE('FILEA') INTO(FILEA)\n"
          + "                   RIDFLD(KEYNUM) RESP(RESPONSE) END-EXEC.\n"
          + "       {#*UPD-FILEA}.\n"
          + "           EXEC CICS READ UPDATE FILE('FILEA') INTO(FILEA-TEMP)\n"
          + "                   RIDFLD(NUMB IN COMM-AREA)\n"
          + "                   RESP(RESPONSE)  END-EXEC.\n"
          + "       {#*REW-FILEA}.\n"
          + "              EXEC CICS REWRITE FILE('FILEA') FROM(FILEA)\n"
          + "                        RESP(RESPONSE) END-EXEC\n"
          + "              IF {$RESP} NOT = DFHRESP(NORMAL)\n"
          + "                  THEN MOVE {$RESP} TO {$RCODE}\n"
          + "                       GO TO {#UPD-FILEA-EXIT}\n"
          + "                 ELSE PERFORM {#LOG-WRITE}.\n"
          + "       {#*UPD-FILEA-EXIT}.\n"
          + "           EXIT.\n"
          + "       {#*LOG-WRITE}.\n"
          + "           EXEC CICS WRITEQ TD QUEUE('LOGA') FROM(LOGA) LENGTH(92)\n"
          + "                     END-EXEC.\n"
          + "       {#*ADD-FILEA}.\n"
          + "              EXEC CICS WRITE FILE('FILEA') FROM(FILEA)\n"
          + "                   RIDFLD(NUMB IN FILEA) RESP(RESPONSE) END-EXEC.\n"
          + "           EXEC CICS READ\n"
          + "                     FILE('PATMSTR')\n"
          + "                     INTO(PAT)\n"
          + "                     LENGTH(2964)\n"
          + "                     RIDFLD(PATIENT-MASTER-REC)\n"
          + "                     RESP(WS-RESP)\n"
          + "           END-EXEC.\n"
          + "           GOBACK.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
