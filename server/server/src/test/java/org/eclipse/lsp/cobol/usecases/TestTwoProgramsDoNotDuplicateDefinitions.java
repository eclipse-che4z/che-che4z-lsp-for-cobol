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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/** This test checks that two programs in one file do not duplicate the defined variables. */
class TestTwoProgramsDoNotDuplicateDefinitions {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'TEST1'.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME1}.\n"
          + "          05 {$*VARNAME2} OCCURS 5 TIMES\n"
          + "             ASCENDING KEY IS {$VARNAME3}\n"
          + "             INDEXED BY {$*VARNAME4}.\n"
          + "             10 {$*VARNAME3} PIC X(4).\n"
          + "       PROCEDURE DIVISION.\n"
          + "       END PROGRAM 'TEST1'.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. 'TEST2'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       END PROGRAM 'TEST2'.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
