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
 * This test checks the positive scenario of using SEND in EXEC CICS statement. Note, the order of
 * parameters inside the grammar relaxed comparing to the CICS specification to avoid false-positive
 * errors caused by CICS preprocessor.
 */
class TestExecCicsSendStatementsArgumentsOrder {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PATIENT-MASTER-REC}.\n"
          + "       01  {$*MESSAGE-LENGTH}             PIC S9(4) COMP.\n"
          + "       01  {$*MESSAGE-AREA}               PIC X(80).\n"
          + "       01  {$*COMMAREA1}.\n"
          + "           05  {$*COMMAREA2}                PIC X.       \n"
          + "       01  {$*WORKAREAS}.\n"
          + "           05  {$*ABSOLUTE-TIME}           PIC X(8).\n"
          + "           05  {$*FORMATTED-DATE}          PIC X(8).\n"
          + "           05  {$*FORMATTED-TIME}          PIC X(8).\n"
          + "       01  {$*ABD1}.\n"
          + "           05  FILLER                             PIC X(12).\n"
          + "       01  {$*ABD2}  REDEFINES ABD1.\n"
          + "           05  FILLER                             PIC X(12).\n"
          + "       01  {$*WS-CICS-WORK-VARIABLES}.\n"
          + "           03  {$*WS-RESP}                     PIC S9(08)  COMP VALUE ZEROS.\n"
          + "       01  {$*WS-TIME}               PIC X(80).\n"
          + "       01  {$*PAT}               PIC X(80).\n"
          + "       01  {$*0300-RETURN}               PIC X(80).\n"
          + "       01  {$*AXDB2}               PIC X(80).\n"
          + "       01  {$*RESPONSE}                             PIC 999.\n"
          + "       01  {$*REASON-CODE}                             PIC 999.\n"
          + "       01  {$*WS-RESP}                             PIC 999.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*0100-SEND}.\n"
          + "           EXEC CICS ASKTIME\n"
          + "                ABSTIME({$ABSOLUTE-TIME})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS FORMATTIME\n"
          + "                ABSTIME({$ABSOLUTE-TIME})\n"
          + "                DATE({$FORMATTED-DATE})\n"
          + "                DATESEP\n"
          + "                TIME({$FORMATTED-TIME})\n"
          + "                TIMESEP\n"
          + "           END-EXEC.\n"
          + "           IF {$COMMAREA2} IS EQUAL TO 'Y'\n"
          + "           THEN\n"
          + "               EXEC CICS SEND\n"
          + "                   MAP('BADDB2')\n"
          + "                   FROM({$ABD2})\n"
          + "                   LENGTH({$MESSAGE-LENGTH})\n"
          + "                   CURSOR\n"
          + "                   FREEKB\n"
          + "                   ERASE\n"
          + "               END-EXEC\n"
          + "           ELSE\n"
          + "               EXEC CICS SEND\n"
          + "                   MAP('BADDB2')\n"
          + "                   FROM({$ABD2})\n"
          + "                   LENGTH({$MESSAGE-LENGTH})\n"
          + "                   CURSOR\n"
          + "                   FREEKB\n"
          + "                   DATAONLY\n"
          + "                   END-EXEC.\n"
          + "           EXEC CICS RETURN\n"
          + "                TRANSID('AXDB')\n"
          + "                COMMAREA({$COMMAREA1})\n"
          + "                LENGTH({$AXDB2})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS ASKTIME\n"
          + "                     ABSTIME({$WS-TIME})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS SEND\n"
          + "                     LENGTH(1000)\n"
          + "                     MAP('ABD2')\n"
          + "                     MAPSET('ABD2')\n"
          + "                     FROM({$ABD2})\n"
          + "                     FREEKB\n"
          + "                     RESP({$WS-RESP})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS READ\n"
          + "                     FILE('PATMSTR')\n"
          + "                     INTO({$PAT})\n"
          + "                     LENGTH(2)\n"
          + "                     RIDFLD({$PATIENT-MASTER-REC})\n"
          + "                     RESP({$WS-RESP})\n"
          + "           END-EXEC.\n"
          + "       {#*0300-RECEIVE}.\n"
          + "           EXEC CICS RECEIVE\n"
          + "                MAP('BADDB2')\n"
          + "                INTO({$ABD1})\n"
          + "           END-EXEC.\n"
          + "       {#*0900-ERROR-ROUTINE}.\n"
          + "           EXEC CICS SEND\n"
          + "                FROM({$MESSAGE-AREA})\n"
          + "                LENGTH({$MESSAGE-LENGTH})\n"
          + "                ERASE\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS RETURN END-EXEC.\n"
          + "       {#*0930-DUPLICATE}.\n"
          + "           GO TO {#0100-SEND}.\n"
          + "       {#*0930-EXIT}.\n"
          + "            EXIT.\n"
          + "       {#*0300-RETURN}.\n"
          + "           EXEC CICS XCTL\n"
          + "                PROGRAM('CMENXDB')\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS SEND CONTROL\n"
          + "                FREEKB\n"
          + "                ERASE\n"
          + "                RESP({$RESPONSE})\n"
          + "                RESP2({$REASON-CODE})\n"
          + "           END-EXEC.\n"
          + "           GOBACK.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
