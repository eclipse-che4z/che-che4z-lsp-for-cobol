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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS Dequeue DML statement */
class TestIdmsDequeueStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK-NAME} PIC X(8).\n"
          + "        01 {$*WK-LENGTH} PIC S9(8).\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String DEQUEUE_ALL = "            DEQUEUE ALL.\r\n";

  private static final String DEQUEUE_NAME_LENGTH_VARB =
      "           MOVE 'TEST' TO {$WK-NAME}.\r\n "
          + "           MOVE 8 TO {$WK-LENGTH}.\r\n  "
          + "           DEQUEUE NAME {$WK-NAME} LENGTH {$WK-LENGTH}. \r\n";

  private static final String DEQUEUE_NAME_LENGTH_LITERAL =
      "           MOVE 'TEST' TO {$WK-NAME}. \r\n"
          + "           MOVE 8 TO {$WK-LENGTH}.  \r\n"
          + "           DEQUEUE NAME {$WK-NAME} LENGTH 8.\r\n";

  private static final String DEQUEUE_MULTIPLE =
      "           MOVE 'TEST' TO {$WK-NAME}. \r\n"
          + "           MOVE 8 TO {$WK-LENGTH}.  \r\n"
          + "           DEQUEUE NAME {$WK-NAME} LENGTH 8 NAME {$WK-NAME}\r\n"
          + "           LENGTH 8.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + DEQUEUE_ALL,
        BOILERPLATE + DEQUEUE_NAME_LENGTH_VARB,
        BOILERPLATE + DEQUEUE_NAME_LENGTH_LITERAL,
        BOILERPLATE + DEQUEUE_MULTIPLE);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS dequeue tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
