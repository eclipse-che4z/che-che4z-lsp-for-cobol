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

/** Test IDMS FREE DML statement */
public class TestIdmsFreeStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1. \n"
          + "        DATA DIVISION. \n"
          + "        WORKING-STORAGE SECTION. \n"
          + "        01 {$*WK_PROGRAM} PIC X(8).\n"
          + "        01 {$*WK1} PIC X(8).\n"
          + "        01 {$*WK2} PIC X(8).\n"
          + "        PROCEDURE DIVISION. \n";

  private static final String FREE_STORAGE_1 = "            FREE STORAGE STGID 'TEST'.\n";

  private static final String FREE_STORAGE_2 =
      "           MOVE 'TEST' TO {$WK1}.\n" + "           FREE STORAGE STGID 'TEST'.\n";

  private static final String FREE_STORAGE_3 = "           FREE STORAGE FOR {$WK1}.\n";

  private static final String FREE_STORAGE_4 = "           FREE STORAGE FOR {$WK1} FROM {$WK2}.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + FREE_STORAGE_1,
        BOILERPLATE + FREE_STORAGE_2,
        BOILERPLATE + FREE_STORAGE_3,
        BOILERPLATE + FREE_STORAGE_4);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS read tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
