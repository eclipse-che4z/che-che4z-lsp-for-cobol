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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the REPLACING statement applied one by one will be collapsed to show only
 * the resulting replacement. Here, 'ABC' replaced by 'DEF', 'DEF' by 'GHI', and 'GHI' by 'JKL' in a
 * row, so the variable ABC-ID should turn into JKL-ID.
 */
class TestReplacingAppliedOneByOne {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01 {$*PARENT}.\r\n"
          + "       COPY {~CUSTCOPY} REPLACING ==:ABC:== BY ==:DEF:==\r\n"
          + "                               ==:DEF:== BY ==:GHI:==\r\n"
          + "                               ==:GHI:== BY ==JKL==.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       {#*MAINLINE}.\r\n"
          + "           MOVE 1 TO {$JKL-ID} OF {$JKL-KEY}.\r\n"
          + "           GOBACK.";

  private static final String CUSTCOPY =
      "           05  {$*:ABC:-KEY^JKL-KEY}.\r\n"
          + "               10  {$*:ABC:-ID^JKL-ID}             PIC 9.\r\n";
  private static final String CUSTCOPY_NAME = "CUSTCOPY";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText(CUSTCOPY_NAME, CUSTCOPY)), ImmutableMap.of());
  }
}
