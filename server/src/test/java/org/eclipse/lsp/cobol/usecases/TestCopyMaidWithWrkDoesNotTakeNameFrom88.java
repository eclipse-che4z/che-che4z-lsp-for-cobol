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
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** WRK qualifier does not retrieve the name of the previous 88 variable. */
class TestCopyMaidWithWrkDoesNotTakeNameFrom88 {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*PARENT}.\n"
          + "            05 {$*CHILD-XLD} PIC X(2).\n"
          + "               88 {$*AB} VALUE \"AB\".\n"
          + "            05 COPY MAID {~BHTRGL-XBG`BHTRGL-XBG_WRK} WRK.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$BHTRGL-XLD}.";

  private static final String COPYBOOK_CONTENT = "1           09 {$*BHTRGL-X^BHTRGL-XLD} PIC X.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("BHTRGL-XBG", DaCoDialect.NAME, "WRK", COPYBOOK_CONTENT)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
