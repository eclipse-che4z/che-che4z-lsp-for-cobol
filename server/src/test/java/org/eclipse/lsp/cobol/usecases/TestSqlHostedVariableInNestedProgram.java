/*
 * Copyright (c) 2021 Broadcom.
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
import org.junit.jupiter.api.Test;

/** This test checks if sql hosted-variables works correctly in nested program. */
class TestSqlHostedVariableInNestedProgram {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SQL1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*LOCRES}  PIC X  VALUE 'A'.\n"
          + "       01 {$*LOCHIST}  PIC X  VALUE 'B'.\n"
          + "       01 {$*LOCPIC}  PIC X  VALUE 'C'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "             HOLD LOCATOR :{$LOCRES}, :{$LOCHIST}, :{$LOCPIC} \n"
          + "           END-EXEC.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'SQL2'.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*LOCRES2}  PIC X  VALUE 'A'.\n"
          + "       01 {$*LOCHIST2}  PIC X  VALUE 'B'.\n"
          + "       01 {$*LOCPIC2}  PIC X  VALUE 'C'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "             HOLD LOCATOR :{$LOCRES2}, :{$LOCHIST2}, :{$LOCPIC2} \n"
          + "           END-EXEC.\n"
          + "       END PROGRAM 'SQL2'.\n"
          + "       END PROGRAM 'SQL1'.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
