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
import org.eclipse.lsp.cobol.core.ParserUtils;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the an asterisk out of indicator area before the COPY statement doesn't
 * break syntax analysis
 */
class TestAsteriskBeforeCopyDoesntBreakAnalysis {

  private static final String TEXT =
          "        IDENTIFICATION DIVISION.\r\n"
                  + "        PROGRAM-ID. test1.\r\n"
                  + "        DATA DIVISION.\r\n"
                  + "        WORKING-STORAGE SECTION.\r\n"
                  + "        {*|1} COPY {~CPY}.\n\n"
                  + "      * COPY CPY.\n\n"
                  + "        PROCEDURE DIVISION.\n\n";

  private static final String CPY = "        01 ABC PIC 9.";
  private static final String CPY_NAME = "CPY";

  @Test
  void test() {

    UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(new CobolText(CPY_NAME, CPY)),
            ImmutableMap.of(
                    "1",
                    new Diagnostic(
                            new Range(),
                            ParserUtils.isHwParserEnabled()
                                    ? "Extraneous input '*'"
                                    :
                                    "Syntax error on '*'",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
