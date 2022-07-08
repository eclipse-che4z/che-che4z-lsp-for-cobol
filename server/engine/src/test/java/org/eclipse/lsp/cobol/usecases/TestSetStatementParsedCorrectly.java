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

/**
 * This test checks that the SET statement that by definition may accept multiple variables may
 * parsed correctly.
 */
class TestSetStatementParsedCorrectly {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*FIRSTNAME} PIC X(10).\n"
          + "       88 {$*MSG-NAME}       VALUE 'N'.\n"
          + "       01 {$*FNAMEML} PIC 9.\n"
          + "       01 {$*FNAMEMA} PIC 9.\n"
          + "       01 {$*DFHBMBRY} PIC 9.\n"
          + "       01 {$*DFHBMUNP} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*BB-050}.\n"
          + "           IF  {$FIRSTNAME} NOT ALPHABETIC\n"
          + "               SET {$MSG-NAME} TO TRUE\n"
          + "               MOVE -1 TO {$FNAMEML}\n"
          + "               MOVE {$DFHBMBRY} TO {$FNAMEMA}\n"
          + "           ELSE\n"
          + "               MOVE {$DFHBMUNP} TO {$FNAMEMA}\n"
          + "           END-IF.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
