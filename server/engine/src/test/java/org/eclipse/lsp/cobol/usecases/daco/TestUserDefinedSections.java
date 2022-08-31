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
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * If user has user defined labels they should be resolved without errors
 */
class TestUserDefinedSections {
  private static final String TEXT =
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

  @Test
  void test() {
    CopybookConfig copybookConfig = new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER, ImmutableList.of("USERLABEL"));
    AnalysisConfig analysisConfig = new AnalysisConfig(copybookConfig, ImmutableList.of(), ImmutableList.of("DaCo", "IDMS"));
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), analysisConfig);
  }
}
