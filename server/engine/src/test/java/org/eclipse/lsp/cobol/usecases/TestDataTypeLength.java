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
          + "       01 {$*VALID-NUMERIC} PIC S9(18).\n"
          + "       01 {$*INVALID-NUMERIC|2} PIC 9(19).\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_ALPHA =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-ALPHA} PIC A(255).\n"
          + "       01 {$*INVALID-ALPHA|1} PIC A(1000000000).\n"
          + "       01 {$*INVALID1-ALPHA|2} PIC A(9999999999).\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_ALPHA_NUMERIC =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-ALPHANUM} PIC X(255).\n"
          + "       01 {$*INVALID-ALPHANUM|1} PIC X(1000000000).\n"
          + "       01 {$*INVALID1-ALPHANUM|2} PIC X(9999999999).\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_NUMERIC1 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-NUM} PIC S9(18).\n"
          + "       01 {$*VALID-NUM1} PIC 9(5)99.\n"
          + "       01 {$*INVALID-NUM|1} PIC 99999999999999999999.\n"
          + "       01 {$*INVALID-NUM1|2} PIC S9999999999999999999.\n"
          + "       01 {$*INVALID-NUM2|3} PIC 99999999999999999999(9)999.\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_NATIONAL =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-NATIONAL} PIC N(99999999).\n"
          + "       01 {$*INVALID-NATIONAL|1} PIC N(100000000).\n"
          + "       01 {$*INVALID1-NATIONAL|2} PIC N(9999999999).\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_UTF8 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-UTF8} PIC U(99999999).\n"
          + "       01 {$*INVALID-UTF8|1} PIC U(100000000).\n"
          + "       01 {$*INVALID1-UTF8|2} PIC U(9999999999).\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_DBCS =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-DBCS} PIC G(99999999) USAGE DISPLAY-1.\n"
          + "       01 {$*INVALID-DBCS|1} PIC G(100000000) USAGE DISPLAY-1.\n"
          + "       01 {$*INVALID1-DBCS|2} PIC G(9999999999) DISPLAY-1.\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_DBCS_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*DBCS-NO-USAGE|1} PIC G(100).\n"
          + "       01 {$*DBCS-WITH-USAGE} PIC G(100) USAGE DISPLAY-1.\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_SIMPLE_PATTERNS =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-NATIONAL-SIMPLE} PIC NNNN.\n"
          + "       01 {$*VALID-UTF8-SIMPLE} PIC UUUU.\n"
          + "       01 {$*VALID-DBCS-SIMPLE} PIC GGGG USAGE DISPLAY-1.\n"
          + "       01 {$*DBCS-SIMPLE-NO-USAGE|1} PIC GGG.\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_NUMERIC_WITH_DECIMAL =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-DECIMAL1} PIC 9(10)V9(8).\n"
          + "       01 {$*VALID-DECIMAL2} PIC S9(16)V9(2).\n"
          + "       01 {$*INVALID-DECIMAL1|1} PIC 9(10)V9(9).\n"
          + "       01 {$*INVALID-DECIMAL2|2} PIC S9(15)V9(5).\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_SIMPLE_NUMERIC_WITH_DECIMAL =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-SIMPLE-DEC1} PIC 999V99.\n"
          + "       01 {$*VALID-SIMPLE-DEC2} PIC S9999V999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC|1} PIC 9999999999V999999999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC2|2} PIC V099999999009999999999900.\n"
          + "       01 {$*VALID-SIMPLE-DEC3} PIC V099999999999999999900.\n"
          + "       01 {$*VALID-SIMPLE-DEC4} PIC V999999999999999999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC3|3} PIC V09999999999999999999.\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_SIMPLE_NUMERIC_WITH_DECIMAL1 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-SIMPLE-DEC1} PIC 0V099999999999999999.\n"
          + "       01 {$*VALID-SIMPLE-DEC2} PIC 099999999999999999.\n"
          + "       01 {$*VALID-SIMPLE-DEC3} PIC 999999999999999990.\n"
          + "       01 {$*INVALID-SIMPLE-DEC1|1} PIC 0V09999999999999999999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC2|2} PIC 09999999999999999999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC3|3} PIC 99999999999999999990.\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_SIMPLE_NUMERIC_WITH_DECIMAL2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-SIMPLE-DEC1} PIC P099999999999999999.\n"
          + "       01 {$*VALID-SIMPLE-DEC2} PIC 099999999999999999P.\n"
          + "       01 {$*INVALID-SIMPLE-DEC1|1} PIC P0999999999999999999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC2|2} PIC 0P999999999999999999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC3|3} PIC 9999999P999999.\n"
          + "       01 {$*INVALID-SIMPLE-DEC4|4} PIC 9P000099999999990.\n"
          + "       01 {$*INVALID-SIMPLE-DEC5|5} PIC 09P000099999990.\n"
          + "       PROCEDURE DIVISION.";

  private static final String TEXT_ALPHANUMERIC_EDITED =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID.    TEST12.\n"
                  + "       ENVIRONMENT DIVISION.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       01 {$*VALID-B} PIC B.\n"
                  + "       01 {$*VALID-ABA1} PIC ABA.\n"
                  + "       01 {$*VALID-ABA2} PIC A(9)BA(9).\n"
                  + "       01 {$*VALID-ABA3} PIC A9BA9.\n"
                  + "       01 {$*VALID-ABA4} PIC A(9)B(18)A(9)B(18)A(9)B(18)A(9).\n"
                  + "       01 {$*INVALID-ABA|1} PIC ABA(999999999).\n"
                  + "       01 {$*INVALID-BA|2} PIC BA(999999998).\n"
                  + "       01 {$*INVALID-ABA5|3} PIC A(9)B(18)A(9)B(18)A(999999999)B(18)A(9).\n"
                  + "       PROCEDURE DIVISION.";

  private static final String TEXT_FLOATING_POINT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VALID-FLOAT1} PIC -9V9(15)E-99.\n"
          + "       01 {$*VALID-FLOAT2} PIC +99V999(12)E+99.\n"
          + "       01 {$*VALID-FLOAT3} PIC +99.999E+99.\n"
          + "       01 {$*VALID-FLOAT4} PIC +99.99(13)E+99.\n"
          + "       01 {$*INVALID-FLOAT-MANTISSA|1} PIC -99V999(13)E+99.\n"
          + "       01 {$*INVALID-FLOAT-NO-SIGN|2} PIC 9V9(15)E-99.\n"
          + "       01 {$*INVALID-FLOAT-NO-DECIMAL|3} PIC +9(16)E-99.\n"
          + "       01 {$*INVALID-FLOAT-EXP-SIGN|4} PIC +9V9(15)E99.\n"
          + "       01 {$*INVALID-FLOAT-EXP-DIGITS|5} PIC +9V9(15)E+999.\n"
          + "       PROCEDURE DIVISION.";

  @Test
  void testNumeric() {
    UseCaseEngine.runTest(
        TEXT_NUMERIC,
        ImmutableList.of(),
        ImmutableMap.of(
            "2",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-NUMERIC' with length 19 exceeds maximum allowed length of"
                    + " 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testAlpha() {
    UseCaseEngine.runTest(
        TEXT_ALPHA,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Alphabetic field 'INVALID-ALPHA' with length 1000000000 exceeds maximum allowed"
                    + " length of 999999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Alphabetic field 'INVALID1-ALPHA' with length 9999999999 exceeds maximum allowed"
                    + " length of 999999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testAlphaNumeric() {
    UseCaseEngine.runTest(
        TEXT_ALPHA_NUMERIC,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Alphanumeric field 'INVALID-ALPHANUM' with length 1000000000 exceeds maximum"
                    + " allowed length of 999999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Alphanumeric field 'INVALID1-ALPHANUM' with length 9999999999 exceeds maximum"
                    + " allowed length of 999999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testNumeric1() {
    UseCaseEngine.runTest(
        TEXT_NUMERIC1,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-NUM' with length 20 exceeds maximum allowed length of 18"
                    + " digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-NUM1' with length 19 exceeds maximum allowed length of 18"
                    + " digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-NUM2' with length 31 exceeds maximum allowed length of 18"
                    + " digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testNational() {
    UseCaseEngine.runTest(
        TEXT_NATIONAL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "National field 'INVALID-NATIONAL' with length 100000000 exceeds maximum allowed"
                    + " length of 99999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "National field 'INVALID1-NATIONAL' with length 9999999999 exceeds maximum allowed"
                    + " length of 99999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testUtf8() {
    UseCaseEngine.runTest(
        TEXT_UTF8,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "UTF-8 field 'INVALID-UTF8' with length 100000000 exceeds maximum allowed"
                    + " length of 99999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "UTF-8 field 'INVALID1-UTF8' with length 9999999999 exceeds maximum allowed"
                    + " length of 99999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testDbcs() {
    UseCaseEngine.runTest(
        TEXT_DBCS,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "DBCS field 'INVALID-DBCS' with length 100000000 exceeds maximum allowed"
                    + " length of 99999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "DBCS field 'INVALID1-DBCS' with length 9999999999 exceeds maximum allowed"
                    + " length of 99999999 characters",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testDbcsUsageError() {
    UseCaseEngine.runTest(
        TEXT_DBCS_ERROR,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "USAGE DISPLAY-1 was not specified for DBCS item 'DBCS-NO-USAGE'.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testSimplePatterns() {
    UseCaseEngine.runTest(
        TEXT_SIMPLE_PATTERNS,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "USAGE DISPLAY-1 was not specified for DBCS item 'DBCS-SIMPLE-NO-USAGE'.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testNumericWithDecimal() {
    UseCaseEngine.runTest(
        TEXT_NUMERIC_WITH_DECIMAL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-DECIMAL1' with length 19 exceeds maximum allowed length of"
                    + " 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-DECIMAL2' with length 20 exceeds maximum allowed length of"
                    + " 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testSimpleNumericWithDecimal() {
    UseCaseEngine.runTest(
        TEXT_SIMPLE_NUMERIC_WITH_DECIMAL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC' with length 19 exceeds maximum allowed length"
                    + " of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC2' with length 19 exceeds maximum allowed"
                    + " length of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC3' with length 19 exceeds maximum allowed"
                    + " length of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testSimpleNumericWithDecimal1() {
    UseCaseEngine.runTest(
        TEXT_SIMPLE_NUMERIC_WITH_DECIMAL1,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC1' with length 19 exceeds maximum allowed length"
                    + " of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC2' with length 19 exceeds maximum allowed"
                    + " length of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC3' with length 19 exceeds maximum allowed"
                    + " length of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testSimpleNumericWithDecimal2() {
    UseCaseEngine.runTest(
        TEXT_SIMPLE_NUMERIC_WITH_DECIMAL2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC1' with length 19 exceeds maximum allowed length"
                    + " of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC2' with length 19 exceeds maximum allowed"
                    + " length of 18 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC3' has invalid picture string",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC4' has invalid picture string",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "5",
            new Diagnostic(
                new Range(),
                "Numeric field 'INVALID-SIMPLE-DEC5' has invalid picture string",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testAlphaNumericEdited() {
    UseCaseEngine.runTest(TEXT_ALPHANUMERIC_EDITED,
            ImmutableList.of(),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            "Alphanumeric-edited field 'INVALID-ABA' with length 1000000001 exceeds maximum allowed length of 999999999 characters",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "2",
                    new Diagnostic(
                            new Range(),
                            "Alphanumeric-edited field 'INVALID-BA' exceeds maximum repetition factor of 32767",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "3",
                    new Diagnostic(
                            new Range(),
                            "Alphanumeric-edited field 'INVALID-ABA5' with length 1000000080 exceeds maximum allowed length of 999999999 characters",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testFloatingPoint() {
    UseCaseEngine.runTest(
        TEXT_FLOATING_POINT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Floating-point field 'INVALID-FLOAT-MANTISSA' mantissa with length 17 exceeds"
                    + " maximum allowed length of 16 digits",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Floating-point field 'INVALID-FLOAT-NO-SIGN' mantissa must start with + or - sign",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Floating-point field 'INVALID-FLOAT-NO-DECIMAL' must include a decimal point (. or"
                    + " V)",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "Floating-point field 'INVALID-FLOAT-EXP-SIGN' exponent must have + or - sign",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "5",
            new Diagnostic(
                new Range(),
                "Floating-point field 'INVALID-FLOAT-EXP-DIGITS' exponent must be exactly 99",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
