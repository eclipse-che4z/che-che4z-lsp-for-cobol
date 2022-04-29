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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/** Test variable usage separated by Commas without Whitespaces */
class TestVariableUsageSeparatedByComma {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. programID.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*VAR-TEST1} PIC 9.\n"
          + "        01 {$*VAR-TEST2} PIC 9.\n"
          + "        01 {$*VAR-TEST3} PIC 9.\n"
          + "        01 {$*VAR-TEST4} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            CALL {%\"smth\"} USING {$VAR-TEST1},{$VAR-TEST2} BY VALUE {$VAR-TEST3}, \n"
          + "            BY CONTENT {$VAR-TEST4} BY CONTENT ADDRESS OF {$VAR-TEST4},TRUE.\n"
          + "       END PROGRAM programID.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of("SMTH"));
  }
}
