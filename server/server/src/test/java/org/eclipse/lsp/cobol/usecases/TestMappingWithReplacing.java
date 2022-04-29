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
 * This test verifies that the replacing statement changes the variable names in the given copybook
 * by the provided pattern. Here, :TAG: should be replaced with CSTOUT, so the copybook content
 * processed as CSTOUT-KEY and CSTOUT-ID, and those variables are available for "Go to Definition"
 * request.
 */
class TestMappingWithReplacing {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01  {$*PARENT}.\r\n"
          + "       COPY {~CUSTCOPY} REPLACING ==:TAG:== BY ==CSTOUT==.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       {#*MAINLINE}.\r\n"
          + "           MOVE 1 TO {$CSTOUT-ID} OF {$CSTOUT-KEY} OF {$PARENT}.\r\n"
          + "           GOBACK.";

  private static final String CUSTCOPY =
      "           05  {$*:TAG:-KEY^CSTOUT-KEY}.\r\n"
          + "               10  {$*:TAG:-ID^CSTOUT-ID}             PIC 9.\r\n";

  private static final String CUSTCOPY_NAME = "CUSTCOPY";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(new CobolText(CUSTCOPY_NAME, CUSTCOPY)), ImmutableMap.of());
  }
}
