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
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/**
 * This test checks all the cases of the semantic check for duplicated statements in the variable
 * definition
 */
class TestDuplicatedStatementInDefinitionProduceErrors {
  private static final String BOILERPLATE =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n       ";
  private static final String DUPLICATED_PIC = "01 {$*VARNAME|1} PIC 9 PIC X.";
  private static final String DUPLICATED_VALUE = "01 {$*VARNAME|1} PIC 9 VALUE 0 VALUE 1 VALUE 2.";
  private static final String DUPLICATED_USAGE = "01 {$*VARNAME|1} USAGE DISPLAY USAGE POINTER.";
  private static final String DUPLICATED_OCCURS =
      "01 {$*VARNAME|1} OCCURS 12 TIMES PIC 9 occurs 0 to 512 times.";
  private static final String DUPLICATED_MIX =
      "01 {$*VARNAME|1|2|3} PIC 9 PIC X VALUE 0 VALUE 1 USAGE DISPLAY POINTER.";
  private static final String DUPLICATED_USAGE_WITHOUT_TOKEN = "01 {$*VARNAME|1} DISPLAY POINTER.";

  private static final Diagnostic DIAGNOSTIC_PIC =
      new Diagnostic(
          new Range(),
          "A duplicate PICTURE clause was found in a data description entry",
          DiagnosticSeverity.Error,
          ERROR.getText());

  private static final Diagnostic DIAGNOSTIC_VALUE =
      new Diagnostic(
          new Range(),
          "A duplicate VALUE clause was found in a data description entry",
          DiagnosticSeverity.Error,
          ERROR.getText());

  private static final Diagnostic DIAGNOSTIC_USAGE =
      new Diagnostic(
          new Range(),
          "A duplicate USAGE clause was found in a data description entry",
          DiagnosticSeverity.Error,
          ERROR.getText());

  private static final Diagnostic DIAGNOSTIC_OCCURS =
      new Diagnostic(
          new Range(),
          "A duplicate OCCURS clause was found in a data description entry",
          DiagnosticSeverity.Error,
          ERROR.getText());

  @Test
  void testDuplicatedPicProducesError() {
    UseCaseEngine.runTest(
        BOILERPLATE + DUPLICATED_PIC, ImmutableList.of(), ImmutableMap.of("1", DIAGNOSTIC_PIC));
  }

  @Test
  void testDuplicatedValueProducesError() {
    UseCaseEngine.runTest(
        BOILERPLATE + DUPLICATED_VALUE, ImmutableList.of(), ImmutableMap.of("1", DIAGNOSTIC_VALUE));
  }

  @Test
  void testDuplicatedUsageProducesError() {
    UseCaseEngine.runTest(
        BOILERPLATE + DUPLICATED_USAGE, ImmutableList.of(), ImmutableMap.of("1", DIAGNOSTIC_USAGE));
  }

  @Test
  void testDuplicatedOccursProducesError() {
    UseCaseEngine.runTest(
        BOILERPLATE + DUPLICATED_OCCURS,
        ImmutableList.of(),
        ImmutableMap.of("1", DIAGNOSTIC_OCCURS));
  }

  @Test
  void testDuplicatedMixedStatementsProduceError() {
    UseCaseEngine.runTest(
        BOILERPLATE + DUPLICATED_MIX,
        ImmutableList.of(),
        ImmutableMap.of("1", DIAGNOSTIC_PIC, "2", DIAGNOSTIC_VALUE, "3", DIAGNOSTIC_USAGE));
  }

  @Test
  void testDuplicatedStatementsWithoutTheUsageTokenProduceCorrectError() {
    UseCaseEngine.runTest(
        BOILERPLATE + DUPLICATED_USAGE_WITHOUT_TOKEN,
        ImmutableList.of(),
        ImmutableMap.of("1", DIAGNOSTIC_USAGE));
  }
}
