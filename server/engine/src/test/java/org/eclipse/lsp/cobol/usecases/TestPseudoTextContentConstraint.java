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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test the following pseudo text constraint - 1. Each word of pseudo text can't have more than 322
 * chars. 2. COPY word not allowed in pseudo text. 3. Pseudo text delimiter can't be continued.
 */
class TestPseudoTextContentConstraint {
  private static final String BASE =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID. TESTREPL.\n"
          + "2      DATA DIVISION.\n"
          + "3      WORKING-STORAGE SECTION.\n";
  private static final String TEXT =
      BASE
          + "5      COPY {~REPL} REPLACING {_==asasasasasasasasasasasasa|1_}\n"
          + "      -    cccccccccccccccccccccccccccccccccccccccccccccccccccc\n"
          + "      -    oooooooooooooooooooooooooooooooooooooooooooooooooooo\n"
          + "      -    bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\n"
          + "      -    oooooooooooooooooooooooooooooooooooooooooooooooooooo\n"
          + "      -    llllllllllllllllllllllllllllllllllllllllllllllllllll\n"
          + "      -    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII\n"
          + "      -    BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB\n"
          + "      -    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\n"
          + "      -    == BY ====.\n"
          + "8      PROCEDURE DIVISION.\n";
  private static final String PSEUDO_COPY_TEXT =
      BASE
          + "5      COPY {~REPL} REPLACING {_==COPY== BY ====|1_}.\n"
          + "8      PROCEDURE DIVISION.";

  private static final String PSEUDO_TEXT_DELIMITER_CONSTRAINT =
      BASE
          + "5      COPY {~REPL} REPLACING ==COPY1=\n"
          + "      -{_= BY == CD ==.|1_}\n"
          + "8      PROCEDURE DIVISION.";

  private static final String PSEUDO_TEXT_COMMA_OPERAND1 =
      BASE
          + "5      COPY {~DEMO1} REPLACING ==, == BY ==== .\n"
          + "8      PROCEDURE DIVISION.\n"
          + "9          MOVE 0 TO {$TAG_ID}. ";

  private static final String REPL = "                \n";
  private static final String REPL_NAME = "REPL";

  private static final String DEMO1 = "0      01 {$*TAG_ID, ^TAG_ID}    PIC 9.";
  private static final String DEMO1_NAME = "DEMO1";

  @Test
  void testMax322CharsAllowedInPseudoText() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(new Position(4, 27), new Position(13, 22)),
                "Max 322 chars allowed for each individual word in pseudo text",
                DiagnosticSeverity.Error,
                ErrorSource.EXTENDED_DOCUMENT.getText())));
  }

  @Test
  void testCopyNotAllowedInPseudoText() {
    UseCaseEngine.runTest(
        PSEUDO_COPY_TEXT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "COPY string is not allowed in pseudo text",
                DiagnosticSeverity.Error,
                ErrorSource.EXTENDED_DOCUMENT.getText())));
  }

  @Test
  void testPseudoTextDelimiterCannotBeContinued() {
    UseCaseEngine.runTest(
        PSEUDO_TEXT_DELIMITER_CONSTRAINT,
        ImmutableList.of(new CobolText(REPL_NAME, REPL)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Compiler directives cannot be continued on another line",
                DiagnosticSeverity.Error,
                ErrorSource.PREPROCESSING.getText())));
  }

  @Test
  void testUnderscoreAllowedAsOperandOne() {
    UseCaseEngine.runTest(
        PSEUDO_TEXT_COMMA_OPERAND1,
        ImmutableList.of(new CobolText(DEMO1_NAME, DEMO1)),
        ImmutableMap.of());
  }
}
