/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.utils.Fixtures;
import org.junit.jupiter.api.Test;

/**
 * Test for DaCo implicit code injection
 */
class TestDaCoImplicitCode {

  private static final String TEXT_WS =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "               MOVE 6 to {$OPDATOINI-XII}.\r\n";

  private static final String TEXT_LS =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        LINKAGE SECTION. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "               MOVE 6 to {$PMT-XII}.\r\n";

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01  COPY MAID {~PMOREC!DaCo}.\r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "               MOVE 6 to {$OPDATOINI-XII}.\r\n"
          + "               MOVE 6 to {$RMXKNM-BIA}.\r\n";

  private static final String COPY = "       01  {$*ITEAVL-XIA}.\n"
      + "           03 {$*TBLKNM-XIA}.\n"
      + "             05 {$*ROWKNM-XIA}                         OCCURS 15.\n"
      + "               07 {$*SPETPS-XIA}           PIC X.\n";

  private static final String TEXT_DYN =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1. \n"
          + "        DATA DIVISION. \n"
          + "        WORKING-STORAGE SECTION. \n"
          + "       01  {$*AREA-XAA}.\n"
          + "           03 {$*TBLNAM-XAA} PIC X(6).\n"
          + "        PROCEDURE DIVISION. \n"
          + "               MOVE 6 to {$RUSNAM-BAA}.\n";

  private static final String TEXT_DYN_DUPLICATE =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1. \n"
          + "        DATA DIVISION. \n"
          + "        WORKING-STORAGE SECTION. \n"
          + "       01  {$*AREA-XAA}.\n"
          + "           03 {$*TBLNAM-XAA} PIC X(6).\n"
          + "             05 {$*RUSNAM-BAA} PIC X(6).\n"
          + "        PROCEDURE DIVISION. \n"
          + "               MOVE 6 to {$RUSNAM-BAA}.\n";

  @Test
  void testImplicitWorkingStorageCode() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT_WS,
        ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testImplicitLinkageSectionCode() {
    UseCaseEngine.runTest(
        TEXT_LS,
        ImmutableList.of(),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testImplicitWorkingSectionDynamicCode() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT,
        ImmutableList.of(new CobolText("PMOREC", DaCoDialect.NAME, COPY), Fixtures.subschemaCopy("")),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testImplicitWorkingStorageCode_Dynamic() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT_DYN,
        ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testImplicitWorkingStorageCode_DynamicWithDuplicates() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT_DYN_DUPLICATE,
        ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

}
