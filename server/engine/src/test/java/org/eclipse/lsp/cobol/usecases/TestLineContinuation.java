/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/**
 * Test if variable usage position tracked correctly with line concatenation.
 */
class TestLineContinuation {
  private static final String TEXT =
      "000100 IDENTIFICATION DIVISION.                                         NC2054.2\n"
          + "000200 PROGRAM-ID.                                                      NC2054.2\n"
          + "000300     NC205A.                                                      NC2054.2\n"
          + "003800 DATA DIVISION.                                                   NC2054.2\n"
          + "004300 WORKING-STORAGE SECTION.                                         NC2054.2\n"
          + "005400 77  {$*CONT-A}                       PICTURE S9(5)V9(5) VALUE ZERO.  NC2054.2\n"
          + "005400 77  {$*CONT-B}                       PICTURE S9(5)V9(5) VALUE ZERO.  NC2054.2\n"
          + "028300 PROCEDURE DIVISION.                                              NC2054.2\n"
          + "040700     MOVE     1                                                   NC2054.2\n"
          + "040800-             0                                                   NC2054.2\n"
          + "040900-             0                                                   NC2054.2\n"
          + "041100-             0 TO {$CONT-A}.                                        NC2054.2\n"
          + "040800     DISPLAY {$CONT-A}.                                              NC2054.2\n"
          + "040700     MOVE     4                                                   NC2054.2\n"
          + "040800-             5                                                   NC2054.2\n"
          + "040900-             6                                                   NC2054.2\n"
          + "041000-             7                                                   NC2054.2\n"
          + "041100-             8 TO {$CONT-B}.                                        NC2054.2";

  private static final String TEXT_WITH_COPY =
      "       IDENTIFICATION DIVISION.                                         \n"
      + "       PROGRAM-ID. MIN.\n"
      + "       DATA DIVISION.                                                   \n"
      + "       WORKING-STORAGE SECTION.                                         \n"
      + "       01 FILLER  PIC IS X(99)    VALUE IS \" FEATURE                  PA\n"
      + "      -    \"REMARKS\".                                                   \n"
      + "       PROCEDURE DIVISION.                                              \n"
      + "           COPY                                                    {~KP001|missing}\n"
      + "           .\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testErrorMapping() {

    UseCaseEngine.runTest(
        TEXT_WITH_COPY,
        ImmutableList.of(),
        ImmutableMap.of(
            "missing",
            new Diagnostic(
                new Range(),
                "KP001: Copybook not found",
                Error,
                "COBOL Language Support (copybook)",
                "missing copybook")));
  }

}
