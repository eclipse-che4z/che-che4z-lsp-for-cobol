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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/**
 * If a variable name in COPY MAID ends with pattern "-XXX", its last two characters should be
 * replaced, or else the suffix should append to the end.
 */
class TestCopyMaidWithWrkAppendsSuffixToVariablesWithoutDash {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "        01 {$*ABC}.\n"
          + "            05 COPY MAID {~BHTRGL-XBG`BHTRGL-XBG_WRK} WRK.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$BHTRGL-XBC}.\n"
          + "           DISPLAY {$CHILDBC}.\n"
          + "           DISPLAY {$BHT-XBC}.\n"
          + "           DISPLAY {$BHT-3BC}.\n"
          + "           DISPLAY {$BBC}.\n"
          + "           DISPLAY {$BHTRGL-XABC}.\n";

  private static final String COPYBOOK_CONTENT =
      "1           05 {$*BHTRGL-X^BHTRGL-XBC} PIC X.\n"
          + "2           05 {$*CHILD^CHILDBC} PIC X.\n"
          + "3           05 {$*BHT-XAB^BHT-XBC} PIC X.\n"
          + "3           05 {$*BHT-3iz^BHT-3BC} PIC X.\n"
          + "4           05 FILLER PIC x(10).\n"
          + "5           05 PIC 9.\n"
          + "6           05 {$*B^BBC} PIC 9.\n"
          + "7           05 {$*BHTRGL-XA^BHTRGL-XABC} PIC X.\n";

  @Test
  @Disabled("This test seems to be wrong")
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("BHTRGL-XBG", DaCoDialect.NAME, COPYBOOK_CONTENT, "WRK", false)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
