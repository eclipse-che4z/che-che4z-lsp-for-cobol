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

/** This test checks that there are no errors on the "SKIP2" statement. */
class TestSkipStatement {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. SKIP_TEST.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*ID0} PIC 9.\n"
          + "        01 {$*TAPARM1} PIC 9.\n"
          + "        PROCEDURE DIVISION.\n"
          + "       {#*PROGA}.\n"
          + "       SKIP1\n"
          + "           PERFORM WITH TEST BEFORE UNTIL {$ID0} = 0\n"
          + "             SUBTRACT 1 FROM {$TAPARM1}\n"
          + "             CALL {%'ID1'}\n"
          + "           END-PERFORM.\n"
          + "        SKIP2.\n"
          + "        {#*PROGB}.\n"
          + "            EXIT.\n"
          + "        EJECT";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of(), List.of("ID1"));
  }
}
