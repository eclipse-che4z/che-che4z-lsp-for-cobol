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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/** This test checks the mnemonic name definition in SPECIAL-NAMES paragraph */
class TestMnemonicNames {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES. C01 IS {$*TOP-OF-PAGE}.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*LADING-RECORD}   PIC X(133).\n"
          + "       01  {$*PRINT-HEADER-0}.\n"
          + "           05  FILLER PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           WRITE {$LADING-RECORD} FROM {$PRINT-HEADER-0}\n"
          + "                       AFTER ADVANCING {$TOP-OF-PAGE}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
