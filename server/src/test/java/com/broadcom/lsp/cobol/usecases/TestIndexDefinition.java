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
 * This test checks if the index definition does not produce the semantic error. Here: INDEXED BY
 * SUB1 should act as a definition for SUB1 variable.
 */
class TestIndexDefinition {

  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*OVERLIMIT}.\n"
          + "           03 FILLER OCCURS 30 TIMES INDEXED BY {$*SUB1}.\n"
          + "           05 {$*OL-ACCT-NO} PIC X(8).\n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           SET {$SUB1} TO 1.\n"
          + "           MOVE 'ABC' TO {$OL-ACCT-NO}({$SUB1}).\n"
          + "       End program ProgramId.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
