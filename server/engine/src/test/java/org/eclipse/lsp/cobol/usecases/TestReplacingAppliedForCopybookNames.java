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

import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * Test REPLACING statement changes nested copybook names. Here, CPYNAME should be replaced by
 * STRUCT1, so this copybook used.
 */
class TestReplacingAppliedForCopybookNames {

  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "4      01  {$*PARENT}.\n"
          + "5      COPY {~REPL} REPLACING ==CPYNAME== BY ==STRUCT1==.\n"
          + "6      PROCEDURE DIVISION.\n"
          + "7      {#*MAINLINE}.\n"
          + "8          MOVE 0 TO {$ABC-ID}.\n"
          + "9          GOBACK. ";

  private static final String REPL =
      "       05 {$*ABC-ID} PIC 9.\n" + "       COPY {~CPYNAME^STRUCT1}.";
  private static final String REPL_NAME = "REPL";

  private static final String STRUCT1 = "       10 {$*TAG-STRUCT1} PIC 9.";
  private static final String STRUCT1_NAME = "STRUCT1";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL), new CobolText(STRUCT1_NAME, STRUCT1)),
        ImmutableMap.of());
  }
}
