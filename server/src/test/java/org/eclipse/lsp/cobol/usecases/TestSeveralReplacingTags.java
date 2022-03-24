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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the REPLACING statement with several patterns specified does not cause any
 * syntax errors.
 */
class TestSeveralReplacingTags {

  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\r\n"
          + "1      PROGRAM-ID. TEST1.\r\n"
          + "2      DATA DIVISION.\r\n"
          + "3      WORKING-STORAGE SECTION.\r\n"
          + "4      01  {$*PARENT}.\r\n"
          + "5      COPY {~CUSTCOPY} REPLACING ==:TAG1:== BY ==ABCD==\r\n"
          + "6                              ==:TAG2:== BY ==XYZA==.\r\n"
          + "7      PROCEDURE DIVISION.\r\n"
          + "8      {#*MAINLINE}.\r\n"
          + "9          MOVE 1 TO {$XYZA-ID} OF {$ABCD-KEY} OF {$PARENT}.\r\n"
          + "10         GOBACK.";

  private static final String CUSTCOPY =
      "           05  {$*:TAG1:-KEY^ABCD-KEY}.\r\n"
          + "               10  {$*:TAG2:-ID^XYZA-ID}             PIC 9.\r\n";

  private static final String CUSTCOPY_NAME = "CUSTCOPY";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(new CobolText(CUSTCOPY_NAME, CUSTCOPY)), ImmutableMap.of());
  }
}
