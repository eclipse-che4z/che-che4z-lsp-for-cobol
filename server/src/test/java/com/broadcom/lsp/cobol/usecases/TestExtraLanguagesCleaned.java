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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test is looking for a clean implementation of a mechanism which can remove SQL and COPY
 * statements from COBOL code. If they are not removed then a syntax error thrown.
 */
class TestExtraLanguagesCleaned {

  private static final String TEXT =
      "000000  IDENTIFICATION DIVISION.\r\n"
          + "000000  PROGRAM-ID.    FILETOTEST.\r\n"
          + "000000  AUTHOR. SERGIU ILIE.\r\n"
          + "000000   DATA DIVISION.\r\n"
          + "000000  WORKING-STORAGE SECTION.\r\n"
          + "000000  01 {$*TAPARM1}.\r\n"
          + "000000  01 {$*TAPARM2}      PIC 99 VALUE 2.\r\n"
          + "000000  01 {$*ATCDEM3}      PIC X(7) VALUE 'ATCDEM3'.\r\n"
          + "000000  01 {$*P1PARM1}      PIC 99 VALUE 0.\r\n"
          + "000000  01 {$*TASTRUCT}.\r\n"
          + "000000     05 {$*LOC-ID}.\r\n"
          + "000000         10 {$*STATE}    PIC X(2).\r\n"
          + "000000         10 {$*CITY}     PIC X(3).\r\n"
          + "000000     05 {$*OP-SYS}     PIC X(3).\r\n"
          + "000000  01 {$*ERRORS} PIC 9.\r\n"
          + "000000  PROCEDURE DIVISION.\r\n"
          + "000000      MOVE 'ILCHIMVS' TO {$TASTRUCT}.\r\n"
          + "000000      MOVE 'ILSPR' TO {$LOC-ID}.\r\n"
          + "000000      MOVE 'AIX' TO {$OP-SYS}.\r\n"
          + "000000  {#*PROGA}.\r\n"
          + "000000      PERFORM WITH TEST BEFORE UNTIL {$TAPARM1} = 0\r\n"
          + "000000      SUBTRACT 1 FROM {$TAPARM1}\r\n"
          + "000000      CALL 'ATCDEM3'\r\n"
          + "000000      END-PERFORM\r\n"
          + "000000      IF {$TAPARM2} = 0\r\n"
          + "000000      PERFORM {#PROCA}\r\n"
          + "000000      END-IF\r\n"
          + "000000      PERFORM WITH TEST BEFORE UNTIL {$TAPARM2} = 0\r\n"
          + "000000      SUBTRACT 1 FROM {$TAPARM2}\r\n"
          + "000000      END-PERFORM.\r\n"
          + "000000\r\n"
          + "000000  {#*PROCA}.\r\n"
          + "000000  IDENTIFICATION DIVISION.\r\n"
          + "000000  PROGRAM-ID. ATCDEM3.\r\n"
          + "000000  DATA DIVISION.\r\n"
          + "000000  WORKING-STORAGE SECTION.\r\n"
          + "000000  01 {$*TBPARM1}      PIC 99 VALUE 5.\r\n"
          + "000000  01 {$*TBPARM2}      PIC 99 VALUE 0.\r\n"
          + "000000  01 {$*ATCDEM4}      PIC X(7) VALUE 'ATCDEM4'.\r\n"
          + "000000  01 {$*P1PARM1}      PIC 99 VALUE 0.\r\n"
          + "000000  01   {$*BORROWER}.\r\n"
          + "000000     05 {$*AGE}                   PIC 9(3).\r\n"
          + "000000         10 {$*MAMA} PIC 99 VALUE 3.\r\n"
          + "000000             88 {$*teenager}  VALUE 0  THRU 17.\r\n"
          + "000000             88 {$*adult}    VALUE 18 THRU 60.\r\n"
          + "000000             88 {$*retired}  VALUE 61 THRU 150.\r\n"
          + "000000     03 {$*SERGIU} PIC 9(7).\r\n"
          + "000000         88 {$*teenager}  VALUE 0  THRU 17.\r\n"
          + "000000  01 {$*CRUD-PGM-NAME} PIC X(10).\r\n"
          + "000000  01 {$*LINK-AREA} PIC X(10).\r\n"
          + "       01  {$*RESPONSE}                             PIC 999.\n"
          + "000000  PROCEDURE DIVISION.\r\n"
          + "000000  {#*PROGB}.\r\n"
          + "000000      EXEC CICS HANDLE CONDITION ERROR({#ERRORS}) END-EXEC.\r\n"
          + "000000      PERFORM WITH TEST BEFORE UNTIL {$TBPARM1} = 0\r\n"
          + "000000      SUBTRACT 1 FROM {$TBPARM1}\r\n"
          + "000000      CALL 'ATCDEM4'\r\n"
          + "000000      END-PERFORM\r\n"
          + "000000      IF {$TBPARM2} = 0\r\n"
          + "000000      PERFORM {#PROCB}\r\n"
          + "000000      END-IF\r\n"
          + "000000      PERFORM WITH TEST BEFORE UNTIL {$TBPARM2} = 0\r\n"
          + "000000      SUBTRACT 1 FROM {$TBPARM2}\r\n"
          + "000000      END-PERFORM.\r\n"
          + "000000             EXEC CICS LINK PROGRAM({$CRUD-PGM-NAME})\r\n"
          + "000000      RESP(${RESPONSE})COMMAREA({$LINK-AREA}) END-EXEC.\r\n"
          + "000000 {#*PROCB}.\r\n"
          + "000000      MOVE 10 TO {$MAMA} OF {$AGE} OF {$BORROWER}.\r\n"
          + "000000 {#*ERRORS}.\r\n"
          + "000000      DISPLAY 'Error'.\r\n"
          + "000000  END PROGRAM ATCDEM3.\r\n"
          + "           \r\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
