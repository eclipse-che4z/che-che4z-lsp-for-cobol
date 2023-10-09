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
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;
import static org.eclipse.lsp4j.DiagnosticSeverity.Warning;

/** This test checks that a misspelled keyword after a copybook usage is in the correct position */
class TestMisspelledKeywordWarningInCorrectPosition {

  private static final String TEXT =
      "0      Identification Division. \n"
          + "1      Program-id.    ProgramId.\n"
          + "2      Data Division.\n"
          + "3      Working-Storage Section.\n"
          + "4       COPY {~STRUC1}. \n"
          + "5      Procedure Division.\n"
          + "6      {#*000-Main-Logic}.\n"
          + "7          {@*DISPLA|misspelled|area} {\"hello\"|hello}.\n"
          + "8          DISPLAY {$CHILD1} OF {$PARENT1}.\n"
          + "9      End program ProgramId.";

  private static final String STRUC1 =
      "       01  {$*PARENT1}.\n"
          + "           03  {$*CHILD1}         PIC 9   VALUE IS '0'.\n"
          + "           03  {$*CHILD2}         PIC 9   VALUE IS '1'.\n"
          + "           03  {$*CHILD3}         PIC 9   VALUE IS '2'.";

  private static final String STRUC1_NAME = "STRUC1";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(STRUC1_NAME, STRUC1)),
        ImmutableMap.of(
            "misspelled",
            new Diagnostic(
                new Range(),
                "A misspelled word, maybe you want to put DISPLAY",
                Warning,
                ErrorSource.PARSING.getText()),
            "area",
            new Diagnostic(
                new Range(),
                "The following token must start in Area A: DISPLA",
                Warning,
                ErrorSource.PARSING.getText()),
            "hello",
            new Diagnostic(
                new Range(), "Syntax error on '\"hello\"'", Error, ErrorSource.PARSING.getText())));
  }
}
