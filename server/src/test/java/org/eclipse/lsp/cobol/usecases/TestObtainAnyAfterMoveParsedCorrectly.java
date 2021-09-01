/*
 * Copyright (c) 2021 Broadcom.
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

/** OBTAIN ANY after a number of MOVE statements should be parsed as a statement, not variables. */
class TestObtainAnyAfterMoveParsedCorrectly {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. VARIABLES.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*A1} PIC 9.\n"
          + "       01  {$*A2} PIC 9.\n"
          + "       01  {$*A3} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           IF {$A1} = ZERO\n"
          + "              MOVE 1 TO  {$A1}\n"
          + "              MOVE 1 TO  {$A2}\n"
          + "              OBTAIN ANY {$A3}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
