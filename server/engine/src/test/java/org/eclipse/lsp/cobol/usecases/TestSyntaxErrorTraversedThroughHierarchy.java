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
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

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
          + "       PROCEDURE DIVISION.\n"
          + "       {_COPY {~CONT}.|1_}\n"
          + "       {#*MAINLINE}. \n"
          + "           GOBACK. ";

  private static final String CONT = "       {_COPY {~REPL}.|1_}";
  private static final String CONT_NAME = "CONT";

  private static final String REPL = "       {@*05} {@*TAG-ID|3} {PIC|4} 9.\n";
  private static final String REPL_NAME = "REPL";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL), new CobolText(CONT_NAME, CONT)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Errors inside the copybook",
                Error,
                ErrorSource.COPYBOOK.getText(),
                null),
            "3",
            new Diagnostic(
                new Range(),
                "Syntax error on 'TAG-ID'",
                Error,
                ErrorSource.PARSING.getText(),
                null),
            "4",
            new Diagnostic(
                new Range(),
                "Syntax error on 'PIC'",
                Error,
                ErrorSource.PARSING.getText(),
                null)));
  }
}
