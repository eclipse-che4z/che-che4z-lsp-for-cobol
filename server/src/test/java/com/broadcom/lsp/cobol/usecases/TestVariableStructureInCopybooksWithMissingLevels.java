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

/**
 * This test verifies that the variable structure can be built correctly with copybooks and that
 * error not thrown if there are no ambiguous definitions, even with skipped hierarchical levels on
 * usage.
 */
class TestVariableStructureInCopybooksWithMissingLevels {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.   COPY {~STRUCT}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 00 TO {$CHILD1} OF {$PARENT}.";

  private static final String STRUCT =
      "       02  {$*PARENT2}.\n"
          + "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n"
          + "           03  {$*CHILD2}         PIC 9   VALUE IS '1'.\n"
          + "           03  {$*CHILD3}         PIC 9   VALUE IS '2'.";
  private static final String STRUCT_NAME = "STRUCT";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(new CobolText(STRUCT_NAME, STRUCT)), ImmutableMap.of());
  }
}
