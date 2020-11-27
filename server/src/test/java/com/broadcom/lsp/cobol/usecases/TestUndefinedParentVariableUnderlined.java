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

import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

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
          + "9           MOVE 10 TO {$MAMA} OF {_{$AGE} OF {$BORROWE|2}|1_}.\r\n"
          + "10      END PROGRAM TEST1.";

  private static final String MESSAGE = "Invalid definition for: ";
  private static final String BORROWE = "BORROWE";
  private static final String AGE = "AGE OF BORROWE";

  @Test
  void assertCopybookProcessingModeNotChangesLogic() {
    Assertions.assertEquals(
        UseCaseUtils.analyze(UseCaseUtils.DOCUMENT_URI, TEXT, List.of(), List.of(), CopybookProcessingMode.ENABLED),
        UseCaseUtils.analyze(UseCaseUtils.DOCUMENT_URI, TEXT, List.of(), List.of(), CopybookProcessingMode.DISABLED));
  }

  @Test
  void assertAnalysisResult() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "1",
            new Diagnostic(null, MESSAGE + AGE, Information, SourceInfoLevels.INFO.getText()),
            "2",
            new Diagnostic(null, MESSAGE + BORROWE, Information, SourceInfoLevels.INFO.getText())));
  }
}
