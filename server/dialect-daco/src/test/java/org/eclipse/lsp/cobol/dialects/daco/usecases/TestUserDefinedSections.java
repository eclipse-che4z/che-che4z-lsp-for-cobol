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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import java.util.Map;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * If user has user defined labels they should be resolved without errors
 */
class TestUserDefinedSections {
  private static final String TEXT_GOTO =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GO TO {@USERLABEL}.";

  private static final String TEXT_PERFORM =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UDPAR. \n"
          + "       DATA DIVISION.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  {$*LINK-PRM0}.\n"
          + "           05  {$*PARM}                               PIC X(8).\n"
          + "       PROCEDURE DIVISION USING {$LINK-PRM0}.\n"
          + "           PERFORM {@USERLABEL}.";

  private static final String TEXT_ALREADY_DEFINED =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UDPAR. \n"
          + "       DATA DIVISION.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  {$*LINK-PRM0}.\n"
          + "           05  {$*PARM}                               PIC X(8).\n"
          + "       PROCEDURE DIVISION USING {$LINK-PRM0}.\n"
          + "           PERFORM {@USERLABEL}.\n"
          + "       {@*USERLABEL} SECTION.";

  @Test
  void testPerform() {
    UseCaseEngine.runTestForDiagnostics(TEXT_PERFORM,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig(
                CopybookProcessingMode.DISABLED, ImmutableList.of("USERLABEL")));
  }

  @Test
  void testGoTo() {
    Map<String, JsonElement> dialectConfig = ImmutableMap.of(DaCoDialect.DACO_PREDEFINED_SECTIONS, new Gson().toJsonTree(ImmutableList.of("USERLABEL")));
    AnalysisConfig analysisConfig = new AnalysisConfig(CopybookProcessingMode.ENABLED, ImmutableList.of("DaCo", "IDMS"),
        true, ImmutableList.of(), dialectConfig);
    UseCaseEngine.runTestForDiagnostics(TEXT_GOTO, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), analysisConfig);
  }

  @Test
  void testAlreadyDefined() {
    UseCaseEngine.runTestForDiagnostics(TEXT_ALREADY_DEFINED,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig(
                CopybookProcessingMode.DISABLED,
            ImmutableList.of("USERLABEL")));
  }

}
