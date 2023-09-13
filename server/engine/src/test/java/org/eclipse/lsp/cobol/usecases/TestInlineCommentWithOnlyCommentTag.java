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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Tests inline comment with just the comment tag doesn't throw error. */
public class TestInlineCommentWithOnlyCommentTag {
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
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT} PIC 9.\n"
          + "       01  {$*CHILD1} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MAINLINE.\n"
          + "           MOVE 0 TO   {$CHILD1}   *>\"\"\" '.\n"
          + "           display \"Testing in progress\"\n"
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
  void testNoErrorWhenCommentTagisFollowedByUnBalancedQuotes() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }
}
