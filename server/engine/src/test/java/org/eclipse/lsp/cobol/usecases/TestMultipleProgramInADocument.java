/*
 * Copyright (c) 2022 Broadcom.
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

/** Tests a single document can have multiple programs with same program id. */
public class TestMultipleProgramInADocument {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. CONDS.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-NUM1} PIC 9(9).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 to {$WS-NUM1}.\n"
          + "       END PROGRAM CONDS.\n"
          + "\n"
          + "\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. CONDS.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-NUM1} PIC 9(9).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 to {$WS-NUM1}.\n"
          + "       END PROGRAM CONDS.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
