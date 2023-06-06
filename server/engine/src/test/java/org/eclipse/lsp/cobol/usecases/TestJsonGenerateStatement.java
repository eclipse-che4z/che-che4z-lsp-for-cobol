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

/** Tests JSON generate statement. */
public class TestJsonGenerateStatement {
  public static final String VALID_TEXT =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*NG-AREA1}. \n"
          + "           03 {$*FLAGS} PIC X.      03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "       01 {$*docx} PIC X.\n"
          + "       01 {$*countN} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx} FROM {$NG-AREA1} COUNT {$countN}\n"
          + "               name of {$FLAGS} OF {$NG-AREA1} is OMITTED\n"
          + "               SUPPRESS {$ASNUM}\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_NO_IDEN1 =
          "       Identification division.\n"
                  + "       Program-id. jp_ex.\n"
                  + "       Data division.\n"
                  + "       Working-storage section.\n"
                  + "       01 {$*STRUCT}. \n"
                  + "         02 {$*NG-AREA1}. \n"
                  + "           03 {$*FLAGS} PIC X.      03 PIC X(3). \n"
                  + "           03 {$*PTR} USAGE POINTER.\n"
                  + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
                  + "           03 PIC X(92). \n"
                  + "       01 {$*countN} pic P.\n"
                  + "       01 {$*myrecord}.\n"
                  + "           02 {$*data-a} PIC X.\n"
                  + "           02 {$*data-b} PIC X.\n"
                  + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
                  + "       Procedure division.\n"
                  + "               JSON GENERATE {docx|1} FROM {$NG-AREA1} COUNT {$countN}\n"
                  + "               name of {$FLAGS} OF {$NG-AREA1} is OMITTED\n"
                  + "               SUPPRESS {$ASNUM}\n"
                  + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
                  + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
                  + "                END-JSON.";

  public static final String TEXT_IDENTIFIER1_NOT_ALPHANUMERIC =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*NG-AREA1}. \n"
          + "           03 {$*FLAGS} PIC X.      03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "       01 {$*docx} pic E(1000).\n"
          + "       01 {$*countN} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx|1} FROM {$NG-AREA1} COUNT {$countN}\n"
          + "               name of {$FLAGS} OF {$NG-AREA1} is OMITTED\n"
          + "               SUPPRESS {$ASNUM}\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_IDENTIFIER1_JUSTIFIED =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*NG-AREA1}. \n"
          + "           03 {$*FLAGS} PIC X.      03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "       01 {$*docx} pic E(1000).\n"
          + "       01 {$*countN} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx|1} FROM {$NG-AREA1} COUNT {$countN}\n"
          + "               name of {$FLAGS} OF {$NG-AREA1} is OMITTED\n"
          + "               SUPPRESS {$ASNUM}\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_IDEN2_UNIQUE_SUBORDINATE =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*STAT} PIC X(4). \n"
          + "         02 {$*IN-AREA} PIC X(100). \n"
          + "         02 {$*NG-AREA1} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FLAGS} PIC X.      03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "         02 {$*NG-AREA2} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FN-CODE} PIC X. \n"
          + "           03 {$*UNREFERENCED} PIC X(3). \n"
          + "           03 {$*QTYONHAND} USAGE BINARY PIC 9(5). \n"
          + "           03 {$*DESC} USAGE NATIONAL PIC N(40). \n"
          + "           03 {$*UNREFERENCED} PIC X(12).\n"
          + "       01 {$*docx} PIC X.\n"
          + "       01 {$*countN}.\n"
          + "           02 {$*count1} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx} FROM {$NG-AREA2|1} COUNT {$count1}\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_IDEN2_INVALID =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*STAT} PIC X(4). \n"
          + "         02 {$*IN-AREA} PIC X(100). \n"
          + "         02 {$*NG-AREA1} REDEFINES {$IN-AREA}. \n"
          + "           03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "         02 {$*NG-AREA2} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FN-CODE} PIC X. \n"
          + "           03 {$*UNREFERENCED} PIC X(3). \n"
          + "           03 {$*QTYONHAND} USAGE BINARY PIC 9(5). \n"
          + "           03 {$*DESC} USAGE NATIONAL PIC N(40). \n"
          + "           03 {$*UNREFERENCED} PIC X(12).\n"
          + "       01 {$*docx} PIC X.\n"
          + "       01 {$*countN}.\n"
          + "           02 {$*count1} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx} FROM {$NG-AREA1|1} COUNT {$count1}\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_IDEN3_INVALID =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*STAT} PIC X(4). \n"
          + "         02 {$*IN-AREA} PIC X(100). \n"
          + "         02 {$*NG-AREA1} REDEFINES {$IN-AREA}. \n"
          + "           03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "         02 {$*NG-AREA2} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FN-CODE} PIC X. \n"
          + "           03 {$*UNREFERENCED} PIC X(3). \n"
          + "           03 {$*QTYONHAND} USAGE BINARY PIC 9(5). \n"
          + "           03 {$*DESC} USAGE NATIONAL PIC N(40). \n"
          + "           03 {$*UNREFERENCED} PIC X(12).\n"
          + "       01 {$*docx} PIC X.\n"
          + "       01 {$*countN}.\n"
          + "           02 {$*count1} pic X(20).\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx} FROM {$STRUCT} COUNT {$count1|1}\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_IDEN4_INVALID =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*STAT} PIC X(4). \n"
          + "         02 {$*IN-AREA} PIC X(100). \n"
          + "         02 {$*NG-AREA1} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FLAGS} PIC X.       03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "         02 {$*NG-AREA2} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FN-CODE} PIC X. \n"
          + "           03 {$*UNREFERENCED} PIC X(3). \n"
          + "           03 {$*QTYONHAND} USAGE BINARY PIC 9(5). \n"
          + "           03 {$*DESC} USAGE NATIONAL PIC N(40). \n"
          + "           03 {$*UNREFERENCED} PIC X(12).\n"
          + "       01 {$*docx} PIC X.\n"
          + "       01 {$*countN}.\n"
          + "           02 {$*count1} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx} FROM {$IN-AREA} COUNT {$count1}\n"
          + "               name of {$FLAGS|1} OF {$NG-AREA1|2} is OMITTED\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_IDEN5_INVALID =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*STAT} PIC X(4). \n"
          + "         02 {$*IN-AREA} PIC X(100). \n"
          + "         02 {$*NG-AREA1} REDEFINES {$IN-AREA}. \n"
          + "           03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "         02 {$*NG-AREA2} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FN-CODE} PIC X. \n"
          + "           03 {$*UNREFERENCED} PIC X(3). \n"
          + "           03 {$*QTYONHAND} USAGE BINARY PIC 9(5). \n"
          + "           03 {$*DESC} USAGE NATIONAL PIC N(40). \n"
          + "           03 {$*UNREFERENCED} PIC X(12).\n"
          + "       01 {$*docx} PIC X.\n"
          + "       01 {$*countN}.\n"
          + "           02 {$*count1} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X.\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx} FROM {$IN-AREA} COUNT {$count1}\n"
          + "               SUPPRESS {$ASNUM|1}\n"
          + "                 CONVERTING {$data-a} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_IDEN6_INVALID =
      "       Identification division.\n"
          + "       Program-id. jp_ex.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "       01 {$*STRUCT}. \n"
          + "         02 {$*STAT} PIC X(4). \n"
          + "         02 {$*IN-AREA} PIC X(100). \n"
          + "         02 {$*NG-AREA1} REDEFINES {$IN-AREA}. \n"
          + "           03 PIC X(3). \n"
          + "           03 {$*PTR} USAGE POINTER.\n"
          + "           03 {$*ASNUM} REDEFINES {$PTR} USAGE COMP-5 PIC S9(9). \n"
          + "           03 PIC X(92). \n"
          + "         02 {$*NG-AREA2} REDEFINES {$IN-AREA}. \n"
          + "           03 {$*FN-CODE} PIC X. \n"
          + "           03 {$*UNREFERENCED} PIC X(3). \n"
          + "           03 {$*QTYONHAND} USAGE BINARY PIC 9(5). \n"
          + "           03 {$*DESC} USAGE NATIONAL PIC N(40). \n"
          + "           03 {$*UNREFERENCED} PIC X(12).\n"
          + "       01 {$*docx} PIC X.\n"
          + "       01 {$*countN}.\n"
          + "           02 {$*count1} pic P.\n"
          + "       01 {$*myrecord}.\n"
          + "           02 {$*data-a} PIC X(9).\n"
          + "           02 {$*data-b} PIC X.\n"
          + "             88 {$*data-b-flag} VALUE 'a' THRU 'z'.\n"
          + "       Procedure division.\n"
          + "               JSON GENERATE {$docx} FROM {$IN-AREA} COUNT {$count1}\n"
          + "                 CONVERTING {$data-a|1} TO BOOLEAN USING 'T'\n"
          + "                       ALSO {$data-b} TO BOOLEAN USING {$data-b-flag}\n"
          + "                END-JSON.";

  public static final String TEXT_LEVEL77 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   JSONTEST.\n"
          + "\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "\n"
          + "       SOURCE-COMPUTER. IBM-370-158.\n"
          + "\n"
          + "       DATA DIVISION.\n"
          + "\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "\n"
          + "        01 {$*MYDATA}.\n"
          + "           05 {$*header}.\n"
          + "                10 {$*systemId}       PIC X(10).\n"
          + "                10 {$*timestamp}      PIC X(30).\n"
          + "           05 {$*payload}.\n"
          + "                10 {$*customerid}         PIC X(10).\n"
          + "  \n"
          + "        77 {$*JSONLEN}   PIC 9(05).\n"
          + "        77 {$*utf-8-pos}   PIC 9(05).\n"
          + "        77 {$*utf-8-end}   PIC 9(05).\n"
          + "\n"
          + "       01 {$*jsonout}    PIC X(30000).\n"
          + "\n"
          + "       PROCEDURE DIVISION.\n"
          + "           JSON GENERATE {$JSONOUT} FROM {$MYDATA} COUNT {$JSONLEN}                \n"
          + "               SUPPRESS WHEN ZERO                                           \n"
          + "               ON EXCEPTION DISPLAY 'ERROR JSON-CODE: ' {$JSON-CODE}        \n"
          + "               NOT ON EXCEPTION DISPLAY 'JSON GENERATED - LEN=' {$JSONLEN}\n"
          + "               END-Json.  ";

  @Test
  void testValidJsonGenerateStatement() {
    UseCaseEngine.runTest(VALID_TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test_whenIdentifier1NotAlphanumeric_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDENTIFIER1_NOT_ALPHANUMERIC,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "DOCX can only be of category national or alphanumeric and must not be dynamic length or justified.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier1Justified_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDENTIFIER1_JUSTIFIED,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "DOCX can only be of category national or alphanumeric and must not be dynamic length or justified.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier2_haveNonUniqueSubOrdinateElement_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDEN2_UNIQUE_SUBORDINATE,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "NG-AREA2 group item must have unique data-name and must not contain RENAMES clause.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier2_isInvalid_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDEN2_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "NG-AREA1 group item must have unique data-name and must not contain RENAMES clause.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier3_isInvalid_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDEN3_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "COUNT1 must be an integer data item defined without the symbol P in its picture string.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier4_isInvalid_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDEN4_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "FLAGS must reference a data item that is subordinate to IN-AREA",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "NG-AREA1 must reference a data item that is subordinate to IN-AREA",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier5_isInvalid_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDEN5_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "ASNUM must reference a data item that is subordinate to IN-AREA",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier6_isInvalid_throwDiagnostics() {
    UseCaseEngine.runTest(
        TEXT_IDEN6_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "data-a must be an elementary item with a PIC X clause.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenLevel77_considerIndependentNode() {
    UseCaseEngine.runTest(TEXT_LEVEL77, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void whenIdentifier1NotDefined_showError() {
    UseCaseEngine.runTest(TEXT_NO_IDEN1, ImmutableList.of(), ImmutableMap.of("1", new Diagnostic(
            new Range(),
            "Variable DOCX is not defined",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText())));
  }
}
