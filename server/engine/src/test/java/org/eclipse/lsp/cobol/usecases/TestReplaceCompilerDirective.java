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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.Collections;

/** Test the REPLACE compiler directive. */
class TestReplaceCompilerDirective {
  private static final String BASE =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n";

  private static final String TEXT =
      BASE
          + "       REPLACE ==:TAG:== BY ==Payroll==.\n"
          + "       01  {$*:TAG:^PAYROLL}.\n"
          + "            02  {$*:TAG:-WEEK^PAYROLL-WEEK}          PIC S99.\n"
          + "            02  {$*:TAG:-GROSS-PAY^PAYROLL-GROSS-PAY}     PIC S9(5)V99.\n"
          + "            02  {$*:TAG:-HOURS^PAYROLL-HOURS}         PIC S999  OCCURS 1 TO 52 TIMES\n"
          + "       DEPENDING ON {$:TAG:-WEEK^PAYROLL-WEEK} OF {$:TAG:^PAYROLL}.\n"
          + "       REPLACE OFF.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "           MOVE 0 to {$PAYROLL-WEEK}.";

  private static final String TEXT2 =
      BASE
          + "       REPLACE ==:TAG:== BY ==Payroll==.\n"
          + "       01  {$*:TAG:^PAYROLL}.\n"
          + "            02  {$*:TAG:-WEEK^PAYROLL-WEEK}          PIC S99.\n"
          + "            02  {$*:TAG:-GROSS-PAY^PAYROLL-GROSS-PAY}     PIC S9(5)V99.\n"
          + "            02  {$*:TAG:-HOURS^PAYROLL-HOURS}         PIC S999  OCCURS 1 TO 52 TIMES\n"
          + "       DEPENDING ON {$:TAG:-WEEK^PAYROLL-WEEK} OF {$:TAG:^PAYROLL}.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "           MOVE 0 to {$PAYROLL-WEEK}.\n"
          + "           REPLACE ==:TADA:== BY ==Payroll==.\n"
          + "           MOVE 0 to {$:TADA:-GROSS-PAY^PAYROLL-GROSS-PAY}.";

  private static final String TEXT3 =
      BASE
          + "       REPLACE ==:ABC:== BY ==XYZ==.\n"
          + "       01  {$*PARENT}.\n"
          + "5      COPY {~REPL} REPLACING ==CPYNAME== BY ==STRUCT1==.\n"
          + "       REPLACE ==:TAG:== BY ==Payroll==.\n"
          + "       01  {$*:TAG:^PAYROLL}.\n"
          + "            02  {$*:TAG:-WEEK^PAYROLL-WEEK}          PIC S99.\n"
          + "            02  {$*:TAG:-GROSS-PAY^PAYROLL-GROSS-PAY}     PIC S9(5)V99.\n"
          + "            02  {$*:TAG:-HOURS^PAYROLL-HOURS}         PIC S999  OCCURS 1 TO 52 TIMES\n"
          + "       DEPENDING ON {$:TAG:-WEEK^PAYROLL-WEEK} OF {$:TAG:^PAYROLL}.\n"
          + "       REPLACE OFF.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "\n"
          + "           MOVE 0 to {$PAYROLL-WEEK}.\n"
          + "           REPLACE ==:TADA:== BY ==Payroll==.\n"
          + "           MOVE 0 to {$:TADA:-GROSS-PAY^PAYROLL-GROSS-PAY}.\n"
          + "           MOVE 0 to {$XYZ-ID}.";

  private static final String TEXT4 =
      BASE
          + "       REPLACE LEADING ==TAG== BY ==Payroll==\n"
          + "                TRAILING ==NO== BY ==ID==.\n"
          + "       01  {$*TAG^PAYROLL}.\n"
          + "            02  {$*TAG-WEEK^PAYROLL-WEEK}          PIC S99.\n"
          + "            02  {$*TAG-GROSS-PAY^PAYROLL-GROSS-PAY}     PIC S9(5)V99.\n"
          + "            02  {$*TAG-GROSS-NO^PAYROLL-GROSS-ID}     PIC S9(5)V99.\n"
          + "            02  {$*TAG-HOURS^PAYROLL-HOURS}         PIC S999  OCCURS 1 TO 52 TIMES\n"
          + "       DEPENDING ON {$TAG-WEEK^PAYROLL-WEEK} OF {$TAG^PAYROLL}.\n"
          + "       REPLACE OFF.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "\n"
          + "           MOVE 0 to {$PAYROLL-WEEK}.\n"
          + "           MOVE 0 to {$PAYROLL-GROSS-ID}.";

