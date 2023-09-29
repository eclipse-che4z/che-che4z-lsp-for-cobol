/*
 * Copyright (c) 2023 Broadcom.
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
import org.junit.jupiter.api.Test;

/** Test CICS WEB RECEIVE syntax */
public class TestCicsWebReceive {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. testpgm.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*CONSTANTS}.\n"
          + "          05 {$*CONTENT-TYPES}.\n"
          + "             10 {$*CONTENT-TYPE-XWWW}    PIC X(56) VALUE\n"
          + "                                    'application/x-www-form-urlencoded'.\n"
          + "             10 {$*CONTENT-TYPE-JSON}    PIC X(56) VALUE 'application/json'.\n"
          + "             10 {$*CONTENT-TYPE-TXT}     PIC X(56) VALUE 'application/text'.\n"
          + "          05 {$*CON-CHANNEL}             PIC X(16) VALUE 'CHANWLLT'.\n"
          + "          05 {$*CHARSET-CODE}            PIC X(40) VALUE 'UTF-8'.\n"
          + "       LOCAL-STORAGE SECTION.\n"
          + "       01 {$*JSON-WORK-VARIABLES}.\n"
          + "          02 {$*CICS-RESP}               PIC S9(8)  COMP.\n"
          + "          02 {$*CICS-RESP2}              PIC S9(8)  COMP.\n"
          + "          02 {$*TOKEN}                   PIC S9(16) COMP.\n"
          + "          02 {$*HTTP-RESP}               PIC S9(3)  COMP.\n"
          + "          02 {$*HTTPSTATUS}              PIC X(50).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC CICS WEB RECEIVE SESSTOKEN({$TOKEN})\n"
          + "                     MEDIATYPE({$CONTENT-TYPE-JSON})\n"
          + "                     TOCONTAINER('DFHJSON-JSON')\n"
          + "                     TOCHANNEL({$CON-CHANNEL})\n"
          + "                     STATUSCODE({$HTTP-RESP})\n"
          + "                     STATUSTEXT({$HTTPSTATUS})\n"
          + "                     CHARACTERSET({$CHARSET-CODE})\n"
          + "                     RESP({$CICS-RESP})\n"
          + "                     RESP2({$CICS-RESP2})\n"
          + "           END-EXEC.\n"
          + "\n"
          + "       end program testpgm.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
