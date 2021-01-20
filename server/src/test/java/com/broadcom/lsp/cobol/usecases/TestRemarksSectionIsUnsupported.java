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

import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that the remarks section is not marked as a comment, and the syntax analysis
 * applied.
 *
 * <p>The REMARKS is an old syntax that is not supported anymore, so it should be marked as error.
 */
class TestRemarksSectionIsUnsupported {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       AUTHOR.     SE.\n"
          + "           {REMARKS|unsupported}.\n"
          + "              PURPOSE.\n"
          + "              THIS PROGRAM IS DEFINED TO TEST A NUMBER OF THE\n"
          + "              APPLICATION TESTING COLLECTION AND DEBUG TOOL FUNCTIONS\n"
          + "       ENVIRONMENT DIVISION.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "unsupported",
            new Diagnostic(
                null,
                "Syntax error on 'REMARKS' expected {<EOF>, AUTHOR, DATE-COMPILED, DATE-WRITTEN, ID, IDENTIFICATION, INSTALLATION, "
                    + "ENVIRONMENT, PROCEDURE, DATA, END, SECURITY}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
