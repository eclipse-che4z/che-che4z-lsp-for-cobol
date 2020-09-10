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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * Test replacing for keywords. Here, 'IDENTIFICATION' in the copybook should be replaced with
 * 'PROCEDURE', so the program will have a correct structure
 */
class TestReplacingKeywords {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.\n"
          + "            05 {$*CHILD1} PIC 9.\n"
          + "       COPY {~KEYW} REPLACING ==IDENTIFICATION== BY ==PROCEDURE==.\n"
          + "       {#*MAINLINE}.\n"
          + "           MOVE 0 TO {$CHILD1} OF {$PARENT}.\n"
          + "           GOBACK. ";

  private static final String KEYW = "       IDENTIFICATION DIVISION.\n";
  private static final String KEYW_NAME = "KEYW";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(new CobolText(KEYW_NAME, KEYW)), Map.of());
  }
}
