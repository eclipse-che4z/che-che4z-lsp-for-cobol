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
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks the "duplicated clause" errors for the different types of clauses in a variable
 * definition with the level number 77
 */
class Test77WithMultiplePicShowsError {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       77 {$*VARNAME|1|2|3|4|5} PIC 9 PIC x VALUE 0 VALUE 1\n"
          + "          OCCURS 5 TIMES OCCURS 10 TIMEs USAGE POINTER USAGE DISPLAY.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$VARNAME}.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A duplicate PICTURE clause was found in a data description entry",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "A duplicate VALUE clause was found in a data description entry",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "A duplicate OCCURS clause was found in a data description entry",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "A duplicate USAGE clause was found in a data description entry",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "5",
            new Diagnostic(
                new Range(),
                "PICTURE clause incompatible with usage POINTER",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }
}
