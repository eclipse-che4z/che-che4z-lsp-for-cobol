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

/** This test checks that unexpected text in ID DIVISION is flagged */
class TestUnexpectedTextInIdentificationDivision {

  private static final String TEXT =
      "       identification division.\n"
          + "       program-id. test.\n"
          + "       {DISPLAY|1} \"HELLO\".\n"
          + "       data division.\n"
          + "       working-storage section.\n"
              + (ParserUtils.isHwParserEnabled()
              ? "       01 {$*VARNAME} PIC X(3) VALUE \"ABC\".\n"
              : "       01 VARNAME PIC X(3) VALUE \"ABC\".\n")
          + "       procedure division.\n"
              + (ParserUtils.isHwParserEnabled()
              ? "           DISPLAY {$VARNAME}."
              : "           DISPLAY VARNAME.");

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'DISPLAY'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
