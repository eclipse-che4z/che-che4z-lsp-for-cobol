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

/** Test IDMS SEND DML statements */
class TestIdmsSendStatement {

  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_NAME} PIC X(8).\n"
          + "        01 {$*WK_MSG} PIC X(8).\n"
          + "        01 {$*WK_BYTE} PIC X(1).\n"
          + "        01 {$*WK_LENGTH} PIC S9(8).\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String SEND_USER_VARIABLES =
      DEFS
          + "           MOVE 'TESTUSER' TO {$WK_NAME}.\r\n"
          + "           SEND MESSAGE TO USER ID {$WK_NAME} FROM {$WK_MSG} TO {$WK_BYTE}.\n";

  private static final String SEND_USER_LITERALS =
      DEFS
          + "           MOVE 8 TO {$WK_LENGTH}.\r\n"
          + "           SEND MESSAGE TO DEST ID 'TSTDEST' FROM {$WK_MSG} LENGTH 8.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(SEND_USER_VARIABLES, SEND_USER_LITERALS);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS send tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
