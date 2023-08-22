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

/** Tests semantics for the file I-O operations. */
public class TestSemanticsForFileIOOperations {
  public static final String BASE_TEXT =
      "       IDENTIFICATION DIVISION.                                         \n"
          + "       PROGRAM-ID.    TEST12.                                           \n"
          + "       ENVIRONMENT DIVISION.                                            \n"
          + "       INPUT-OUTPUT SECTION.                                            \n"
          + "      *                                                                 \n"
          + "       FILE-CONTROL.  \n";
  public static final String PRE_FILE_SECTION_TEXT =
      "      *                                                                 \n"
          + "       DATA DIVISION.                                                   \n"
          + "      *                                                                 \n"
          + "      *                                                                 \n"
          + "       FILE SECTION.            \n";
  public static final String WRK_STRG_TEXT =
      "       WORKING-STORAGE SECTION.                                         \n"
          + "       01 {$*LIST-ACCT-REC}                            PIC X(450).          \n"
          + "       01  {$*WS01-WAREHOUS-SW}                PIC X(01) VALUE 'N'.         \n"
          + "       01  {$*REPORT-FILE-RECORD}             PIC X(400).                   \n"
          + "       PROCEDURE DIVISION.                                \n";
  public static final String TEXT =
      BASE_TEXT
          + "           SELECT {$REPORT-FILE-OUT}                                       \n"
          + "                 ASSIGN TO UT-S-YYRPFLE1.                               \n"
          + "           SELECT {$FILE-IN}                                               \n"
          + "                 ASSIGN TO UT-S-YYCUSMST.                               \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*REPORT-FILE-OUT}                                              \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 274 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$REPORT-RECORD}.                              \n"
          + "      *                                                                 \n"
          + "       01  {$*REPORT-RECORD}                         PIC X(274).            \n"
          + "       FD  {$*FILE-IN}                                                      \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 450 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.                            \n"
          + "      *                                                                 \n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).          \n"
          + WRK_STRG_TEXT
          + "       {#*110-OPEN-FILES}.                                                  \n"
          + "      *                                                                 \n"
          + "           OPEN INPUT  {$FILE-IN}                                          \n"
          + "                OUTPUT {$REPORT-FILE-OUT}.                                 \n"
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           READ {$FILE-IN} INTO {$LIST-ACCT-REC}                              \n"
          + "              AT END                                                    \n"
          + "                 MOVE 'Y' TO {$WS01-WAREHOUS-SW}.                          \n"
          + "           WRITE {$REPORT-RECORD} FROM {$REPORT-FILE-RECORD}.  ";

  public static final String READ_TEXT =
      BASE_TEXT
          + "       SELECT {$FILE-IN}                                               \n"
          + "                 ASSIGN TO UT-S-YYCUSMST.                  \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*FILE-IN}                                                      \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 450 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.                            \n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).          \n"
          + WRK_STRG_TEXT
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           READ {$FILE-IN|1} INTO {$LIST-ACCT-REC}                              \n"
          + "              AT END                                                    \n"
          + "                 MOVE 'Y' TO {$WS01-WAREHOUS-SW}.                          \n";

  public static final String READ_TEXT2 =
      BASE_TEXT
          + "       SELECT {$FILE-IN}                                               \n"
          + "                 ASSIGN TO UT-S-YYCUSMST.                  \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*FILE-IN}                                                      \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 450 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.                            \n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).          \n"
          + WRK_STRG_TEXT
          + "       {#*110-OPEN-FILES}.                                                  \n"
          + "           OPEN OUTPUT  {$FILE-IN}.                                        \n"
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           READ {$FILE-IN|1} INTO {$LIST-ACCT-REC}                              \n"
          + "              AT END                                                    \n"
          + "                 MOVE 'Y' TO {$WS01-WAREHOUS-SW}.                          \n";

