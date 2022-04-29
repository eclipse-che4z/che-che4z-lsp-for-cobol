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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** This use cases checks if varying with multiple identifiers works correctly. */
class TestVaryingCorrect {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*IDENTIFIER-1} PIC 9.\n"
          + "        01 {$*IDENTIFIER-2} PIC 9.\n"
          + "        01 {$*IDENTIFIER-3} PIC 9.\n"
          + "        01 {$*IDENTIFIER-4} PIC 9.\n"
          + "        01 {$*IDENTIFIER-5} PIC 9.\n"
          + "        01 {$*IDENTIFIER-6} PIC 9.\n"
          + "        01 {$*IDENTIFIER-7} PIC 9.\n"
          + "        01 {$*IDENTIFIER-8} PIC 9.\n"
          + "        01 {$*IDENTIFIER-9} PIC 9.\n"
          + "        01 {$*IDENTIFIER-10} PIC 9.\n"
          + "            88 {$*CONDITION-1} VALUE 1.\n"
          + "            88 {$*CONDITION-2} VALUE 2.\n"
          + "            88 {$*CONDITION-3} VALUE 3.\n"
          + "        PROCEDURE DIVISION.\n"
          + "        {#*PROCEDURE-NAME-1}.\n"
          + "        {#*PROCEDURE-NAME-2}.\n";

  private static final String VARYING_WITH_TWO_IDENTIFIERS =
      "            PERFORM {#PROCEDURE-NAME-1} THROUGH {#PROCEDURE-NAME-2}\n"
          + "            VARYING {$IDENTIFIER-2} FROM {$IDENTIFIER-3}\n"
          + "            BY {$IDENTIFIER-4} UNTIL {$CONDITION-1}\n"
          + "            AFTER {$IDENTIFIER-5} FROM {$IDENTIFIER-6}\n"
          + "            BY {$IDENTIFIER-7} UNTIL {$CONDITION-2}.";

  private static final String VARYING_WITH_THREE_IDENTIFIERS =
      "            PERFORM {#PROCEDURE-NAME-1} THROUGH {#PROCEDURE-NAME-2}\n"
          + "            VARYING {$IDENTIFIER-2} FROM {$IDENTIFIER-3}\n"
          + "            BY {$IDENTIFIER-4} UNTIL {$CONDITION-1}\n"
          + "            AFTER {$IDENTIFIER-5} FROM {$IDENTIFIER-6}\n"
          + "            BY {$IDENTIFIER-7} UNTIL {$CONDITION-2}\n"
          + "            AFTER {$IDENTIFIER-8} FROM {$IDENTIFIER-9}\n"
          + "            BY {$IDENTIFIER-10} UNTIL {$CONDITION-3}.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + VARYING_WITH_TWO_IDENTIFIERS, BOILERPLATE + VARYING_WITH_THREE_IDENTIFIERS);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
