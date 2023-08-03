/*
 * Copyright (c) 2023 Broadcom.
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

/**
 * Tests Group Variable usage in the EXEC SQL block
 */
class TestSqlGroupVariableUsage {

  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID. SM106A.\n"
      + "       DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION. \n"
      + "       01 {$*INP} PIC X(9).\n"
      + "       01 {$*A}.\n"
      + "          05 {$*BBB} PIC X(9).\n"
      + "       PROCEDURE DIVISION.\n"
      + "           EXEC SQL SELECT :{$INP} INTO :{$A}.{$BBB} FROM CACHE END-EXEC.\n";
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
