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
import org.eclipse.lsp.cobol.core.model.ErrorStage;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test missing copybook at the beginning doesn't break the syntax analysis */
class TestMissingCopybookAtBeginningNotBreaksSyntaxAnalysis {

  private static final String TEXT =
      "       COPY {~ASDAW|1}.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PARENT} PIC 9.\n"
          + "       PROCEDURE DIViSION. \n"
          + "       {#*MAINLINE}. \n"
          + "           MOVE 0 TO {$PARENT}. \n"
          + "           GOBACK.  ";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "ASDAW: Copybook not found",
                DiagnosticSeverity.Error,
                ErrorStage.EXTENDED_DOCUMENT.getText(),
                "MISSING_COPYBOOK")));
  }
}