  private static final String TEXT5 =
      BASE
          + "       REPLACE ==:ABC:== BY ==XYZ==.\n"
          + "       01  {$*PARENT}.\n"
          + "5      COPY {~REPL} REPLACING ==CPYNAME== BY ==STRUCT1==.\n"
          + "       REPLACE LEADING ==TAG== BY ==Payroll==.\n"
          + "       01  {$*TAG^PAYROLL}.\n"
          + "            02  {$*TAG-WEEK^PAYROLL-WEEK}          PIC S99.\n"
          + "            02  {$*TAG-GROSS-PAY^PAYROLL-GROSS-PAY}     PIC S9(5)V99.\n"
          + "            02  {$*TAG-HOURS^PAYROLL-HOURS}         PIC S999  OCCURS 1 TO 52 TIMES\n"
          + "       DEPENDING ON {$TAG-WEEK^PAYROLL-WEEK} OF {$TAG^PAYROLL}.\n"
          + "       REPLACE OFF.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "\n"
          + "           MOVE 0 to {$PAYROLL-WEEK}.\n"
          + "           REPLACE ==:TADA:== BY ==Payroll==.\n"
          + "           MOVE 0 to {$:TADA:-GROSS-PAY^PAYROLL-GROSS-PAY}.\n"
          + "           MOVE 0 to {$XYZ-ID}.\n"
          + "           MOVE 0 to {$ACC-ID}.\n"
          + "           MOVE 0 to {$TAG-STRUCT1}.\n"
          + "       END PROGRAM TESTREPL.\n"
          + " \n";

  private static final String REPL =
      "       05 {$*:ABC:-ID^XYZ-ID} PIC 9.\n" + "       COPY {~CPYNAME^STRUCT1}.";
  private static final String REPL_NAME = "REPL";

  private static final String REPL2 =
      "       05 {$*:ABC:-ID^XYZ-ID} PIC 9.\n"
          + "       REPLACE ==:ABC:== BY ==ACC==.\n"
          + "       05 {$*:ABC:-ID^ACC-ID} PIC 9.\n"
          + "       REPLACE OFF.\n"
          + "       COPY {~CPYNAME^STRUCT1}.";

  private static final String STRUCT1 = "       10 {$*TAG-STRUCT1} PIC 9.";
  private static final String STRUCT1_NAME = "STRUCT1";

  @Test
  void testReplaceCompilerDirective() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSubsequentReplaceSwitchOffPreviousReplace() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testLeadingAndTrailingReplaceClause() {
    UseCaseEngine.runTest(TEXT4, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testCopybookContentModifiedByReplace() {
    UseCaseEngine.runTest(
        TEXT3,
        ImmutableList.of(new CobolText(REPL_NAME, REPL), new CobolText(STRUCT1_NAME, STRUCT1)),
        ImmutableMap.of());
  }

  @Test
  // Replace off works correctly inside a copybook.
  void testReplaceWorksCompletelyInsideACopybook() {
    UseCaseEngine.runTest(
        TEXT3,
        ImmutableList.of(new CobolText(REPL_NAME, REPL2), new CobolText(STRUCT1_NAME, STRUCT1)),
        ImmutableMap.of());
  }

  @Test
  void testCorrectVariableDefinitionAfterReplace() {
    UseCaseEngine.runTest(
        TEXT5,
        ImmutableList.of(new CobolText(REPL_NAME, REPL2), new CobolText(STRUCT1_NAME, STRUCT1)),
        ImmutableMap.of(),
        Collections.emptyList(),
        AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
  }
}
