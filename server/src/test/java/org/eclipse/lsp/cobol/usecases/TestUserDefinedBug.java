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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * If user has user defined labels they should be resolved without errors
 */
class TestUserDefinedBug {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "000300 PROGRAM-ID.    BMEDIQ1M.   \n"
                  + "001200 ENVIRONMENT  DIVISION.\n"
                  + "001300 IDMS-CONTROL SECTION.\n"
                  + "001400 PROTOCOL.    MODE IS BATCH           DEBUG \n"
                  + "001500              IDMS-RECORDS            MANUAL.\n"
                  + "001600 CONFIGURATION    SECTION. \n"
                  + "001700 SOURCE-COMPUTER. IBM-SYSTEM WITH DEBUGGING MODE. \n"
                  + "001800*----------------------------------------------------------------*\n"
                  + "       DATA DIVISION.\n"
                  + "000810 LINKAGE SECTION.\n"
                  + "000820 01  {$*LINK-PRM0}.\n"
                  + "000830     05  {$*PARM-LENGTH}                        PIC S9(4) COMP.\n"
                  + "000840     05  {$*PARM}                               PIC X(8).\n"
                  + "000850 PROCEDURE DIVISION USING {$LINK-PRM0}.\n"
                  + "           PERFORM {#USERLABEL}.";

  @Test
  void test() {
    CopybookConfig copybookConfig = new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER, ImmutableList.of("USERLABEL"));
    AnalysisConfig analysisConfig = new AnalysisConfig(copybookConfig, ImmutableList.of(), ImmutableList.of("DaCo", "IDMS"));
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), analysisConfig);
  }
}
