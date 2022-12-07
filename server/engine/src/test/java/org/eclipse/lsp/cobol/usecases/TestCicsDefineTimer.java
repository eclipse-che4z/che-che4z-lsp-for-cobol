/*
 * Copyright (c) 2021 Broadcom.
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

/** This test checks that the DEFINE TIMER statements are parsed correctly */
class TestCicsDefineTimer {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-CICS.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*abc} PIC x VALUE 'a'.\n"
          + "       01 {$*def} PIC x VALUE 'b'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC CICS\n"
          + "           DEFINE TIMER({$abc}) EVENT({$def}) AT HOURS(15)\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS\n"
          + "           DEFINE TIMER({$abc}) EVENT({$def}) AT HOURS(15)\n"
          + "            ON YEAR(2001) MONTH(11) DAYOFMONTH(3)\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS\n"
          + "           DEFINE TIMER({$abc}) EVENT({$def}) AT HOURS(8)\n"
          + "            ON YEAR(1997) MONTH(1) DAYOFMONTH(1)\n"
          + "           END-EXEC.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
