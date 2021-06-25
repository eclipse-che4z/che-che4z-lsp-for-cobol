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
 * This PARAMETERIZED test checks if all below sql GRANT statements works correctly.
 *
 * <pre>
 *     - Collection
 *     - Database
 *     - Function or stored procedure
 *     - Package
 *     - Plan
 *     - Schema
 *     - Sequence
 *     - System
 *     - Table or view
 *     - Type or JAR
 *     - Variable
 *     - Use
 * </pre>
 */
class TestSqlAllGrantStatements {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n";

  private static final String GRANT_ON_COLLECTION =
      TEXT + "            GRANT CREATE IN COLLECTION DSN8CC91 TO ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String GRANT_ON_COLLECTION2 =
      TEXT
          + "            GRANT CREATE IN COLLECTION QAACLONE, DSN8CC61 TO CLARK;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_DATABASE =
      TEXT
          + "            GRANT DROP\n"
          + "                 ON DATABASE DSN8D12A\n"
          + "                 TO PEREZ;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_DATABASE2 =
      TEXT
          + "            GRANT REPAIR\n"
          + "                 ON DATABASE DSN8D12A\n"
          + "                 TO PUBLIC;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_DATABASE3 =
      TEXT
          + "            GRANT CREATETAB,LOAD\n"
          + "             ON DATABASE DSN8D12A\n"
          + "             TO WALKER,PIANKA,FUJIMOTO\n"
          + "             WITH GRANT OPTION;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_DATABASE4 =
      TEXT
          + "            GRANT LOAD \n"
          + "             ON DATABASE DSN9D91A \n"
          + "             TO ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_FUNCTION =
      TEXT + "            GRANT EXECUTE ON FUNCTION CALC_SALARY TO JONES;\n" + "           END-EXEC.";

  private static final String GRANT_ON_SPECIFIC_FUNCTION =
      TEXT + "            GRANT EXECUTE ON PROCEDURE VACATION_ACCR TO PUBLIC;\n" + "           END-EXEC.";

  private static final String GRANT_ON_PROCEDURE =
      TEXT
          + "            GRANT EXECUTE ON SPECIFIC FUNCTION DEPT85_TOT TO ADMIN_A\n"
          + "             WITH GRANT OPTION;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_PACKAGE =
      TEXT + "            GRANT COPY ON PACKAGE DSN8CC61.* TO LEWIS;\n" + "           END-EXEC.";

  private static final String GRANT_ON_PACKAGE2 =
      TEXT + "            GRANT ALL ON PACKAGE CLCT1.PKG1, CLCT2.PKG2 TO JONES;\n" + "           END-EXEC.";

  private static final String GRANT_ON_PACKAGE3 =
      TEXT + "            GRANT EXECUTE ON PACKAGE DSN9CC13.* TO ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String GRANT_ON_PLAN =
      TEXT + "            GRANT BIND ON PLAN DSN8IP12 TO JONES;\n" + "           END-EXEC.";

  private static final String GRANT_ON_PLAN2 =
      TEXT + "            GRANT BIND,EXECUTE ON PLAN DSN8CP12 TO PUBLIC;\n" + "           END-EXEC.";

  private static final String GRANT_ON_PLAN3 =
      TEXT
          + "            GRANT EXECUTE ON PLAN DSN8CP12 TO ADAMSON,\n"
          + "            BROWN WITH GRANT OPTION;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_PLAN4 =
      TEXT + "            GRANT BIND ON PLAN DSN91PLN TO ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String GRANT_ON_SCHEMA =
      TEXT + "            GRANT CREATEIN ON SCHEMA T_SCORES TO JONES;\n" + "           END-EXEC.";

  private static final String GRANT_ON_SCHEMA2 =
      TEXT
          + "            GRANT ALTERIN ON SCHEMA DEPT TO ADMIN_A\n"
          + "             WITH GRANT OPTION;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_SCHEMA3 =
      TEXT
          + "            GRANT CREATEIN, ALTERIN, \n"
          + "            DROPIN ON SCHEMA NEW_HIRE, PROMO, RESIGN TO HR;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_SCHEMA4 =
      TEXT + "            GRANT ALTERIN ON SCHEMA EMPLOYEE TO ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String GRANT_ON_SEQUENCE =
      TEXT
          + "            GRANT USAGE\n"
          + "            ON SEQUENCE MYNUM\n"
          + "            TO JONES;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_SEQUENCE2 =
      TEXT + "            GRANT USAGE ON SEQUENCE ORDER_SEQ TO ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String GRANT_SYS_PRIVILGES =
      TEXT + "            GRANT DISPLAY\n" + "            TO LUTZ;\n" + "           END-EXEC.";

