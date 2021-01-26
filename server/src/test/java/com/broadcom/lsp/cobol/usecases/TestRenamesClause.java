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

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/** This test checks the positive scenario of RENAMES clause */
class TestRenamesClause {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTRENAME.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME1}.\n"
          + "          02 {$*VARNAME2} PIC 9."
          + "       66 {$*VARANME3} RENAMES {$VARNAME2}.\n"
          + "       01 {$*VARNAME4}.\n"
          + "          02 {$*VARNAME5} PIC 9.\n"
          + "          02 {$*VARNAME6} PIC 9.\n"
          + "          02 {$*VARNAME7}.\n"
          + "            03 {$*VARNAME8} PIC 9.\n"
          + "       66 {$*VARNAME9} RENAMES {$VARNAME5} THRU {$VARNAME8}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 TO {$VARNAME2} OF {$VARANME3}.\n"
          + "           MOVE 0 TO {$VARNAME7} OF {$VARNAME9}.\n"
          + "           MOVE 0 TO {$VARNAME8} OF {$VARNAME9}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
