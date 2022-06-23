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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Typing the variable definition "01 EXEC" should not produce NPE */
class TestExecVarDoesNotProduceNPE {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {01|1} {EXEC|2|3}{|4}\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item FILLER",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Syntax error on 'EXEC' expected {BINARY, BLANK, COMP, COMPUTATIONAL, COMPUTATIONAL-1, "
                    + "COMPUTATIONAL-2, COMPUTATIONAL-3, COMPUTATIONAL-4, COMPUTATIONAL-5, COMP-1, COMP-2, COMP-3, "
                    + "COMP-4, COMP-5, DISPLAY, DISPLAY-1, DYNAMIC, EXTERNAL, FILLER, FUNCTION-POINTER, GLOBAL, "
                    + "GROUP-USAGE, INDEX, IS, JUST, JUSTIFIED, LEADING, OCCURS, PACKED-DECIMAL, PIC, PICTURE, "
                    + "POINTER, POINTER-32, PROCEDURE-POINTER, REDEFINES, SIGN, SYNC, SYNCHRONIZED, TRAILING, USAGE, "
                    + "UTF-8, VALUE, VALUES, '.', IDENTIFIER}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "The following token must start in Area B: EXEC",
                DiagnosticSeverity.Warning,
                SourceInfoLevels.WARNING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "Unexpected end of file",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
