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

import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels.INFO;
import static org.eclipse.lsp4j.DiagnosticSeverity.Information;

/**
 * This test checks that semantic errors that appear in a copybook exposed in the COBOL document on
 * the COPY statement.
 */
class TestSemanticErrorsFromCopybooksShownInDocument {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           {_COPY {~MOVE}.|1_}\n"
          + "           GOBACK.";

  private static final String MOVE = "             MOVE 0 to {$SMTH|1}.";
  private static final String MOVE_NAME = "MOVE";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(new CobolText(MOVE_NAME, MOVE)),
        Map.of(
            "1",
            new Diagnostic(null, "Invalid definition for: SMTH", Information, INFO.getText())));
  }
}
