/*
 * Copyright (c) 2025 Broadcom.
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

/** Tests COBOL evaluate statements */
public class TestEvaluateStatement {
  public static final String TEST_1 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test2.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*IMI} pic x.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           if {$IMI} = 'N'\n"
          + "             EVALUATE {$IMI}\n"
          + "                 WHEN '2'\n"
          + "                   EVALUATE TRUE\n"
          + "                     WHEN {$IMI} = 'Y'\n"
          + "                       DISPLAY 'some test'\n"
          + "                   END-EVALUATE\n"
          + "           END-IF\n"
          + "             STOP RUN.  ";

  @Test
  void testEvaluateStatement_whenEndEvaluateFollowedByEndIfToken() {
    UseCaseEngine.runTest(TEST_1, ImmutableList.of(), ImmutableMap.of());
  }
}
