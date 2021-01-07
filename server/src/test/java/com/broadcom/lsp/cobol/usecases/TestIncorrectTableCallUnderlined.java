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

/** This test verifies that the definition checks applies to the table calls */
class TestIncorrectTableCallUnderlined {

  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           MOVE 'ABC' TO {OL-ACCT-NO|1}({SUB1|2}).\n"
          + "       End program ProgramId.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "1",
            new Diagnostic(
                null,
                "Invalid definition for: OL-ACCT-NO",
                DiagnosticSeverity.Error,
                ERROR.getText()),
            "2",
            new Diagnostic(
                null, "Invalid definition for: SUB1", DiagnosticSeverity.Error, ERROR.getText())));
  }
}
