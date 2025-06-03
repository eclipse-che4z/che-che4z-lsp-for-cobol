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

/** Test CICS translator options position. */
class TestCicsTranslatorOptionsPosition {
  private static final String TEXT =
      "CBL CICS(DLI)\n"
          + "CBL CICS(DLI)\n"
          + "       ID DIVISION.\n"
          + "CBL {_CICS(DLI)|1_}\n"
          + "       PROGRAM-ID. TESTPROG.\n"
          + "CBL {_CICS(DLI)|2_}\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "CICS translator options must be before IDENTIFICATION DIVISION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "CICS translator options must be before IDENTIFICATION DIVISION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
