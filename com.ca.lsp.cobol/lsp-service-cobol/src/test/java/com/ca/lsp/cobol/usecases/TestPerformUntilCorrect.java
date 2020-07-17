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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.Test;

import java.util.List;
import java.util.Map;

/** This use cases checks if "PERFORM" with the "UNTIL" sentence processed correctly. */
public class TestPerformUntilCorrect {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        01 {$*ID0}.\r\n"
          + "        01 {$*TAPARM1}.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "       {#*PROGA}.\r\n"
          + "           PERFORM WITH TEST BEFORE UNTIL {$ID0} = 0\r\n"
          + "             SUBTRACT 1 FROM {$TAPARM1}\r\n"
          + "             CALL 'ID1'\r\n"
          + "           END-PERFORM.";

  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
