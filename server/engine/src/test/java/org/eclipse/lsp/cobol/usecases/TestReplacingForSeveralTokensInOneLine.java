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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test verifies that the replacing statement changes the variable names following one by one,
 * and definition errors for them found correctly. Here, :TAG: should be replaced with CSTOUT, so
 * the copybook content processed as CSTOUT-KEY and CSTOUT-ID. ABC-CHILD not defined, so there
 * should be the semantic error.
 */
class TestReplacingForSeveralTokensInOneLine {

  private static final String DOCUMENT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01 {$*ABCDE-PARENT} PIC 9.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "       {#*MAIN-LINE}.\r\n"
          + "       {_COPY {~REPL} REPLACING ==:TAG:== BY ==ABCDE==.|invalid_}\r\n"
          + "           GOBACK.";

  private static final String REPL =
      "              MOVE 10 TO {_{:TAG:-CHILD^ABCDE-CHILD} OF {:TAG:-PARENT^ABCDE-PARENT}|invalidS_}";

  private static final String REPL_NAME = "REPL";
  private static final String MESSAGE = "Variable ABCDE-CHILD is not defined";

  @Test
  void test() {
    UseCaseEngine.runTest(
        DOCUMENT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL)),
        ImmutableMap.of(
            "invalid", new Diagnostic(new Range(), "Errors inside the copybook", DiagnosticSeverity.Error,  ErrorSource.COPYBOOK.getText()),
            "invalidS", new Diagnostic(new Range(), MESSAGE, DiagnosticSeverity.Error,  ErrorSource.PARSING.getText())
                ));
  }
}
