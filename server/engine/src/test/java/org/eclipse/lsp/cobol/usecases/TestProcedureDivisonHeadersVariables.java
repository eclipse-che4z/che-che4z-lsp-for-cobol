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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests {@link org.eclipse.lsp.cobol.core.engine.processors.ProcedureDivisionHeaderProcess} */
public class TestProcedureDivisonHeadersVariables {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       FUNCTION-ID. HEXOF.\n"
          + "       DATA DIVISION.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  {$*NUM}         PIC X(1234).\n"
          + "       PROCEDURE DIVISION RETURNING {$NUM}.\n"
          + "       END FUNCTION HEXOF.\n"
          + "\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGM.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.                               \n"
          + "       REPOSITORY.                                          \n"
          + "               FUNCTION HEXOF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*num} pic x.\n"
          + "       01 {$*num2} pic x.\n"
          + "       LINKAGE SECTION.\n"
          + "       01 {$*num3} pic x.\n"
          + "       PROCEDURE DIVISION using {_{$num}|1_} {_{$num2}|2_} {hexof|3} {$num3} RETURNING {_{$num}|4_}.\n"
          + "           display function HEXOF.\n"
          + "       END PROGRAM PGM.";

  // TODO:
  // After usecase engine is updated to capture function definition and usage. Below Test need to
  // be modified to capture those and update error message for the wrong function usage.
  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Operand 'NUM' was not defined in the LINKAGE SECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Operand 'NUM2' was not defined in the LINKAGE SECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Variable HEXOF is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "Operand 'NUM' was not defined in the LINKAGE SECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
