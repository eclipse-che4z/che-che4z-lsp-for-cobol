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
class TestAbendCode {

  private static final String BOILERPLATE =
      "       IDENTIFICATION DIVISION. \r\n"
          + "       PROGRAM-ID. test1. \r\n"
          + "       DATA DIVISION. \r\n"
          + "       WORKING-STORAGE SECTION. \r\n"
          + "       01 {$*ID1} PIC X(4).\r\n"
          + "       PROCEDURE DIVISION. \r\n";

  private static final String ABEND_CODE_VARIABLE =
      "           MOVE 1234 TO {$ID1}.\n" + "           ABEND CODE {$ID1}.\r\n";

  private static final String ABEND_CODE_CODE_LITERAL = "           ABEND CODE '1234'.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(BOILERPLATE + ABEND_CODE_VARIABLE, BOILERPLATE + ABEND_CODE_CODE_LITERAL);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
