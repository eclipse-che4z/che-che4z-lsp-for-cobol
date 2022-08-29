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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * COPY MAID statement with the WRK qualifier should concatenate each variable name in the copybook
 * with the last two chars of the previous variable name
 */
class TestCopyMaidWithWRK {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "        01 {$*PARENT}.\n"
          + "           03 {$*AREA-XW7}.\n"
          + "             05 FILLER PIC X(8) VALUE 'AREA-XW8'.\n"
          + "             05 {$*TABMAX-PW7} PIC S9(4) VALUE ZERO COMP-3.\n"
          + "             05 {$*BHTTAB-XW7}.\n"
          + "               07 {$*BHTREG-XW8} OCCURS 50.\n"
          + "                 09 COPY MAID {~BHTRGL-XBG!DaCo`BHTRGL-XBG} WRK.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$BHTRGL-XW8} OF {$BHTTAB-XW7}.";

  private static final String COPYBOOK_CONTENT =
      "1           09 {$*BHTRGL-X`BHTRGL-XW8}.\n"
          + "2             11 {$*BHTRGLVLG-X`BHTRGLVLG-XW8}.\n"
          + "3               13 {$*FABLYN-X`FABLYN-XW8}.\n"
          + "4                 15 {$*FABLYNPOSEEN-X`FABLYNPOSEEN-XW8} PIC X.\n"
          + "5                 15 {$*LYNKOD-X`LYNKOD-XW8} PIC X(2).\n"
          + "6               13 {$*BHTORSKOD-X`BHTORSKOD-XW8} PIC X(2).";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("BHTRGL-XBG", DaCoDialect.NAME, COPYBOOK_CONTENT)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
