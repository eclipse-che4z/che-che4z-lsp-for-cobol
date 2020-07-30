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

import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.PreprocessorCleanerServiceImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.TokenUtilsImpl;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;

@Slf4j
public class CobolCleanExtraLanguageTest {

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

  private static Stream<Arguments> textsToTest() {
    return Stream.of(
        Arguments.of(CICS_TAG, CICS_TEXT, LINE_PREFIX_CICS, CICS_EXPECTED_TEXT),
        Arguments.of(SQL_TAG, SQL_TEXT, LINE_PREFIX_SQL, SQL_EXPECTED_TEXT),
        Arguments.of(COPY_TAG, COPY_TEXT, LINE_PREFIX_COPY, COPY_EXPECTED_TEXT));
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - specificStatementExclusionTest")
  public void specificStatementExclusionTest(
      String tag, String text, String linePrefix, String expectedText) {
    PreprocessorCleanerServiceImpl preprocessorCleanerService =
        new PreprocessorCleanerServiceImpl(new TokenUtilsImpl());
    preprocessorCleanerService.push();
    preprocessorCleanerService.excludeSpecificType(tag, text, linePrefix);
    assertEquals(expectedText, preprocessorCleanerService.peek().toString());
  }
}
