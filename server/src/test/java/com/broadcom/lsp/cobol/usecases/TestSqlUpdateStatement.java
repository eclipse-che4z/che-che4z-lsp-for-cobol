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
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

/** This test checks if sql UPDATE statement works correctly. */
class TestSqlUpdateStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL\n";

  private static final String UPDATE =
      TEXT
          + "         UPDATE DSN8C10.EMP\n"
          + "           SET PHONENO='3565'\n"
          + "           WHERE EMPNO='000190'\n"
          + "       END-EXEC.\n";

  private static final String UPDATE2 =
      TEXT
          + "         UPDATE DSN8C10.EMP\n"
          + "           SET SALARY = SALARY + 100\n"
          + "           WHERE WORKDEPT = 'D11';\n"
          + "       END-EXEC.\n";

  private static final String UPDATE3 =
      TEXT
          + "         UPDATE DSN8C10.EMP\n"
          + "           SET SALARY = NULL, BONUS = NULL, COMM = NULL\n"
          + "           WHERE EMPNO='000250';\n"
          + "       END-EXEC.\n";

  private static final String UPDATE4 =
      TEXT
          + "         UPDATE DSN8C10.EMP\n"
          + "           SET PROJSIZE = (SELECT COUNT(*)\n"
          + "              FROM DSN8C10.PROJ\n"
          + "              WHERE DEPTNO = 'E21') \n"
          + "           WHERE WORKDEPT = 'E21'; \n"
          + "       END-EXEC.\n";

  private static final String UPDATE5 =
      TEXT
          + "         UPDATE DSN8C10.EMP\n"
          + "           SET SALARY = 2 * SALARY\n"
          + "           WHERE CURRENT OF C1; \n"
          + "       END-EXEC.\n";

  private static final String UPDATE6 =
      TEXT
          + "         UPDATE EMP1\n"
          + "           SET SALARY = SALARY + 1000,\n"
          + "              RESUME = UPDATE_RESUME(:HV_RESUME)\n"
          + "           WHERE EMP_ROWID = :HV_EMP_ROWID; \n"
          + "       END-EXEC.\n";

  private static final String UPDATE7 =
      TEXT
          + "         UPDATE EMP X\n"
          + "           SET SALARY = 1.10 * SALARY\n"
          + "           WHERE SALARY < (SELECT AVG(SALARY) FROM EMP Y\n"
          + "           WHERE X.JOBCODE = Y.JOBCODE); \n"
          + "       END-EXEC.\n";

  private static final String UPDATE8 =
      TEXT
          + "         UPDATE EMP T1\n"
          + "           SET SALARY = (SELECT AVG(T2.SALARY) FROM EMP T2)\n"
          + "           WHERE WORKDEPT = 'E11' AND\n"
          + "           SALARY < (SELECT AVG(T3.SALARY) FROM EMP T3); \n"
          + "       END-EXEC.\n";

  private static final String UPDATE9 =
      TEXT
          + "         UPDATE DSN8710.EMP \n"
          + "           SET BONUS = ( SELECT .10 * SALARY FROM DSN8710.EMP Y  \n"
          + "                WHERE EMPNO = Y.EMPNO )\n"
          + "           WHERE CURRENT OF C1; \n"
          + "       END-EXEC.\n";

  private static final String UPDATE10 =
      TEXT + "         UPDATE T1 SET C1 = 5 WHERE CURRENT OF CS1;  END-EXEC.\n";

  private static final String UPDATE11 =
      TEXT
          + "         UPDATE POLICY \n"
          + "           FOR PORTION OF BUSINESS_TIME   \n"
          + "               FROM '2014-01-01' TO '9999-12-31'\n"
          + "                SET TYPE='HMO'\n"
          + "                WHERE BK='P138', CLIENT='C882';\n"
          + "       END-EXEC.\n";

  private static final String UPDATE12 =
      TEXT
          + "         UPDATE POLICY \n"
          + "           FOR PORTION OF BUSINESS_TIME  \n"
          + "               FROM '2014-01-01' TO '9999-12-31'\n"
          + "                BETWEEN '2014-01-01' AND '9999-12-31'\n"
          + "                SET TYPE='HMO'\n"
          + "                WHERE BK='P138', CLIENT='C882';\n"
          + "       END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        UPDATE,
        UPDATE2,
        UPDATE3,
        UPDATE4,
        UPDATE5,
        UPDATE6,
        UPDATE7,
        UPDATE8,
        UPDATE9,
        UPDATE10);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql update statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, List.of(), Map.of());
  }
}
