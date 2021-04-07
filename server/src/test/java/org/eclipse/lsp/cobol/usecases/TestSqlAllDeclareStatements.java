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

/**
 * This PARAMETERIZED test checks if all below sql DECLARE statements works correctly.
 *
 * <pre>
 * - DECLARE CURSOR
 * - DECLARE GLOBAL TEMPORARY TABLE
 * - DECLARE STATEMENT
 * - DECLARE TABLE
 * - DECLARE VARIABLE
 *
 * </pre>
 */
class TestSqlAllDeclareStatements {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n";

  private static final String DECLARE_CURSOR =
      TEXT
          + "           EXEC SQL\n"
          + "            DECLARE C1 CURSOR FOR\n"
          + "            SELECT DEPTNO, DEPTNAME, MGRNO\n"
          + "            FROM DSN8C10.DEPT\n"
          + "            WHERE ADMRDEPT = 'A00';\n"
          + "           END-EXEC.";

  private static final String DECLARE_GLOBAL_TEMP_TABLE =
      TEXT
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC SQL\n"
          + "            DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_EMP\n"
          + "              (EMPNO     CHAR(6)   NOT NULL,\n"
          + "               SALARY    DECIMAL(9, 2),\n"
          + "               BONUS     DECIMAL(9, 2),\n"
          + "               COMM      DECIMAL(9, 2))\n"
          + "               CCSID EBCDIC\n"
          + "               ON COMMIT PRESERVE ROWS;\n"
          + "           END-EXEC.";

  private static final String DECLARE_TABLE =
      TEXT
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "             DECLARE DSN8C10.EMP TABLE\n"
          + "              (EMPNO     CHAR(6)     NOT NULL,\n"
          + "               FIRSTNME  VARCHAR(12) NOT NULL,\n"
          + "               MIDINIT   CHAR(1)     NOT NULL,\n"
          + "               LASTNAME  VARCHAR(15) NOT NULL,\n"
          + "               WORKDEPT  CHAR(3)             ,\n"
          + "               PHONENO   CHAR(4)             ,\n"
          + "               HIREDATE  DATE                ,\n"
          + "               JOB       CHAR(8)             ,\n"
          + "               EDLEVEL   SMALLINT            ,\n"
          + "               SEX       CHAR(1)             ,\n"
          + "               BIRTHDATE DATE                ,\n"
          + "               SALARY    DECIMAL(9,2)        ,\n"
          + "               BONUS     DECIMAL(9,2)        ,\n"
          + "               COMM      DECIMAL(9,2)        );\n"
          + "             END-EXEC.";

  private static final String DECLARE_STATEMENT =
      TEXT
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL DECLARE OBJECT_STATEMENT STATEMENT; END-EXEC.";

  private static final String DECLARE_VARIABLE =
      TEXT
          + "           EXEC SQL \n"
          + "             DECLARE :FRED VARIABLE CCSID EBCDIC FOR BIT DATA;\n"
          + "             DECLARE :JEAN VARIABLE CCSID 1208;\n"
          + "             DECLARE :DAVE VARIABLE CCSID UNICODE; \n"
          + "             DECLARE :PETE VARIABLE CCSID 1200;\n"
          + "             DECLARE :AMBER VARIABLE CCSID UNICODE;\n"
          + "           END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        DECLARE_CURSOR,
        DECLARE_GLOBAL_TEMP_TABLE,
        DECLARE_TABLE,
        DECLARE_STATEMENT,
        DECLARE_VARIABLE);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql declare statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
