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

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** This test checks that 66-level variable cannot be renamed by another 66 one */
class Test66RenamingReturnError {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTRENAME.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       66 {$*VARNAME4|1} RENAMES VARNAME2.\n"
          + "       01 {$*VARNAME1}.\n"
          + "          02 {$*VARNAME2} PIC 9.\n"
          + "       66 {$*VARNAME3} RENAMES {$VARNAME2}.\n"
          + "       66 {$*VARNAME5} RENAMES {$VARNAME2}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE {$VARNAME2} TO {$VARNAME3}.\n"
          + "           MOVE {$VARNAME3} TO {$VARNAME5}.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "No data definition entry found for rename",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
