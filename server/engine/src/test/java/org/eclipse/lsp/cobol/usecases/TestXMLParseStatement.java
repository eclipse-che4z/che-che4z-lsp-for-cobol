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
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.XMLParseNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

/** Tests XML parse statement. */
public class TestXMLParseStatement {

  public static final String COMPILE_OPTION_XMLPARSE_XMLSS = "PROCESS XMLPARSE(XMLSS)\n";

  private static final String XMP_PARSE_STATEMENT =
      "           XML PARSE {$XML-DOC} \n"
          + "           WITH ENCODING 1200\n"
          + "           RETURNING NATIONAL\n"
          + "           VALIDATING WITH {$QUESTION}\n"
          + "           PROCESSING PROCEDURE {#XML-HANDLER}\n";

  private static final String XML_PARSE_STATEMENT_PRECESSED =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. XML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       \n"
          + "       01  {$*REQUEST}.\n"
          + "           06 {$*ROUTE}.\n"
          + "               11 {$*NAME}                  PIC  X(030).\n"
          + "               11 {$*VERSION}               PIC  9(004).\n"
          + "           06 {$*QUESTION}.\n"
          + "               11 {$*IDENT}                 PIC  9(009).\n"
          + "               11 {$*XMLFILENAME}           PIC  X(006).\n"
          + "               11 {$*XMLFILEINH}            PIC  X(5000).\n"
          + "       \n"
          + "       \n"
          + "       01  {$*XML-DOC}                    PIC X(5000).\n"
          + "       01  {$*XML-IDX}                    PIC S9(9) BINARY.\n"
          + "       01  {$*XML-CHAR-CNT}               PIC S9(9) BINARY.\n"
          + "       \n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*MAINLINE} SECTION.\n"
          + "           MOVE 'serviceRequest' TO {$NAME}\n"
          + "           MOVE 1                TO {$VERSION}\n"
          + "           MOVE 111111111        TO {$IDENT}\n"
          + "           MOVE 'FILE-1'         TO {$XMLFILENAME}\n"
          + "           MOVE '<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelop\n"
          + "      -          'e.....<SOAP-ENV:Envelope>'\n"
          + "               TO {$XMLFILEINH}\n"
          + "       \n";

  private static final String XML_PARSE_SUCCESSOR =
      "               ON EXCEPTION\n"
          + "                     DISPLAY 'XML Error: ' {$XML-CODE}\n"
          + "                     GOBACK\n"
          + "               NOT ON EXCEPTION\n"
          + "                     DISPLAY 'ALL DONE.'\n"
          + "           END-XML\n"
          + "           GOBACK\n"
          + "           .\n"
          + "       \n"
          + "       {#*XML-HANDLER}.\n"
          + "           DISPLAY {$XML-EVENT} (1:22) ':' {$XML-TEXT}\n"
          + "           .";

  private static final String XMP_PARSE_STATEMENT_NO_XMLSS =
      "           XML PARSE {$XML-DOC} \n"
          + "           {_WITH ENCODING 1200|1_}\n"
          + "           {_RETURNING NATIONAL|2_}\n"
          + "           {_VALIDATING WITH {$QUESTION}|3_}\n"
          + "           PROCESSING PROCEDURE {#XML-HANDLER}\n";

  private static final String XMP_PARSE_STATEMENT_XMLSS =
          "           XML PARSE {$XML-DOC} \n"
                  + "           WITH ENCODING 1200\n"
                  + "           RETURNING NATIONAL\n"
                  + "           VALIDATING WITH {$QUESTION}\n"
                  + "           PROCESSING PROCEDURE {#XML-HANDLER}\n";

  public static final String TEXT =
      XML_PARSE_STATEMENT_PRECESSED + XMP_PARSE_STATEMENT + XML_PARSE_SUCCESSOR;

  public static final String XML_PARSE_WITH_USAGE_NATIONAL =
      "     PROCESS XMLPARSE(XMLSS)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. XML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*XML-DOC}                    PIC X(5000) USAGE NATIONAL.\n"
          + "       \n"
          + "       PROCEDURE DIVISION.\n"
          + "           XML PARSE {$XML-DOC} \n"
          + "           {_WITH ENCODING 1208|1_}\n"
          + "           PROCESSING PROCEDURE {#XML-HANDLER}\n"
          + "           END-XML\n"
          + "           GOBACK\n"
          + "           .\n"
          + "       \n"
          + "       {#*XML-HANDLER}.\n"
          + "           DISPLAY {$XML-EVENT} (1:22) ':' {$XML-TEXT}\n"
          + "           .";

  public static final String XML_PARSE_NOT_SUPPORTED_CCID =
      "     PROCESS XMLPARSE(XMLSS)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. XML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*XML-DOC}                    PIC X(5000).\n"
          + "       \n"
          + "       PROCEDURE DIVISION.\n"
          + "           XML PARSE {$XML-DOC} \n"
          + "           {_WITH ENCODING 11|1_}\n"
          + "           PROCESSING PROCEDURE {#XML-HANDLER}\n"
          + "           END-XML\n"
          + "           GOBACK\n"
          + "           .\n"
          + "       \n"
          + "       {#*XML-HANDLER}.\n"
          + "           DISPLAY {$XML-EVENT} (1:22) ':' {$XML-TEXT}\n"
          + "           .";

