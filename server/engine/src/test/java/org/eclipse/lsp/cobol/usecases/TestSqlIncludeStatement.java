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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks if sql include statement works correctly. */
class TestSqlIncludeStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*SQLCA}.\n"
          + "       EXEC SQL INCLUDE {~STRUCT1} END-EXEC.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 00 TO {$SQLCABC} OF {$SQLCA}.";

  private static final String STRUCT = "       05 {$*SQLCABC}        PIC S9(9) BINARY.\n";

  private static final String CPY_NAME = "STRUCT1";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText(CPY_NAME, STRUCT)), ImmutableMap.of());
  }
}
