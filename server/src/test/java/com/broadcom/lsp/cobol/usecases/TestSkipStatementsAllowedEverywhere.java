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

import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This test checks that SKIP1, SKIP2 and SKIP3 are allowed everywhere and do not produce syntax
 * errors.
 */
class TestSkipStatementsAllowedEverywhere {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        SKIP1\n"
          + "        PROGRAM-ID. TEST1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*VARNAME} PIC 9.\n"
          + "        SKIP1\n"
          + "        PROCEDURE DIVISION.\n"
          + "        {#*PROCB}.\n"
          + "            MOVE 0 TO {$VARNAME}\n"
          + "        SKIP2.\n"
          + "            MOVE 0 TO {$VARNAME}.\n"
          + "        SKIP3\n";

  @Test
  void assertCopybookProcessingModeNotChangesLogic() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), CopybookProcessingMode.DISABLED);
  }
}
