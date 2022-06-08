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

/** This test checks if sql REGRESH TABLE statement works correctly. */
class TestSqlRefreshTableStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String REFRESH =
      TEXT + "           EXEC SQL REFRESH TABLE SALESCOUNT  END-EXEC.\n";

  private static final String REFRESH2 =
      TEXT + "           EXEC SQL REFRESH TABLE SALESCOUNT QUERYNO 23  END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(REFRESH, REFRESH2);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql refresh table statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
