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

/** Check that DISPLAY works according to the specification */
class TestDisplayGramarRule {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*IAR} PIC X(8) SYNC.\n"
          + "        01 {$*CAL-RETURN-CODE} PIC X(4) VALUE ZERO.\n"
          + "        01 {$*PARENT}.\n"
          + "             05 {$*CHILD} PIC 9.\n"
          + "        PROCEDURE DIVISION. \n"
          + "           IF {$CAL-RETURN-CODE} NOT EQUAL ZERO\n"
          + "              DISPLAY '*********************************' UPON CONSOLE\n"
          + "              DISPLAY 'asdf' {$IAR}, {$CAL-RETURN-CODE}, 'asdfe'\n"
          + "                AT 'ase' UPON CONSOLE WITH NO ADVANCING\n"
          + "              DISPLAY {$IAR} AT {$CHILD} OF {$PARENT} NO ADVANCING\n"
          + "              CALL {%'sub'} USING {$IAR}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of("SUB"));
  }
}
