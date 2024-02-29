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
import org.eclipse.lsp.cobol.core.ParserUtils;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
// to review

/**
 * This test checks that READY TRACE outside the PROCEDURE DIVISION is not allowed
 */
class TestErrorOnReadyTraceOutsideProcedureDivision {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "           {READY|1} TRACE.\n"
                  + "       PROCEDURE DIVISION.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            ParserUtils.isHwParserEnabled()
                                    ? "Extraneous input 'READY'"
                                    : "Syntax error on 'READY'",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
