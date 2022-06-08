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
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** This test checks if sql SELECT statement works correctly. */
class TestSqlSelectStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n";

  private static final String SELECT = TEXT + "           SELECT * FROM DSN8C10.EMP;  END-EXEC.\n";

  private static final String SELECT2 =
      TEXT
          + "            SELECT * FROM DSN8C10.EMP  \n"
          + "              ORDER BY HIREDATE;  \n"
          + "           END-EXEC.\n";

  private static final String SELECT3 =
      TEXT
          + "            SELECT WORKDEPT, AVG(SALARY)  \n"
          + "             FROM DSN8C10.EMP  \n"
          + "             GROUP BY WORKDEPT \n"
          + "             ORDER BY 2; \n"
          + "           END-EXEC.\n";

  private static final String SELECT4 =
      TEXT
          + "            DECLARE UP_CUR CURSOR FOR \n"
          + "            SELECT WORKDEPT, EMPNO, SALARY, BONUS, COMM \n"
          + "              FROM DSN8C10.EMP \n"
          + "              WHERE WORKDEPT IN ('D11','D21') \n"
          + "           END-EXEC.\n";

  private static final String SELECT5 =
      TEXT
          + "            SELECT MAX(BONUS), MIN(BONUS), AVG(BONUS) \n"
          + "               INTO :MAX, :MIN, :AVG \n"
          + "               FROM DSN8C10.EMP \n"
          + "               WITH UR \n"
          + "               QUERYNO 13; \n"
          + "           END-EXEC.\n";

  private static final String SELECT6 =
      TEXT
          + "            DECLARE C1 CURSOR FOR \n"
          + "             SELECT * FROM RMTTAB\n"
          + "               FETCH FIRST 50 ROWS ONLY \n"
          + "           END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(SELECT, SELECT2, SELECT3, SELECT4, SELECT5, SELECT6);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql whenever statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
