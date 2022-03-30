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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that statements may be terminated by the semicolon */
class TestStatementTerminationWithSemicolons {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       MAP SECTION.\n"
          + "           MAP {$*MC}.\n"
          + "       working-storage section.\n"
          + "       01 {$*CARRIAGE-CONTROL} PIC 9.\n"
          + "       01 {$*LINE-SPACING} PIC 9.\n"
          + "       01 {$*REPORT-TITLE} PIC X(100).\n"
          + "       01 {$*PROGRAM-WORK-FIELDS}.\n"
          + "             88  {$*NEW-PAGE}      VALUE 30.\n"
          + "          02 {$*PAGE-COUNT}        PIC 9(3).\n"
          + "          02 {$*ITENUM}           PIC X(7).\n"
          + "       procedure division.\n"
          + "           CALL {%'spacing'} USING {$LINE-SPACING};\n"
          + "       {#*WRITE-REPORT-LINE}.\n"
          + "           IF {$NEW-PAGE}\n"
          + "              PERFORM {#WRITE-HEADER};\n"
          + "              MOVE 2 TO {$LINE-SPACING}.\n"
          + "           MOVE {$LINE-SPACING} TO {$CARRIAGE-CONTROL}.\n"
          + "       {#*WRITE-HEADER}.\n"
          + "           MOVE {$LINE-SPACING} TO {$CARRIAGE-CONTROL};\n"
          + "           ADD 1 TO {$PAGE-COUNT};\n"
          + "           MOVE 'TITLE' TO {$REPORT-TITLE}.\n"
          + "           IF {$NEW-PAGE}\n"
          + "              MODIFY MAP {$MC} FOR DFLD {$ITENUM} EDIT ERROR\n"
          + "              CALL {%'spacing'} USING {$LINE-SPACING};\n"
          + "              MOVE '  '  TO {$LINE-SPACING}\n"
          + "           END-IF.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of("SPACING"), IdmsBase.getAnalysisConfig());
  }
}
