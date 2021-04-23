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

/** Test IDMS TRANSFER DML statement */
public class TestIdmsTransferStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_PROGRAM} PIC X(8).\r\n"
          + "        01 {$*WK1} PIC X(8).\r\n"
          + "        01 {$*WK2} PIC X(8).\r\n"
          + "        01 {$*WK3} PIC X(8).\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String TRANSFER = "            TRANSFER CONTROL TO 'TSTPROG'.\r\n";

  private static final String TRANSFER_PARMS = "           TRANSFER CONTROL TO 'TSTPROG' LINK.\r\n";

  private static final String TRANSFER_PARMS2 =
      "           TRANSFER CONTROL TO 'TSTPROG' XCTL.\r\n";

  private static final String TRANSFER_USING_PARMS =
      "           TRANSFER CONTROL TO 'TSTPROG' USING {$WK1} {$WK2} {$WK3}.\r\n";

  private static final String TRANSFER_ALL =
      "           TRANSFER CONTROL TO 'TSTPROG' NORETURN USING {$WK1};\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + TRANSFER,
        BOILERPLATE + TRANSFER_PARMS,
        BOILERPLATE + TRANSFER_PARMS2,
        BOILERPLATE + TRANSFER_USING_PARMS,
        BOILERPLATE + TRANSFER_ALL);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS read tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
