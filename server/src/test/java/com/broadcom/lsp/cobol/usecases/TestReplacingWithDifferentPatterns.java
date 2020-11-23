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

import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks REPLACING statement can be used with pseudoText and literals . e.g. COPY SAMPLE
 * REPLACING KEY1 BY =="ABC"==. Here: REPLACING statement for REPL is CORRECT. Parsed Text and
 * literals can be mixed in replace statement.
 */
class TestReplacingWithDifferentPatterns {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.  \n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.\n"
          + "       COPY {~REPL} REPLACING ==TAG== BY DEF\n"
          + "                              DEF BY ==ABC==. \n";

  private static final String REPL_NAME = "REPL";
  private static final String NEW2 = "           05  {$*TAG}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(new CobolText(REPL_NAME, NEW2)), Map.of());
  }
}
