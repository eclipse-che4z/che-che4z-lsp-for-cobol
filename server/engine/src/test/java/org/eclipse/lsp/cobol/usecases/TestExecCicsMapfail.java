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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks the positive scenarios of using MAPFAIL in HANDLE CONDITION and IGNORE
 * CONDITION.
 */
class TestExecCicsMapfail {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*RESPONSE}   PIC s9(8) COMP-4 VALUE 0.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*10-EXIT}.\n"
          + "            EXIT.\n"
          + "       {#*NACT}.\n"
          + "           EXEC CICS IGNORE CONDITION MAPFAIL END-EXEC.\n"
          + "           EXEC CICS HANDLE CONDITION MAPFAIL({#10-EXIT}) END-EXEC.\n"
          + "           IF ({$RESPONSE} NOT = DFHRESP(MAPFAIL))\n"
          + "               PERFORM {#10-EXIT}\n"
          + "           END-IF.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
