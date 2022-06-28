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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import org.eclipse.lsp.cobol.core.model.ErrorStage;

/**
 * This test check the semantic error when the renamed structure does not contain the specified data
 * name.
 */
class TestRenamesWithNonExistingName {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTRENAME.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME1}.\n"
          + "           02 {$*VARNAME2} PIC 9.\n"
          + "       66 {$*VARNAME3|1} RENAMES NOT-EXISTS1.\n"
          + "       01 {$*VARNAME4|2}.\n"
          + "       66 {$*VARNAME5|3} RENAMES NOT-EXISTS2.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 0 TO {$VARNAME2} OF {$VARNAME1}.\n"
          + "           MOVE 0 TO {_VARNAME5 OF VARNAME4|4_}.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "The data entry with the name NOT-EXISTS1 not found",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item VARNAME4",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "The data entry with the name NOT-EXISTS2 not found",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "Variable VARNAME5 is not defined",
                DiagnosticSeverity.Error,
                 ErrorStage.SYNTAX.getText())));
  }
}
