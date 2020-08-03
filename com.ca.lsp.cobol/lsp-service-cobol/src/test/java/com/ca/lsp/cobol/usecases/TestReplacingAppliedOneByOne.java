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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that the REPLACING statement applied one by one will be collapsed to show only
 * the resulting replacement. Here, 'ABC' replaced by 'DEF', 'DEF' by 'GHI', and 'GHI' by 'JKL' in a
 * row, so the variable ABC-ID should turn into JKL-ID.
 */
public class TestReplacingAppliedOneByOne {

  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\r\n"
          + "1      PROGRAM-ID. TEST1.\r\n"
          + "2      DATA DIVISION.\r\n"
          + "3      WORKING-STORAGE SECTION.\r\n"
          + "4      COPY {~CUSTCOPY} REPLACING ==ABC== BY ==DEF==\r\n"
          + "5                              ==DEF== BY ==GHI==\r\n"
          + "6                              ==GHI== BY ==JKL==.\r\n"
          + "7      PROCEDURE DIVISION.\r\n"
          + "8      {#*MAINLINE}.\r\n"
          + "9          MOVE 1 TO {$JKL-ID} OF {$JKL-KEY}.\r\n"
          + "10         GOBACK.";

  private static final String CUSTCOPY =
      "           05  {$*ABC-KEY^JKL-KEY}.\r\n"
          + "               10  {$*ABC-ID^JKL-ID}             PIC 9.\r\n";
  private static final String CUSTCOPY_NAME = "CUSTCOPY";

  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, List.of(new CobolText(CUSTCOPY_NAME, CUSTCOPY)), Map.of());
  }
}
