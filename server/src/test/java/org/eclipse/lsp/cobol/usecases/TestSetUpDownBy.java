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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.WARNING;
import static org.eclipse.lsp4j.DiagnosticSeverity.Warning;

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
          + "           SET {$IND1} UP BY {@*SUBINT|4} {IND3|3|5}.\n"
          + "           SET {$INTVAL|1} DOWN BY {$SUBINT} OF {$GROUP-VAR}.\n"
          + "           SET {$IND1} DOWN BY {IND4|6}.\n"
          + "           SET {IND4|6} DOWN BY {$INTVAL}.\n"
          + "           SET {IND4|6} DOWN BY {IND4|6}.\n"
          + "           SET {$IND1} UP BY {1.5|2}.\n"
          + "           SET {$IND1} UP BY {1,5|2}.\n"
          + "       END PROGRAM SETINDEX.";

  private static final Map<String, Diagnostic> DIAGNOSTICS = new HashMap<>();

  static {
    DIAGNOSTICS.put(
        "1",
        new Diagnostic(
            null,
            "Invalid receiving field type. Expected: Index name",
            DiagnosticSeverity.Error,
            ERROR.getText()));
    DIAGNOSTICS.put(
        "2",
        new Diagnostic(
            null,
            "Invalid sending field type. Expected: Elementary integer data item, Non-zero integer",
            DiagnosticSeverity.Error,
            ERROR.getText()));
    DIAGNOSTICS.put(
        "3",
        new Diagnostic(
            null,
            "No viable alternative at input SUBINT IND3",
            DiagnosticSeverity.Error,
            ERROR.getText()));
    DIAGNOSTICS.put(
        "4",
        new Diagnostic(
            null, "The following token must start in Area A: SUBINT", Warning, WARNING.getText()));
    DIAGNOSTICS.put(
        "5",
        new Diagnostic(
            null,
            "Syntax error on 'IND3' expected SECTION",
            DiagnosticSeverity.Error,
            ERROR.getText()));
    DIAGNOSTICS.put(
        "6",
        new Diagnostic(
            null, "Invalid definition for: IND4", DiagnosticSeverity.Error, ERROR.getText()));
  }

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), DIAGNOSTICS);
  }
}
