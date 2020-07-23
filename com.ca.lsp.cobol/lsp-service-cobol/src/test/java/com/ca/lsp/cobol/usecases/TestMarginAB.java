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
 */

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import static org.junit.Assert.assertEquals;
import org.junit.Test;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyze;

/** This test verifies if the margins are respected and warnings are thrown */
public class TestMarginAB {

  /**
   * In TEXT_DIVISION_WRONG_PLACE string there are several DIVISIONS that are not in the right place
   */
  private static final String TEXT_DIVISION_WRONG_PLACE =
      "000000       IDENTIFICATION DIVISION.\n" // starting area B instead of A
          + "000000  PROGRAM-ID.    FILETOTEST.\n"
          + "000000  AUTHOR. SERGIU ILIE.\n"
          + "000000     DATA DIVISION.\n" // starting area B instead of A
          + "000000  WORKING-STORAGE SECTION.\n"
          + "000000  01 TAPARM1.\n"
          + "000000  01 TAPARM2      PIC 99 VALUE 2.\n"
          + "000000  01 ATCDEM3      PIC X(7) VALUE 'ATCDEM3'.\n"
          + "000000  01 P1PARM1      PIC 99 VALUE 0.\n"
          + "000000  01 TASTRUCT.\n"
          + "000000     05 LOC-ID.\n"
          + "000000         10 STATE    PIC X(2).\n"
          + "000000         10 CITY     PIC X(3).\n"
          + "000000     05 OP-SYS     PIC X(3).\n"
          + "000000     PROCEDURE DIVISION.\n" // starting area B instead of A
          + "000000     MOVE 'ILCHIMVS' TO TASTRUCT.\n"
          + "000000     MOVE 'ILSPR' TO LOC-ID.\n"
          + "000000     MOVE 'AIX' TO OP-SYS.\n"
          + "000000  PROGA.\n"
          + "000000     PERFORM WITH TEST BEFORE UNTIL TAPARM1 = 0\n"
          + "000000       SUBTRACT 1 FROM TAPARM1\n"
          + "000000       CALL 'ATCDEM3'\n"
          + "000000     END-PERFORM\n"
          + "000000     IF TAPARM2 = 0\n"
          + "000000       PERFORM PROCA\n"
          + "000000     END-IF\n"
          + "000000     PERFORM WITH TEST BEFORE UNTIL TAPARM2 = 0\n"
          + "000000       SUBTRACT 1 FROM TAPARM2\n"
          + "000000     END-PERFORM.\n"
          + "000000  END PROGRAM FILETOTEST.";

  /** In TEXT_AREA_B there are several statements starting on the wrong position */
  private static final String TEXT_AREA_B =
      "000000 IDENTIFICATION DIVISION.\n"
          + "000000  PROGRAM-ID.    FILETOTEST.\n"
          + "000000  AUTHOR. SERGIU ILIE.\n"
          + "000000 DATA DIVISION.\n"
          + "000000  WORKING-STORAGE SECTION.\n"
          + "000000  01 TAPARM1.\n"
          + "000000  01 TAPARM2      PIC 99 VALUE 2.\n"
          + "000000  01 ATCDEM3      PIC X(7) VALUE 'ATCDEM3'.\n"
          + "000000  01 P1PARM1      PIC 99 VALUE 0.\n"
          + "000000  01 TASTRUCT.\n"
          + "000000  05 LOC-ID.\n" // starting in the correct area, must not be a warning
          + "000000         10 STATE    PIC X(2).\n"
          + "000000         10 CITY     PIC X(3).\n"
          + "000000     05 OP-SYS     PIC X(3).\n"
          + "000000 PROCEDURE DIVISION.\n"
          + "000000  MOVE 'ILCHIMVS' TO TASTRUCT.\n" // starting area A instead of B
          + "000000     MOVE 'ILSPR' TO LOC-ID.\n"
          + "000000     MOVE 'AIX' TO OP-SYS.\n"
          + "000000  PROGA.\n"
          + "000000  PERFORM WITH TEST BEFORE UNTIL TAPARM1 = 0\n" // starting area A instead of B
          + "000000       SUBTRACT 1 FROM TAPARM1\n"
          + "000000       CALL 'ATCDEM3'\n"
          + "000000     END-PERFORM\n"
          + "000000     IF TAPARM2 = 0\n"
          + "000000       PERFORM PROCA\n"
          + "000000     END-IF\n"
          + "000000  PERFORM WITH TEST\n" // starting area A instead of B
          + "000000  BEFORE UNTIL TAPARM2 = 0\n" // starting area A instead of B
          + "000000       SUBTRACT 1 FROM TAPARM2\n"
          + "000000     END-PERFORM.\n"
          + "000000  END PROGRAM FILETOTEST.";

