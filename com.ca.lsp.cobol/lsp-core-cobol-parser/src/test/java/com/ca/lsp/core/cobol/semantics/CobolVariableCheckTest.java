/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.semantics;

import com.ca.lsp.core.cobol.engine.CobolLanguageEngine;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import org.junit.Test;

import static com.ca.lsp.core.cobol.engine.CobolLanguageEngineTest.DID_CHANGE;
import static com.ca.lsp.core.cobol.engine.CobolLanguageEngineTest.DID_OPEN;
import static org.junit.Assert.assertEquals;

public class CobolVariableCheckTest {

  /**
   * This test represent the semantic check for variable in PROCEDURE DIVISION section There are
   * some typos in text, the BORROWE variable and TBPARM15 variable are not define in the DATA
   * DIVISON so the engine is able to throw a suggestion. First implementation of a test for
   * semantic analysis for variables. More to come
   */
  private static final String TEXT_TO_TEST =
      "000000  IDENTIFICATION DIVISION.                               \r\n"
          + "000000  PROGRAM-ID.             ATCDEM2.\r\n"
          + "000000  AUTHOR.                 TIM MAGEE.\r\n"
          + "000000   DATA DIVISION.\r\n"
          + "000000  WORKING-STORAGE SECTION.\r\n"
          + "000000  01 TAPARM1.\r\n"
          + "000000  01 TAPARM2      PIC 99 VALUE 2.\r\n"
          + "000000  01 ATCDEM3      PIC X(7) VALUE 'ATCDEM3'.\r\n"
          + "000000  01 P1PARM1      PIC 99 VALUE 0.\r\n"
          + "000000  01 TASTRUCT.\r\n"
          + "000000     05 LOC-ID.\r\n"
          + "000000         10 STATE    PIC X(2).\r\n"
          + "000000         10 CITY     PIC X(3).\r\n"
          + "000000     05 OP-SYS     PIC X(3).\r\n"
          + "000000  PROCEDURE DIVISION.\r\n"
          + "000000  MOVE 'ILCHIMVS' TO TASTRUCT.\r\n"
          + "000000  MOVE 'ILSPR' TO LOC-ID.\r\n"
          + "000000  MOVE 'AIX' TO OP-SYS.\r\n"
          + "000000  MOVE 'KY' TO STATE.\r\n"
          + "000000  MOVE 'LEX' TO CITY.\r\n"
          + "000000  MOVE 'VM ' TO OP-SYS.\r\n"
          + "000000  PROGA.\r\n"
          + "000000  PERFORM WITH TEST BEFORE UNTIL TAPARM1 = 0\r\n"
          + "000000  SUBTRACT 1 FROM TAPARM1\r\n"
          + "000000  CALL 'ATCDEM3'\r\n"
          + "000000  END-PERFORM\r\n"
          + "000000  IF TAPARM2 = 0\r\n"
          + "000000  PERFORM PROCA\r\n"
          + "000000  END-IF\r\n"
          + "000000  PERFORM WITH TEST BEFORE UNTIL TAPARM2 = 0\r\n"
          + "000000  SUBTRACT 1 FROM TAPARM2\r\n"
          + "000000  END-PERFORM.\r\n"
          + "000000\r\n"
          + "000000  PROCA.\r\n"
          + "000000  IDENTIFICATION DIVISION.\r\n"
          + "000000  PROGRAM-ID. ATCDEM3.\r\n"
          + "000000  DATA DIVISION.\r\n"
          + "000000  WORKING-STORAGE SECTION.\r\n"
          + "000000  01 TBPARM1      PIC 99 VALUE 5.\r\n"
          + "000000  01 TBPARM2      PIC 99 VALUE 0.\r\n"
          + "000000  01 ATCDEM4      PIC X(7) VALUE 'ATCDEM4'.\r\n"
          + "000000  01 P1PARM1      PIC 99 VALUE 0.\r\n"
          + "000000  01   BORROWER.\r\n"
          + "000000     05 AGE                   PIC 9(3).\r\n"
          + "000000         10 MAMA PIC 99 VALUE 3.\r\n"
          + "000000             88 teenager  VALUE 0  THRU 17.\r\n"
          + "000000             88 adult    VALUE 18 THRU 60.\r\n"
          + "000000             88 retired  VALUE 61 THRU 150.\r\n"
          + "000000     03 SERGIU PIC 9(7).\r\n"
          + "000000         88 teenager  VALUE 0  THRU 17.\r\n"
          + "000000  PROCEDURE DIVISION.\r\n"
          + "000000  PROGB.\r\n"
          + "000000  PERFORM WITH TEST BEFORE UNTIL TBPARM15 = 0\r\n"
          + "000000  SUBTRACT 1 FROM TBPARM1\r\n"
          + "000000  CALL 'ATCDEM4'\r\n"
          + "000000  END-PERFORM\r\n"
          + "000000  IF TBPARM2 = 0\r\n"
          + "000000  PERFORM PROCB\r\n"
          + "000000  END-IF\r\n"
          + "000000  PERFORM WITH TEST BEFORE UNTIL TBPARM2 = 0\r\n"
          + "000000  SUBTRACT 1 FROM TBPARM2\r\n"
          + "000000  END-PERFORM.\r\n"
          + "000000          PROCB.\r\n"
          + "000000  MOVE 10 TO MAMA OF AGE OF BORROWE.\r\n"
          + "000000  END PROGRAM ATCDEM3.\r\n"
          + "000000  END PROGRAM ATCDEM2.                                 \r\n";

  /**
   * This test verify that the engine returns diagnostics in both scenario where the document sync
   * type is DID_OPEN or DID_CHANGE.
   */
  @Test
  public void test() {
    CobolLanguageEngine engine = new CobolLanguageEngine(new CobolPreprocessorImpl());
    ResultWithErrors<SemanticContext> result;

    // SCENARIO FOR DID_OPEN
    result = engine.run("1", TEXT_TO_TEST, DID_OPEN);
    assertEquals(2, result.getErrors().stream().filter(item -> item.getSeverity() == 3).count());

    // SCENARIO FOR DID_CHANGE
    result = engine.run("1", TEXT_TO_TEST, DID_CHANGE);
    assertEquals(2, result.getErrors().stream().filter(item -> item.getSeverity() == 3).count());
  }
}
