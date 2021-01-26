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

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** This test checks the semantic error about incorrect order of variables to rename */
class TestRenamesThruIncorrectOrder {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTRENAME.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME1}.\n"
          + "          02 {$*VARNAME2} PIC 9.\n"
          + "          02 {$*VARNAME3} PIC 9.\n"
          + "       66 {$*VARANME4|1} RENAMES {$VARNAME3} THROUGH {$VARNAME2}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 TO {VARNAME2|2} OF VARANME4.\n"
          + "           MOVE 0 TO {VARNAME3|3} OF VARANME4.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "1",
            new Diagnostic(
                null,
                "The data entries to rename are specified in an incorrect order",
                DiagnosticSeverity.Error,
                ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "Invalid definition for: VARNAME2",
                DiagnosticSeverity.Error,
                ERROR.getText()),
            "3",
            new Diagnostic(
                null,
                "Invalid definition for: VARNAME3",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
