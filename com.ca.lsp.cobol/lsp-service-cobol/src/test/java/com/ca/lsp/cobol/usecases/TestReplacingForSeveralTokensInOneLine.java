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

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.Test;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static java.util.Collections.singletonList;
import static java.util.Collections.singletonMap;

/**
 * This test verifies that the replacing statement changes the variable names following one by one,
 * and definition errors for them found correctly. Here, :TAG: should be replaced with CSTOUT, so
 * the copybook content processed as CSTOUT-KEY and CSTOUT-ID. ABC-CHILD not defined, so there
 * should be the semantic error.
 */
public class TestReplacingForSeveralTokensInOneLine {

  private static final String DOCUMENT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01 {$*ABC-PARENT}.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       {#*MAIN-LINE}.\r\n"
          + "       COPY {~REPL} REPLACING ==:TAG:== BY ==ABC==.\r\n"
          + "       GOBACK.";

  private static final String REPL =
      "          MOVE 10 TO {$:TAG:-CHILD^ABC-CHILD|invalid|invalid} OF {$:TAG:-PARENT^ABC-PARENT}";

  private static final String REPL_NAME = "REPL";
  private static final String MESSAGE = "Invalid definition for: ABC-CHILD";

  @Test
  public void test() {
    UseCaseEngine.runTest(
        DOCUMENT,
        singletonList(new CobolText(REPL_NAME, REPL)),
        singletonMap(
            "invalid",
            new Diagnostic(null, MESSAGE, DiagnosticSeverity.Information, INFO.getText())));
  }
}
