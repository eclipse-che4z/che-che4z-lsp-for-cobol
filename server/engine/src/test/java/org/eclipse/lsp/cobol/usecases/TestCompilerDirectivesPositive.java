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

/**
 * This test checks that the correct CBL and PROCESS compiler directives do not produce syntax
 * errors
 */
class TestCompilerDirectivesPositive {

  private static final String PROCESS_WITHOUT_NUMBER = "PROCESS DATA(24),RMODE(24),NODYNAM\r\n";
  private static final String PROCESS_WITH_NUMBER = "012345 PROCESS DATA(24),RMODE(24),NODYNAM\r\n";
  private static final String CBL_WITHOUT_NUMBERS = "  cbl LIST,QUOTE,NODYNAM,TEST(SEP)\r\n";
  private static final String CBL_WITH_NUMBER = "012345 CBL DATA(24),RMODE(24),NODYNAM\r\n";
  private static final String CBL_WITH_LONG_LINE =
      "  CBL LIST,QUOTE,NODYNAM,TEST(SEP)                                      00010003\r\n";

  private static final String FOLLOWING_TEXT =
      "000000 Identification DIVISION.                                         23323232\r\n"
          + "002800 Program-ID.                                                      23323232\r\n"
          + "002800  HELLOWORLD.                                                     23323232\r\n"
          + "024200 PROCEDURE DIVISION .                                             CM1014.2\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        "",
        CBL_WITHOUT_NUMBERS,
        CBL_WITH_NUMBER,
        CBL_WITH_LONG_LINE,
        PROCESS_WITH_NUMBER,
        PROCESS_WITHOUT_NUMBER);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - testing CBL/PROCESS directives")
  void test(String text) {
    UseCaseEngine.runTest(text + FOLLOWING_TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
