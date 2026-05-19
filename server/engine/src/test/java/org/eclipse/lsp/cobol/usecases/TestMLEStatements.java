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

/** This test checks if Millennium Language Extensions are being marked correctly. */
class TestMLEStatements {

  private static final String MLE =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. MLE-DEMO.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*WS-INVOICE-DATE}       PIC 9(6) {DATE|errorOne} FORMAT YYXXXX.\n"
          + "       01  {$*WS-CURRENT-DATE}       PIC 9(8) {DATE|errorTwo} FORMAT YYYYXXXX.\n"
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

  @Test
  void testMLE() {
    // Corresponds to "cobolParser.MLEDeprecated"
    String messageStr = "Millennium Language Extensions are deprecated in later COBOL versions.";

    Diagnostic diagnostic =
        new Diagnostic(
            new Range(), messageStr, DiagnosticSeverity.Warning, ErrorSource.PARSING.getText());

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
}
