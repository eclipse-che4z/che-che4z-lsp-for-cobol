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
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that a variable used in SET UP/DOWN BY statement flagged when it is not allowed
 */
class TestSetUpDownBy {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SETINDEX.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*TABLE1} OCCURS 5 TIMES INDEXED BY {$*IND1} PIC 9.\n"
          + "       01 {$*TABLE2} OCCURS 5 TIMES INDEXED BY {$*IND2} PIC 9.\n"
          + "       01 {$*TABLE3} OCCURS 5 TIMES INDEXED BY {$*IND3} PIC 9.\n"
          + "       01 {$*NOT-A-TABLE} USAGE IS INDEX.\n"
          + "       01 {$*INTVAL} PIC 9 VALUE 1.\n"
          + "       01 {$*GROUP-VAR}.\n"
          + "           05 {$*SUBINT} PIC 9 VALUE 1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           SET {$IND1} UP BY 1.\n"
          + "           SET {$IND1} UP BY {0|2}.\n"
          + "           SET {$IND1} UP BY {00|2}.\n"
          + "           SET {$IND1} DOWN BY {0|2}.\n"
          + "           SET {$IND1} DOWN BY {\"0\"|2}.\n"
          + "           SET {$IND1} DOWN BY {\"1\"|2}.\n"
          + "           SET {$IND1} {$IND2} {$IND3} DOWN BY 1.\n"
          + "           SET {$IND1} {$INTVAL|1} DOWN BY -1.\n"
          + "           SET {$NOT-A-TABLE|1} UP BY 1.\n"
          + "           SET {$NOT-A-TABLE|1} DOWN BY 1.\n"
          + "           SET {$NOT-A-TABLE|1} {$IND1} UP BY 1.\n"
          + "           SET {$IND1} UP BY {$INTVAL}.\n"
          + "           SET {$IND1} UP BY {$SUBINT} OF {$GROUP-VAR}.\n"
          + "           SET {$IND1} UP BY {$SUBINT} {#*IND3|3|5}.\n"
          + "           SET {$INTVAL|1} DOWN BY {$SUBINT} OF {$GROUP-VAR}.\n"
          + "           SET {$IND1} DOWN BY {IND4|4}.\n"
          + "           SET {IND4|4} DOWN BY {$INTVAL}.\n"
          + "           SET {IND4|4} DOWN BY {IND4|4}.\n"
          + "           SET {$IND1} UP BY {1.5|2}.\n"
          + "           SET {$IND1} UP BY {1,5|2}.\n"
          + "       END PROGRAM SETINDEX.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Invalid receiving field type. Expected: Index name",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Invalid sending field type. Expected: Elementary integer data item, Non-zero integer",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                    "Extraneous input 'IND3'",
                    DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "Variable IND4 is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "5",
            new Diagnostic(
                new Range(),
                "The following token must start in Area A: IND3",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        AnalysisConfig.defaultConfig(CopybookProcessingMode.DISABLED));
  }
}
