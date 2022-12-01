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

/** This test checks if sql SELECT INTO statement works correctly. */
class TestSqlSelectIntoStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*MYINTVAR}  PIC 9  VALUE '23'.\n"
          + "       01 {$*MAXSALRY}  PIC 9  VALUE '23'.\n"
          + "       01 {$*EMPREC}  PIC 9  VALUE '23'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL";
  private static final String SELECT_INTO1 =
      TEXT
          + "               SELECT MAX(SALARY)\n"
          + "                 INTO :{$MAXSALRY}\n"
          + "                 FROM DSN8C10.EMP;\n"
          + "               END-EXEC.";

  private static final String SELECT_INTO2 =
      TEXT
          + "             SELECT * INTO :{$EMPREC}\n"
          + "              FROM DSN8C10.EMP\n"
          + "              WHERE EMPNO = '528671'\n"
          + "           END-EXEC.";

  private static final String SELECT_INTO3 =
      TEXT
          + "            SELECT * INTO :{$EMPREC}\n"
          + "             FROM DSN8C10.EMP\n"
          + "             WHERE EMPNO = '528671'\n"
          + "             WITH RS USE AND KEEP EXCLUSIVE LOCKS\n"
          + "           END-EXEC.";

  private static final String SELECT_INTO4 =
      TEXT
          + "            SELECT INTCOL1 INTO \n"
          + "             MYINTARRAY1[INTCOL2+:{$MYINTVAR}+1]\n"
          + "             FROM T1\n"
          + "             WHERE INTCOL1 = MYINTARRAY1[INTCOL2]\n"
          + "           END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(SELECT_INTO1, SELECT_INTO2, SELECT_INTO3, SELECT_INTO4);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql select into statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
