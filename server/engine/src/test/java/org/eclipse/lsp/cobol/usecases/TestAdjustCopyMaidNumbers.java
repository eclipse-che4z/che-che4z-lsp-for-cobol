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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test COPY MAID statement with level number specified adjusts the numbers of the underlying
 * copybook.
 */
class TestAdjustCopyMaidNumbers {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "023000 01 {$*AREA-XW7}.\n"
          + "023100       05 FILLER                 PIC X(8)    VALUE 'AREA-XW8'.\n"
          + "023200       05 {$*TABMAX-PW7}             PIC S9(4)   VALUE ZERO  COMP-3.\n"
          + "023300       05 {$*BHTTAB-XW7}.\n"
          + "023400         07 {$*BHTREG-XW8}                       OCCURS 50.\n"
          + "023500           09 COPY MAID {~BHTRGL-XBG!DaCo}.\n"
          + "             05 {$*NOT-ADJUSTED} PIC X.\n"
          + "        Procedure Division.\n"
          + "           display {$FABLYNPOSEEN-X} OF {$FABLYN-X}.\n"
          + "           display {$BHTRGL-X} OF {$BHTTAB-XW7}.\n"
          + "           display {$NOT-ADJUSTED} OF {$AREA-XW7}.\n"
          + "           display {_NOT-ADJUSTED OF TABMAX-PW7|invalid_}.\n";

  private static final String COPYBOOK_CONTENT =
      "     1           {03^09} {$*BHTRGL-X}.  \n"
          + "     2             {05^11} {$*BHTRGLVLG-X}.\n"
          + "     3               {07^13} {$*FABLYN-X}.\n"
          + "     4                 {09^15} {$*FABLYNPOSEEN-X}\n"
          + "     4                                 PIC X.\n"
          + "     5                 {09^15} {$*LYNKOD-X}     PIC X(2).\n"
          + "     6               {07^13} {$*BHTORSKOD-X}    PIC X(2).\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("BHTRGL-XBG", DaCoDialect.NAME, COPYBOOK_CONTENT)),
        ImmutableMap.of(
            "invalid",
            new Diagnostic(
                new Range(),
                "Variable NOT-ADJUSTED is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
