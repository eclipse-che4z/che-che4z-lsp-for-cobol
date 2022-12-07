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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** This test checks if sql MERGE statement works correctly. */
class TestSqlMergeStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*HV_ID}  PIC 9  VALUE '63'.\n"
          + "       01 {$*HV_ACTIVITY}  PIC 9  VALUE '23'.\n"
          + "       01 {$*HV_AMOUNT}  PIC 9  VALUE '40'.\n"
          + "       01 {$*HV_DESCRIPTION}  PIC X  VALUE 'Some Description'.\n"
          + "       01 {$*HV_NROWS}  PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL";
  private static final String MERGE1 =
      TEXT
          + "            MERGE INTO RECORDS AR\n"
          + "            USING (SELECT ACTIVITY, DESCRIPTION FROM ACTIVITIES) AC\n"
          + "            ON (AR.ACTIVITY = AC.ACTIVITY)\n"
          + "            WHEN MATCHED THEN\n"
          + "            UPDATE SET\n"
          + "            DESCRIPTION = AC.DESCRIPTION\n"
          + "            WHEN NOT MATCHED THEN\n"
          + "            INSERT\n"
          + "            (ACTIVITY, DESCRIPTION)\n"
          + "            VALUES (AC.ACTIVITY, AC.DESCRIPTION);\n"
          + "           END-EXEC.";

  private static final String MERGE2 =
      TEXT
          + "            MERGE INTO INVENTORY AS IN\n"
          + "            USING (SELECT PARTNO, DESCRIPTION, COUNT FROM SHIPMENT\n"
          + "            WHERE SHIPMENT.PARTNO IS NOT NULL) AS SH\n"
          + "            ON (IN.PARTNO = SH.PARTNO)\n"
          + "            WHEN MATCHED THEN\n"
          + "             UPDATE SET\n"
          + "              DESCRIPTION = SH.DESCRIPTION,\n"
          + "              QUANTITY = IN.QUANTITY + SH.COUNT\n"
          + "            WHEN NOT MATCHED THEN\n"
          + "             INSERT\n"
          + "             (PARTNO, DESCRIPTION, QUANTITY)\n"
          + "             VALUES (SH.PARTNO, SH.DESCRIPTION, SH.COUNT);\n"
          + "           END-EXEC.";

  private static final String MERGE3 =
      TEXT
          + "            MERGE INTO ACCOUNT AS A\n"
          + "             USING (SELECT ID, SUM(AMOUNT) SUM_AMOUNT FROM TRANSACTION\n"
          + "              GROUP BY ID) AS T\n"
          + "              ON A.ID = T.ID\n"
          + "             WHEN MATCHED THEN\n"
          + "              UPDATE SET\n"
          + "               BALANCE = A.BALANCE + T.SUM_AMOUNT\n"
          + "             WHEN NOT MATCHED THEN\n"
          + "              INSERT\n"
          + "              (ID, BALANCE)\n"
          + "               VALUES (T.ID, T.SUM_AMOUNT);\n"
          + "           END-EXEC.";

  private static final String MERGE4 =
      TEXT
          + "            MERGE INTO EMPLOYEE_FILE AS E\n"
          + "             USING (SELECT EMPID, PHONE, OFFICE\n"
          + "              FROM (SELECT EMPID, PHONE, OFFICE,\n"
          + "              ROW_NUMBER() OVER (PARTITION BY EMPID\n"
          + "              ORDER BY TRANSACTION_TIME DESC) RN\n"
          + "              FROM TRANSACTION_LOG) AS NT\n"
          + "              WHERE RN = 1) AS T\n"
          + "              ON E.EMPID = T.EMPID\n"
          + "             WHEN MATCHED THEN\n"
          + "              UPDATE SET\n"
          + "               (PHONE, OFFICE) =\n"
          + "               (T.PHONE, T.OFFICE)\n"
          + "             WHEN NOT MATCHED THEN\n"
          + "              INSERT\n"
          + "              (EMPID, PHONE, OFFICE)\n"
          + "              VALUES (T.EMPID, T.PHONE, T.OFFICE);\n"
          + "           END-EXEC.";

  private static final String MERGE5 =
      TEXT
          + "            MERGE INTO RECORDS AR\n"
          + "             USING (SELECT ACTIVITY, DESCRIPTION, DATE, LAST_MODIFIED\n"
          + "              FROM ACTIVITIES_GROUPA) AC\n"
          + "              ON (AR.ACTIVITY = AC.ACTIVITY) AND AR.GROUP = 'A'\n"
          + "             WHEN MATCHED AND AC.DATE IS NULL THEN\n"
          + "              SIGNAL SQLSTATE '70001'\n"
          + "               SET MESSAGE_TEXT =\n"
          + "                AC.ACTIVITY CONCAT\n"
          + "                ' CANNOT BE MODIFIED. REASON: DATE IS NOT KNOWN'\n"
          + "             WHEN MATCHED AND AC.DATE < CURRENT DATE THEN\n"
          + "              DELETE\n"
          + "             WHEN MATCHED AND AR.LAST_MODIFIED < AC.LAST_MODIFIED THEN\n"
          + "              UPDATE SET\n"
          + "              (DESCRIPTION, DATE, LAST_MODIFIED) = \n"
          + "              (AC.DESCRIPTION, AC.DATE, DEFAULT)\n"
          + "             WHEN NOT MATCHED AND AC.DATE IS NULL THEN\n"
          + "              SIGNAL SQLSTATE '70002'\n"
          + "               SET MESSAGE_TEXT =\n"
          + "                AC.ACTIVITY CONCAT \n"
          + "               ' CANNOT BE INSERTED. REASON: DATE IS NOT KNOWN'\n"
          + "             WHEN NOT MATCHED AND AC.DATE >= CURRENT DATE THEN\n"
          + "              INSERT\n"
          + "               (GROUP, ACTIVITY, DESCRIPTION, DATE)\n"
          + "               VALUES ('A', AC.ACTIVITY, AC.DESCRIPTION, AC.DATE)\n"
          + "             ELSE IGNORE;\n"
          + "           END-EXEC.";

  private static final String MERGE6 =
      TEXT
          + "            MERGE INTO RECORDS AR\n"
          + "              USING (VALUES (:{$hv_activity}, :{$hv_description})\n"
          + "                FOR :{$hv_nrows} ROWS)\n"
          + "                AS AC (ACTIVITY, DESCRIPTION)\n"
          + "              ON (AR.ACTIVITY = AC.ACTIVITY)\n"
          + "              WHEN MATCHED THEN UPDATE SET DESCRIPTION = AC.DESCRIPTION\n"
          + "              WHEN NOT MATCHED THEN INSERT (ACTIVITY, DESCRIPTION)\n"
          + "                 VALUES (AC.ACTIVITY, AC.DESCRIPTION)\n"
          + "              NOT ATOMIC CONTINUE ON SQLEXCEPTION;\n"
          + "           END-EXEC.";

  private static final String MERGE7 =
      TEXT
          + "            MERGE INTO ACCOUNT AS A\n"
          + "              USING (VALUES (:{$hv_id}, :{$hv_amount}) \n"
          + "                FOR 3 ROWS)\n"
          + "                AS T (ID, AMOUNT)\n"
          + "              ON (A.ID = T.ID)\n"
          + "              WHEN MATCHED THEN UPDATE SET BALANCE = \n"
          + "              A.BALANCE + T.AMOUNT\n"
          + "              WHEN NOT MATCHED THEN INSERT (ID, BALANCE) \n"
          + "                  VALUES (T.ID, T.AMOUNT)\n"
          + "              NOT ATOMIC CONTINUE ON SQLEXCEPTION;\n"
          + "           END-EXEC.";

  private static Stream<String> textsToTest() {
    // add all
    return Stream.of(MERGE1, MERGE2, MERGE3, MERGE4, MERGE5, MERGE6, MERGE7);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql merge statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
