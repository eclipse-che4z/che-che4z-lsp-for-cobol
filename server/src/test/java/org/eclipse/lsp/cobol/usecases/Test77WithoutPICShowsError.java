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
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** This class checks that a 77-level variable without PIC specified produces a semantic error. */
class Test77WithoutPICShowsError {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       77 {$*VARNAME|1}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$VARNAME}.";

  private static final String TEXT2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       77 {$*VARNAME|1} USAGE COMPUTATIONAL.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$VARNAME}.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item VARNAME",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void testInCompatibleUsageForElementaryItem() {
    UseCaseEngine.runTest(
        TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item VARNAME",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
