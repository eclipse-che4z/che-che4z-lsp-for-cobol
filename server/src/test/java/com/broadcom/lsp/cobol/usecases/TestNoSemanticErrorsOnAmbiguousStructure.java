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

/**
 * Test there are no semantic errors produced on variable structure calls with similar intermediate
 * structure. Here: MOM and DAD have similar 02-level nested variables, and the language engine
 * should not be confused with it.
 */
class TestNoSemanticErrorsOnAmbiguousStructure {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*MOM}.\n"
          + "            02 {$*CHILD1} PIC 9.\n"
          + "            02 {$*CHILD2} PIC 9.\n"
          + "       01 {$*DAD}.\n"
          + "            02 {$*CHILD1} PIC 9.\n"
          + "            02 {$*CHILD2}.\n"
          + "                  04 {$*NEPHEW} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE {$CHILD2} OF {$MOM} TO {$NEPHEW} OF {$CHILD2} OF {$DAD}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
