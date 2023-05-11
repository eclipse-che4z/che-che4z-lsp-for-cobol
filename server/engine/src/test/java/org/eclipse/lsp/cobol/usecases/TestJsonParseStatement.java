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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests JSON PARSE statement. */
public class TestJsonParseStatement {
  public static final String TEXT =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx}  into {$myrecord}\n"
          + "             with detail\n"
          + "             suppress {$DATA-A}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER1_VALIDATION_1 = "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic E(1000).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx|1}  into {$myrecord}\n"
          + "             with detail\n"
          + "             suppress {$DATA-A}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER1_VALIDATION_2 = "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000) DYNAMIC.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx|1}  into {$myrecord}\n"
          + "             with detail\n"
          + "             suppress {$DATA-A}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER1_VALIDATION_3 = "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000) JUSTIFIED.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx|1}  into {$myrecord}\n"
          + "             with detail\n"
          + "             suppress {$DATA-A}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER1_IDENTIFIER2_OVERLAP = "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$data-a}  into {$myrecord|1}\n"
          + "             with detail\n"
          + "             suppress {$DATA-A}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER2_UNBOUNDED = "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000).\n"
          + "       01 {$*myrecord}  OCCURS 1 TO UNBOUNDED.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx}  into {$myrecord|1}\n"
          + "             with detail\n"
          + "             suppress {$DATA-A}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER2_UNBOUNDED_2 = "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x OCCURS 1 TO UNBOUNDED.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx}  into {$myrecord|1}\n"
          + "             with detail\n"
          + "             suppress {$DATA-A}\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER3 =
          "       Identification division.\n"
                  + "       Program-id. jp_ex.\n"
                  + "       Data division.\n"
                  + "       Working-storage section.\n"
                  + "       01 {$*docx} pic x(1000).\n"
                  + "       01 {$*myrecord}.\n"
                  + "           02 {$*data-a} pic x.\n"
                  + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
                  + "           02 {$*data-b} pic x.\n"
                  + "             88 {$*data-b-true} value '1'.\n"
                  + "             88 {$*data-b-false} value '0'.\n"
                  + "           02 {$*data-c} pic x.\n"
                  + "       Procedure division.\n"
                  + "           Json parse {$docx}  into {$myrecord}\n"
                  + "             with detail\n"
                  + "             suppress {$docx|1}\n"
                  + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
                  + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
                  + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
                  + "             not on exception\n"
                  + "               display \"Successful JSON Parse\"\n"
                  + "           end-json.\n"
                  + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER3_OMITTED =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx}  into {$myrecord}\n"
          + "             with detail\n"
          + "             name of {$DATA-A|1} OMITTED\n"
          + "             suppress {$data-a}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER3_NO_ERROR =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x.\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx}  into {$myrecord}\n"
          + "             with detail\n"
          + "             name of {$DATA-A} 'a'\n"
          + "             suppress {$data-a}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  public static final String TEXT_CONDITION =
          "       Identification division.\n"
                  + "       Program-id. jp_ex.\n"
                  + "       Data division.\n"
                  + "       Working-storage section.\n"
                  + "       01 {$*docx} pic x(1000).\n"
                  + "       01 {$*myrecord}.\n"
                  + "           02 {$*data-a} pic x.\n"
                  + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
                  + "           02 {$*data-b} pic x.\n"
                  + "             88 {$*data-b-true} value '1'.\n"
                  + "             88 {$*data-b-false} value '0'.\n"
                  + "           02 {$*data-c} pic x.\n"
                  + "       Procedure division.\n"
                  + "           Json parse {$docx}  into {$myrecord}\n"
                  + "             with detail\n"
                  + "             name of {$DATA-A} 'a'\n"
                  + "             suppress {$data-a}\n"
                  + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-c|1}\n"
                  + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
                  + "             ALSO {$data-c} FROM BOOLEAN USING 'a' AND 'z'\n"
                  + "             not on exception\n"
                  + "               display \"Successful JSON Parse\"\n"
                  + "           end-json.\n"
                  + "       End program jp_ex.";

  public static final String TEXT_IDENTIFIER5 =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*docx} pic x(1000).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} pic x.\n"
          + "             88 {$*data-a-flag} value 'T' false 'F'.\n"
          + "           02 {$*data-b} pic x.\n"
          + "             88 {$*data-b-true} value '1'.\n"
          + "             88 {$*data-b-false} value '0'.\n"
          + "           02 {$*data-c} pic x(9).\n"
          + "       Procedure division.\n"
          + "           Json parse {$docx}  into {$myrecord}\n"
          + "             with detail\n"
          + "             name of {$DATA-A} 'a'\n"
          + "             suppress {$data-a}\n"
          + "             CONVERTING {$data-a} FROM BOOLEAN USING {$data-a-flag}\n"
          + "             ALSO {$data-b} FROM BOOLEAN USING {$data-b-true} AND {$data-b-false}\n"
          + "             ALSO {$data-c|1} FROM BOOLEAN USING 'a' AND 'z'\n"
          + "             not on exception\n"
          + "               display \"Successful JSON Parse\"\n"
          + "           end-json.\n"
          + "       End program jp_ex.";

  @Test
  void test_valid_json_parse_syntax() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_identifier1_for_alphanumeric() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER1_VALIDATION_1, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "DOCX elementary item must be alphanumeric and not be defined with JUSTIFIED or dynamic-length.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier1_for_dynamic() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER1_VALIDATION_2, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "DOCX elementary item must be alphanumeric and not be defined with JUSTIFIED or dynamic-length.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier1_for_justified() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER1_VALIDATION_3, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "DOCX elementary item must be alphanumeric and not be defined with JUSTIFIED or dynamic-length.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier1_identifier2_overlap() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER1_IDENTIFIER2_OVERLAP, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "JSON parse DATA-A must not overlap MYRECORD",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier1_identifier2_unbounded() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER2_UNBOUNDED, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "MYRECORD group item must be alphanumeric and not be UNBOUNDED or contain a RENAMES clause.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier1_identifier2_unbounded_groupItem() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER2_UNBOUNDED_2, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "MYRECORD group item must be alphanumeric and not be UNBOUNDED or contain a RENAMES clause.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier3_should_be_subordinateTo_identifier2() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER3, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "DOCX must reference a data item that is subordinate to MYRECORD",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier3_with_omitted_should_be_identifier2() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER3_OMITTED, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "DATA-A must reference MYRECORD.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_identifier3_no_error() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER3_NO_ERROR, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_identifier5_must_be_single_byte_alphanumeric_elementary_node() {
    UseCaseEngine.runTest(TEXT_IDENTIFIER5, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "DATA-C must be a single-byte alphanumeric elementary data item whose data definition entry contains PICTURE X.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void test_condition_must_be_level88() {
    UseCaseEngine.runTest(TEXT_CONDITION, ImmutableList.of(), ImmutableMap.of(
            "1",
            new Diagnostic(
                    new Range(),
                    "DATA-C must be a level-88.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

}
