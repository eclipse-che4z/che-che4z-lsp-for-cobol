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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import org.eclipse.lsp.cobol.core.model.ErrorStage;

/** This test checks that redefined variable has the same group */
class TestVariableRedefineSameGroup {
  private static final String REDEFINES_SAME_GROUP =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.      EMPPROJ.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION. \n"
          + "         WORKING-STORAGE SECTION.\n"
          + "          01 {$*WS-DESCRIPTION1}.\n"
          + "              05 {$*WS-DATE1} PIC X(20).\n"
          + "          01 {$*WS-DESCRIPTION2}.\n"
          + "               05 {$*WS-DATE2} REDEFINES {WS-DATE1|1} PIC 9(8).";

  private static final String REDEFINE_SAME_GROUP_2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.      EMPPROJ.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION. \n"
          + "         WORKING-STORAGE SECTION.\n"
          + "         COPY {~HOWDY} REPLACING == 'XXX' == BY == NEW ==.\n"
          + "       PROCEDURE DIVISION.";

  private static final String REDEFINE_SAME_GROUP_3 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.      EMPPROJ.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION. \n"
          + "         WORKING-STORAGE SECTION.\n"
          + "       01  {$*FILE-STATUS-CODES}.\n"
          + "           05  {$*IFCODE}           PIC X(2).\n"
          + "               88 {$*CODE-READ}     VALUE SPACES.\n"
          + "               88 {$*NO-MORE-DATA}  VALUE \"10\".\n"
          + "\n"
          + "           05  {$*REGULAR-EMPLOYEE}.\n"
          + "               10 {$*LOCATION} PICTURE A(8).\n"
          + "               10 {$*GRADE} PICTURE X(4).\n"
          + "               10 {$*SEMI-MONTHLY-PAY} PICTURE 9999V99.\n"
          + "               10 {$*WEEKLY-PAY} REDEFINES {$SEMI-MONTHLY-PAY} PICTURE 999V999.\n"
          + "\n"
          + "           05  {$*TEMPORARY-EMPLOYEE} REDEFINES {$REGULAR-EMPLOYEE}.\n"
          + "               10 {$*LOCATION} PICTURE A(8).\n"
          + "               10 FILLER PICTURE X(6).\n"
          + "               10 {$*HOURLY-PAY} PICTURE 99V99.\n"
          + "       PROCEDURE DIVISION.";

  private static final String REDEFINE_SAME_GROUP_4 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.      EMPPROJ.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION. \n"
          + "         WORKING-STORAGE SECTION.\n"
          + "       01  {$*FILE-STATUS-CODES}.\n"
          + "           05  {$*IFCODE}           PIC X(2).\n"
          + "               88 {$*CODE-READ}     VALUE SPACES.\n"
          + "               88 {$*NO-MORE-DATA}  VALUE \"10\".\n"
          + "\n"
          + "           05  {$*REGULAR-EMPLOYEE}.\n"
          + "               10 {$*LOCATION} PICTURE A(8).\n"
          + "               10 {$*GRADE} PICTURE X(4).\n"
          + "               10 {$*SEMI-MONTHLY-PAY} PICTURE 9999V99.\n"
          + "               66 {$*VAR-TRY} RENAMES {$SEMI-MONTHLY-PAY}.\n"
          + "\n"
          + "           05  {$*TEMPORARY-EMPLOYEE|1} REDEFINES {REGULAR-EMPLOYEE|2}.\n"
          + "               10 {$*LOCATION} PICTURE A(8).\n"
          + "               10 FILLER PICTURE X(6).\n"
          + "               10 {$*HOURLY-PAY} PICTURE 99V99.\n"
          + "       PROCEDURE DIVISION.";

  private static final String REDEFINES_SAME_GROUP_5 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.      EMPPROJ.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION. \n"
          + "         WORKING-STORAGE SECTION.\n"
          + "       01 filler.\n"
          + "           03 {$*group-1}.\n"
          + "             05 {$*dataname-1} pic x.\n"
          + "           02 {$*group-2} redefines {$group-1}.\n"
          + "             03 {$*dataname-2} pic 9.";

  private static final String HOWDY =
      "       01  {$*'XXX'-BALANCE-DUE^NEW-BALANCE-DUE}.\n"
          + "           03 {$*SEGX-AMANOD}              PIC X(6).\n"
          + "           03 {$*SEGX-SEQ}                 PIC X(2).\n"
          + "           03 {$*SEGX-CURRENT-BALANCE-DUE} PIC 9(9)V99 COMP.\n"
          + "           03 {$*SEGX-OVERDUE-IND}         PIC X(1).\n"
          + "           03 {$*SEGX-CUSTOMER-STATUS}     PIC X(10).\n"
          + "           66 {$*SED} RENAMES {$SEGX-CUSTOMER-STATUS}.\n"
          + "       01  {$*test} REDEFINES {$'XXX'-BALANCE-DUE^NEW-BALANCE-DUE} PIC x(120).";
  private static final String HOWDY_NAME = "HOWDY";

  @Test
  void testError() {
    UseCaseEngine.runTest(
        REDEFINES_SAME_GROUP,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "REDEFINES line must immediately follow redefined item: WS-DATE1",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText())));
  }

  @Test
  void testVarRedefineInCopyBook() {
    UseCaseEngine.runTest(
        REDEFINE_SAME_GROUP_2,
        ImmutableList.of(new CobolText(HOWDY_NAME, HOWDY)),
        ImmutableMap.of());
  }

  @Test
  void testRedefineForGroupLevel() {
    UseCaseEngine.runTest(REDEFINE_SAME_GROUP_3, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testRedefineForGroupLevelWithRename() {
    UseCaseEngine.runTest(
        REDEFINE_SAME_GROUP_4,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "TEMPORARY-EMPLOYEE: Only 01, 66 and 77 level numbers are allowed at the highest level",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "REDEFINES line must immediately follow redefined item: REGULAR-EMPLOYEE",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText())));
  }

  @Test
  void testRedefineForSameGroupWithDiffLevelNumber() {
    UseCaseEngine.runTest(REDEFINES_SAME_GROUP_5, ImmutableList.of(), ImmutableMap.of());
  }
}
