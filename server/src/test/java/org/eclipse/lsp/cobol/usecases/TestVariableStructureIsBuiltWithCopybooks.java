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
 * This test case checks that there is no semantic error when a variable structure defined using a
 * copybook. Here COPYBOOK-CONTENT represents a copybook that has a variable definition with a level
 * 02. By idea this variable will be recognized as a child of PARENT variable. if not, there will be
 * an error thrown at CHILD OF PARENT statement.
 */
class TestVariableStructureIsBuiltWithCopybooks {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT1}.  COPY {~STRUCT}.\n"
          + "       01  {$*PARENT2}.  COPY {~STRUCT}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*MAINLINE}.\n"
          + "           MOVE 00 TO {$CHILD} OF {$PARENT1}.\n"
          + "           MOVE 00 TO {$CHILD} OF {$PARENT2}.\n"
          + "           GOBACK.";

  private static final String STRUCT = "       02 {$*CHILD} PIC X.";
  private static final String STRUCT_NAME = "STRUCT";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(new CobolText(STRUCT_NAME, STRUCT)), ImmutableMap.of());
  }
}
