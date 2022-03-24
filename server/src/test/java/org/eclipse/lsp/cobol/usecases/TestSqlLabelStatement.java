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

/** This test checks if sql LABEL statement works correctly. */
class TestSqlLabelStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String LABEL1 =
      TEXT
          + "           EXEC SQL\n"
          + "             LABEL ON COLUMN DSN8C10.DEPT.DEPTNO \n"
          + "             IS 'DEPARTMENT NUMBER' \n"
          + "           END-EXEC.\n";

  private static final String LABEL2 =
      TEXT
          + "           EXEC SQL\n"
          + "             LABEL ON DSN8C10.DEPT \n"
          + "             (MGRNO IS 'EMPLOYEE NUMBER FOR THE MANAGER',\n"
          + "             ADMRDEPT IS 'ADMINISTERING DEPARTMENT') \n"
          + "           END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(LABEL1, LABEL2);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql label  statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
