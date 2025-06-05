/*
 * Copyright (c) 2025 Broadcom.
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

/** Test CICS translator options position. */
class TestCicsTranslatorOptionsPosition {
  private static final String TEXT =
      "CBL CICS(DLI)\n"
          + "CBL CICS(DLI)\n"
          + "       ID DIVISION.\n"
          + "CBL {_CICS(DLI)|1_}\n"
          + "       PROGRAM-ID. TESTPROG.\n"
          + "CBL {_CICS(DLI)|2_}\n";
  private static final String TEXT_2 =
      "       COPY    {~COPYBOOK}.\n"
          + "       CBL     {_CICS(\"SP\")|1_}\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGMNAME.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "               EXEC CICS ABEND END-EXEC.\n"
          + "               EXIT PROGRAM.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "CICS translator options must be at the beginning of source code",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "CICS translator options must be at the beginning of source code",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(
        TEXT_2,
        ImmutableList.of(new CobolText("COPYBOOK", "")),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "CICS translator options must be at the beginning of source code",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
