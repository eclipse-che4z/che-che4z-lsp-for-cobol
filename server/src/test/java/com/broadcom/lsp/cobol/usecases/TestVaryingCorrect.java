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
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

/** This use cases checks if varying with multiple identifiers works correctly. */
class TestVaryingCorrect {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        01 {$*IDENTIFIER-1}.\r\n"
          + "        01 {$*IDENTIFIER-2}.\r\n"
          + "        01 {$*IDENTIFIER-3}.\r\n"
          + "        01 {$*IDENTIFIER-4}.\r\n"
          + "        01 {$*IDENTIFIER-5}.\r\n"
          + "        01 {$*IDENTIFIER-6}.\r\n"
          + "        01 {$*IDENTIFIER-7}.\r\n"
          + "        01 {$*IDENTIFIER-8}.\r\n"
          + "        01 {$*IDENTIFIER-9}.\r\n"
          + "        01 {$*IDENTIFIER-10}.\r\n"
          + "        PROCEDURE DIVISION.\r\n";

  private static final String VARYING_WITH_TWO_IDENTIFIERS =
      "            PERFORM {#PROCEDURE-NAME-1} THROUGH {#PROCEDURE-NAME-2}\r\n"
          + "            VARYING {$IDENTIFIER-2} FROM {$IDENTIFIER-3}\r\n"
          + "            BY {$IDENTIFIER-4} UNTIL CONDITION-1\r\n"
          + "            AFTER {$IDENTIFIER-5} FROM {$IDENTIFIER-6}\r\n"
          + "            BY {$IDENTIFIER-7} UNTIL CONDITION-2.";

  private static final String VARYING_WITH_THREE_IDENTIFIERS =
      "            PERFORM {#PROCEDURE-NAME-1} THROUGH {#PROCEDURE-NAME-2}\r\n"
          + "            VARYING {$IDENTIFIER-2} FROM {$IDENTIFIER-3}\r\n"
          + "            BY {$IDENTIFIER-4} UNTIL CONDITION-1\r\n"
          + "            AFTER {$IDENTIFIER-5} FROM {$IDENTIFIER-6}\r\n"
          + "            BY {$IDENTIFIER-7} UNTIL CONDITION-2\r\n"
          + "            AFTER {$IDENTIFIER-8} FROM {$IDENTIFIER-9}\r\n"
          + "            BY {$IDENTIFIER-10} UNTIL CONDITION-3.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + VARYING_WITH_TWO_IDENTIFIERS, BOILERPLATE + VARYING_WITH_THREE_IDENTIFIERS);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(text, List.of(), Map.of());
  }
}
