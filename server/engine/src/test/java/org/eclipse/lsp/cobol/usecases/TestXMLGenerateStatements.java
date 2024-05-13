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
 *   Broadcom, Inc. - initial API and implementation
 */

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/**
 * Tests XML Generate statements. Ref:
 * https://www.ibm.com/docs/en/cobol-zos/6.3?topic=statements-xml-generate-statement
 */
public class TestXMLGenerateStatements {
  public static final String TEXT1 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID TEST3.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       \n"
          + "       01 {$*WS-MIS-VARIABLES}.       \n"
          + "           05  {$*TOTAL-CHAR}           PIC 9(05) VALUE 0. \n"
          + "           05  {$*XML-OUTPUT}           PIC X(1000) VALUE QUOTES.    \n"
          + "\n"
          + "       01 {$*XML-INPUT}.      \n"
          + "           05  {$*NAME}                 PIC X(10)  VALUE 'JOHN'. \n"
          + "           05  {$*AGE}                  PIC X(02)  VALUE 33.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*1000-MAINLINE}.\n"
          + "           XML GENERATE {$XML-OUTPUT} \n"
          + "               FROM {$XML-INPUT} \n"
          + "               COUNT IN {$TOTAL-CHAR}\n"
          + "               WITH ENCODING 1208\n"
          + "               ON EXCEPTION DISPLAY \"ERROR-XML-CODE =  \" {$XML-CODE}. \n"
          + "\n"
          + "           DISPLAY {$XML-OUTPUT}(1:{$TOTAL-CHAR}).\n"
          + "           STOP RUN.";

  public static final String TEXT2 =
      "       Identification division.\n"
          + "       Program-id. XGFX.\n"
          + "       Data division.\n"
          + "       Working-storage section.\n"
          + "        01 {$*numItems} pic 99 global.\n"
          + "        01 {$*purchaseOrder} global.\n"
          + "           05 {$*orderDate} pic x(10).\n"
          + "        01 {$*numChars} comp pic 999.\n"
          + "        01 {$*xmlPO} pic x(999).\n"
          + "       Procedure division.\n"
          + "        m.\n"
          + "           Move space to {$*xmlPO}\n"
          + "           Xml generate {$*xmlPO} from {$*purchaseOrder} count in {$*numChars} \n"
          + "               with xml-declaration  with attributes   \n"
          + "               namespace 'http://www.example.com'  namespace-prefix 'po'\n"
          + "           Call 'pretty' using {$*xmlPO} value {$numChars}\n"
          + "           Goback\n"
          + "           .\n"
          + "\n"
          + "       End program XGFX.";

  public static final String TEXT3 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID TEST3.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*XML-INPUT}.\n"
          + "           05  {$*NAME} PIC X(10) VALUE \"JANE\".\n"
          + " \n"
          + "       PROCEDURE DIVISION.\n"
          + "           XML GENERATE {XML-OUT|1} FROM {$XML-INPUT} WITH ATTRIBUTES .";

  public static final String TEXT4 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. XML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*REQUEST}.\n"
          + "           06 {$*ROUTE}.\n"
          + "               11 {$*NAME}                  PIC  X(030).\n"
          + "               11 {$*VERSION}               PIC  9(004).\n"
          + "           06 {$*QUESTION}.\n"
          + "               11 {$*IDENT}                 PIC  9(009).\n"
          + "               11 {$*XMLFILENAME}           PIC  X(006).\n"
          + "               11 {$*XMLFILEINH}            PIC  X(5000).\n"
          + "       01  {$*XML-DOC}                    PIC X(5000).\n"
          + "       01  {$*XML-IDX}                    PIC S9(9) BINARY.\n"
          + "       01  {$*XML-CHAR-CNT}               PIC S9(9) BINARY.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           XML GENERATE {$XML-DOC} FROM {$REQUEST} COUNT IN {$XML-CHAR-CNT}\n"
          + "           PERFORM VARYING {$XML-IDX} FROM 1 BY 80\n"
          + "                    UNTIL {$XML-IDX} > {$XML-CHAR-CNT}\n"
          + "               DISPLAY {$XML-DOC} ({$XML-IDX} : 80)\n"
          + "           END-PERFORM.";

  public static final String TEXT5 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. XML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*REQUEST}.\n"
          + "           06 {$*ROUTE}.\n"
          + "               11 {$*NAME}                  PIC  X(030).\n"
          + "               11 {$*VERSION}               PIC  9(004).\n"
          + "           06 {$*QUESTION}.\n"
          + "               11 {$*IDENT}                 PIC  9(009).\n"
          + "               11 {$*XMLFILENAME}           PIC  X(006).\n"
          + "               11 {$*XMLFILEINH}            PIC  X(5000).\n"
          + "       01  {$*XML-DOC}                    PIC X(5000).\n"
          + "       01  {$*XML-IDX}                    PIC S9(9) BINARY.\n"
          + "       01  {$*XML-CHAR-CNT}               PIC S9(9) BINARY.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           XML GENERATE {$XML-DOC} FROM {$REQUEST} COUNT IN {$XML-CHAR-CNT}\n"
          + "            SUPPRESS EVERY NONNUMERIC ELEMENT WHEN SPACES\n"
          + "            ON EXCEPTION\n"
          + "             DISPLAY 'GENERATE XML Error-Header'\n"
          + "            NOT ON EXCEPTION\n"
          + "                CONTINUE\n"
          + "           END-XML.";

  public static final String TEST_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-WORLD.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "\n"
          + "       77  {$*TestXmlTag}      PIC X(20) VALUE \"test\". \n"
          + "       77  {$*OutputXml}       PIC X(100).\n"
          + "\n"
          + "       PROCEDURE DIVISION.\n"
          + "           \n"
          + "           XML GENERATE OutputXml FROM TestXmlTag                               \n"
          + "           END-XML\n"
          + "           \n"
          + "           DISPLAY \"TestXmlTag:          \" {$TestXmlTag}\n"
          + "           DISPLAY \"OutputXml:           \" {$OutputXml}\n"
          + "\n"
          + "           STOP RUN.";

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - testing positive XML generate statements")
  void positiveXMLGenerateTest() {
    UseCaseEngine.runTest(TEXT1, ImmutableList.of(), ImmutableMap.of());
  }

  private static Stream<String> textsToTest() {
    return Stream.of(TEXT1, TEXT2, TEXT4, TEXT5, TEST_TEXT);
  }

  @Test
  void test3() {
    UseCaseEngine.runTest(
        TEXT3,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable XML-OUT is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
