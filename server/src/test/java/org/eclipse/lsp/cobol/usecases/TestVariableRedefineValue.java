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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/**
 * This test checks that redefined variable can not contain VALUE clause
 */
class TestVariableRedefineValue {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PERFTIMI.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-DATA-A} PIC X(20) .\n"
          + "       01 {$*WS-DATA-B} REDEFINES {$WS-DATA-A} PIC X(20) {VALUE|1} 10.\n"
          + "       PROCEDURE DIVISION.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "The redefining item cannot contain a VALUE clause: WS-DATA-B",
                DiagnosticSeverity.Error,
                ERROR.getText())));
   }
}
