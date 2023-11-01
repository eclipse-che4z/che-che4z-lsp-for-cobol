/*
 * Copyright (c) 2023 Broadcom.
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

/** Test that tokens are not skipped for embedded language. */
public class TestEmbeddedCodeWithIssueOnLastToken {
  private static final String ISSUE_1 = "           :testing,|1_}\n" + "           END-EXEC.";
  private static final String ISSUE_2 = "           :{$testing}{(|1}\n" + "           END-EXEC.";
  private static final String NO_ISSUE = "           :{$testing}\n" + "           END-EXEC.";
  private static final String FETCH_STMT_START = "           fetch abc \n";
  private static final String FETCH_STMT_START_ISSUE_1 = "           fetch {_abc \n";
  private static final String TEXT_HEAD =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*testing} pic x.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL \n";
  private static final String TEXT_TAIL =
      "           into \n" + "           asas,\n" + "           ajsjs, \n";
  public static final String TEXT = TEXT_HEAD + FETCH_STMT_START + TEXT_TAIL;

  @Test
  void testCobolParserDontEatEmbeddedToken() {
    UseCaseEngine.runTest(
        TEXT_HEAD + FETCH_STMT_START_ISSUE_1 + TEXT_TAIL + ISSUE_1,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "No viable alternative at input abc\n           into\n           asas, \n           ajsjs, \n           :testing, ",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testEmbeddedTokensAreFullyMatchedAgainstEmbeddedParserRule() {
    UseCaseEngine.runTest(
        TEXT + ISSUE_2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "No viable alternative at input (",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testPositiveScenario() {
    UseCaseEngine.runTest(TEXT + NO_ISSUE, ImmutableList.of(), ImmutableMap.of());
  }
}
