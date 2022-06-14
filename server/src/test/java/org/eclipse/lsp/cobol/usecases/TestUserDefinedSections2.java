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
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * If user has user defined paragraphs they should be resolved without errors
 */
public class TestUserDefinedSections2 {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. UDPAR. \n"
                  + "       DATA DIVISION.\n"
                  + "       LINKAGE SECTION.\n"
                  + "       01  {$*LINK-PRM0}.\n"
                  + "           05  {$*PARM}                               PIC X(8).\n"
                  + "       PROCEDURE DIVISION USING {$LINK-PRM0}.\n"
                  + "           PERFORM {@USERLABEL}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig(
                    new CopybookConfig(CopybookProcessingMode.DISABLED, SQLBackend.DB2_SERVER,
                            ImmutableList.of("USERLABEL"))));
  }
}