  public static final String WRITE_TEXT =
      BASE_TEXT
          + "           SELECT {$REPORT-FILE-OUT}                                       \n"
          + "                 ASSIGN TO UT-S-YYRPFLE1.                               \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*REPORT-FILE-OUT}                                              \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 274 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$REPORT-RECORD}.                              \n"
          + "      *                                                                 \n"
          + "       01  {$*REPORT-RECORD}                         PIC X(274).            \n"
          + WRK_STRG_TEXT
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           WRITE {$REPORT-RECORD|1} FROM {$REPORT-FILE-RECORD}.  ";

  public static final String WRITE_TEXT2 =
      BASE_TEXT
          + "           SELECT {$REPORT-FILE-OUT}                                       \n"
          + "                 ASSIGN TO UT-S-YYRPFLE1.                               \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*REPORT-FILE-OUT}                                              \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 274 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$REPORT-RECORD}.                              \n"
          + "      *                                                                 \n"
          + "       01  {$*REPORT-RECORD}                         PIC X(274).            \n"
          + WRK_STRG_TEXT
          + "       {#*110-OPEN-FILES}.                                                  \n"
          + "      *                                                                 \n"
          + "           OPEN                                                \n"
          + "                INPUT {$REPORT-FILE-OUT}.                                 \n"
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           WRITE {$REPORT-RECORD|1} FROM {$REPORT-FILE-RECORD}.  ";

  public static final String REWRITE_TEXT =
      BASE_TEXT
          + "           SELECT {$REPORT-FILE-OUT}                                       \n"
          + "                 ASSIGN TO UT-S-YYRPFLE1.                               \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*REPORT-FILE-OUT}                                              \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 274 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$REPORT-RECORD}.                              \n"
          + "      *                                                                 \n"
          + "       01  {$*REPORT-RECORD}                         PIC X(274).            \n"
          + WRK_STRG_TEXT
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           REWRITE {$REPORT-RECORD|1} FROM {$REPORT-FILE-RECORD}.  ";

  public static final String REWRITE_TEXT2 =
      BASE_TEXT
          + "           SELECT {$REPORT-FILE-OUT}                                       \n"
          + "                 ASSIGN TO UT-S-YYRPFLE1.                               \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*REPORT-FILE-OUT}                                              \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 274 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$REPORT-RECORD}.                              \n"
          + "      *                                                                 \n"
          + "       01  {$*REPORT-RECORD}                         PIC X(274).            \n"
          + WRK_STRG_TEXT
          + "       {#*110-OPEN-FILES}.                                                  \n"
          + "      *                                                                 \n"
          + "           OPEN                                                \n"
          + "                INPUT {$REPORT-FILE-OUT}.                                 \n"
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           REWRITE {$REPORT-RECORD|1} FROM {$REPORT-FILE-RECORD}.  ";

  public static final String DELETE_TEXT =
      BASE_TEXT
          + "       SELECT {$FILE-IN}                                               \n"
          + "                 ASSIGN TO UT-S-YYCUSMST.                  \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*FILE-IN}                                                      \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 450 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.                            \n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).          \n"
          + WRK_STRG_TEXT
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           DELETE {$FILE-IN|1}.\n";

  public static final String DELETE_TEXT2 =
      BASE_TEXT
          + "       SELECT {$FILE-IN}                                               \n"
          + "                 ASSIGN TO UT-S-YYCUSMST.                  \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*FILE-IN}                                                      \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 450 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.                            \n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).          \n"
          + WRK_STRG_TEXT
          + "       {#*110-OPEN-FILES}.                                                  \n"
          + "           OPEN OUTPUT  {$FILE-IN}.                                        \n"
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           DELETE {$FILE-IN|1}.\n";

  public static final String START_TEXT =
      BASE_TEXT
          + "       SELECT {$FILE-IN}                                               \n"
          + "                 ASSIGN TO UT-S-YYCUSMST.                  \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*FILE-IN}                                                      \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 450 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.                            \n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).          \n"
          + WRK_STRG_TEXT
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           START {$FILE-IN|1}.\n";

