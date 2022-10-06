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
          + "       01 {$*MAX1}  PIC A  VALUE 'ONAT'.\n"
          + "       01 {$*MIN1}  PIC 9  VALUE '44'.\n"
          + "       01 {$*AVG1}  PIC 9  VALUE '44'.\n"
          + "       01 {$*A610-C-INTRN-SCP-ET}  PIC 9  VALUE '44'.\n"
          + "       01 {$*A610-C-ET-SICO}  PIC 9  VALUE '44'.\n"
          + "       01 {$*WS-D-TRANSIT-2B}  PIC 9  VALUE '44'.\n"
          + "       01 {$*WS-D-TRANSIT-2}  PIC 9  VALUE '44'.\n"
          + "       01 {$*WS-D-DEB}  PIC 9  VALUE '44'.\n"
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
          + "               INTO :{$MAX1}, :{$MIN1}, :{$AVG1} \n"
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

  private static final String SELECT7 =
      TEXT
          + "            SELECT CONCAT('IBM','MAINFRAMER') \n"
          + "             AS Result FROM SYSIBM.SYSDUMMY1;\n"
          + "           END-EXEC.\n";

  private static final String SELECT8 =
      TEXT + "            select all all, avg from all; \n" + "           END-EXEC.\n";

  private static final String SELECT9 =
      TEXT + "            select all, avg from all;\n" + "           END-EXEC.\n";

  private static final String SELECT10 =
      TEXT + "            select all all as all, avg from all;\n" + "           END-EXEC.\n";

  public static final String SELECT11 =
      TEXT
          + "              SELECT C_INTRN_SCP_ET                                     00119600\n"
          + "                INTO :{$A610-C-INTRN-SCP-ET}                               00119700\n"
          + "                FROM VVA610                                             00119800\n"
          + "               WHERE C_ET_SICO     = :{$A610-C-ET-SICO}                    00119900\n"
          + "E46179           FETCH FIRST 1 ROW ONLY                                 00120700\n"
          + "           END-EXEC.                                                    00120800";

  public static final String SELECT12 =
      TEXT
          + "HL0119      SELECT                                                      00098800\n"
          + "HL0119        DATE(                                                     00098900\n"
          + "HL0119        YEAR(DATE(:{$WS-D-TRANSIT-2B})-1 MONTH)!!                    00099000\n"
          + "HL0119        '-'!!                                                     00099100\n"
          + "HL0119        MONTH(DATE(:{$WS-D-TRANSIT-2B})-1 MONTH)!!                   00099200\n"
          + "HL0119        '-'!!                                                     00099300\n"
          + "HL0119        '01'                                                      00099400\n"
          + "HL0119        )                                                         00099500\n"
          + "HL0119      INTO :{$WS-D-DEB}                                              00099600\n"
          + "HL0119      FROM SYSIBM.SYSDUMMY1                                       00099700\n"
          + "HL0119     END-EXEC.                                                    00099800";

  public static final String SELECT13 =
      TEXT
          + "            SELECT                                                      00094400\n"
          + "              DATE(                                                     00094500\n"
          + "              DAYS(                                                     00094600\n"
          + "              DATE(                                                     00094700\n"
          + "              YEAR(:{$WS-D-TRANSIT-2})!!                                   00094800\n"
          + "              '-'!!                                                     00094900\n"
          + "              MONTH(:{$WS-D-TRANSIT-2})!!                                  00095000\n"
          + "              '-'!!                                                     00095100\n"
          + "              '01'                                                      00095200\n"
          + "              )                                                         00095300\n"
          + "              )                                                         00095400\n"
          + "              -1)                                                       00095500\n"
          + "            INTO :{$WS-D-DEB}                                              00095600\n"
          + "            FROM SYSIBM.SYSDUMMY1                                       00095700\n"
          + "           END-EXEC.                                                    00095800";

  private static Stream<String> textsToTest() {
    return Stream.of(SELECT, SELECT2, SELECT3, SELECT4, SELECT5, SELECT6, SELECT7, SELECT8, SELECT9, SELECT10,
            SELECT11, SELECT12, SELECT13);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql whenever statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
