/*
 * Copyright (c) 2022 DAF Trucks NV.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * DAF Trucks NV – implementation of DaCo COBOL statements
 * and DAF development standards
 */
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
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

  @Test
  void testImplicitWorkingStorageCode() {
    UseCaseEngine.runTest(
        TEXT_WS,
        ImmutableList.of(),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testImplicitLinkageSectionCode() {
    UseCaseEngine.runTest(
        TEXT_LS,
        ImmutableList.of(),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }

}