  private static final String GRANT_SYS_PRIVILGES2 =
      TEXT
          + "            GRANT BSDS,RECOVER\n"
          + "            TO PARKER,SETRIGHT\n"
          + "            WITH GRANT OPTION;\n"
          + "           END-EXEC.";

  private static final String GRANT_SYS_PRIVILGES3 =
      TEXT + "            GRANT TRACE\n" + "            TO PUBLIC;\n" + "           END-EXEC.";

  private static final String GRANT_SYS_PRIVILGES4 =
      TEXT + "            GRANT ARCHIVE TO ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String GRANT_SYS_PRIVILGES5 =
      TEXT + "            GRANT CREATE_SECURE_OBJECT \n" + "            TO STEVE;\n" + "           END-EXEC.";

  private static final String GRANT_SYS_PRIVILGES6 =
      TEXT
          + "             GRANT DBADM ON SYSTEM \n"
          + "              TO ROLE ADMINROLE;\n"
          + "             GRANT DBADM, ACCESSCTRL, DATAACCESS \n"
          + "             ON SYSTEM \n"
          + "             TO SALLY;\n"
          + "           END-EXEC.";

  private static final String GRANT_SYS_PRIVILGES7 =
      TEXT
          + "             GRANT DBADM WITHOUT ACCESSCTRL \n"
          + "             WITHOUT DATAACCESS \n"
          + "             ON SYSTEM \n"
          + "             TO JOHN;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_TABLE =
      TEXT + "             GRANT SELECT ON DSN8C10.EMP TO PULASKI;\n" + "           END-EXEC.";

  private static final String GRANT_ON_TABLE2 =
      TEXT
          + "             GRANT ALL ON TABLE DSN8C10.EMP TO KWAN,\n"
          + "             THOMPSON WITH GRANT OPTION;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_TABLE3 =
      TEXT
          + "             GRANT ALTER ON TABLE DSN9910.EMP \n"
          + "             TO ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_TYPE =
      TEXT + "             GRANT USAGE ON TYPE SHOE_SIZE TO JONES;\n" + "           END-EXEC.";

  private static final String GRANT_ON_TYPE2 =
      TEXT + "             GRANT USAGE ON TYPE US_DOLLAR TO PUBLIC;\n" + "           END-EXEC.";

  private static final String GRANT_ON_TYPE3 =
      TEXT
          + "             GRANT USAGE ON TYPE MILES\n"
          + "             TO ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_VARIABLE =
      TEXT + "             GRANT READ ON VARIABLE ACCOUNTNO TO JONES;\n" + "           END-EXEC.";

  private static final String GRANT_ON_VARIABLE2 =
      TEXT
          + "             GRANT USE OF TABLESPACE\n"
          + "              DSN8D12A.DSN8S12D\n"
          + "              TO PUBLIC;\n"
          + "           END-EXEC.";

  private static final String GRANT_ON_VARIABLE3 =
      TEXT
          + "             GRANT USE OF STOGROUP SG1\n"
          + "             TO ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        GRANT_ON_COLLECTION,
        GRANT_ON_COLLECTION2,
        GRANT_ON_DATABASE,
        GRANT_ON_DATABASE2,
        GRANT_ON_DATABASE3,
        GRANT_ON_DATABASE4,
        GRANT_ON_FUNCTION,
        GRANT_ON_SPECIFIC_FUNCTION,
        GRANT_ON_PROCEDURE,
        GRANT_ON_PACKAGE,
        GRANT_ON_PACKAGE2,
        GRANT_ON_PACKAGE3,
        GRANT_ON_PLAN,
        GRANT_ON_PLAN2,
        GRANT_ON_PLAN3,
        GRANT_ON_PLAN4,
        GRANT_ON_SCHEMA,
        GRANT_ON_SCHEMA2,
        GRANT_ON_SCHEMA3,
        GRANT_ON_SCHEMA4,
        GRANT_ON_SEQUENCE,
        GRANT_ON_SEQUENCE2,
        GRANT_SYS_PRIVILGES,
        GRANT_SYS_PRIVILGES2,
        GRANT_SYS_PRIVILGES3,
        GRANT_SYS_PRIVILGES4,
        GRANT_SYS_PRIVILGES5,
        GRANT_SYS_PRIVILGES6,
        GRANT_SYS_PRIVILGES7,
        GRANT_ON_TABLE,
        GRANT_ON_TABLE2,
        GRANT_ON_TABLE3,
        GRANT_ON_TYPE,
        GRANT_ON_TYPE2,
        GRANT_ON_TYPE3,
        GRANT_ON_VARIABLE,
        GRANT_ON_VARIABLE2,
        GRANT_ON_VARIABLE3);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql all grant statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
