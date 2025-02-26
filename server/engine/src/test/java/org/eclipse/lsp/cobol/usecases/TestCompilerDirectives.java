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
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test for compiler directives
 */
class TestCompilerDirectives {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*G1}.\n"
          + "         03 {$*N1} PIC S9(9) COMP-5.\n"
          + "         03 {$*G1SUB}.\n"
          + "           05 {$*S1} PIC X(20).\n"
          + "       >>JAVA-SHAREABLE OFF\n"
          + "       01 {$*TESTW} pic x(9).\n"
          + "       >>JAVA-CALLABLE\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$TESTW}.\n"
          + "           GOBACK.\n";

  private static final String TEXT_ERROR =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       JAVA-SHAREABLE ON\n"
                  + "       01 N1 PIC S9(9) COMP-5.\n"
                  + "       {JAVA-SHAREABLE|error1|error2}\n"
                  + "       JAVA-CALLABLE\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           GOBACK.\n";
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testError() {
    UseCaseEngine.runTest(
            TEXT_ERROR,
            ImmutableList.of(),
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(new Position(6, 21), new Position(6, 21)),
                            "Missing token JAVA-SHAREABLE OFF for the JAVA-SHAREABLE block",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Extraneous input 'JAVA-SHAREABLE'",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())),
            ImmutableList.of());
  }
}
