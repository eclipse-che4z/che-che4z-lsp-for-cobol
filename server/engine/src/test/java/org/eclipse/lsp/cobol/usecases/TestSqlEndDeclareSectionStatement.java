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

/** This test checks if sql END DECLARE SECTION statement works correctly. */
class TestSqlEndDeclareSectionStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "           EXEC SQL BEGIN DECLARE SECTION\n"
          + "           END-EXEC.\n"
          + "       01 {$*WS-STUDENT-REC}.\n"
          + "           EXEC SQL INCLUDE {~STUDENT} END-EXEC.\n"
          + "           EXEC SQL END DECLARE SECTION\n"
          + "           END-EXEC.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 101 TO {$WS-STUDENT-ID} OF {$WS-STUDENT-REC}.\n"
          + "           MOVE 'Michealla' TO {$WS-STUDENT-NAME} OF {$WS-STUDENT-REC}.\n"
          + "           MOVE 'Broadcom' TO {$WS-STUDENT-ADDR} OF {$WS-STUDENT-REC}.\n";

  private static final String STUDENT_REC =
      "             05 {$*WS-STUDENT-ID} PIC 9(4).\n"
          + "             05 {$*WS-STUDENT-NAME} PIC X(25).\n"
          + "             05 {$*WS-STUDENT-ADDR} PIC X(25).\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText("STUDENT", STUDENT_REC)), ImmutableMap.of());
  }
}
