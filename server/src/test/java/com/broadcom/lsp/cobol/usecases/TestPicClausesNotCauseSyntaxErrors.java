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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/** This test checks PIC clauses don't cause any syntax errors. */
class TestPicClausesNotCauseSyntaxErrors {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.\n"
          + "       COPY {~REPL} REPLACING ==TAG== BY ==ABC==.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*MAINLINE}.\n"
          + "           MOVE 0 TO {$ABC-ONE} OF {$PARENT}.\n"
          + "           MOVE 0 TO {$ABC-TWO} OF {$PARENT}.\n"
          + "           MOVE 0 TO {$ABC-THREE} OF {$PARENT}.\n"
          + "           MOVE 0 TO {$ABC-FOUR} OF {$PARENT}.\n"
          + "           MOVE 0 TO {$ABC-FIVE} OF {$PARENT}.\n"
          + "           GOBACK. ";

  private static final String REPL =
      "       05 {$*TAG-ONE^ABC-ONE} PIC 9(03)V99.\n"
          + "       05 {$*TAG-TWO^ABC-TWO} PIC X(20).\n"
          + "       05 {$*TAG-THREE^ABC-THREE} PIC X VALUE 'N'.\n"
          + "       05 {$*TAG-FOUR^ABC-FOUR} OCCURS 3 TIMES.\n"
          + "       10 FILLER PIC X(10) VALUE '1000000000'. \n"
          + "       05 {$*TAG-FIVE^ABC-FIVE} PIC 9(6)V9(2).\n";
  private static final String REPL_NAME = "REPL";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(new CobolText(REPL_NAME, REPL)), ImmutableMap.of());
  }
}
