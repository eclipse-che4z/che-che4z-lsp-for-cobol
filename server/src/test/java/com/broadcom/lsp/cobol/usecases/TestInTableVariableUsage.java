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

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that a table structure variable usage does not produce NPE. Here: MYTABLE-ENTRY
 * of Myrecord is a structure call, and Myrecord (TIndex) is a table call. Their combination should
 * be parsed correctly.
 */
class TestInTableVariableUsage {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*MYRECORD} group-usage NATIONAL.\n"
          + "           03 {$*TABLE-ITEMS-NUM}     PIC  S99 SIGN TRAILING SEPARATE.\n"
          + "           03 {$*MYTABLE}.\n"
          + "              05 {$*MYTABLE-ENTRY}    PIC  9 OCCURS 10 TIMES\n"
          + "                                  DEPENDING ON {$TABLE-ITEMS-NUM}\n"
          + "                                            OF {$Myrecord}\n"
          + "                                  INDEXED BY {$*TIndex}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "                 MOVE 0 to {$MYTABLE-ENTRY} of {$Myrecord} ({$TIndex}).";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
