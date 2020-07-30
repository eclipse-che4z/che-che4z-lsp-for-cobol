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

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * This test covers case when copybook that was not found appears as a variable. Assert that there
 * is no variable with name 'CPYNAME' in the defined variable list due to the copybook with this
 * name isn't resolved. There should be only 'PARENT'.
 */
public class TestMissingCopybookNotInVariableList {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*PARENT}. COPY {~CPYNAME|missing}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO {$CHILD1|invalid|invalid} OF {$PARENT}.";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "missing",
            new Diagnostic(
                null, "CPYNAME: Copybook not found", Error, ERROR.getText(), "MISSING_COPYBOOK"),
            "invalid",
            new Diagnostic(null, "Invalid definition for: CHILD1", Information, INFO.getText())));
  }
}
