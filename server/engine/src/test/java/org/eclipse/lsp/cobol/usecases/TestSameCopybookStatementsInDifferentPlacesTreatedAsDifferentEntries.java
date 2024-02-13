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
import org.eclipse.lsp.cobol.core.ParserUtils;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assumptions.assumeFalse;

/**
 * Test several copy statements treated as different entries, so if one of them contains a syntax
 * errors, it will be shown only on the copy statement that produces the error. Here: duplicated
 * DATA DIVISION is a syntax error, but it is shown only on the second copybook entry.
 */
class TestSameCopybookStatementsInDifferentPlacesTreatedAsDifferentEntries {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TESTREPL.\n"
                  + "       {_COPY {~REPL}.|1_}\n"
                  + "       {_COPY {~REPL}.|1_}\n";
  private static final String REPL = "       {DATA|2} DIVISION.\n";
  private static final String REPL_NAME = "REPL";

  @Test
  void test() {
    assumeFalse(ParserUtils.isHwParserEnabled());
    UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(new CobolText(REPL_NAME, REPL)),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            "Errors inside the copybook",
                            DiagnosticSeverity.Error,
                            ErrorSource.COPYBOOK.getText(),
                            null),
                    "2",
                    new Diagnostic(
                            new Range(),
                            ParserUtils.isHwParserEnabled()
                                    ? "Unknown input: 'DATA'"
                                    :
                                    "Syntax error on 'DATA'",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText(),
                            null)));
  }
}
