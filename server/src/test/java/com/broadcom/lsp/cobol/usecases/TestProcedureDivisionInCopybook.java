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
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This test checks the insertion of PROCEDURE DIVISION statement with a copybook doesn't produce
 * any error
 */
class TestProcedureDivisionInCopybook {
  private static final String TEXT =
      "0       IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. BKP92S1.        \n"
          + "2      DATA DIVISION.              \n"
          + "3      WORKING-STORAGE SECTION.    \n"
          + "4      01  {$*PARENT}.  COPY {~STRUCT1}.  \n"
          + "5      COPY {~PROCDIV}.\n"
          + "6      {#*MAINLINE}.\n"
          + "7          MOVE 1 TO {$CHILD1}.\n"
          + "8          GOBACK. ";

  private static final String STRUCT1 = "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n";
  private static final String PROCDIV = "       PROCEDURE DIVISION.";

  private static final String PROCDIV_NAME = "PROCDIV";
  private static final String STRUCT1_NAME = "STRUCT1";

  @Test
  void assertAnalysisResult() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(PROCDIV_NAME, PROCDIV), new CobolText(STRUCT1_NAME, STRUCT1)),
        ImmutableMap.of());
  }
}
