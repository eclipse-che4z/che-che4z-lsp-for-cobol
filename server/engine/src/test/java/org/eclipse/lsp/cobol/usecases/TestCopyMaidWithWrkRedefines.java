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
 * with the last two chars of the previous variable name even with redefines
 */
class TestCopyMaidWithWrkRedefines {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "        01 {$*PARENT-XLO}.\n"
          + "           05 COPY MAID {~BHTRGL-XBG!DaCo`BHTRGL-XBG_WRK} WRK.\n";

  private static final String COPYBOOK_CONTENT =
      "       01  {$*MAIN-X`MAIN-XLO}.\n"
          + "           03 {$*F90-X`F90-XLO}.\n"
          + "             05 {$*SOME-X`SOME-XLO}            PIC X(4)    VALUE SPACE.\n"
          + "           03 {$*F91-X`F91-XLO} REDEFINES {$F90-X`F90-XLO}.\n"
          + "             05 FILLER                 PIC X(37).";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("BHTRGL-XBG_WRK", DaCoDialect.NAME, COPYBOOK_CONTENT)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
