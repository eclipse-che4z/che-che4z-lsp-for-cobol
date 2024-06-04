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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Check that the copybook name in COPY MAID is concatenated with the qualifier before requesting
 * the copybook file, and is shown as is in the AST
 */
class TestCopyMaidWithKmkRequestsCorrectFile {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST1.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "        01 {$*PARENT}."
          + "           03 {$*AREA-XW7}.\n"
          + "             05 FILLER PIC X(8) VALUE 'AREA-XW8'.\n"
          + "             05 {$*TABMAX-PW7} PIC S9(4) VALUE ZERO COMP-3.\n"
          + "             05 {$*BHTTAB-XW7}.\n"
          + "               07 {$*BHTREG-XW8} OCCURS 50.\n"
          + "                 09 COPY MAID {~BHTRGL-XBG!DaCo} KMK.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$BHTRGL-XW8} OF {$BHTTAB-XW7}.";

  private static final String COPYBOOK_CONTENT =
            "1           09 {$*BHTRGL-XB4`BHTRGL-XW8}.\n"
          + "2             11 {$*BHTRGLVLG-XB4`BHTRGLVLG-XW8}.\n"
          + "3               13 {$*FABLYN-XB4`FABLYN-XW8}.\n"
          + "4                 15 {$*FABLYNPOSEEN-XB4`FABLYNPOSEEN-XW8} PIC X.\n"
          + "5                 15 {$*LYNKOD-XB4`LYNKOD-XW8} PIC X(2).\n"
          + "6               13 {$*BHTORSKOD-XB4`BHTORSKOD-XW8} PIC X(2).";
  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("BHTRGL-XBG", DaCoDialect.NAME, COPYBOOK_CONTENT)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
