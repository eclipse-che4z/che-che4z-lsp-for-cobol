/*
 * Copyright (c) 2021 Broadcom.
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

/**
 * This test checks that the missing copybook name error in COPY MAID is shown in the correct
 * position
 */
class TestCopyMaidWithQualifierMissingCopybook {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SETINDEX.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*MRB|1}.\n"
          + "           03 COPY MAID {~ABCDEFG123`ABCDEFG123_ABC|2} ABC.\n"
          + "       01  {$*QWE} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {VAR1|3}.\n"
          + "           DISPLAY {$QWE}.\n"
          + "           DISPLAY {$MRB}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "A \"PICTURE\" clause was not found for elementary item MRB",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "ABCDEFG123_ABC: Copybook not found",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText(),
                "MISSING_COPYBOOK"),
            "3",
            new Diagnostic(
                null,
                "Variable VAR1 is not defined",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
