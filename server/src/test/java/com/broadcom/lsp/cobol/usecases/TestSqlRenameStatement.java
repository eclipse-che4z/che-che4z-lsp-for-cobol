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

/** This test checks if sql RENAME statement works correctly. */
class TestSqlRenameStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n";

  private static final String RENAME =
      TEXT + "       EXEC SQL RENAME TABLE EMP TO EMPLOYEE  END-EXEC.\n";

  private static final String RENAME2 =
      TEXT
          + "       EXEC SQL\n"
          + "         RENAME TABLE EMP_USA_HIS2002 TO EMPLOYEE_UNITEDSTATES_HISTORY2002 \n"
          + "       END-EXEC.\n";

  private static final String RENAME3 =
      TEXT
          + "       EXEC SQL\n"
          + "         RENAME INDEX COMPANY.EMPINDX1 TO EMPLOYEE_INDEX \n"
          + "       END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(RENAME, RENAME2, RENAME3);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql rename statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
