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

package org.eclipse.lsp.cobol.usecases.idms;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.utils.Fixtures;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS Post DML statement */
class TestIdmsPostStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_ECB}.\n"
          + "        02 {$*WK_ECB1} PIC S9(8).\n"
          + "        02 {$*WK_ECB2} PIC S9(8).\n"
          + "        02 {$*WK_ECB3} PIC S9(8).\n"
          + "        01 {$*WK_ECBID} PIC X(8).\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String POST_ECB = "            POST EVENT {$WK_ECB}.\r\n";

  private static final String POST_ECBID_LITERAL = "            POST EVENT NAME 'ECBID'.\r\n";

  private static final String POST_ECBID_VARB =
      "           MOVE 'ECBID' TO {$WK_ECBID}.\r\n"
          + "           POST EVENT NAME {$WK_ECBID} CLEAR. \r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + POST_ECB, BOILERPLATE + POST_ECBID_LITERAL, BOILERPLATE + POST_ECBID_VARB);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS post tests")
  void test(String text) {
    UseCaseEngine.runTestForDiagnostics(
        text,
        ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
