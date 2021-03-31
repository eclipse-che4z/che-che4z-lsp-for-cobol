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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS SET DML statements */
class TestIdmsSetStatement {

  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_PROG} PIC X(8).\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String SET_ABEND_LIT = DEFS + "           SET ABEND EXIT PROGRAM 'TSTPROG'.";

  private static final String SET_ABEND_VARB =
      DEFS
          + "           MOVE 'TSTPROG' TO {$WK_PROG}.\r\n"
          + "           SET ABEND EXIT ON PROGRAM {$WK_PROG}.";

  private static Stream<String> textsToTest() {
    return Stream.of(SET_ABEND_LIT, SET_ABEND_VARB);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS set abend tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
