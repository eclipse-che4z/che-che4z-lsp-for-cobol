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
 * This test checks the positive scenarios of using CLEAR in HANDLE AID.
 * The valid usages are: CLEAR() and CLEAR(cics_label).
 */
class TestExecCicsHandleAidClear {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  {$*RESPONSE}                      PIC s9(8) COMP-4 VALUE 0.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*10-EXIT}.\n"
          + "            EXIT.\n"
          + "       {#*NACT}.\n"
          + "           EXEC CICS HANDLE AID CLEAR() END-EXEC.\n"
          + "           EXEC CICS HANDLE AID CLEAR({#10-EXIT}) END-EXEC.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
