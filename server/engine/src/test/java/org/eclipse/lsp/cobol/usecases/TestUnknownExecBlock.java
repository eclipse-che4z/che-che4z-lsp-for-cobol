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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests XML parse statement. */
public class TestUnknownExecBlock {

  private static final String EXEC_BLOCK_TERMINATED =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXECOK.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {_EXEC SOMETHING END-EXEC|1_}\n";

  private static final String EXEC_BLOCK_NOT_TERMINATED =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXECOK.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {_EXEC SOMETHING .|1_}\n";

  private static final String EXEC_BLOCK_MULTILINE =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXECOK.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {_EXEC\n"
          + "         SOMETHING END-EXEC|1_}\n";

  @Test
  void terminatedExecBlock() {
    UseCaseEngine.runTest(
        EXEC_BLOCK_TERMINATED,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Unknown EXEC block",
                DiagnosticSeverity.Hint,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void unterminatedExecBlock() {
    UseCaseEngine.runTest(
        EXEC_BLOCK_NOT_TERMINATED,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Unknown EXEC block is not terminated",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void multilineExecBlock() {
    UseCaseEngine.runTest(
        EXEC_BLOCK_MULTILINE,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Unknown EXEC block",
                DiagnosticSeverity.Hint,
                ErrorSource.PARSING.getText())));
  }
}
