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

import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This class test the *CONTROL (*CBL) compiler directives. */
class TestControlCompilerDirective {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Title  'asas'. \n"
          + "       *CONTROL MAP SOURCE\n"
          + "       *CBL NOMAP.\n"
          + "       Program-Id. control-dir.";

  private static final String TEXT_WRONG_ARG =
      "       Identification Division.\n"
          + "       *CONTROL {MAP1|1}\n"
          + "       Program-Id. control-dir.";

  private static final String TEXT_CONTINUATION_FOR_COMPILER_DIR =
      "       Identification Division.\n"
          + "       *CONTROL {_MAP|1|2_}\n"
          + "      -     NOSOURCE.\n"
          + "       Program-Id. control-dir.";

  @Test
  void testNoErrorOnControlCompilerDirective() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testErrorOnWrongArgumentToControlDirective() {
    UseCaseEngine.runTest(
        TEXT_WRONG_ARG,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(new Position(1, 7), new Position(1, 20)),
                "Invalid argument for CONTROL compiler directives.",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }

  @Test
  void testContinuationForCompilerDirective() {
    UseCaseEngine.runTest(
        TEXT_CONTINUATION_FOR_COMPILER_DIR,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(new Position(2, 7), new Position(2, 21)),
                "Compiler directives cannot be continued on another line.",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                new Range(new Position(1, 7), new Position(1, 28)),
                "Invalid argument for CONTROL compiler directives.",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
