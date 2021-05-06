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
 * This test checks that redefined variable should immediately follow
 */
public class TestVariableRedefineAsap {
  private static final String REDEFINES_SHOULD_FOLLOW =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PERFTIMI.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*WS-DATA-A} PIC X(20) .\n"
          + "       01 {$*WS-DATA-RED} REDEFINES {$WS-DATA-A} PIC X(20).\n"
          + "       01 {$*WS-DATA-RED2} REDEFINES {$WS-DATA-A} PIC X(20).\n"
          + "       01 {$*WS-DATA-B} PIC X(20) .\n"
          + "       01 {$*WS-DATA-RED3} REDEFINES {$WS-DATA-A|1} PIC X(20).\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String CORRECT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.      EMPPROJ.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       DATA DIVISION. \n"
          + "         WORKING-STORAGE SECTION.\n"
          + "          01 {$*WS-DESCRIPTION}.\n"
          + "              05 {$*WS-DATE1} VALUE '20140831'.\n"
          + "                 10 {$*WS-YEAR} PIC X(4).\n"
          + "                 10 {$*WS-MONTH} PIC X(2).\n"
          + "                 10 {$*WS-DATE} PIC X(2).\n"
          + "               05 {$*WS-DATE2} REDEFINES {$WS-DATE1} PIC 9(8).";

  @Test
  void testError() {
    UseCaseEngine.runTest(
        REDEFINES_SHOULD_FOLLOW,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "REDEFINES line must immediately follow redefined item: WS-DATA-A",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }

  @Test
  void test() {
    UseCaseEngine.runTest(CORRECT, ImmutableList.of(), ImmutableMap.of());
  }
}
