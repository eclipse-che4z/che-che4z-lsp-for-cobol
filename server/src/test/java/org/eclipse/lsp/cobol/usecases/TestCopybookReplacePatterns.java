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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/**
 * Test different pattern for the copy replace statements. Also covers, LEADING and TRAILING
 * clauses.
 */
class TestCopybookReplacePatterns {

  private static final String BASE =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n";
  private static final String TEXT =
      BASE
          + "5      COPY {~REPL} REPLACING ==TAG== BY == ACC ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {ACC_ID|1}.";

  private static final String TEXT2 =
      BASE
          + "5      COPY {~REPL1} REPLACING ==:TAG:== BY == ACC ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String TEXT3 =
      BASE
          + "5      COPY {~REPL3} REPLACING LEADING ==TAG== BY == ACC ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String TEXT4 =
      BASE
          + "5      COPY {~REPL4} REPLACING TRAILING ==ID== BY == IDS ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$TAG_IDS}.";

  private static final String REPL = "0      01 {$*TAG_ID}        PIC 9.\n";
  private static final String REPL_NAME = "REPL";

  private static final String REPL1 = "0      01 {$*:TAG:_ID^ACC_ID}        PIC 9.\n";
  private static final String REPL1_NAME = "REPL1";

  private static final String REPL3 = "0      01 {$*TAG_ID^ACC_ID}        PIC 9.\n";
  private static final String REPL3_NAME = "REPL3";

  private static final String REPL4 = "0      01 {$*TAG_ID^TAG_IDS}        PIC 9.\n";
  private static final String REPL4_NAME = "REPL4";

  @Test
  void testPartialTextAreNotReplaced() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Invalid definition for: ACC_ID",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }

  @Test
  void testTextAreNotReplacedBasedOnValidSeparators() {
    UseCaseEngine.runTest(
        TEXT2, ImmutableList.of(new CobolText(REPL1_NAME, REPL1)), ImmutableMap.of());
  }

  @Test
  void testPartialTextReplaceableWithLeadingClause() {
    UseCaseEngine.runTest(
        TEXT3, ImmutableList.of(new CobolText(REPL3_NAME, REPL3)), ImmutableMap.of());
  }

  @Test
  void testPartialTextReplaceableWithTrailingClause() {
    UseCaseEngine.runTest(
        TEXT4, ImmutableList.of(new CobolText(REPL4_NAME, REPL4)), ImmutableMap.of());
  }
}
