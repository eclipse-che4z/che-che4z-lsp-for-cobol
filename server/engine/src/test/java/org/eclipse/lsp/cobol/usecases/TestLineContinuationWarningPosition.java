/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/**
 * Test if variable usage position tracked correctly with line concatenation.
 */
public class TestLineContinuationWarningPosition {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.                                         \n"
                  + "       PROGRAM-ID. TEST.                                                      \n"
                  + "       ENVIRONMENT DIVISION.                                            \n"
                  + "       CONFIGURATION SECTION.                                           \n"
                  + "       INPUT-OUTPUT SECTION.                                            \n"
                  + "       DATA DIVISION.                                                   \n"
                  + "       WORKING-STORAGE SECTION.                                         \n"
                  + "       77  CONT-C                       PICTURE 9(8).                   \n"
                  + "       77  CONT-D                       PICTURE 9(5).                   \n"
                  + "       77  CONT-E                       PICTURE 9999.                   \n"
                  + "       PROCEDURE DIVISION.                                              \n"
                  + "       TEST SECTION.                                         \n"
                  + "       CON-TEST.                                                   \n"
                  + "           DIV                                                          \n"
                  + "      -       ID                                                        \n"
                  + "      -         E   CONT-E IN                                           \n"
                  + "      -                      TO CONT-C GIV                              \n"
                  + "      -                                   IN                            \n"
                  + "      -                                     G CONT-D ROUN               \n"
                  + "      -                                                  DE             \n"
                  + "      -                                                    D O          \n"
                  + "      -                                                       N SIZE ERR\n"
                  + "      -    OR       PERFOR                                              \n"
                  + "      -                   M PASS G                                      \n"
                  + "      -                           O T                                   \n"
                  + "      -                              O CON-WRITE-GF-4.                  \n"
                  + "           GO       TO CON-FAIL-GF-4.                                   \n"
                  + "       CON-WRITE-GF-4.\n"
                  + "       CON-FAIL-GF-4.\n"
                  + "       PASS.";

  @Test
  @Disabled
  void testErrorMapping() {

    UseCaseEngine.runTest(
            TEXT,
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
