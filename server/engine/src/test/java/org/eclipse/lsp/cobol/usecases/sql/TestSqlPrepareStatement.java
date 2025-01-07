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

package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/** This test checks if sql PREPARE statement works correctly. */
class TestSqlPrepareStatement {

  /**
   * -----------------
   * COMPILE OUTPUT
   * ------------------
   *    000035                     EXEC SQL
   *
   *  ==000035==> IGYPS0226-E DSNH104I DSNHSMS1 LINE 35 COL 72  ILLEGAL SYMBOL "'INSERT INTO
   *                          DSN8C10.DEPT VALUES(?,?,?,?,?)'". SOME SYMBOLS THAT MIGHT BE LEGAL ARE: :
   *
   *    000036                     PREPARE DEPT_INSERT FROM
   *    000037                      'INSERT INTO DSN8C10.DEPT VALUES(?,?,?,?,?)'
   *    000038                     END-EXEC.
   *    000039
   */
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL PREPARE DEPT_INSERT FROM\n"
          + "            'INSERT INTO DSN8C10.DEPT VALUES(?,?,?,?,?)';\n"
          + "           END-EXEC.\n";

  public static final String VALID_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL INCLUDE {~SQLCA} END-EXEC.\n"
          + "       01 {$*SQL-STMT}.\n"
          + "           49 {$*SQL-STMT-LEN} PIC S9(4) COMP.\n"
          + "           49 {$*SQL-STMT-TEXT} PIC X(100).\n"
          + "       PROCEDURE DIVISION.\n"
          + "            MOVE 'INSERT INTO DSN8C10.DEPT VALUES(?,?,?,?,?)' \n"
          + "           TO {$SQL-STMT-TEXT}.\n"
          + "            EXEC SQL\n"
          + "                PREPARE sample FROM :{$SQL-STMT}\n"
          + "            END-EXEC.";

  @Disabled("Compilation error")
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void validTest() {
    UseCaseEngine.runTest(VALID_TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
