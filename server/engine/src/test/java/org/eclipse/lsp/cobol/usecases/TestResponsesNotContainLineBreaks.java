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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test verifies that all the responses from server escaped from line breaks to prevent
 * incorrect parsing on the client side.
 */
class TestResponsesNotContainLineBreaks {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*A} PIC 9.\n"
          + "        01 {$*B} PIC 9.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           PERFORM VARYING {$A} FROM 10 BY 10 UNTIL  {>|1} 40\n" // May contain line
          // break in a diagnostic message between 40 and PERFORM
          + "               PERFORM VARYING {$b} FROM 1 BY 1 UNTIL {$B} > 4\n"
          + "               END-PERFORM\n"
          + "            END-PERFORM.\n"
          + "            STOP RUN.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                    "Extraneous input '>'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
