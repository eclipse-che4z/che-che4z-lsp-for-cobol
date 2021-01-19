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

/** This test checks if sql INSERT statement works correctly. */
class TestSqlInsertStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL";
  private static final String INSERT1 =
      TEXT
          + "        INSERT INTO DSN8C10.EMP\n"
          + "         VALUES ('000205','MARY','T','SMITH','D11','2866',\n"
          + "              '1981-08-10','ANALYST',16,'F','1956-05-22',\n"
          + "             16345,500,2300);\n"
          + "       END-EXEC.";

  private static final String INSERT2 =
      TEXT
          + "        INSERT INTO SMITH.TEMPEMPL\n"
          + "        SELECT *\n"
          + "        FROM DSN8C10.EMP;\n"
          + "       END-EXEC.";

  private static final String INSERT3 =
      TEXT
          + "        INSERT INTO SESSION.TEMPEMPL\n"
          + "        SELECT *\n"
          + "        FROM DSN8C10.EMP\n"
          + "        WHERE WORKDEPT='D11';\n"
          + "       END-EXEC.";

  private static final String INSERT4 =
      TEXT
          + "        INSERT INTO DSN8C10.EMP_PHOTO_RESUME\n"
          + "        (EMPNO, EMP_ROWID)\n"
          + "        VALUES (:HV_ENUM, DEFAULT);\n"
          + "       END-EXEC.";

  private static final String INSERT5 =
      TEXT
          + "        INSERT INTO DSN8C10.EMP_PHOTO_RESUME\n"
          + "        (EMPNO,EMP_ROWID)\n"
          + "         VALUES (:HV_ENUM,DEFAULT);\n"
          + "       END-EXEC.";

  private static final String INSERT6 =
      TEXT
          + "       INSERT INTO ABC INCLUDE (A SMALLINT, \n"
          + "       B SMALLINT) VALUEs TAD+1;\n"
          + "       END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(INSERT1, INSERT2, INSERT3, INSERT4, INSERT5, INSERT6);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql insert statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, List.of(), Map.of());
  }
}
