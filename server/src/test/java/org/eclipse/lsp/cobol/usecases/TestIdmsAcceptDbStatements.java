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

/** Test IDMS ACCEPT DML statements */
class TestIdmsAcceptDbStatements {

  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*DB1} PIC X(8).\n"
          + "       01 {$*DC1} PIC X(8).\n"
          + "       01 {$*EMP-LOC} PIC S9(8) COMP SYNC.\n"
          + "       01 {$*DB-KEY1} PIC S9(8) COMP SYNC.\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String TST1 = DEFS + "           ACCEPT {$DB1} FOR EMPLOYEE.\n";

  private static final String TST2 = DEFS + "           ACCEPT {$DB1} FROM ABC-PROC PROCEDURE.\n";

  private static final String TST3 = DEFS + "           ACCEPT {$EMP-LOC} FROM EMPLOYEE BIND.\n";

  private static final String TST4 = DEFS + "           ACCEPT {$DC1} FROM IDMS-STATISTICS.\n";

  private static final String TST5 =
      DEFS + "           ACCEPT {$DC1} FROM IDMS-STATISTICS EXTENDED {$DB1}.\n";

  private static final String TST6 =
      DEFS + "           ACCEPT {$DB-KEY1} FROM DEPT-EMPL CURRENCY.\n";

  private static final String TST7 = DEFS + "           ACCEPT {$DB-KEY1} FROM CURRENCY.\n";

  private static final String TST8 =
      DEFS + "           ACCEPT {$DB-KEY1} FROM DEPT-EMPL OWNER CURRENCY.\n";

  private static final String TST9 =
      DEFS + "           ACCEPT {$DB-KEY1} FROM EMP_AREA NEXT CURRENCY PAGE-INFO {$DB1}. \n";

  private static Stream<String> textsToTest() {
    return Stream.of(TST1, TST2, TST3, TST4, TST5, TST6, TST7, TST8, TST9);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - idms accept tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
