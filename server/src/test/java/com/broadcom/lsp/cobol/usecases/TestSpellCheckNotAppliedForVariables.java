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
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * Test a variable with name that seems like a misspelled keyword doesn't produce a warning. Here:
 * "STAT" has a short Levenshtein distance to "STATE" and "TITLEO" is close to "TITLE"
 */
class TestSpellCheckNotAppliedForVariables {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*STAT} PIC 9.\n"
          + "       01  {$*TITLEO} PIC 9.\n"
          + "       PROCEDURE DIViSION. \n"
          + "       {#*DATEO}. \n"
          + "           MOVE 0 TO {$STAT}. \n"
          + "           MOVE 0 TO {$TITLEO}. \n"
          + "           GOBACK.  ";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
