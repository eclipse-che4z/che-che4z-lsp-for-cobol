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
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test nested copy statements are allowed , but is constraint by maximum one copy statement with
 * replace clause.
 */
class TestNestedCopyReplaceClause {
  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "5      {_COPY {~REPL} REPLACING ==COPY1== BY == CD ==.|1_}\n"
          + "8      PROCEDURE DIVISION.";

  private static final String TEXT2 =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n"
          + "5      COPY {~REPL1} REPLACING TRAILING ==STRUCT1== BY == NUMBER ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACT-NUMBER}.";

  private static final String REPL =
      "       COPY {_{~STRUCT1}|2_} REPLACING ==C1== BY == CD1 ==.\n";
  private static final String REPL_NAME = "REPL";

  private static final String REPL1 = "       COPY {~STRUCT1^NUMBER} .\n";
  private static final String REPL1_NAME = "REPL1";

  private static final String STRUCT1 = "       01 {$*ACT-STRUCT1} PIC 9.";
  private static final String STRUCT1_NAME = "STRUCT1";

  private static final String NUMBER = "       01 {$*ACT-STRUCT1^ACT-NUMBER} PIC 9.";
  private static final String NUMBER_NAME = "NUMBER";

  @Test
  void testNestedCopybookWithMultipleReplaceStmtThrowError() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL), new CobolText(STRUCT1_NAME, STRUCT1)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "More than one nested copy replace statement for copybook declaration of: STRUCT1",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "More than one nested copy replace statement for copybook declaration of: STRUCT1",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText())));
  }

  @Test
  void testReplaceWorksOnAllCopybooksUnderCurrentContext() {
    UseCaseEngine.runTest(
        TEXT2,
        ImmutableList.of(new CobolText(REPL1_NAME, REPL1), new CobolText(NUMBER_NAME, NUMBER)),
        ImmutableMap.of());
  }
}
