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

/** This test checks if sql WHENEVER statement works correctly. */
class TestSqlWheneverStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n";

  private static final String WHENEVER =
      TEXT + "       EXEC SQL  WHENEVER SQLERROR GOTO HANDLER  END-EXEC.\n";

  private static final String WHENEVER2 =
      TEXT + "       EXEC SQL  WHENEVER SQLWARNING CONTINUE   END-EXEC.\n";

  private static final String WHENEVER3 =
      TEXT + "       EXEC SQL  WHENEVER NOT FOUND GO TO ENDDATA  END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(WHENEVER, WHENEVER2, WHENEVER3);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql whenever statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
