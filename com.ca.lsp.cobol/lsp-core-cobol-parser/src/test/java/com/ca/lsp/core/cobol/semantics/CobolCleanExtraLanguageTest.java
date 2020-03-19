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

import com.broadcom.lsp.cdi.EngineModule;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.ca.lsp.core.cobol.engine.CobolLanguageEngine;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import com.google.inject.Guice;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;
import java.util.Collection;

import static org.junit.Assert.assertEquals;

@Slf4j
@RunWith(Parameterized.class)
public class CobolCleanExtraLanguageTest {

  /**
   * This test is looking for a clean implementation of a mechanism which can remove SQL, CICS, COPY
   * statements from COBOL code.
   */
  private static final String TEXT_TO_TEST =
      "000000  IDENTIFICATION DIVISION.                               \r\n"
          + "000000  PROGRAM-ID.    FILETOTEST.\r\n"
          + "000000  AUTHOR. SERGIU ILIE.\r\n"
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
          + "000000  EXEC CICS HANDLE CONDITION ERROR(ERRORS) END-EXEC.\r\n"
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
          + "000000             EXEC CICS LINK PROGRAM(CRUD-PGM-NAME)\r\n"
          + "000000  RESP(RESPONSE)COMMAREA(LINK-AREA) END-EXEC.\r\n"
          + "000000          PROCB.\r\n"
          + "000000  MOVE 10 TO MAMA OF AGE OF BORROWE.\r\n"
          + "000000  END PROGRAM ATCDEM3.\r\n"
          + "           \r\n";

  private static final String CICS_TEXT =
      "EXEC CICS LINK PROGRAM(CRUD-PGM-NAME)\r\n"
          + "                 RESP(RESPONSE)COMMAREA(LINK-AREA) END-EXEC.\r\n"
          + "      ";

  private static final String SQL_TEXT =
      "EXEC SQL DECLARE CONFIDENTIAL.DATA TABLE\n"
          + "           ( SECRET_ID                        CHAR(4), \r\n"
          + "             PRIMARY__ID           CHAR(8), \r\n"
          + "             SUPERVISE__ID             CHAR(8), \r\n"
          + "             LOCATION                       CHAR(8), \r\n"
          + "             NUMBER                 SMALLINT, \r\n"
          + "             ANOTHER_NUMBER               DECIMAL(7, 2)\r\n"
          + "           ) END-EXEC.\r\n"
          + "      ";

  private static final String COPY_TEXT = "COPY SQLCA.\r\n" + "       \r\n" + "       ";

  private static final String LINE_PREFIX_CICS = "      *>EXECCICS";
  private static final String LINE_PREFIX_SQL = "      *>EXECSQL";
  private static final String LINE_PREFIX_COPY = "      *>";
  private static final String CICS_TAG = "*>EXECCICS";
  private static final String SQL_TAG = "*>EXECSQL";
  private static final String COPY_TAG = "*>";
  private static final String CICS_EXPECTED_TEXT =
      "      *>EXECCICS EXEC CICS LINK PROGRAM(CRUD-PGM-NAME)\r\n"
          + "      *>EXECCICS RESP(RESPONSE)COMMAREA(LINK-AREA) END-EXEC }.\r\n"
          + "      ";
  private static final String SQL_EXPECTED_TEXT =
      "      *>EXECSQL EXEC SQL DECLARE CONFIDENTIAL.DATA TABLE\r\n"
          + "      *>EXECSQL ( SECRET_ID                        CHAR(4),\r\n"
          + "      *>EXECSQL PRIMARY__ID           CHAR(8),\r\n"
          + "      *>EXECSQL SUPERVISE__ID             CHAR(8),\r\n"
          + "      *>EXECSQL LOCATION                       CHAR(8),\r\n"
          + "      *>EXECSQL NUMBER                 SMALLINT,\r\n"
          + "      *>EXECSQL ANOTHER_NUMBER               DECIMAL(7, 2)\r\n"
          + "      *>EXECSQL ) END-EXEC }.\r\n"
          + "      ";

  private static final String COPY_EXPECTED_TEXT = "      *> COPY SQLCA.\r\n" + "\r\n";
  private String text;
  private String linePrefix;
  private String tag;
  private String expectedText;

  public CobolCleanExtraLanguageTest(
      String tag, String text, String linePrefix, String expectedText) {
    super();
    this.tag = tag;
    this.text = text;
    this.linePrefix = linePrefix;
    this.expectedText = expectedText;
  }

  @Parameterized.Parameters
  public static Collection<Object> textsToTest() {
    return Arrays.asList(
        new Object[][] {
          {CICS_TAG, CICS_TEXT, LINE_PREFIX_CICS, CICS_EXPECTED_TEXT},
          {SQL_TAG, SQL_TEXT, LINE_PREFIX_SQL, SQL_EXPECTED_TEXT},
          {COPY_TAG, COPY_TEXT, LINE_PREFIX_COPY, COPY_EXPECTED_TEXT}
        });
  }

  @Test
  public void positiveErrorTest() {
    CobolLanguageEngine engine =
        Guice.createInjector(new EngineModule(), new DatabusModule())
            .getInstance(CobolLanguageEngine.class);
    ResultWithErrors<SemanticContext> result;

    // VERIFY THE SCENARIO FOR DID_OPEN
    result = engine.run("1", TEXT_TO_TEST, "DID_OPEN");
    assertEquals(0, result.getErrors().stream().filter(item -> item.getSeverity() == 1).count());

    // VERIFY THE SCENARIO FOR DID_CHANGE
    result = engine.run("1", TEXT_TO_TEST, "DID_CHANGE");
    assertEquals(0, result.getErrors().stream().filter(item -> item.getSeverity() == 1).count());
  }

  @Test
  public void specificStatementExclusionTest() {
    PreprocessorCleanerServiceImpl preprocessorCleanerService =
        new PreprocessorCleanerServiceImpl();
    preprocessorCleanerService.push();
    preprocessorCleanerService.specificTypeExclusion(tag, text, linePrefix);
    assertEquals(expectedText, preprocessorCleanerService.context().read());
  }
}
