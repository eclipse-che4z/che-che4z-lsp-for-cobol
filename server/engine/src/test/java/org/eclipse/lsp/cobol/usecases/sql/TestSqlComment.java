/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test DB2 SQL comments */
public class TestSqlComment {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "             EXEC SQL \n"
          + "             open a\n"
          + "      *      select a from table a = b  \n"
          + "             select a from table -- random where stuffss ss sdjsd  \n"
          + "              END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  public static final String EMPTY_COMMENTS_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test12.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-ID} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "               --\n"
          + "               --\n"
          + "               --\n"
          + "               SELECT EMP_ID\n"
          + "               -- Second comment before the host variable\n"
          + "               INTO {:WS-MISSING|1}\n"
          + "               FROM EMPLOYEE -- Comment after SQL text\n"
          + "               WHERE EMP_ID = 1\n"
          + "           END-EXEC.\n";

  @Test
  void testEmptyCommentLinesKeepPositions() {
    UseCaseEngine.runTest(
        EMPTY_COMMENTS_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable WS-MISSING is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
