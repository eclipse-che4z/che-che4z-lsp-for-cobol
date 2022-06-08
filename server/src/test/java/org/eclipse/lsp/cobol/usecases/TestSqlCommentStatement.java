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

/** This test checks if sql COMMENT statement works correctly. */
class TestSqlCommentStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n";

  private static final String COMMENT1 =
      TEXT
          + "             COMMENT ON TABLE DSN8C10.EMP\n"
          + "              IS 'REFLECTS 1ST QTR 81 REORG';\n"
          + "           END-EXEC.";

  private static final String COMMENT2 =
      TEXT
          + "             COMMENT ON COLUMN DSN8C10.DEPT.DEPTNO\n"
          + "             IS 'DEPARTMENT ID - UNIQUE';\n"
          + "           END-EXEC.";

  private static final String COMMENT3 =
      TEXT
          + "             COMMENT ON FUNCTION CHEM.ATOMIC_WEIGHT\n"
          + "             IS 'TAKES ATOMIC NUMBER AND GIVES ATOMIC WEIGHT';\n"
          + "           END-EXEC.";

  private static final String COMMENT4 =
      TEXT
          + "             COMMENT ON PROCEDURE BIOLOGY.OSMOSIS\n"
          + "             IS 'CALCULATIONS THAT MODEL OSMOSIS'\n"
          + "           END-EXEC.";

  private static final String COMMENT5 =
      TEXT
          + "           COMMENT ON ROLE ROLE1 \n"
          + "           IS 'Role defined for trusted context, ctx1';\n"
          + "           END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(COMMENT1, COMMENT2, COMMENT3, COMMENT4, COMMENT5);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql comment statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
