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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that there is no error thrown when there are several COPY statements one by one
 * with the same name in different cases.
 */
class TestSameCopybooksWithDifferentCases {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.   COPY {~STRUCT1}.\n"
          + "       COPY {~Struct1}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 00 TO {$PARENT}.";

  private static final String STRUCT1 =
      "       02  {$*PARENT2}.\n"
          + "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n"
          + "           03  {$*CHILD2}         PIC 9   VALUE IS '1'.\n"
          + "           03  {$*CHILD3}         PIC 9   VALUE IS '2'.";

  private static final String CPY_NAME = "STRUCT1";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(new CobolText(CPY_NAME, STRUCT1)), Map.of());
  }
}
