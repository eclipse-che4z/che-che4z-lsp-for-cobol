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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/** Test missing copybook at the beginning doesn't break the syntax analysis */
class TestMissingCopybookAtBeginningNotBreaksSyntaxAnalysis {

  private static final String TEXT =
      "       COPY {~ASDAW|1}.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT} PIC 9.\n"
          + "       PROCEDURE DIViSION. \n"
          + "       {#*MAINLINE}. \n"
          + "           MOVE 0 TO {$PARENT}. \n"
          + "           GOBACK.  ";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "1",
            new Diagnostic(
                null,
                "ASDAW: Copybook not found",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText(),
                "MISSING_COPYBOOK")));
  }
}
