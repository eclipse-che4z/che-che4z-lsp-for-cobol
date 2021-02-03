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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.stream.Stream;

/**
 * These test for COPY IDMS statements in FILE SECTION, WS/LINKAGE SECTIONS AND PROCEDURE DIVISION
 */
class TestCopyIdms {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n";

  private static final String COPY_IDMS_FILE =
      "        FILE SECTION.\r\n"
          + "            COPY IDMS FILE FL001\r\n"
          + "            COPY IDMS FILE FL002 VERSION 1.\r\n";

  private static final String COPY_IDMS_WS =
      "        WORKING-STORAGE SECTION.\r\n"
          + "             01 COPY IDMS EMPLOYEE VERSION 03.\r\n"
          + "             COPY IDMS SUBSCHEMA-RECORDS\r\n"
          + "             COPY IDMS SUBSCHEMA-LR-CTRL SIZE 256\r\n"
          + "             COPY IDMS TRANSACTION-STATISTICS.\r\n"
          + "             03 COPY IDMS LR ORDITEM REDEFINES OIREC\r\n"
          + "             COPY IDMS MAP MGETINFO.\r\n"
          + "             COPY IDMS MAPS. \r\n"
          + "             COPY IDMS MAP CONTROL MRB01.\r\n";

  private static final String COPY_IDMS_PD =
      "        PROCEDURE DIVISION.\r\n"
          + "           COPY IDMS SUBSCHEMA-BINDS\r\n"
          + "           COPY IDMS ABCD VERSION 103.\r\n"
          + "           COPY IDMS MODULE ABCD;\r\n";

  private static final String COPY_IDMS_PD_DECL =
      "        PROCEDURE DIVISION.\r\n"
          + "        DECLARATIVES.\r\n"
          + "        S1 SECTION.\r\n"
          + "        COPY IDMS MODULE abc\r\n"
          + "        S2 SECTION.\r\n"
          + "          USE AFTER EXCEPTION PROCEDURE ON INPUT.\r\n"
          + "        {#*REPORT-ERR-PARA}.\r\n"
          + "              DISPLAY 'ERROR IN IN-FILE'.\r\n"
          + "              COPY IDMS xyz.\r\n"
          + "        END DECLARATIVES.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + COPY_IDMS_FILE,
        BOILERPLATE + COPY_IDMS_WS,
        BOILERPLATE + COPY_IDMS_PD,
        BOILERPLATE + COPY_IDMS_PD_DECL);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
