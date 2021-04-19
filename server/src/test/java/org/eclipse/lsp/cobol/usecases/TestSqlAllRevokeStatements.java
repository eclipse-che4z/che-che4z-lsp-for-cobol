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
 * This PARAMETERIZED test checks if all below sql REVOKE statements works correctly.
 *
 * <pre>
 * - Collection
 * - Database
 * - Function or stored procedure
 * - Package
 * - Plan
 * - Schema
 * - Sequence
 * - System
 * - Table or view
 * - Type or JAR file
 * - Variable
 * Use
 *
 * </pre>
 */
class TestSqlAllRevokeStatements {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n";

  private static final String REVOKE_IN_COLLECTION =
      TEXT
          + "             REVOKE CREATE IN COLLECTION QAACLONE, \n"
          + "             DSN8CC61 FROM CLARK;\n"
          + "           END-EXEC.";

  private static final String REVOKE_IN_COLLECTION2 =
      TEXT
          + "             REVOKE CREATE IN COLLECTION DSN8CC91 FROM ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_DATABASE =
      TEXT
          + "             REVOKE DROP\n"
          + "              ON DATABASE DSN8D12A\n"
          + "              FROM PEREZ;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_DATABASE2 =
      TEXT
          + "             REVOKE REPAIR\n"
          + "              ON DATABASE DSN8D12A\n"
          + "              FROM PUBLIC;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_DATABASE3 =
      TEXT
          + "             REVOKE CREATETAB,LOAD\n"
          + "             ON DATABASE DSN8D12A\n"
          + "             FROM WALKER,PIANKA,FUJIMOTO;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_DATABASE4 =
      TEXT
          + "             REVOKE LOAD\n"
          + "             ON DATABASE DSN8D12A\n"
          + "             FROM ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_FUNCTION =
      TEXT + "            REVOKE EXECUTE ON FUNCTION CALC_SALARY FROM JONES;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_PROCEDURE =
      TEXT
          + "            REVOKE EXECUTE ON PROCEDURE VACATION_ACCR FROM PUBLIC;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_PACKAGE =
      TEXT + "            REVOKE COPY ON PACKAGE DSN8CC61.* FROM LEWIS;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_PACKAGE2 =
      TEXT + "            REVOKE EXECUTE ON PACKAGE DSN9CC13.* FROM ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_PLAN =
      TEXT + "            REVOKE BIND ON PLAN DSN8IP12 FROM JONES;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_PLAN2 =
      TEXT + "            REVOKE BIND,EXECUTE ON PLAN DSN8CP12 FROM PUBLIC;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_PLAN3 =
      TEXT + "            REVOKE EXECUTE ON PLAN DSN8CP12 FROM ADAMSON,BROWN;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_PLAN4 =
      TEXT + "            REVOKE BIND ON PLAN DSN91PLN FROM ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_SCHEMA =
      TEXT + "            REVOKE CREATEIN ON SCHEMA T_SCORES FROM JONES;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_SCHEMA2 =
      TEXT + "            REVOKE CREATEIN ON SCHEMA VAC FROM PUBLIC;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_SCHEMA3 =
      TEXT + "            REVOKE ALTERIN ON SCHEMA DEPT FROM ADMIN_A;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_SCHEMA4 =
      TEXT
          + "            REVOKE ALTERIN, DROPIN ON SCHEMA \n"
          + "            NEW_HIRE, PROMO, RESIGN FROM HR;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_SCHEMA5 =
      TEXT + "            REVOKE ALTERIN ON SCHEMA EMPLOYEE FROM ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_SEQUENCE =
      TEXT
          + "            REVOKE USAGE\n"
          + "             ON SEQUENCE MYNUM\n"
          + "             FROM JONES;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_SEQUENCE2 =
      TEXT
          + "            REVOKE USAGE\n"
          + "            ON SEQUENCE ORDER_SEQ\n"
          + "            FROM ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String REVOKE_SYS_PRIVILGES =
      TEXT + "            REVOKE DISPLAY\n" + "            FROM LUTZ;\n" + "           END-EXEC.";

  private static final String REVOKE_SYS_PRIVILGES2 =
      TEXT
          + "            REVOKE BSDS,RECOVER\n"
          + "            FROM PARKER,SETRIGHT;\n"
          + "           END-EXEC.";

  private static final String REVOKE_SYS_PRIVILGES3 =
      TEXT + "            REVOKE TRACE\n" + "            FROM PUBLIC;\n" + "           END-EXEC.";

  private static final String REVOKE_SYS_PRIVILGES4 =
      TEXT + "            REVOKE ARCHIVE\n" + "             FROM ROLE ROLE1;\n" + "           END-EXEC.";

