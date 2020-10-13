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
 * This test checks the insertion of IDENTIFICATION DIVISION statement with a copybook doesn't
 * produce any error
 */
class TestIdentificationDivisionInCopybook {
  private static final String TEXT =
      "0      COPY {~IDDIV}.\n"
          + "1      PROGRAM-ID. BKP92S1.        \n"
          + "2      DATA DIVISION.              \n"
          + "3      WORKING-STORAGE SECTION.    \n"
          + "4      01  {$*PARENT}.  COPY {~STRUCT1}.  \n"
          + "5      PROCEDURE DIVISION.\n"
          + "6      {#*MAINLINE}.\n"
          + "7          MOVE 1 TO {$CHILD1}.\n"
          + "8          GOBACK. ";

  private static final String STRUCT1 = "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n";
  private static final String IDDIV = "       IDENTIFICATION DIVISION.";

  private static final String IDDIV_NAME = "IDDIV";
  private static final String STRUCT1_NAME = "STRUCT1";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(new CobolText(IDDIV_NAME, IDDIV), new CobolText(STRUCT1_NAME, STRUCT1)),
        Map.of());
  }
}
