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

/** This test checks if sql VALUES INTO statement works correctly. */
class TestSqlValuesIntoStatement {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL \n";

  private static final String VALUES_INTO =
      TEXT + "            VALUES(CURRENT PATH) INTO :HV1; END-EXEC.";

  private static final String VALUES_INTO2 =
      TEXT + "            VALUES(CURRENT MEMBER) INTO :MEM; END-EXEC.";

  private static final String VALUES_INTO3 =
      TEXT + "            VALUES (SUBSTR(:LOB1,1,35)) INTO :DETAILS; END-EXEC.";

  private static final String VALUES_INTO4 =
      TEXT + "            VALUES INTVAR1 INTO MYINTARRAY1[23]; END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(VALUES_INTO, VALUES_INTO2, VALUES_INTO3, VALUES_INTO4);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql values statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
