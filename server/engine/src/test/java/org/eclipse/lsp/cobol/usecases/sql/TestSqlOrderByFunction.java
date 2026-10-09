/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that a DB2 cursor with a function call in the ORDER BY clause is parsed. */
class TestSqlOrderByFunction {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SQLCRSR.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "            DECLARE C1 CURSOR FOR\n"
          + "                   SELECT COL1\n"
          + "                      ,COL2\n"
          + "                   FROM TABLE1\n"
          + "                   ORDER BY UPPER(COL2) ASC\n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
