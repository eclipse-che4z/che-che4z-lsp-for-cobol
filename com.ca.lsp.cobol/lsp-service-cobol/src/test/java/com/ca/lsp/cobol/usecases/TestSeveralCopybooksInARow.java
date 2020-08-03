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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/** This test checks that several COPY statements in a row won't cause mapping errors. */
public class TestSeveralCopybooksInARow {

  private static final String DOCUMENT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       COPY {~STRUC1}.\r\n"
          + "       COPY {~STRUC2}.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       {#*MAIN-LINE}.\r\n"
          + "           MOVE 00 TO {$CHILD1} OF {$PARENT1}.\r\n"
          + "           MOVE 00 TO {$CHILD2} OF {$PARENT2}.\r\n"
          + "           GOBACK.";

  private static final String STRUC1 =
      "         01  {$*PARENT1}.\r\n" + "           02  {$*CHILD1}         PIC 99.\r\n";

  private static final String STRUC1_NAME = "STRUC1";

  private static final String STRUC2 =
      "         01  {$*PARENT2}.\r\n" + "           02  {$*CHILD2}         PIC 99.\r\n";

  private static final String STRUC2_NAME = "STRUC2";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        DOCUMENT,
        List.of(new CobolText(STRUC1_NAME, STRUC1), new CobolText(STRUC2_NAME, STRUC2)),
        Map.of());
  }
}
