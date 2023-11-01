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
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Typing EXEC SQL should not throw {@link StringIndexOutOfBoundsException} */
class TestNoStringIndexOutOfBoundsOnExecSql {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        PROCEDURE DIVISION.\n"
          + "            {EXEC|2} SQL\n"
          + "       {|1}\n";

  @Test
  void test() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Unexpected end of line",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Missing token END-EXEC for the EXEC block",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
  }
}
