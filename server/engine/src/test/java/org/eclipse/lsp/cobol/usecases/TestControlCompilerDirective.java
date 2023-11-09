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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Disabled;
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
      "       Identification Division{.|4}\n"
          + "       *{CONTROL|1} MAP1\n"
          + "       *{CBL|3} {MAP1|2}\n"
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
  @Disabled("TODO better error handling for CBLs")
  void testErrorOnWrongArgumentToControlDirective() {
    UseCaseEngine.runTest(
        TEXT_WRONG_ARG,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "No arguments found for *CONTROL",
                DiagnosticSeverity.Error,
                ErrorSource.PREPROCESSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Syntax error on 'MAP1'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "No arguments found for *CBL",
                DiagnosticSeverity.Error,
                ErrorSource.PREPROCESSING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "Missing token PROGRAM-ID at programIdParagraph",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testContinuationForCompilerDirective() {
    UseCaseEngine.runTest(
        TEXT_CONTINUATION_FOR_COMPILER_DIR,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Compiler directives cannot be continued on another line",
                DiagnosticSeverity.Error,
                ErrorSource.PREPROCESSING.getText())));
  }
}