  public static final String XML_PARSE_MISSING_IDENTIFIER =
      "     PROCESS XMLPARSE(XMLSS)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. XML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*XML-DOC1}                    PIC X(5000).\n"
          + "       \n"
          + "       PROCEDURE DIVISION.\n"
          + "           XML PARSE {XML-DOC|1} \n"
          + "           WITH ENCODING 1208\n"
          + "           PROCESSING PROCEDURE {#XML-HANDLER}\n"
          + "           END-XML\n"
          + "           GOBACK\n"
          + "           .\n"
          + "       \n"
          + "       {#*XML-HANDLER}.\n"
          + "           DISPLAY {$XML-EVENT} (1:22) ':' {$XML-TEXT}\n"
          + "           .";

  public static final String XML_PARSE_MISSING_IDENTIFIER2 =
      "     PROCESS XMLPARSE(XMLSS)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. XML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*XML-DOC}                    PIC X(5000).\n"
          + "       \n"
          + "       PROCEDURE DIVISION.\n"
          + "           XML PARSE {$XML-DOC} \n"
          + "           VALIDATING WITH {NAME|1}\n"
          + "           PROCESSING PROCEDURE {#XML-HANDLER}\n"
          + "           END-XML\n"
          + "           GOBACK\n"
          + "           .\n"
          + "       \n"
          + "       {#*XML-HANDLER}.\n"
          + "           DISPLAY {$XML-EVENT} (1:22) ':' {$XML-TEXT}\n"
          + "           .";

  public static final String XML_PARSE_SUBSTRING_IDENTIFIER =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TDXMLTST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*XML-STRING}                PIC X(1000) VALUE SPACES.\n"
          + "       01 {$*EZ-PTR}                    PIC S9(4) COMP VALUE 1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "          {#*MAINLINE}.\n"
          + "             DISPLAY 'XML-DOCUMENT=' {$XML-STRING}(1:{$EZ-PTR})\n"
          + "             XML PARSE {$XML-STRING}(1:{$EZ-PTR}) RETURNING NATIONAL\n"
          + "                                PROCESSING PROCEDURE {#XML-HANDLER}\n"
          + "               ON EXCEPTION\n"
          + "                 DISPLAY 'XML DOCUMENT ERROR ' {$XML-CODE}\n"
          + "               NOT ON EXCEPTION\n"
          + "                 DISPLAY 'XML DOCUMENT SUCCESSFULLY PARSED'\n"
          + "              END-XML.\n"
          + "       {#*XML-HANDLER}.\n"
          + "           DISPLAY 'XML-EVENT=' {$XML-EVENT}.";

  @Test
  void xmlParsePositiveTest() {
    AnalysisResult analysisResult = UseCaseEngine.runTest(
        COMPILE_OPTION_XMLPARSE_XMLSS + TEXT, ImmutableList.of(), ImmutableMap.of());

    XMLParseNode node = analysisResult.getRootNode().getDepthFirstStream()
        .filter(n -> n.getNodeType() == NodeType.XML_PARSE)
         .map(XMLParseNode.class::cast)
        .findFirst()
        .orElse(null);

    assertNotNull(node);
    assertEquals("XML-HANDLER", node.getProcessingProcedureName().getName());
  }

  @Test
  void xmlParse_whenXmlssNotSet_provideHints() {
    UseCaseEngine.runTest(
        "     PROCESS XMLPARSE(COMPAT)\n"
            + XML_PARSE_STATEMENT_PRECESSED
            + XMP_PARSE_STATEMENT_NO_XMLSS
            + XML_PARSE_SUCCESSOR,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "The ENCODING phrase can be specified only when the XMLPARSE(XMLSS) compiler option is in effect",
                DiagnosticSeverity.Hint,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "RETURNING NATIONAL phrase can be specified only when the XMLPARSE(XMLSS) compiler option is in effect",
                DiagnosticSeverity.Hint,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Validating phrase can be specified only when XMLPARSE(XMLSS) compiler option is in effect",
                DiagnosticSeverity.Hint,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void xmlParse_whenCompilerOptionNotProvided_XMLPARSE_XMLSS_isConsideredDefault() {
    UseCaseEngine.runTest(
        XML_PARSE_STATEMENT_PRECESSED + XMP_PARSE_STATEMENT_XMLSS + XML_PARSE_SUCCESSOR,
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void xmlParse_whenIdentifier1IsNational_thenEncodingMustBe1200() {
    UseCaseEngine.runTest(
        XML_PARSE_WITH_USAGE_NATIONAL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A national item codepage must be 1200",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void xmlParse_whenCCIdNotSupported_thenShowWarning() {
    UseCaseEngine.runTest(
        XML_PARSE_NOT_SUPPORTED_CCID,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "CCID not supported",
                DiagnosticSeverity.Hint,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void xmlParse_whenIdentifier1NotDefined_showError() {
    UseCaseEngine.runTest(
        XML_PARSE_MISSING_IDENTIFIER,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable XML-DOC is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void xmlParse_whenIdentifier2NotDefined_showError() {
    UseCaseEngine.runTest(
        XML_PARSE_MISSING_IDENTIFIER2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable NAME is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void test_whenIdentifier1HasMoreThanOneDefinitions_thenProcess() {
    UseCaseEngine.runTest(
            XML_PARSE_SUBSTRING_IDENTIFIER,
            ImmutableList.of(),
            ImmutableMap.of());
  }
}
