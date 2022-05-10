/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.DialectType;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/** WRK qualifier should show an error if the previous variable has the level 77. */
class TestCopyMaidWithWrkShowsErrorAfter77 {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       LINKAGE SECTION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*F00-XWD} PIC X.\n"
          + "       77 {$*NOT-A-PARENT} PIC X.\n"
          + "            {_05 COPY MAID {~BHTRGL-XBG`BHTRGL-XBG_WRK} WRK.|2_}\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$BHTRGL-XWD}.";

  private static final String COPYBOOK_CONTENT = "1           09 {$*BHTRGL-X^BHTRGL-XWD|2} PIC X.\n";

  @Test
  @Disabled("An error is produced, but is shown in copybook file. Not sure if it's wrong.")
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("BHTRGL-XBG", DaCoDialect.NAME, "WRK", COPYBOOK_CONTENT)),
        ImmutableMap.of(
            "2",
            new Diagnostic(
                null,
                "BHTRGL-XWD: Only 01, 66 and 77 level numbers are allowed at the highest level",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
