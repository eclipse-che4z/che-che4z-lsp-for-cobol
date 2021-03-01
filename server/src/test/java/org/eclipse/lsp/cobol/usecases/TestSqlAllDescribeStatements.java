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
 * This PARAMETERIZED test checks if all below sql DESCRIBE statements works correctly.
 *
 * <pre>
 * - DESCRIBE CURSOR
 * - DESCRIBE INPUT
 * - DESCRIBE OUTPUT
 * - DESCRIBE PROCEDURE
 * - DESCRIBE TABLE
 *
 * </pre>
 */
class TestSqlAllDescribeStatements {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL\n";

  private static final String DESCRIBE_CURSOR =
      TEXT + "        DESCRIBE CURSOR C1 INTO :sqlda1\n" + "       END-EXEC.";

  private static final String DESCRIBE_INPUT =
      TEXT
          + "        PREPARE STMT1_NAME FROM :STMT1_STR;\n"
          + "        DESCRIBE INPUT STMT1_NAME INTO :SQLDA;\n"
          + "       END-EXEC.";

  private static final String DESCRIBE_OUTPUT =
      TEXT
          + "        BEGIN DECLARE SECTION;\n"
          + "        END DECLARE SECTION;\n"
          + "        INCLUDE SQLDA;\n"
          + "        DECLARE DYN_CURSOR CURSOR FOR STMT1_NAME;\n"
          + "        PREPARE STMT1_NAME FROM :STMT1_STR;\n"
          + "        DESCRIBE STMT1_NAME INTO :SQLDA;\n"
          + "        DESCRIBE STMT1_NAME INTO :SQLDA;\n"
          + "        OPEN DYN_CURSOR;\n"
          + "        FETCH DYN_CURSOR USING DESCRIPTOR :SQLDA;\n"
          + "       END-EXEC.";

  private static final String DESCRIBE_PROCEDURE =
      TEXT
          + "        CONNECT TO SITE2;\n"
          + "        CALL SITE2.MYSCHEMA.P1;\n"
          + "        ASSOCIATE LOCATORS (:LOC1, :LOC2)\n"
          + "            WITH PROCEDURE :HV1;\n"
          + "       END-EXEC.";

  private static final String DESCRIBE_TABLE =
      TEXT + "        DESCRIBE TABLE MySchemaName.MyTableName INTO holder;\n" + "       END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        DESCRIBE_CURSOR, DESCRIBE_INPUT, DESCRIBE_OUTPUT, DESCRIBE_PROCEDURE, DESCRIBE_TABLE);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql describe statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
