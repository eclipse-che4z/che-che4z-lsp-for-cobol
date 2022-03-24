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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** These test for variations of valid CHECK TERMINAL statements */
class TestCheckTerminal {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_VARB1} PIC X(8) SYNC.\r\n"
          + "        01 {$*WK_VARB2} PIC X(8) SYNC.\r\n"
          + "        01 {$*WK_LENGTH} PIC X(8) SYNC.\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String CHECK_TERMINAL =
      "           CHECK TERMINAL INTO {$WK_VARB1} MAX LENGTH {$WK_VARB2}.\r\n";

  private static final String CHECK_TERMINAL_TO_ALL_PARMS =
      "           CHECK TERMINAL GET STORAGE INTO {$WK_VARB1} TO {$WK_VARB2}\r\n"
          + "           RETURN LENGTH INTO {$WK_LENGTH}.\r\n";

  private static final String CHECK_TERMINAL_MAXLENGTH_VARB_ALL_PARMS =
      "           CHECK TERMINAL GET STORAGE INTO {$WK_VARB1} MAX LENGTH {$WK_VARB2}\r\n"
          + "           RETURN LENGTH INTO {$WK_LENGTH}.\r\n";

  private static final String CHECK_TERMINAL_MAXLENGTH_LITERAL_ALL_PARMS =
      "           CHECK TERMINAL GET STORAGE INTO {$WK_VARB1} MAX LENGTH 120\r\n"
          + "           RETURN LENGTH INTO {$WK_LENGTH}.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + CHECK_TERMINAL,
        BOILERPLATE + CHECK_TERMINAL_TO_ALL_PARMS,
        BOILERPLATE + CHECK_TERMINAL_MAXLENGTH_VARB_ALL_PARMS,
        BOILERPLATE + CHECK_TERMINAL_MAXLENGTH_LITERAL_ALL_PARMS);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        IdmsBase.getAnalysisConfig());
  }
}
