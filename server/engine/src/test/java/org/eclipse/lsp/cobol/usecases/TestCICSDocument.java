/*
 * Copyright (c) 2024 Broadcom.
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

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS DOCUMENT commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-document-create">DOCUMENT Command</a>
 *
 * <p>This class tests all variations of the DOCUMENT command: CREATE, DELETE, INSERT, RETRIEVE, and SET.</p>
 */
public class TestCICSDocument {
  private static final String DOCUMENT_CREATE_VALID =
          "DOCUMENT CREATE DOCTOKEN({$varOne}) FROM({$varTwo}) LENGTH({$varThree})";

  private static final String DOCUMENT_CREATE_INVALID_NO_DOCTOKEN =
          "DOCUMENT {_CREATE  FROM({$varTwo}) LENGTH(123)|errorOne_}";

  private static final String DOCUMENT_CREATE_INVALID_MULTIPLE_SOURCES =
          "DOCUMENT CREATE DOCTOKEN({$varOne}) {FROM|errorOne}({$varTwo}) {TEXT|errorTwo}({$varThree}) LENGTH({$varFour})";

  private static final String DOCUMENT_DELETE_VALID =
          "DOCUMENT DELETE DOCTOKEN({$varOne})";

  private static final String DOCUMENT_DELETE_INVALID =
          "DOCUMENT {DELETE|errorOne}";

  private static final String DOCUMENT_INSERT_VALID =
          "DOCUMENT INSERT DOCTOKEN({$varOne}) TEXT({$varTwo}) LENGTH({$varThree})";

  private static final String DOCUMENT_INSERT_INVALID_NO_DOCTOKEN =
          "DOCUMENT {_INSERT TEXT({$varTwo}) LENGTH(123)|errorOne_}";

  private static final String DOCUMENT_INSERT_INVALID_MULTIPLE_SOURCES =
          "DOCUMENT INSERT DOCTOKEN({$varOne}) {TEXT|errorOne}({$varTwo}) {BINARY|errorTwo}({$varThree}) LENGTH({$varFour})";

  private static final String DOCUMENT_RETRIEVE_VALID =
          "DOCUMENT RETRIEVE DOCTOKEN({$varOne}) INTO({$varTwo}) LENGTH({$varThree})";

  private static final String DOCUMENT_RETRIEVE_INVALID_MISSING_OPTIONS =
          "DOCUMENT {_RETRIEVE DATAONLY|errorOne|errorTwo|errorThree_}";

  private static final String DOCUMENT_SET_VALID_SYMBOL =
          "DOCUMENT SET DOCTOKEN({$varOne}) SYMBOL({$varTwo}) VALUE({$varThree}) LENGTH({$varThree})";

  private static final String DOCUMENT_SET_VALID_SYMBOLLIST =
          "DOCUMENT SET DOCTOKEN({$varOne}) SYMBOLLIST({$varTwo}) DELIMITER({$varThree}) LENGTH({$varFour})";

  private static final String DOCUMENT_SET_INVALID_NO_DOCTOKEN =
          "DOCUMENT {_SET DOCTOKEN({$varOne}) SYMBOL({$varTwo}) VALUE({$varThree}) UNESCAPED|errorOne_}";

  private static final String DOCUMENT_SET_INVALID_BOTH_SYMBOL_AND_SYMBOLLIST =
          "DOCUMENT {_SET DOCTOKEN({$varFour}) LENGTH(123)|errorOne_}";

  @Test
  void testDocumentCreateValid() {
    CICSTestUtils.noErrorTest(DOCUMENT_CREATE_VALID);
  }

  @Test
  void testDocumentCreateInvalidNoDoctoken() {
    CICSTestUtils.errorTest(
            DOCUMENT_CREATE_INVALID_NO_DOCTOKEN,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: DOCTOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testDocumentCreateInvalidMultipleSources() {
    CICSTestUtils.errorTest(
            DOCUMENT_CREATE_INVALID_MULTIPLE_SOURCES,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROM, TEXT or BINARY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROM, TEXT or BINARY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testDocumentDeleteValid() {
    CICSTestUtils.noErrorTest(DOCUMENT_DELETE_VALID);
  }

  @Test
  void testDocumentDeleteInvalid() {
    CICSTestUtils.errorTest(
            DOCUMENT_DELETE_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: DOCTOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testDocumentInsertValid() {
    CICSTestUtils.noErrorTest(DOCUMENT_INSERT_VALID);
  }

  @Test
  void testDocumentInsertInvalidNoDoctoken() {
    CICSTestUtils.errorTest(
            DOCUMENT_INSERT_INVALID_NO_DOCTOKEN,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: DOCTOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testDocumentInsertInvalidMultipleSources() {
    CICSTestUtils.errorTest(
            DOCUMENT_INSERT_INVALID_MULTIPLE_SOURCES,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROM, TEXT or BINARY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROM, TEXT or BINARY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testDocumentRetrieveValid() {
    CICSTestUtils.noErrorTest(DOCUMENT_RETRIEVE_VALID);
  }

  @Test
  void testDocumentRetrieveInvalidMissingOptions() {
    CICSTestUtils.errorTest(
            DOCUMENT_RETRIEVE_INVALID_MISSING_OPTIONS,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: DOCTOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: INTO",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: LENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testDocumentSetValidSymbol() {
    CICSTestUtils.noErrorTest(DOCUMENT_SET_VALID_SYMBOL);
  }

  @Test
  void testDocumentSetValidSymbollist() {
    CICSTestUtils.noErrorTest(DOCUMENT_SET_VALID_SYMBOLLIST);
  }

  @Test
  void testDocumentSetInvalidNoDoctoken() {
    CICSTestUtils.errorTest(
            DOCUMENT_SET_INVALID_NO_DOCTOKEN,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: LENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testDocumentSetInvalidBothSymbolAndSymbollist() {
    CICSTestUtils.errorTest(
            DOCUMENT_SET_INVALID_BOTH_SYMBOL_AND_SYMBOLLIST,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, none provided: SYMBOL or SYMBOLLIST",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, none provided: SYMBOL or SYMBOLLIST",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
