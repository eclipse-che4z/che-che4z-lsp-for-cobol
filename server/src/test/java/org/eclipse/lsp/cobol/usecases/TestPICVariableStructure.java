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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** This test checks that PIC Clause with valid period usage. */
class TestPICVariableStructure {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*TEST1} PIC 9.\n"
          + "       01  {$*TEST2} PIC .9.\n"
          + "       01  {$*TEST2} PIC .9(1).\n"
          + "       01  {$*TEST3} PIC 9(1).9(2).\n"
          + "       01  {$*TEST4} PIC -.9(1).\n"
          + "       01  {$*TEST5} PIC .9+(1).\n"
          + "       01  {$*TEST6} PIC .Z(1).\n"
          + "       01  {$*TEST7} PIC ./(1).\n";

  private static final String TEXT2 =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID. SM208A.                                              \n"
          + "       ENVIRONMENT DIVISION.                                            \n"
          + "       DATA DIVISION.                                                   \n"
          + "       WORKING-STORAGE SECTION.                                         \n"
          + "       77  {$*DATA-J}                             PICTURE IS {W|1}WWWW.         \n"
          + "       77  {$*DATA-S}             PICTURE X(20) VALUE               \"OFFSET \n"
          + "      -             \"CONTINUATION \".     ";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSyntaxErrorWhenPICClausePassesWithWrongSyntax() {
    UseCaseEngine.runTest(
        TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'W' expected FINALCHARSTRING",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
