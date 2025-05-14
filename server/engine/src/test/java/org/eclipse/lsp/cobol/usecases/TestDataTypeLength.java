/*
 * Copyright (c) 2025 Broadcom.
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

/** Tests the maximum length checks for data types. */
public class TestDataTypeLength {
  private static final String TEXT_NUMERIC =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID.    TEST12.\n"
                  + "       ENVIRONMENT DIVISION.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01 {$*VALID-NUMERIC} PIC 9(18).\n"
                  + "       01 {$*INVALID-NUMERIC|2} PIC 9(19).\n"
                  + "       PROCEDURE DIVISION.";

  private static final String TEXT_ALPHA =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID.    TEST12.\n"
                  + "       ENVIRONMENT DIVISION.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01 {$*VALID-ALPHA} PIC A(255).\n"
                  + "       01 {$*INVALID-ALPHA|3} PIC A(256).\n"
                  + "       PROCEDURE DIVISION.";

  private static final String TEXT_ALPHA_NUMERIC =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID.    TEST12.\n"
                  + "       ENVIRONMENT DIVISION.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01 {$*VALID-ALPHANUM} PIC X(255).\n"
                  + "       01 {$*INVALID-ALPHANUM|4} PIC X(256).\n"
                  + "       PROCEDURE DIVISION.";

  @Test
  void testNumeric() {
    UseCaseEngine.runTest(TEXT_NUMERIC,
            ImmutableList.of(),
            ImmutableMap.of(
                    "2",
                    new Diagnostic(
                            new Range(),
                            "Numeric field 'INVALID-NUMERIC' with length 19 exceeds maximum allowed length of 18 digits",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testAlpha() {
    UseCaseEngine.runTest(TEXT_ALPHA,
            ImmutableList.of(),
            ImmutableMap.of(
                    "3",
                    new Diagnostic(
                            new Range(),
                            "Alphabetic field 'INVALID-ALPHA' with length 256 exceeds maximum allowed length of 255 characters",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testAlphaNumeric() {
    UseCaseEngine.runTest(TEXT_ALPHA_NUMERIC,
            ImmutableList.of(),
            ImmutableMap.of(
                    "4",
                    new Diagnostic(
                            new Range(),
                            "Alphanumeric field 'INVALID-ALPHANUM' with length 256 exceeds maximum allowed length of 255 characters",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
