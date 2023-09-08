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
 */ package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests the semantics for the file status clause of the file control statement */
public class TestSemanticsForFileStatus {
  public static final String POSITIVE_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "           SELECT {$FILE-IN}  file STATUS is {$DS} ASSIGN TO UT-S-YYCUSMST .\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*FILE-IN} IS EXTERNAL\n"
          + "           RECORD CONTAINS 450 CHARACTERS\n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.\n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*DS}  .\n"
          + "           05 {$*XY} PIC 9  USAGE NATIONAL.\n"
          + "           05 {$*YZ} pic x.\n"
          + "\n"
          + "       PROCEDURE DIVISION.";
  public static final String NEGATIVE_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST12.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "           SELECT {$FILE-IN}  file STATUS is {$DS|1|2} ASSIGN TO UT-S-YYCUSMST .\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  {$*FILE-IN} IS EXTERNAL\n"
          + "           RECORD CONTAINS 450 CHARACTERS\n"
          + "           DATA RECORDS ARE {$WREHOUSE-RECORD}.\n"
          + "       01  {$*WREHOUSE-RECORD}                         PIC X(450).\n"
          + "       01 {$*DS}  .\n"
          + "           05 {$*XY} PIC 9(2)  USAGE NATIONAL.\n"
          + "           05 {$*YZ} pic x.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "\n"
          + "       PROCEDURE DIVISION.\n";

  @Test
  void positiveText() {
    UseCaseEngine.runTest(POSITIVE_TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void negativeText() {
    UseCaseEngine.runTest(
        NEGATIVE_TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "2",
            new Diagnostic(
                new Range(),
                "data-name DS was not defined as a two-character item",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "1",
            new Diagnostic(
                new Range(),
                "DS was not defined in the 'WORKING-STORAGE SECTION', 'LOCAL-STORAGE SECTION' or 'LINKAGE SECTION'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
