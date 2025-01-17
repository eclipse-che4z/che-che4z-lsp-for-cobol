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

/** This test checks if sql EXECUTE IMMEDIATE statement works correctly. */
class TestSqlExecuteImmediateStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "             EXECUTE IMMEDIATE \"DELETE FROM DSN8C10.DEPT WHERE ABC = 1\" \n"
          + "           END-EXEC.\n";

  /*
  COMPILATION FAILS
  -----------------------
     000035                     EXEC SQL

 ==000035==> IGYPS0226-E DSNH104I DSNHSMS1 LINE 35 COL 75  ILLEGAL SYMBOL "'DELETE FROM
                         DSN8C10.DEPT WHERE ABC = 1'". SOME SYMBOLS THAT MIGHT BE LEGAL ARE: :

   000036                         EXECUTE IMMEDIATE
   000037                         'DELETE FROM DSN8C10.DEPT WHERE ABC = 1'
   000038                     END-EXEC.
   000039
   */
  @Disabled("Compilation Fails")
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

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
          + "           MOVE 'DELETE FROM DSN8C10.DEPT WHERE ABC = 1' \n"
          + "                   TO {$SQL-STMT-TEXT}.\n"
          + "\n"
          + "            EXEC SQL\n"
          + "              EXECUTE IMMEDIATE :{$SQL-STMT}\n"
          + "            END-EXEC.";

  @Test
  void validTest() {
    UseCaseEngine.runTest(VALID_TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
