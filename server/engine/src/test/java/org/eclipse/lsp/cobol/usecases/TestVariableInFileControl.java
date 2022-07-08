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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import org.eclipse.lsp.cobol.core.model.ErrorSource;

/** This test checks that variable can be used before its definition. */
class TestVariableInFileControl {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "           SELECT {$FOO} FILE STATUS IS {$BAR}.\n"
          + "           SELECT {$FOO1} FILE STATUS IS {BAZ|1}.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        FD  {$*FOO} \n"
          + "           LABEL RECORDS ARE STANDARD. \n"
          + "        FD  {$*FOO1} \n"
          + "           LABEL RECORDS ARE STANDARD. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*BAR}  PIC  X(2).";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(new Range(), "Variable BAZ is not defined", DiagnosticSeverity.Error,  ErrorSource.PARSING.getText())));
  }
}
