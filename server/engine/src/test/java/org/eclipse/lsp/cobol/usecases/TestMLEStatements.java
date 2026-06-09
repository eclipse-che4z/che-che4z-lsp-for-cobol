/*
 * Copyright (c) 2026 Broadcom.
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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** This test checks if Millennium Language Extensions are being marked correctly. */
class TestMLEStatements {

  // Corresponds to "cobolParser.MLEDeprecated"
  private static final String ERROR_MSG =
      "Millennium Language Extensions are deprecated in later COBOL versions.";

  private static final String MLE =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. MLE-DEMO.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*WS-INVOICE-DATE}       PIC 9(6) {_DATE FORMAT YYXXXX|errorOne_}.\n"
          + "       01  {$*WS-CURRENT-DATE}       PIC 9(8) {_DATE FORMAT YYYYXXXX|errorTwo_}.\n"
          + "       01  {$*WS-RAW-NUMBER}         PIC 9(6) VALUE 981231.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*MAIN-PARA} SECTION.\n"
          + "           MOVE FUNCTION {_{$$DATEVAL}|errorThree_}({$WS-RAW-NUMBER}) TO "
          + "{$WS-INVOICE-DATE}.\n"
          + "           DISPLAY \"Raw numeric invoice value: \" \n"
          + "                   FUNCTION {_{$$UNDATE}|errorFour_}({$WS-INVOICE-DATE}).\n"
          + "           DISPLAY \"The active Century Window starts in: \" \n"
          + "                   FUNCTION {_{$$YEARWINDOW}|errorFive_}.\n"
          + "           STOP RUN.\n";

  private static final String MLE2 =
      "       {$$*IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. DATEVAL.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*UNRELATED-STUFF}.                                 \n"
          + "           05  {$*NUM}         PIC X(1234).                     \n"
          + "       PROCEDURE DIVISION RETURNING {$UNRELATED-STUFF}.        \n"
          + "       END FUNCTION DATEVAL.|DATEVAL}                                  \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGMNAME.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       REPOSITORY.\n"
          + "                   FUNCTION {$$DATEVAL}.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "               DISPLAY FUNCTION {$$DATEVAL}.\n"
          + "               EXIT PROGRAM.\n";

  @Test
  void testMLE() {
    Diagnostic diagnostic =
        new Diagnostic(
            new Range(), ERROR_MSG, DiagnosticSeverity.Warning, ErrorSource.PARSING.getText());

    UseCaseEngine.runTest(
        MLE,
        ImmutableList.of(),
        ImmutableMap.of(
            "errorOne", diagnostic,
            "errorTwo", diagnostic,
            "errorThree", diagnostic,
            "errorFour", diagnostic,
            "errorFive", diagnostic),
        ImmutableMap.of());
  }

  @Test
  void testMLE2() {
    UseCaseEngine.runTest(MLE2, ImmutableList.of(), ImmutableMap.of());
  }
}
