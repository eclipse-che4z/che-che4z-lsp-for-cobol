/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test the error generated for an embedded code present inside a copybook is properly reflected.
 */
public class TestIssueWithEmbeddedCodePresentInCopybook {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST12.\n"
          + "       DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "        {_copy {~test9}.|1_}";

  public static final String COPYBOOK_CONTENT =
      "XDEBUG     EXEC CICS FORMATTIME ABSTIME({WS0-ABSTIME|2})                   \n"
          + "XDEBUG                          {TIMESEP1|3}(':')                    \n"
          + "XDEBUG                          DATESEP('/')                         \n"
          + "XDEBUG                          YYYYMMDD(WS0-D-CICS)                 \n"
          + "XDEBUG                          TIME(WS0-T-CICS)                     \n"
          + "XDEBUG     END-EXEC.   \n"
          + "           EXEC SQL \n"
          + "           declare scur cursor for select a,b,c from tabD where a = 8\n"
          + "           order by c {_for detch|4_} only;\n"
          + "            END-EXEC.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("TEST9", COPYBOOK_CONTENT)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Errors inside the copybook",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Variable WS0-ABSTIME is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Extraneous input 'TIMESEP1'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "4",
            new Diagnostic(
                new Range(),
                "No viable alternative at input for detch",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
