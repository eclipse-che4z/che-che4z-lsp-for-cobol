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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Complicated conditions should be parsed */
class TestConditions {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*A}   PIC 9.\n"
          + "       01  {$*B}   PIC 9.\n"
          + "       01  {$*C}   PIC 9.\n"
          + "       01  {$*D}   PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           IF NOT {$A} IS GREATER THAN {$B} OR {$A} + {$B} IS EQUAL TO {$C} AND {$D} IS POSITIVE\n"
          + "           DISPLAY 'something'.\n"
          + "           IF {$A} < 1 OR > 133 GO TO {#ABC}.\n"
          + "       {#*ABC}.\n"
          + "           IF {$A} = 191 OR 291\n"
          + "              AND ({$B} =\n"
          + "                120 OR 121 OR 170 OR 171 OR 180 OR 220 OR 221 OR 281)\n"
          + "           DISPLAY 'asdf'.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
