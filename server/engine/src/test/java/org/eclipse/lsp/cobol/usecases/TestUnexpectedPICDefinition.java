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

/**
 * This test verifies that unknown PIC definitions trigger diagnostic messages rather than causing a
 * null pointer exception. In this case below, PIC =(10)9.99-, with equal symbol.
 */
class TestUnexpectedPICDefinition {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*VRB|1} PIC {=|2}(10)9.99-.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           STOP RUN.";

  private static final String MESSAGE1 =
      "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item VRB";
  private static final String MESSAGE2 = "Syntax error on '='";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), MESSAGE1, DiagnosticSeverity.Error, ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(), MESSAGE2, DiagnosticSeverity.Error, ErrorSource.PARSING.getText())));
  }
}
