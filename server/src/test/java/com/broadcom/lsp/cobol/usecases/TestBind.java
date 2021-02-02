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
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** These test for variations of valid ABEND CODE statements */
class TestBind {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_NODENAME} PIC X(8) SYNC.\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String BIND_TASK = "           BIND TASK.\r\n";

  private static final String BIND_TASK_NODENAME_VARIABLE =
      "           MOVE 'TESTNODE' TO {$WK_NODENAME}.\r\n"
          + "           BIND TASK NODENAME {$WK_NODENAME}.\r\n";

  private static final String BIND_TASK_NODENAME_LITERAL =
      "           BIND TASK NODENAME 'TESTNODE'.\r\n";

  private static final String BIND_TRANSACTION_STATISTICS =
      "            BIND TRANSACTION STATISTICS.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + BIND_TASK,
        BOILERPLATE + BIND_TASK_NODENAME_VARIABLE,
        BOILERPLATE + BIND_TASK_NODENAME_LITERAL,
        BOILERPLATE + BIND_TRANSACTION_STATISTICS);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