  public static final String START_TEXT2 =
      BASE_TEXT
          + "       SELECT {$FILE-IN}                                               \n"
          + "                 ASSIGN TO UT-S-YYCUSMST.                  \n"
          + PRE_FILE_SECTION_TEXT
          + "       FD  {$*FILE-IN}                                                      \n"
          + "           LABEL RECORDS ARE STANDARD                                   \n"
          + "           BLOCK CONTAINS 0 RECORDS                                     \n"
          + "           RECORD CONTAINS 450 CHARACTERS                               \n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.                            \n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).          \n"
          + WRK_STRG_TEXT
          + "       {#*110-OPEN-FILES}.                                                  \n"
          + "           OPEN OUTPUT  {$FILE-IN}.                                        \n"
          + "       {#*112-FILE-OPERATION}.                                              \n"
          + "           START {$FILE-IN|1}.\n";

  public static final String TEXT_EXTERNAL_1 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       SELECT {$FILE-IN}  ASSIGN TO UT-S-YYCUSMST.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*FILE-IN} IS EXTERNAL\n"
          + "           RECORD CONTAINS 450 CHARACTERS\n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.\n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).\n"
          + "\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*LIST-ACCT-REC}                           PIC X(450).\n"
          + "       01  {$*WS01-WAREHOUS-SW}                PIC X(01) VALUE 'N'.\n"
          + "       01  {$*REPORT-FILE-RECORD}            PIC X(400).\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*112-FILE-OPERATION}.\n"
          + "           WRITE {$WREHOUSE-RECORD}.";

  public static final String TEXT_EXTERNAL_2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       SELECT {$FILE-IN}  ASSIGN TO UT-S-YYCUSMST.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*FILE-IN} IS EXTERNAL\n"
          + "           RECORD CONTAINS 450 CHARACTERS\n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.\n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).\n"
          + "\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*LIST-ACCT-REC}                           PIC X(450).\n"
          + "       01  {$*WS01-WAREHOUS-SW}                PIC X(01) VALUE 'N'.\n"
          + "       01  {$*REPORT-FILE-RECORD}            PIC X(400).\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*112-FILE-OPERATION}.\n"
          + "           WRITE {$FILE-IN}.";

  @Test
  void positiveTest() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void whenReadFileIsNotOpened_thenThrowError() {
    UseCaseEngine.runTest(
        READ_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "READ statement can only reference a file opened for INPUT or I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenReadFileIsNotOpenedAsInput_thenThrowError() {
    UseCaseEngine.runTest(
        READ_TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "READ statement can only reference a file opened for INPUT or I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenWriteFileIsNotOpened_thenThrowError() {
    UseCaseEngine.runTest(
        WRITE_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "WRITE statement can only reference a file opened for OUTPUT or I-O or EXTEND",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenWriteFileIsNotOpenedAsOutput_thenThrowError() {
    UseCaseEngine.runTest(
        WRITE_TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "WRITE statement can only reference a file opened for OUTPUT or I-O or EXTEND",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenRewriteFileIsNotOpened_thenThrowError() {
    UseCaseEngine.runTest(
        REWRITE_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "REWRITE statement can only reference a file opened for I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenRewriteFileIsNotOpenedAsIO_thenThrowError() {
    UseCaseEngine.runTest(
        REWRITE_TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "REWRITE statement can only reference a file opened for I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenDeleteFileIsNotOpened_thenThrowError() {
    UseCaseEngine.runTest(
        DELETE_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "DELETE statement can only reference a file opened for I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenDeleteFileIsNotOpenedAsIO_thenThrowError() {
    UseCaseEngine.runTest(
        DELETE_TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "DELETE statement can only reference a file opened for I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenStartFileIsNotOpened_thenThrowError() {
    UseCaseEngine.runTest(
        START_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "START statement can only reference a file opened for INPUT or I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void whenStartFileIsNotOpenedAsInput_thenThrowError() {
    UseCaseEngine.runTest(
        START_TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "START statement can only reference a file opened for INPUT or I-O",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testNoIOSemanticsErrorForExternalFiles() {
    UseCaseEngine.runTest(TEXT_EXTERNAL_1, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testNoIOSemanticsErrorForExternalFiles2() {
    UseCaseEngine.runTest(TEXT_EXTERNAL_2, ImmutableList.of(), ImmutableMap.of());
  }
}
