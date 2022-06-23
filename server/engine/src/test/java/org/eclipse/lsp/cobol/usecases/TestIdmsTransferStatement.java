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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** Test IDMS TRANSFER DML statement */
class TestIdmsTransferStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_PROGRAM} PIC X(8).\r\n"
          + "        01 {$*WK1} PIC X(8).\r\n"
          + "        01 {$*WK2} PIC X(8).\r\n"
          + "        01 {$*WK3} PIC X(8).\r\n"
          + "        01 {$*ERROR-STATUS} PIC X(4) VALUE '1400'.\n"
          + "           88 {$*ANY-ERROR-STATUS} VALUE '0001' THRU '9999'.\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String TRANSFER = "            TRANSFER CONTROL TO 'TSTPROG'.\r\n";

  private static final String TRANSFER_PARMS = "           TRANSFER CONTROL TO 'TSTPROG' LINK.\r\n";

  private static final String TRANSFER_PARMS2 =
      "           TRANSFER CONTROL TO 'TSTPROG' XCTL.\r\n";

  private static final String TRANSFER_USING_PARMS =
      "           TRANSFER CONTROL TO 'TSTPROG' USING {$WK1} {$WK2} {$WK3}.\r\n";

  private static final String TRANSFER_ALL =
      "           TRANSFER CONTROL TO 'TSTPROG' NORETURN USING {$WK1};\r\n";

  private static final String TRANSFER_ON =
      "           TRANSFER CONTROL TO 'TSTPROG' NORETURN USING {$WK1};\r\n"
          + "             ON {$ANY-ERROR-STATUS} DISPLAY 'TRANSFER ERROR'.\r\n";

  private static final String TRANSFER_PGM_TOO_LONG_ERROR =
      "           TRANSFER CONTROL TO {'TSTPROGXXX'|1} XCTL.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + TRANSFER,
        BOILERPLATE + TRANSFER_PARMS,
        BOILERPLATE + TRANSFER_PARMS2,
        BOILERPLATE + TRANSFER_USING_PARMS,
        BOILERPLATE + TRANSFER_ALL,
        BOILERPLATE + TRANSFER_ON,
        BOILERPLATE + TRANSFER_PGM_TOO_LONG_ERROR);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS transfer tests")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Max length limit of 8 bytes allowed for program name.",
                Error,
                SourceInfoLevels.ERROR.getText())),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
