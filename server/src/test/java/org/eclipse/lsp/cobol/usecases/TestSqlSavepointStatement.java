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

/** This test checks if sql SAVEPOINT statement works correctly. */
class TestSqlSavepointStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String SAVEPOINT =
      TEXT + "           EXEC SQL  SAVEPOINT A ON ROLLBACK RETAIN CURSORS END-EXEC.\n";

  private static final String SAVEPOINT2 =
      TEXT
          + "           EXEC SQL\n"
          + "            SAVEPOINT B UNIQUE ON ROLLBACK RETAIN CURSORS  \n"
          + "           END-EXEC.\n";

  private static final String SAVEPOINT3 =
      TEXT
          + "           EXEC SQL\n"
          + "            SAVEPOINT A UNIQUE ON ROLLBACK RETAIN CURSORS  \n"
          + "           END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(SAVEPOINT, SAVEPOINT2, SAVEPOINT3);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql savepoint statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
