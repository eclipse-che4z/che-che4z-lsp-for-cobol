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
 * Test REPLACING with literals applied only for full tokens. Here, applying "B BY VARC" should not
 * affect VARB
 */
class TestReplacingIdentifiersAppliedForFullTokens {
  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\r\n"
          + "1      PROGRAM-ID. TESTREPL.\r\n"
          + "2      DATA DIVISION.\r\n"
          + "3      WORKING-STORAGE SECTION.\r\n"
          + "4      COPY {~REPL} REPLACING A BY VARB\r\n"
          + "5                          B BY VARC\r\n"
          + "6                          C BY VARD\r\n"
          + "7                          D BY VARE.\r\n"
          + "8      PROCEDURE DIVISION.\r\n"
          + "9      {#*MAINLINE}.\r\n"
          + "10         MOVE 00 TO {$VARC} OF {$VARB}.\r\n"
          + "11         GOBACK. ";

  private static final String REPL =
      "0      01  {$*A^VARB}.\n"
          + "1      02  {$*B^VARC}    PIC S99.\r\n"
          + "2      02  {$*C^VARD}    PIC S9(5)V99.\r\n"
          + "3      02  {$*D^VARE}    PIC S99 OCCURS 1 TO 10 TIMES\r\n"
          + "4      DEPENDING ON {$B^VARC} OF {$A^VARB}.";

  private static final String REPL_NAME = "REPL";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText(REPL_NAME, REPL)), ImmutableMap.of());
  }
}
