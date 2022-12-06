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
import org.junit.jupiter.api.Test;

/** This test checks if sql CLOSE statement works correctly. */
class TestSqlCloseStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*DNUM}  PIC A  VALUE 'GOWY'.\n"
          + "       01 {$*DNAME}  PIC A  VALUE 'GOWY'.\n"
          + "       01 {$*MNUM}  PIC A  VALUE 'GOWY'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "             DECLARE C1 CURSOR FOR\n"
          + "             SELECT DEPTNO, DEPTNAME, MGRNO\n"
          + "             FROM DSN8C10.DEPT\n"
          + "             WHERE ADMRDEPT = 'A00';\n"
          + "             OPEN C1;\n"
          + "             FETCH C1 INTO :{$DNUM}, :{$DNAME}, :{$MNUM};\n"
          + "         \n"
          + "             CLOSE C1;\n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
