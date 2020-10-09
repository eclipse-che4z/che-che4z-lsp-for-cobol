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

import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/**
 * Test several copy statements treated as different entries, so if one of them contains a syntax
 * errors, it will be shown only on the copy statement that produces the error. Here: one of two
 * "COPY REPL" statements places in the procedure division, that is, according to its content, a
 * syntax error, so this exact statement should be underlined.
 */
class TestSameCopybookStatementsInDifferentPlacesTreatedAsDifferentEntries {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT}.\n"
          + "       COPY {~REPL}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {_COPY {~REPL}.|1|3_}\n"
          + "       {#*MAINLINE}. \n"
          + "           MOVE 0 TO {$TAG-ID}.\n"
          + "           GOBACK. ";

  private static final String REPL = "       05 {$*TAG-ID|1} {PIC|3} 9.\n";
  private static final String REPL_NAME = "REPL";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(new CobolText(REPL_NAME, REPL)),
        Map.of(
            "1",
            new Diagnostic(
                null, "Syntax error on 'TAG-ID' expected SECTION", Error, SourceInfoLevels.ERROR.getText(), null),
            "3",
            new Diagnostic(
                null, "Syntax error on 'PIC' expected SECTION", Error, SourceInfoLevels.ERROR.getText(), null)));
  }
}
