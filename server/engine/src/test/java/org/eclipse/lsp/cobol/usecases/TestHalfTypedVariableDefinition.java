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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test that not completely typed variable definition doesn't produce an exception. */
class TestHalfTypedVariableDefinition {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*COD-RETOUR} PIC X{(|1}{66|2}{|3}";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Extraneous input '('",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "No data definition entry found for rename",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Unexpected end of file",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
