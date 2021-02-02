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

/** Tests that empty lines and comments are allowed between two continuation Lines. */
class TestEmptyLinesAllowedBetweenContinuationLines {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 {$*Variable} PIC 9(9).\n"
          + "       Procedure Division.\n"
          + "           DISPLAY 'TEST TEXT CONCATENATED\n"
          + "           \n"
          + "      * TEST COMMENTS BETWEEN CONTINUOUS LINES\n"
          + "      -      'AT DIFFERENT LINE'.\n"
          + "           MOVE 0 TO {$Variable}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
