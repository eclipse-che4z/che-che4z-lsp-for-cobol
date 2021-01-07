/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** This test checks sql include statement gives an error if defined statement not found. */
class TestSqlIncludeStatementNotFoundCopybook {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL INCLUDE {~CPYNAME|missing} END-EXEC.\n"
          + "       PROCEDURE DIVISION.";

  @Test
  void test() {
    UseCaseEngine.runTest(
            TEXT,
            List.of(),
            Map.of(
                    "missing",
                    new Diagnostic(
                            null, "CPYNAME: Copybook not found", Error, SourceInfoLevels.ERROR.getText(), "MISSING_COPYBOOK")));
  }
}
