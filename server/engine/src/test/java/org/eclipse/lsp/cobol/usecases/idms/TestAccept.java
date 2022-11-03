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

/** These test for variations of valid ACCEPT idms_dc statements */
class TestAccept {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*ABC} PIC X(388) SYNC.\n"
          + "        01 {$*LTERMID} PIC X(8).\r\n"
          + "        01 {$*TASKID} PIC S9(8) COMP SYNC.\r\n"
          + "        01 {$*SYSVERSION_WK} PIC S9(4) COMP.\r\n"
          + "        01 {$*SCREENSIZE_WK}.\r\n"
          + "           05 {$*SCREENSIZE_WK1} PIC S9(4) COMP.\r\n"
          + "           05 {$*SCREENSIZE_WK2} PIC S9(4) COMP.\r\n"
          + "        01 {$*STATS1} PIC S9(4) COMP.\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String ACCEPT_IDMS_DC_LTERM =
      "            ACCEPT LTERM ID INTO {$LTERMID}.\r\n";

  private static final String ACCEPT_IDMS_DC_TASK_ID =
      "            ACCEPT TASK ID INTO {$TASKID}.\r\n";

  private static final String ACCEPT_IDMS_DC_SYSVERSION =
      "            ACCEPT SYSVERSION INTO {$SYSVERSION_WK}.\r\n";

  private static final String ACCEPT_IDMS_DC_SCREENSIZE =
      "            ACCEPT SCREENSIZE INTO {$SCREENSIZE_WK}.\r\n";

  private static final String ACCEPT_TRANSACTION_STATISTICS_NO_OPTIONAL_CLAUSES =
      "           ACCEPT TRANSACTION STATISTICS.\r\n";

  private static final String ACCEPT_TRANSACTION_STATISTICS_INTO_VARIABLE =
      "           ACCEPT TRANSACTION STATISTICS INTO {$ABC}.\r\n";

  private static final String ACCEPT_TRANSACTION_STATISTICS_LENGTH =
      "           ACCEPT TRANSACTION STATISTICS LENGTH 500.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + ACCEPT_IDMS_DC_LTERM,
        BOILERPLATE + ACCEPT_IDMS_DC_TASK_ID,
        BOILERPLATE + ACCEPT_IDMS_DC_SYSVERSION,
        BOILERPLATE + ACCEPT_IDMS_DC_SCREENSIZE,
        BOILERPLATE + ACCEPT_TRANSACTION_STATISTICS_NO_OPTIONAL_CLAUSES,
        BOILERPLATE + ACCEPT_TRANSACTION_STATISTICS_INTO_VARIABLE,
        BOILERPLATE + ACCEPT_TRANSACTION_STATISTICS_LENGTH);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTestForDiagnostics(
        text,
        ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
