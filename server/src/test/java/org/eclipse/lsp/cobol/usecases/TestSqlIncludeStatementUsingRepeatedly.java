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

import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This test checks if sql include statement works correctly when there are several INCLUDE
 * statements.
 */
class TestSqlIncludeStatementUsingRepeatedly {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*SQLCA}.\n"
          + "       EXEC SQL INCLUDE {~STRUCT1} END-EXEC.\n"
          + "       EXEC SQL INCLUDE {~STRUCT2} END-EXEC.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 00 TO {$SQLCABC} OF {$SQLCA}.\n"
          + "           MOVE 00 TO {$SQLCODE} OF {$SQLCA}.";

  private static final String STRUCT1 = "       05 {$*SQLCABC}        PIC S9(9) BINARY.\n";
  private static final String STRUCT2 = "       05 {$*SQLCODE}        PIC S9(9) BINARY.\n";

  private static final String CPY_NAME1 = "STRUCT1";
  private static final String CPY_NAME2 = "STRUCT2";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(CPY_NAME1, STRUCT1), new CobolText(CPY_NAME2, STRUCT2)),
        ImmutableMap.of());
  }
}
