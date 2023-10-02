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
import org.junit.jupiter.api.Test;

/**
 * This test checks that the title before and after IDENTIFICATION DIVISION processed successfully
 */
class TestTitleStatement {
  private static final String TEXT1 =
      "        IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. TITLETEST.\n"
          + "          DATA DIVISION.\n";

  private static final String TEXT2 =
      "          WORKING-STORAGE SECTION.\n" + "          PROCEDURE DIVISION.\n";

  private static final String TITLE = "                TITLE 'title'. \n";
  private static final String END = "          END PROGRAM 'TITLETEST'. \n";
  private static final String TITLE_WITHOUT_STMT = "                {TITLE|1} .\n";

  @Test
  void testTitleBeforeIdDivision() {
    UseCaseEngine.runTest(TITLE + TEXT1 + TEXT2 + END, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testTitleAfterDataDivision() {
    UseCaseEngine.runTest(TEXT1 + TITLE + TEXT2 + END, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testTitleAfterProcedureDivision() {
    UseCaseEngine.runTest(TEXT1 + TEXT2 + TITLE + END, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testTitleWithNoTitleStatement() {
    UseCaseEngine.runTest(
        TEXT1 + TITLE_WITHOUT_STMT + END,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'TITLE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
