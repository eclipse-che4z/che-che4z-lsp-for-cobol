/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** Tests inline comment with just the comment tag doesn't throw error. */
public class TestInlineComments {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION. *>\n"
          + "       77 {$*VARNAME} USAGE INDEX.\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String TEXT2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION. *>no space after tag\n"
          + "       77 {$*VARNAME} USAGE INDEX.\n"
          + "       PROCEDURE DIVISION.\n";

  public static final String TEXT3 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. MIN.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*ABC}  PIC X.                         \n"
          + "       PROCEDURE DIVISION.                  \n"
          + "           DISPLAY \"TEST IN PROGRESS\" *> COMMENT '\n"
          + "           ADD 0 TO {$ABC}.\n";

  public static final String TEXT4 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*VAR1} PIC 9.\n"
          + "       01  {$*VAR2} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 TO   {$VAR1}.   *>'\" '  \"\n"
          + "           display \"Test in progress\"{.|1}*>'\n"
          + "           MOVE 0 TO   {$VAR2}.\n"
          + "           GOBACK.";

  @Test
  void testNoErrorWhenCommentTagNotFollowedByText() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testNoErrorWhenCommentTagisFollowedByTextWithoutSpace() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testFloatingCommentDoNotFlagErrorWhenCommentsHaveUnBalancedQuotes() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testFloatingCommentFlagsErrorWhenCommentIsNotPrecededBySpace() {
    UseCaseEngine.runTest(TEXT4, ImmutableList.of(), ImmutableMap.of("1", new Diagnostic(
            new Range(),
            "Missing blank before inline comment",
            Error,
            ErrorSource.PREPROCESSING.getText())));
  }
}