  private static final String REVOKE_SYS_PRIVILGES5 =
      TEXT
          + "            REVOKE CREATE_SECURE_OBJECT\n"
          + "            FROM STEVE BY MARY;\n"
          + "           END-EXEC.";

  private static final String REVOKE_SYS_PRIVILGES6 =
      TEXT
          + "            REVOKE DBADM ON SYSTEM \n"
          + "            FROM ROLE ADMINROLE \n"
          + "            NOT INCLUDING DEPENDENT PRIVILEGES;\n"
          + "           END-EXEC.";

  private static final String REVOKE_SYS_PRIVILGES7 =
      TEXT
          + "            REVOKE DBADM, DATAACCESS, ACCESSCTRL ON SYSTEM \n"
          + "            FROM ROLE ADMINROLE \n"
          + "            NOT INCLUDING DEPENDENT PRIVILEGES;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_TABLE =
      TEXT + "            REVOKE SELECT ON TABLE DSN8C10.EMP FROM PULASKI;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_TABLE2 =
      TEXT + "            REVOKE UPDATE ON TABLE DSN8C10.EMP FROM PUBLIC;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_TABLE3 =
      TEXT + "            REVOKE ALL ON TABLE DSN8C10.EMP FROM KWAN,THOMPSON;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_TABLE4 =
      TEXT
          + "            REVOKE SELECT, UPDATE ON TABLE DSN8C10.DEPT\n"
          + "            FROM PUBLIC;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_TABLE5 =
      TEXT
          + "            REVOKE ALTER ON TABLE DSN8C10.EMP\n"
          + "            FROM ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_TYPE =
      TEXT + "            REVOKE USAGE ON TYPE SHOESIZE FROM JONES;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_TYPE2 =
      TEXT + "            REVOKE USAGE ON TYPE US_DOLLAR FROM PUBLIC;\n" + "           END-EXEC.";

  private static final String REVOKE_ON_TYPE3 =
      TEXT
          + "            REVOKE USAGE ON TYPE CANADIAN_DOLLARS\n"
          + "             FROM ADMIN_A;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_TYPE4 =
      TEXT
          + "            REVOKE USAGE ON TYPE MILES\n"
          + "             FROM ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static final String REVOKE_ON_VARIABLE =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n";

  private static final String REVOKE_USE =
      TEXT
          + "            REVOKE USE OF BUFFERPOOL BP2\n"
          + "             FROM MARINO;\n"
          + "           END-EXEC.";

  private static final String REVOKE_USE2 =
      TEXT
          + "            REVOKE USE OF TABLESPACE DSN8D12A.DSN8S12D\n"
          + "             FROM PUBLIC;\n"
          + "           END-EXEC.";

  private static final String REVOKE_USE3 =
      TEXT
          + "            REVOKE USE OF STOGROUP SG1\n"
          + "            FROM ROLE ROLE1;\n"
          + "           END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        REVOKE_IN_COLLECTION,
        REVOKE_IN_COLLECTION2,
        REVOKE_ON_DATABASE,
        REVOKE_ON_DATABASE2,
        REVOKE_ON_DATABASE3,
        REVOKE_ON_DATABASE4,
        REVOKE_ON_FUNCTION,
        REVOKE_ON_PROCEDURE,
        REVOKE_ON_PACKAGE,
        REVOKE_ON_PACKAGE2,
        REVOKE_ON_PLAN,
        REVOKE_ON_PLAN2,
        REVOKE_ON_PLAN3,
        REVOKE_ON_PLAN4,
        REVOKE_ON_SCHEMA,
        REVOKE_ON_SCHEMA2,
        REVOKE_ON_SCHEMA3,
        REVOKE_ON_SCHEMA4,
        REVOKE_ON_SCHEMA5,
        REVOKE_ON_SEQUENCE,
        REVOKE_ON_SEQUENCE2,
        REVOKE_SYS_PRIVILGES,
        REVOKE_SYS_PRIVILGES2,
        REVOKE_SYS_PRIVILGES3,
        REVOKE_SYS_PRIVILGES4,
        REVOKE_SYS_PRIVILGES5,
        REVOKE_SYS_PRIVILGES6,
        REVOKE_SYS_PRIVILGES7,
        REVOKE_ON_TABLE,
        REVOKE_ON_TABLE2,
        REVOKE_ON_TABLE3,
        REVOKE_ON_TABLE4,
        REVOKE_ON_TABLE5,
        REVOKE_ON_TYPE,
        REVOKE_ON_TYPE2,
        REVOKE_ON_TYPE3,
        REVOKE_ON_TYPE4,
        REVOKE_USE,
        REVOKE_USE2,
        REVOKE_USE3,
        REVOKE_ON_VARIABLE);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql revoke statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
