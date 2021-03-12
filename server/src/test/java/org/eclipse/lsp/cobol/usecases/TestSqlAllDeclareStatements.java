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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
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
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL\n";

  private static final String DECLARE_CURSOR =
      TEXT
          + "       DECLARE C1 CURSOR FOR\n"
          + "       SELECT DEPTNO, DEPTNAME, MGRNO\n"
          + "       FROM DSN8C10.DEPT\n"
          + "       WHERE ADMRDEPT = 'A00';\n"
          + "       END-EXEC.";

  private static final String DECLARE_GLOBAL_TEMP_TABLE =
      TEXT
          + "        DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP_EMP\n"
          + "              (EMPNO     CHAR(6)   NOT NULL,\n"
          + "               SALARY    DECIMAL(9, 2),\n"
          + "               BONUS     DECIMAL(9, 2),\n"
          + "               COMM      DECIMAL(9, 2))\n"
          + "               CCSID EBCDIC\n"
          + "               ON COMMIT PRESERVE ROWS;\n"
          + "       END-EXEC.";

  private static final String DECLARE_STATEMENT =
      TEXT
          + "        DECLARE OBJECT_STATEMENT STATEMENT;\n"
          + "        INCLUDE SQLDA;\n"
          + "        DECLARE C1 CURSOR FOR OBJECT_STATEMENT;\n"
          + "        PREPARE OBJECT_STATEMENT FROM SOURCE_STATEMENT;\n"
          + "        DESCRIBE OBJECT_STATEMENT INTO SQLDA;\n"
          + "        OPEN C1;\n"
          + "        FETCH C1 USING DESCRIPTOR SQLDA;\n"
          + "        CLOSE C1;\n"
          + "       END-EXEC.";

  private static final String DECLARE_TABLE =
      TEXT
          + "        DECLARE DSN8C10.EMP TABLE\n"
          + "             (EMPNO     CHAR(6)     NOT NULL,\n"
          + "              FIRSTNME  VARCHAR(12) NOT NULL,\n"
          + "              MIDINIT   CHAR(1)     NOT NULL,\n"
          + "              LASTNAME  VARCHAR(15) NOT NULL,\n"
          + "              WORKDEPT  CHAR(3)             ,\n"
          + "              PHONENO   CHAR(4)             ,\n"
          + "              HIREDATE  DATE                ,\n"
          + "              JOB       CHAR(8)             ,\n"
          + "              EDLEVEL   SMALLINT            ,\n"
          + "              SEX       CHAR(1)             ,\n"
          + "              BIRTHDATE DATE                ,\n"
          + "              SALARY    DECIMAL(9,2)        ,\n"
          + "              BONUS     DECIMAL(9,2)        ,\n"
          + "              COMM      DECIMAL(9,2)        );\n"
          + "       END-EXEC.";

  private static final String DECLARE_VARIABLE =
      TEXT
          + "        BEGIN DECLARE SECTION;\n"
          + "        DECLARE :FRED VARIABLE CCSID EBCDIC FOR BIT DATA;\n"
          + "        DECLARE :JEAN VARIABLE CCSID 1208;\n"
          + "        DECLARE :DAVE VARIABLE CCSID UNICODE; \n"
          + "        DECLARE :PETE VARIABLE CCSID 1200;\n"
          + "        DECLARE :AMBER VARIABLE CCSID UNICODE;\n"
          + "        END DECLARE SECTION;\n"
          + "       END-EXEC.";

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
