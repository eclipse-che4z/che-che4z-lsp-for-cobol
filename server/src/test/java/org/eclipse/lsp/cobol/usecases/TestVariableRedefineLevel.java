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

/** This test checks that redefined variable has the same level as original */
class TestVariableRedefineLevel {
  private static final String TEXT_HIGHEST_LEVEL =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PERFTIMI.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       77 {$*WS-DATA-A} PIC X(20) .\n"
          + "       {01|1} {$*WS-DATA-B} REDEFINES {$WS-DATA-A} PIC X(20).\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String TEXT_LEVEL_5 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PERFTIMI.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-DATA-A}.\n"
          + "             05 {$*WS-DATA} PIC X(20).\n"
          + "             {04} {$*WS-DATA-RED} REDEFINES {$WS-DATA} PIC X(20).\n"
          + "       PROCEDURE DIVISION.\n";

  @Test
  void testHighest() {
    UseCaseEngine.runTest(
        TEXT_HIGHEST_LEVEL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "The redefining and redefined items must have the same level: WS-DATA-A",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void testLevel5() {
    UseCaseEngine.runTest(TEXT_LEVEL_5, ImmutableList.of(), ImmutableMap.of());
  }
}
