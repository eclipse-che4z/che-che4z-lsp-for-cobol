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
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/**
 * This test checks the paragraph usages in CICS HANDLE statements work the same they as usual ones.
 * Here, 0930-DUPLICATE, 9999-ABEND-ROUTINE and 0990-RETURN-TO-MAIN-MENU are paragraphs and should
 * all present in the according semantic element lists. Go to definition should also work.
 */
class TestHandleConditionWorksWithParagraphs {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*DUPREC}               PIC X(80).\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*0100-START}.\n"
          + "           EXEC CICS HANDLE CONDITION\n"
          + "                {$DUPREC}({#0930-DUPLICATE})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS HANDLE CONDITION\n"
          + "                     ERROR({#9999-ABEND-ROUTINE})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS HANDLE AID\n"
          + "                PF3({#0990-RETURN-TO-MAIN-MENU})\n"
          + "           END-EXEC.\n"
          + "           EXEC CICS HANDLE CONDITION ERROR END-EXEC.\n"
          + "       {#*0930-DUPLICATE}.\n"
          + "           DISPLAY 'Duplicate'.\n"
          + "       {#*9999-ABEND-ROUTINE}.\n"
          + "           DISPLAY 'Abend'.\n"
          + "       {#*0990-RETURN-TO-MAIN-MENU}.\n"
          + "           DISPLAY 'RETURN'.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
