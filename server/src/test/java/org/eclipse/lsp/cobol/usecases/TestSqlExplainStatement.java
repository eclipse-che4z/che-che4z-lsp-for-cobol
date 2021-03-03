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
import org.junit.jupiter.api.Test;

/** This test checks if sql EXPLAIN statement works correctly. */
class TestSqlExplainStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL\n"
          + "        EXPLAIN PLAN SET QUERYNO = 13\n"
          + "        FOR SELECT X.ACTNO, X.PROJNO, X.EMPNO, Y.JOB, Y.EDLEVEL\n"
          + "        FROM DSN8C10.EMPPROJACT X, DSN8C10.EMP Y\n"
          + "          WHERE X.EMPNO = Y.EMPNO\n"
          + "             AND X.EMPTIME > 0.5\n"
          + "             AND (Y.JOB = 'DESIGNER' OR Y.EDLEVEL >= 12)\n"
          + "          ORDER BY X.ACTNO, X.PROJNO;\n"
          + "       END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
