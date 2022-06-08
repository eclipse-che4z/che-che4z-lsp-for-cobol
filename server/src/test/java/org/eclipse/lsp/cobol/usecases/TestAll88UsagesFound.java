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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that all the usages of 88-level variables found. */
class TestAll88UsagesFound {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WORK-AREA}.\n"
          + "           05 {$*D4-DATE}.\n"
          + "               10 {$*MONTH}            PIC 9(02).\n"
          + "                  88 {$*MONTH-28-29}          VALUE 2.\n"
          + "              10  {$*YEAR}             PIC 9(04).\n"
          + "                 88 {$*VALID-YEAR}    VALUES 1990 THRU 2050.\n"
          + "              10  {$*YEAR-X-TYP}.\n"
          + "                 15 {$*YEAR-JJ}      PIC 9(02).\n"
          + "                     88 {$*YEAR-NOT-A-LEAP} VALUES 01 03 05 07 09.\n"
          + "           05 {$*DIVIDE-WORK}.\n"
          + "              10 {$*REST}                    PIC S9(02).\n"
          + "                 88 {$*NOT-A-LEAP-YEAR}     VALUE 1 2 3.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           IF  {$MONTH-28-29}\n"
          + "           THEN\n"
          + "               EVALUATE TRUE\n"
          + "                   WHEN {$YEAR-NOT-A-LEAP} IN {$YEAR-JJ}\n"
          + "                         SET {$NOT-A-LEAP-YEAR} IN {$REST} TO TRUE\n"
          + "               END-EVALUATE\n"
          + "           END-IF.\n"
          + "           IF NOT {$MONTH-28-29} OF {$WORK-AREA}\n"
          + "           THEN\n"
          + "               DISPlAY 'smth'\n"
          + "           END-IF.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
