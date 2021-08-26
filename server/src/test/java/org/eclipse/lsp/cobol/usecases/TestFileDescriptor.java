/*
 * Copyright (c) 2021 Broadcom.
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
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.hover.VariableHover;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Tests the FD and SD.
 * 1. Hover shows the File Description and File control data.
 * 2. FD are checked before the use of file variable.
 */
public class TestFileDescriptor {
  private static final String TEXT =
      "      *****************************************************************\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  calc2.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "             SELECT {$INFILE} ASSIGN TO \"c:\\infile.dat\"\n"
          + "             ORGANIZATION IS LINE SEQUENTIAL\n"
          + "             ACCESS MODE IS SEQUENTIAL\n"
          + "             FILE STATUS IS {$IFCODE}.\n"
          + "      *****************************************************************\n"
          + "      *****************************************************************\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*INFILE}\n"
          + "           LABEL RECORDS ARE STANDARD\n"
          + "           DATA RECORD IS InputRec\n"
          + "           RECORD CONTAINS 80 CHARACTERS\n"
          + "           RECORDING MODE IS F\n"
          + "           BLOCK CONTAINS 0 RECORDS.\n"
          + "       01  {$*InputRec}.\n"
          + "           05 {$*Field1} PIC X(40).\n"
          + "           05 {$*Field2} PIC X(40).\n"
          + "\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*FILE-STATUS-CODES}.\n"
          + "           05  {$*IFCODE}           PIC X(2).\n"
          + "               88 {$*CODE-READ}     VALUE SPACES.\n"
          + "               88 {$*NO-MORE-DATA}  VALUE \"10\".\n"
          + "\n"
          + "       PROCEDURE DIVISION.\n"
          + "            READ {$INFILE}.\n"
          + "            CLOSE {$INFILE}.";

  private static final String HOVER =
      "DESCRIPTION "
          + System.lineSeparator()
          + "----------- "
          + System.lineSeparator()
          + "FD  INFILE"
          + System.lineSeparator()
          + "LABEL RECORDS ARE STANDARD"
          + System.lineSeparator()
          + "DATA RECORD IS INPUTREC"
          + System.lineSeparator()
          + "RECORD CONTAINS 80 CHARACTERS"
          + System.lineSeparator()
          + "RECORDING MODE IS F"
          + System.lineSeparator()
          + "BLOCK CONTAINS 0 RECORDS."
          + System.lineSeparator()
          + " "
          + System.lineSeparator()
          + "FILE-CONTROL"
          + System.lineSeparator()
          + "------------ "
          + System.lineSeparator()
          + "ASSIGN TO \"C:\\INFILE.DAT\""
          + System.lineSeparator()
          + "ORGANIZATION IS LINE SEQUENTIAL"
          + System.lineSeparator()
          + "ACCESS MODE IS SEQUENTIAL"
          + System.lineSeparator()
          + "FILE STATUS IS IFCODE "
          + System.lineSeparator();

  private static final String NO_FILE_CONTROL_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  calc2.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*INFILE|1}\n"
          + "           LABEL RECORDS ARE STANDARD\n"
          + "           DATA RECORD IS InputRec\n"
          + "           RECORD CONTAINS 80 CHARACTERS\n"
          + "           RECORDING MODE IS F\n"
          + "           BLOCK CONTAINS 0 RECORDS.\n";

  private static final String FILE_CONTROL_WITH_NO_FD =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  calc2.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "             SELECT {INFILE|2} ASSIGN TO \"c:\\infile.dat\"\n"
          + "             ORGANIZATION IS LINE SEQUENTIAL\n"
          + "             ACCESS MODE IS SEQUENTIAL.\n"
          + "       DATA DIVISION.\n"
          + "       END PROGRAM calc2.";

  private static final String FILE_USAGE_WITHOUT_DEF =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  calc2.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           READ {INFILE|1}.\n"
          + "       END PROGRAM calc2.";

  private static final String DUPLICATE_ENTRY_IN_FILE_CONTROL =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  calc2.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "             SELECT {$INFILE} ASSIGN TO \"c:\\infile.dat\"..\n"
          + "             select {$INFILE|1} assign DUMMY.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*INFILE}\n"
          + "           LABEL RECORDS ARE STANDARD\n"
          + "           DATA RECORD IS InputRec\n"
          + "           RECORD CONTAINS 80 CHARACTERS\n"
          + "           RECORDING MODE IS F\n"
          + "           BLOCK CONTAINS 0 RECORDS.";

  @Test
  void test() {
    AnalysisResult analysisResult =
        UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            CopybookProcessingMode.ENABLED);

    assertHover(analysisResult);
  }

  private void assertHover(AnalysisResult result) {
    HoverProvider provider = new VariableHover();

    final Hover actual =
        provider.getHover(
            new CobolDocumentModel("", result),
            new TextDocumentPositionParams(
                new TextDocumentIdentifier(DOCUMENT_URI), new Position(6, 24)));

    Hover expected = new Hover(ImmutableList.of(Either.forRight(new MarkedString("cobol", HOVER))));
    assertEquals(expected, actual);
  }

  @Test
  void whenNoFileControl_thenExpectErrorAtFD() {
    UseCaseEngine.runTest(
        NO_FILE_CONTROL_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "No FILE-CONTROL entry found for INFILE",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void whenFileControlPresentWithoutFD_thenExpectErrorAtFileControl() {
    UseCaseEngine.runTest(
        FILE_CONTROL_WITH_NO_FD,
        ImmutableList.of(),
        ImmutableMap.of(
            "2",
            new Diagnostic(
                null,
                "Variable INFILE is not defined",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void whenNoFD_expectErrorInReadFile() {
    UseCaseEngine.runTest(
        FILE_USAGE_WITHOUT_DEF,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Variable INFILE is not defined",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void whenDuplicateFileNameIsDefinedInFileControl_thenShowError() {
    UseCaseEngine.runTest(
        DUPLICATE_ENTRY_IN_FILE_CONTROL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "File INFILE is already in the FILE-CONTROL paragraph",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
