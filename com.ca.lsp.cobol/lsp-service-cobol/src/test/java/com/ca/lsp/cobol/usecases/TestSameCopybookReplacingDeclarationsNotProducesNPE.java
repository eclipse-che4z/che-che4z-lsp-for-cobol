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
 * This test verifies that several similar COPY statements with REPLACING does not produce
 * NullPointerException
 */
public class TestSameCopybookReplacingDeclarationsNotProducesNPE {

  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      01  {$*PARENT}.\n"
          + "5      COPY {~REPL} REPLACING ==:TAG:== BY ==ABC==.\n"
          + "6      COPY {~REPL} REPLACING ==:TAG:== BY ==ABC==.\n"
          + "7      PROCEDURE DIVISION.\n"
          + "8      {#*MAINLINE}.\n"
          + "9      MOVE 0 TO {$ABC-ID}.\n"
          + "10     GOBACK. ";

  private static final String REPL = "       05 {$*:TAG:-ID^ABC-ID} PIC 9.\n";
  private static final String REPL_NAME = "REPL";

  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, singletonList(new CobolText(REPL_NAME, REPL)), emptyMap());
  }
}
