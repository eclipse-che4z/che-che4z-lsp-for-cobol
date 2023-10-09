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

/** This test checks if sql INSERT statement works correctly. */
class TestSqlInsertStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*HV_ENUM}  PIC 9 VALUE '63'.\n"
          + "       01 {$*TAD}  PIC 9 VALUE '144'.\n"
          + "       01 {$*DB2-POLICYNUM-INT}  PIC 9 VALUE '144'.\n"
          + "       01 {$*CA-H-PROPERTY-TYPE}  PIC 9 VALUE '144'.\n"
          + "       01 {$*DB2-H-BEDROOMS-SINT}  PIC 9 VALUE '144'.\n"
          + "       01 {$*DB2-H-VALUE-INT}  PIC 9 VALUE '144'.\n"
          + "       01 {$*CA-H-HOUSE-NAME}  PIC 9 VALUE '144'.\n"
          + "       01 {$*CA-H-HOUSE-NUMBER}  PIC 9 VALUE '144'.\n"
          + "       01 {$*CA-H-POSTCODE}  PIC 9 VALUE '144'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL";
  private static final String INSERT1 =
      TEXT
          + "            INSERT INTO DSN8C10.EMP\n"
          + "             VALUES ('000205','MARY','T','SMITH','D11','2866',\n"
          + "                  '1981-08-10','ANALYST',16,'F','1956-05-22',\n"
          + "                 16345,500,2300);\n"
          + "           END-EXEC.";

  private static final String INSERT2 =
      TEXT
          + "            INSERT INTO SMITH.TEMPEMPL\n"
          + "            SELECT *\n"
          + "            FROM DSN8C10.EMP;\n"
          + "           END-EXEC.";

  private static final String INSERT3 =
      TEXT
          + "            INSERT INTO SESSION.TEMPEMPL\n"
          + "            SELECT *\n"
          + "             FROM DSN8C10.EMP\n"
          + "             WHERE WORKDEPT='D11';\n"
          + "           END-EXEC.";

  private static final String INSERT4 =
      TEXT
          + "            INSERT INTO DSN8C10.EMP_PHOTO_RESUME\n"
          + "            (EMPNO, EMP_ROWID)\n"
          + "            VALUES (:{$HV_ENUM}, DEFAULT);\n"
          + "           END-EXEC.";

  private static final String INSERT5 =
      TEXT
          + "            INSERT INTO DSN8C10.EMP_PHOTO_RESUME\n"
          + "            (EMPNO,EMP_ROWID)\n"
          + "             VALUES (:{$HV_ENUM},DEFAULT);\n"
          + "           END-EXEC.";

  private static final String INSERT6 =
      TEXT
          + "           INSERT INTO ABC INCLUDE (A SMALLINT, \n"
          + "           B SMALLINT) VALUEs (:{$TAD}+1);\n"
          + "           END-EXEC.";

  public static final String INSERT7 =
      TEXT
          + "           INSERT INTO HOUSE\n"
          + "                       ( POLICYNUMBER,\n"
          + "                         PROPERTYTYPE,\n"
          + "                         BEDROOMS,\n"
          + "                         VALUE,\n"
          + "                         HOUSENAME,\n"
          + "                         HOUSENUMBER,\n"
          + "                         POSTCODE          )\n"
          + "                VALUES ( :{$DB2-POLICYNUM-INT},\n"
          + "                         :{$CA-H-PROPERTY-TYPE},\n"
          + "                         :{$DB2-H-BEDROOMS-SINT},\n"
          + "                         :{$DB2-H-VALUE-INT},\n"
          + "                         :{$CA-H-HOUSE-NAME},\n"
          + "                         :{$CA-H-HOUSE-NUMBER},\n"
          + "                         :{$CA-H-POSTCODE}      )"
          + "           END-EXEC.";

  private static final String INSERT8 =
      TEXT + "           insert into all values(1,1);\n" + "           END-EXEC.";

  private static final String INSERT9 =
      TEXT
          + "           insert into all(all,avg) \n"
          + "           select all all as all, avg from all;\n"
          + "           END-EXEC.";

  public static final String INSERT10 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. testpgm.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-VARIABLES}.\n"
          + "           05 {$*WS-TIMESTAMP}                PIC X(26).\n"
          + "           05 {$*WS-originalIssueDate}        PIC S9(18) COMP.\n"
          + "           05 {$*WS-FIELD1}                   PIC X(01).\n"
          + "           05 {$*WS-EXPIRES-IN}               PIC S9(18)V COMP-3.\n"
          + "       PROCEDURE DIVISION.\n"
          + "                 EXEC SQL\n"
          + "              INSERT INTO TABLE1\n"
          + "              (\n"
          + "                TBL1_FIELD1 \n"
          + "               ,TBL1_TIMESTAMP\n"
          + "              )\n"
          + "              VALUES\n"
          + "              (\n"
          + "                :{$WS-FIELD1}\n"
          + "               ,TIMESTAMP(:{$WS-TIMESTAMP}) +\n"
          + "                          (:{$WS-EXPIRES-IN} SECONDS)\n"
          + "              )\n"
          + "           END-EXEC   .\n"
          + "       end program testpgm.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        INSERT1, INSERT2, INSERT3, INSERT4, INSERT5, INSERT6, INSERT7, INSERT8, INSERT9, INSERT10);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql insert statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
