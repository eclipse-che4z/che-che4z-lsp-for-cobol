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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

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

  private static final String MOVE = "             MOVE 0 to {SMTH|1}.";
  private static final String MOVE_NAME = "MOVE";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(MOVE_NAME, MOVE)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), "Variable SMTH is not defined", DiagnosticSeverity.Error, ERROR.getText())));
  }
}
