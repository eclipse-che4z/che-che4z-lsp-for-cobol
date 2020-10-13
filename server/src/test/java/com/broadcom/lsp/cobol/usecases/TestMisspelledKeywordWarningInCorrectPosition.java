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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

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
          + "7          {DISPLA|misspelled|area} {\"hello\"|hello}.\n"
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
        List.of(new CobolText(STRUC1_NAME, STRUC1)),
        Map.of(
            "misspelled",
            new Diagnostic(
                null,
                "A misspelled word, maybe you want to put DISPLAY",
                Warning,
                SourceInfoLevels.WARNING.getText()),
            "area",
            new Diagnostic(
                null, "The following token must start in Area A: DISPLA", Warning, SourceInfoLevels.WARNING.getText()),
            "hello",
            new Diagnostic(
                null, "Syntax error on '\"hello\"' expected SECTION", Error, SourceInfoLevels.ERROR.getText())));
  }
}
