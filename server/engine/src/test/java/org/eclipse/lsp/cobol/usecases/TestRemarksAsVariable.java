/*
 * Copyright (c) 2021 Broadcom.
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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that the REMARKS token is allowed as a variable name. */
class TestRemarksAsVariable {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01 {$*REMARKS} PIC 9 VALUE 1.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       {#*REMARKS}.\r\n"
          + "           DISPLAY {$REMARKS}.\r\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
