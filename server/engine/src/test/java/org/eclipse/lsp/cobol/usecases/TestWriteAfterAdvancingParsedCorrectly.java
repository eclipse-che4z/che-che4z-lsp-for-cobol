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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** WRITE AFTER ADVANCING statement with variables should be parsed correctly */
class TestWriteAfterAdvancingParsedCorrectly {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.   C01 IS {$*TOP-OF-PAGE}.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*LADING-RECORD} PIC X(133).\n"
          + "       01  {$*PRINT-HEADER}.\n"
          + "           05  FILLER PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "             WRITE {$LADING-RECORD} FROM {$PRINT-HEADER}\n"
          + "                      AFTER ADVANCING {$TOP-OF-PAGE}\n"
          + "             WRITE {$LADING-RECORD} FROM {$PRINT-HEADER}\n"
          + "                      AFTER ADVANCING 3 LINES.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
