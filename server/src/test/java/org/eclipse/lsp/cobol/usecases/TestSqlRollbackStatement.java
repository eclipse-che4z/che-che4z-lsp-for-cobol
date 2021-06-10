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

/** This test checks if sql ROLLBACK statement works correctly. */
class TestSqlRollbackStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String ROLLBACK = TEXT + "           EXEC SQL  ROLLBACK WORK END-EXEC.\n";

  private static final String ROLLBACK2 =
      TEXT
          + "           EXEC SQL\n"
          + "             ROLLBACK WORK TO SAVEPOINT A  \n"
          + "           END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(ROLLBACK, ROLLBACK2);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql rollback statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
