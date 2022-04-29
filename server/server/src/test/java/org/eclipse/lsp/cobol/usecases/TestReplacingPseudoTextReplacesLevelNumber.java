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

import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * Test replacing with changing variable number returns a correct structure. Here, "01 AA-PARENT"
 * replaced by "05 EE-PARENT" that should change the structure to PARENT -> EE-PARENT
 */
class TestReplacingPseudoTextReplacesLevelNumber {

  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      01  {$*PARENT}.\n"
          + "5      COPY {~REPL} REPLACING == 01 AA-PARENT == by == 05  EE-PARENT ==\n"
          + "6                          ==AA-CHILD1==    BY ==EE-CHILD1==\n"
          + "7                          ==AA-CHILD2==    BY ==EE-CHILD2==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9      {#*MAINLINE}.\n"
          + "10         MOVE 0 TO {$EE-CHILD1} OF {$EE-PARENT} OF {$PARENT}.\n"
          + "11         GOBACK. ";

  private static final String REPL =
      "0      {01^05} {$* AA-PARENT^EE-PARENT} .\n"
          + "1        10  {$*AA-CHILD1^EE-CHILD1}      PIC 9.\n"
          + "2        10  {$*AA-CHILD2^EE-CHILD2}    PIC X(1).";

  private static final String REPL_NAME = "REPL";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(new CobolText(REPL_NAME, REPL)), ImmutableMap.of());
  }
}
