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
import org.junit.jupiter.api.Test;

/**
 * Test that not completely typed variable definition doesn't produce an exception.
 */
class TestHalfTypedVariableDefinition {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-id. HELLO-WORLD.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*COD-RETOUR} PIC X{(|1}{66|2}{|3}";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(
        "1",
        new Diagnostic(null, "Extraneous input '(' expected {BINARY, BLANK, COMP, COMPUTATIONAL, "
            + "COMPUTATIONAL-1, COMPUTATIONAL-2, COMPUTATIONAL-3, COMPUTATIONAL-4, COMPUTATIONAL-5, COMP-1, COMP-2, "
            + "COMP-3, COMP-4, COMP-5, DISPLAY, DISPLAY-1, DYNAMIC, EXTERNAL, FUNCTION-POINTER, GLOBAL, GROUP-USAGE, "
            + "INDEX, IS, JUST, JUSTIFIED, LEADING, NATIONAL, OBJECT, OCCURS, PACKED-DECIMAL, PIC, PICTURE, POINTER, "
            + "POINTER-32, PROCEDURE-POINTER, REDEFINES, SIGN, SYNC, SYNCHRONIZED, TRAILING, USAGE, UTF-8, VALUE, "
            + "VALUES, VOLATILE, '.', '.'2}",
            DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText()),
        "2",
        new Diagnostic(null, "No data definition entry found for rename",
            DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText()),
        "3",
        new Diagnostic(null, "Unexpected end of file",
            DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())
    ));
  }
}
