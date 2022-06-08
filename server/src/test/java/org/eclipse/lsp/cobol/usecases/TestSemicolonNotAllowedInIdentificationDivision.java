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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** This test checks that the semicolons are not allowed outside the PROCEDURE DIVISION. */
class TestSemicolonNotAllowedInIdentificationDivision {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION;\n"
          + "       {PROGRAM-ID|1}. {TEST1|2}.\n"
          + "       DATA DIVISION.\n"
          + "       working-storage section.\n"
          + "       01 {$*LINE-SPACING} PIC 9.\n"
          + "       procedure division.\n"
          + "           MOVE 2 TO {$LINE-SPACING}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Extraneous input 'PROGRAM-ID' expected '.'",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "Syntax error on 'TEST1' expected PROGRAM-ID",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
