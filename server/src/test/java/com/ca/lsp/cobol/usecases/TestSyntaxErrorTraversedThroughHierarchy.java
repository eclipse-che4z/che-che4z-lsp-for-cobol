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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/**
 * Test the errors from the bottom of the hierarchy shown at the original document even if there are
 * several intermediate document levels. Here: REPL is nested to CONT, and is nested to the
 * document. REPL contains a syntax errors that should be shown at the copy statement in the
 * document.
 */
class TestSyntaxErrorTraversedThroughHierarchy {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {_COPY {~CONT}.|1|2_}\n"
          + "       {#*MAINLINE}. \n"
          + "           GOBACK. ";

  private static final String CONT = "       {_COPY {~REPL}.|1|2_}";
  private static final String CONT_NAME = "CONT";

  private static final String REPL = "       05 {TAG-ID|1} {PIC|2} 9.\n";
  private static final String REPL_NAME = "REPL";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(new CobolText(REPL_NAME, REPL), new CobolText(CONT_NAME, CONT)),
        Map.of(
            "1",
            new Diagnostic(
                null, "Syntax error on 'TAG-ID' expected SECTION", Error, ERROR.getText(), null),
            "2",
            new Diagnostic(
                null, "Syntax error on 'PIC' expected SECTION", Error, ERROR.getText(), null)));
  }
}