  private static final String TEXT_PROGRAM_ID =
      "000000 IDENTIFICATION DIVISION.\n"
          + "000000  PROGRAM-ID.    FILETOTEST.\n"
          + "000000  AUTHOR. SERGIU ILIE.\n"
          + "000000 DATA DIVISION.\n"
          + "000000  WORKING-STORAGE SECTION.\n"
          + "000000  01 TASTRUCT.\n"
          + "000000     05 LOC-ID.\n"
          + "000000         10 STATE    PIC X(2).\n"
          + "000000         10 CITY     PIC X(3).\n"
          + "000000     05 OP-SYS     PIC X(3).\n"
          + "000000 PROCEDURE DIVISION.\n"
          + "000000     MOVE 'ILCHIMVS' TO TASTRUCT.\n"
          + "000000     MOVE 'ILSPR' TO LOC-ID.\n"
          + "000000     MOVE 'AIX' TO OP-SYS.\n"
          + "000000  END PROGRAM FILETOTEST2."; // PROGRAM-ID must be similar with PROGRAM-ID
  // mentioned on ID DIVISION

  /** In TEXT_DECLARATIVES the mistake is on the DECLARATIVE line */
  private static final String TEXT_DECLARATIVES =
      "000000 IDENTIFICATION DIVISION.\n"
          + "000000  PROGRAM-ID.    FILETOTEST.\n"
          + "000000  AUTHOR. SERGIU ILIE.\n"
          + "000000 DATA DIVISION.\n"
          + "000000  WORKING-STORAGE SECTION.\n"
          + "000000  01 TASTRUCT.\n"
          + "000000     05 LOC-ID.\n"
          + "000000         10 STATE    PIC X(2).\n"
          + "000000         10 CITY     PIC X(3).\n"
          + "000000     05 OP-SYS     PIC X(3).\n"
          + "000000 PROCEDURE DIVISION.\n"
          + "000000 DECLARATIVES. MAMA\n" // after DECLARATIVES keyword no other token is allowed
          + "000000 COBOL-DEBUG SECTION.\n"
          + "000000     USE FOR DEBUGGING ON ALL PROCEDURES.\n"
          + "000000 COBOL-DEBUG-PARA.\n"
          + "000000     IF READY-TRACE THEN\n"
          + "000000       DISPLAY DEBUG-NAME\n"
          + "000000     END-IF.\n"
          + "000000  END DECLARATIVES.\n"
          + "000000     MOVE 'ILCHIMVS' TO TASTRUCT.\n"
          + "000000     MOVE 'ILSPR' TO LOC-ID.\n"
          + "000000     MOVE 'AIX' TO OP-SYS.\n"
          + "000000  END PROGRAM FILETOTEST.";

  @Test
  public void checkForAreaA() {
    AnalysisResult result = analyze(TEXT_DIVISION_WRONG_PLACE);
    assertEquals(3, result.getDiagnostics().size());
  }

  @Test
  public void checkForAreaB() {
    AnalysisResult result = analyze(TEXT_AREA_B);
    assertEquals(4, result.getDiagnostics().size());
  }

  @Test
  public void checkCorrectProgramID() {
    AnalysisResult result = analyze(TEXT_PROGRAM_ID);

    assertEquals(1, result.getDiagnostics().size());
    assertEquals(
        "Program-name must be identical to the program-name of the corresponding PROGRAM-ID paragraph: FILETOTEST",
        result.getDiagnostics().get(0).getMessage());
  }

  @Test
  public void checkDeclaratives() {
    AnalysisResult result = analyze(TEXT_DECLARATIVES);

    assertEquals(3, result.getDiagnostics().size());
    assertEquals(
        "Following token can not be on the same line with DECLARATIVE token: MAMA",
        result.getDiagnostics().get(1).getMessage());
  }
}
