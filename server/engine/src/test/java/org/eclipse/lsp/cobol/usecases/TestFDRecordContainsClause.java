/*
 * Copyright (c) 2022 Broadcom.
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

/**
 * Tests record contains clause2 for file description entry ref- <a
 * href="https://www.ibm.com/docs/en/cobol-zos/6.3?topic=division-data-file-description-entries">
 * division-data-file-description-entries</a>
 */
public class TestFDRecordContainsClause {
  private static final String BASE =
      "000900 IDENTIFICATION DIVISION.                                         00000900\n"
          + "001000 PROGRAM-ID. ABCDEFGH.                                            00001000\n"
          + "001100 ENVIRONMENT DIVISION.                                            00001100\n"
          + "001200 INPUT-OUTPUT SECTION.                                            00001200\n"
          + "001300 FILE-CONTROL.                                                    00001300\n"
          + "001400     SELECT {$ABCD} ASSIGN TO ABCDEFG                           \n"
          + "001500            ORGANIZATION IS INDEXED. \n"
          + "002300 DATA DIVISION.                                                   00002300\n"
          + "002400 FILE SECTION.                                                    00002400\n"
          + "002500 FD  {$*ABCD}                                                         00002500\n";
  private static final String TEXT =
      BASE
          + "002700     RECORD IS VARYING IN SIZE TO 4096 CHARACTERS                 00002700\n"
          + "002800     DATA RECORD IS {$AAAAAAAAAA}.                                   00002800\n"
          + "       01 {$*AAAAAAAAAA} PIC 9(2).\n";

  private static final String TEXT2 =
      BASE
          + "002700     RECORD IS VARYING IN SIZE FROM 4096 CHARACTERS           \n"
          + "002800     DATA RECORD IS {$AAAAAAAAAA}.                                   00002800\n"
          + "       01 {$*AAAAAAAAAA} PIC 9(2).\n";

  private static final String TEXT3 =
      BASE
          + "002700     RECORD IS VARYING IN SIZE FROM 4096 TO 9192 CHARACTERS \n"
          + "002800     DATA RECORD IS {$AAAAAAAAAA}.                                   00002800\n"
          + "       01 {$*AAAAAAAAAA} PIC 9(2).\n";

  private static final String TEXT4 =
      BASE
          + "002700     RECORD IS VARYING IN SIZE 4096 CHARACTERS \n"
          + "002800     DATA RECORD IS {$AAAAAAAAAA}.                                   00002800\n"
          + "       01 {$*AAAAAAAAAA} PIC 9(2).\n";

  public static final String TEXT5 =
      BASE
          + "           record contains 0 CHARACTERS.\n"
          + "           {BLOCK|1} CONTAINS 0 RECORDS\n"
          + "           LABEL RECORDS are OMITTED.\n"
          + "       01 CARD_ABC_FIELD.\n"
          + "           05 A-FIELD pic x(9).";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test3() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test4() {
    UseCaseEngine.runTest(TEXT4, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDotAreNotAllowedBetweenFDEntryClauses() {
    UseCaseEngine.runTest(
        TEXT5,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'BLOCK'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
