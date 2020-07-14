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
import org.junit.Test;

import static java.util.Collections.emptyMap;
import static java.util.Collections.singletonList;

/**
 * Test REPLACING with literals applied only for full tokens. Here, applying "B BY VARC" should not
 * affect VARB
 */
public class TestReplacingIdentifiersAppliedForFullTokens {
  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      COPY {~REPL} REPLACING A BY VARB\n"
          + "5                          B BY VARC\n"
          + "6                          C BY VARD\n"
          + "7                          D BY VARE.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9      {#*MAINLINE}.\n"
          + "10     MOVE 00 TO {$VARC} OF {$VARB}.\n"
          + "11     GOBACK. ";

  private static final String REPL =
      "0      01  {$*A^VARB}.\n"
          + "1      02  {$*B^VARC}    PIC S99.\n"
          + "2      02  {$*C^VARD}    PIC S9(5)V99.\n"
          + "3      02  {$*D^VARE}    PIC S99 OCCURS 1 TO 10 TIMES\n"
          + "4      DEPENDING ON {$B^VARC} OF {$A^VARB}.";

  private static final String REPL_NAME = "REPL";

  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, singletonList(new CobolText(REPL_NAME, REPL)), emptyMap());
  }
}
