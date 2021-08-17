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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.CopybookProcessingMode.DISABLED;
import static org.eclipse.lsp.cobol.service.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.service.SQLBackend.DB2_SERVER;
import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/**
 * This test checks that the undefined parent variable underlined while variable call hierarchy
 * check.
 */
class TestUndefinedParentVariableUnderlined {
  private static final String TEXT =
      "0       IDENTIFICATION DIVISION.\r\n"
          + "1       PROGRAM-ID. TEST1.\r\n"
          + "2       DATA DIVISION.\r\n"
          + "3       WORKING-STORAGE SECTION.\r\n"
          + "4       01   {$*BORROWER}.\r\n"
          + "5          05 {$*AGE}                   PIC 9(3).\r\n"
          + "6              10 {$*MAMA} PIC 99 VALUE 3.\r\n"
          + "7       PROCEDURE DIVISION.\r\n"
          + "8       {#*PROCB}.\r\n"
          + "9           MOVE 10 TO {MAMA|1} OF AGE OF BORROWE.\r\n"
          + "10      END PROGRAM TEST1.";

  @Test
  void assertCopybookProcessingModeNotChangesLogic() {
    Assertions.assertEquals(
        UseCaseUtils.analyze(
            UseCaseUtils.DOCUMENT_URI,
            TEXT,
            ImmutableList.of(),
            ImmutableList.of(),
            new CopybookConfig(ENABLED, DB2_SERVER)),
        UseCaseUtils.analyze(
            UseCaseUtils.DOCUMENT_URI,
            TEXT,
            ImmutableList.of(),
            ImmutableList.of(),
            new CopybookConfig(DISABLED, DB2_SERVER)));
  }

  @Test
  void assertAnalysisResult() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null, "Variable MAMA is not defined", DiagnosticSeverity.Error, ERROR.getText())));
  }
}
