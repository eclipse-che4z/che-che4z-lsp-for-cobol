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
          + "5      COPY {~REPL4} REPLACING TRAILING ==ID== BY == BY-IDS ==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$TAG_BY-IDS}.";

  private static final String TEXT5 =
      BASE
          + "       01  {$*LOGA}.  \r\n"
          + "       COPY {~REPL5}  \r\n"
          + "            REPLACING  ==LDAY== BY ==DMAN123000000000000000000000000000000005900\n"
          + "      -    0000000000000000011111111111111111111111111111111111111111111\n"
          + "      -    00000000000000000000000== .\r\n";

  private static final String TEXT6 =
      BASE
          + "5      COPY {~REPL6} REPLACING ==:TAG:== BY == A ==.\r\n"
          + "8      PROCEDURE DIVISION.\r\n"
          + "9          MOVE 0 TO {$A_ID}.";

  private static final String TEXT7 =
      BASE
          + "       01  {$*LOGA}.  \r\n"
          + "       COPY {~REPL7}  \r\n"
          + "            REPLACING  ==LDAY== BY ==DMAN123000000000000000000000000000000005900\n"
          + "      -    0000000000000000011111111111111111111111111111111111111111111\n"
          + "      -    00000000000000000000000== .\r\n";

  private static final String TEXT8 =
      BASE
          + "5      COPY {~REPL8} REPLACING =='XXX_ID$'== BY ==ACC_ID==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String TEXT9 =
      BASE
          + "5      COPY {~REPL9} REPLACING =='XXX'_ID== BY ==ACC_ID==.\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$ACC_ID}.";

  private static final String REPL = "0      01 {$*TAG_ID}        PIC 9.\n";
  private static final String REPL_NAME = "REPL";

  private static final String REPL1 = "0      01 {$*:TAG:_ID^ACC_ID}        PIC 9.\n";
  private static final String REPL1_NAME = "REPL1";

  private static final String REPL3 = "0      01 {$*TAG_ID^ACC_ID}        PIC 9.\n";
  private static final String REPL3_NAME = "REPL3";

  private static final String REPL4 = "0      01 {$*TAG_ID^TAG_BY-IDS}        PIC 9.\n";
  private static final String REPL4_NAME = "REPL4";

  private static final String REPL5 =
      "      ***************************************************************** 09700000\r\n"
          + "         02  {$*LOGHDR}.                                                    18000000\r\n"
          + "           03  {$*LDAY^DMAN1230000000000000000000000000000000000000000000001111111111111111111111111111111111111111111100000000000000000000000}           PIC S9(7) COMP-3.                         24000000";
  private static final String REPL5_NAME = "REPL5";

  private static final String REPL6 =
      "0      01 {$*:TAG:_ID^A_ID}        PIC 9.                                        00007100";
  private static final String REPL6_NAME = "REPL6";

  private static final String REPL7 =
      "      ***************************************************************** 09700000\r\n"
          + "         02  {$*LOGHDR}.                                                    18000000\r\n"
          + "           03  {$*LDAY^DMAN1230000000000000000000000000000000000000000000001111111111111111111111111111111111111111111100000000000000000000000}           PIC S9(7) COMP-3.";
  private static final String REPL7_NAME = "REPL7";

  private static final String REPL8 = "0      01 {$*'XXX_ID$'^ACC_ID}    PIC 9.\n";
  private static final String REPL8_NAME = "REPL8";

  private static final String REPL9 = "0      01 {$*'XXX'_ID^ACC_ID}    PIC 9.\n";
  private static final String REPL9_NAME = "REPL9";

  @Test
  void testPartialTextAreNotReplaced() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Variable ACC_ID is not defined",
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

  @Test
  void testWhenReplacedLengthIsMoreThanReplaceable() {
    UseCaseEngine.runTest(
        TEXT5, ImmutableList.of(new CobolText(REPL5_NAME, REPL5)), ImmutableMap.of());
  }

  @Test
  void testWhenReplacedLengthIsLessThanReplaceable() {
    UseCaseEngine.runTest(
        TEXT6, ImmutableList.of(new CobolText(REPL6_NAME, REPL6)), ImmutableMap.of());
  }

  @Test
  void testWhenReplacedLengthIsMoreThanReplaceableAndCopybookHasNoSequence() {
    UseCaseEngine.runTest(
        TEXT7, ImmutableList.of(new CobolText(REPL7_NAME, REPL7)), ImmutableMap.of());
  }

  @Test
  void testQuotedTextAreReplaced() {
    UseCaseEngine.runTest(
        TEXT8, ImmutableList.of(new CobolText(REPL8_NAME, REPL8)), ImmutableMap.of());
  }

  @Test
  void testPartialQuotedTextAreReplaced() {
    UseCaseEngine.runTest(
        TEXT9, ImmutableList.of(new CobolText(REPL9_NAME, REPL9)), ImmutableMap.of());
  }
}
