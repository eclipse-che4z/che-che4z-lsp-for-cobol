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

package org.eclipse.lsp.cobol.usecases.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.model.ErrorCode;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the missing copybook name error in COPY MAID is shown in the correct
 * position
 */
class TestCopyMaidWithQualifierMissingCopybook {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SETINDEX.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*MRB|1}.\n"
          + "           03 COPY MAID {~ABCDEFG123!DaCo|2} ABC.\n"
          + "       01  {$*QWE} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {VAR1|3}.\n"
          + "           DISPLAY {$QWE}.\n"
          + "           DISPLAY {$MRB}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "A \"PICTURE\" or \"USAGE INDEX\" clause was not found for elementary item MRB",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "ABCDEFG123: Copybook not found",
                DiagnosticSeverity.Error,
                ErrorSource.DIALECT.getText(),
                ErrorCode.MISSING_COPYBOOK.getLabel()),
            "3",
            new Diagnostic(
                new Range(),
                "Variable VAR1 is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
