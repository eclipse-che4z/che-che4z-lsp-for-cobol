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
          + "       *{CONTROL|1} {MAP1|2}\n"
          + "       *{CBL|3} MAP1\n"
          + "       Program-Id. control-dir.";

  private static final String TEXT_CONTINUATION_FOR_COMPILER_DIR =
      "       Identification Division.\n"
          + "       *CONTROL MA\n"
          + "      -{_P.|1_}\n"
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
                null,
                "No arguments found for *CONTROL",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "Syntax error on 'MAP1' expected PROGRAM-ID",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "3",
            new Diagnostic(
                null,
                "No arguments found for *CBL",
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
                null,
                "Compiler directives cannot be continued on another line",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
