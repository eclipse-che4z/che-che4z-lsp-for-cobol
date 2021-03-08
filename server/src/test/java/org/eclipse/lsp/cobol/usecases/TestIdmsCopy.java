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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.stream.Stream;

/**
 * These test for COPY IDMS statements in FILE SECTION, WS/LINKAGE SECTIONS AND PROCEDURE DIVISION
 */
class TestIdmsCopy {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n";

  private static final String COPY_IDMS_FILE =
      "        FILE SECTION.\n"
          + "            COPY IDMS FILE FL001\n"
          + "            COPY IDMS FILE FL002 VERSION 1.\n";

  private static final String COPY_IDMS_WS =
      "        WORKING-STORAGE SECTION.\n"
          + "             01 COPY IDMS EMPLOYEE VERSION 03.\n"
          + "             COPY IDMS SUBSCHEMA-RECORDS\n"
          + "             COPY IDMS SUBSCHEMA-LR-CTRL SIZE 256\n"
          + "             COPY IDMS TRANSACTION-STATISTICS.\n"
          + "             03 COPY IDMS LR ORDITEM REDEFINES OIREC\n"
          + "             COPY IDMS MAP MGETINFO.\n"
          + "             COPY IDMS MAPS. \n"
          + "             COPY IDMS MAP CONTROL MRB01.\n";

  private static final String COPY_IDMS_PD =
      "        PROCEDURE DIVISION.\n"
          + "           COPY IDMS SUBSCHEMA-BINDS\n"
          + "           COPY IDMS ABCD VERSION 103.\n"
          + "           COPY IDMS MODULE ABCD;\n";

  private static final String COPY_IDMS_PD_DECL =
      "        PROCEDURE DIVISION.\n"
          + "        DECLARATIVES.\n"
          + "        S1 SECTION.\n"
          + "        COPY IDMS MODULE abc\n"
          + "        S2 SECTION.\n"
          + "          USE AFTER EXCEPTION PROCEDURE ON INPUT.\n"
          + "        {#*REPORT-ERR-PARA}.\n"
          + "              DISPLAY 'ERROR IN IN-FILE'.\n"
          + "              COPY IDMS xyz.\n"
          + "        END DECLARATIVES.\n";

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
