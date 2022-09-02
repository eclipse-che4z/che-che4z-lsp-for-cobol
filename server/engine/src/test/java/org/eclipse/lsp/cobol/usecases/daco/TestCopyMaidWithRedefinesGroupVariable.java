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
package org.eclipse.lsp.cobol.usecases.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * COPY MAID statement with the WRK qualifier should concatenate each variable name in the copybook
 * with the last two chars of the previous variable name even with redefines
 */
class TestCopyMaidWithRedefinesGroupVariable {
  private static final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT-SSS}.\n"
          + "       02  COPY MAID {~CB!DaCo`CB_WRK} WRK.\n"
          + "           04 {$*D} REDEFINES {$B-SSS}.\n";

  private static final String COPYBOOK_CONTENT =
                "       01  {$*A-S`A-SSS}.\n"
              + "           03 {$*B-S`B-SSS}.\n"
              + "             05 {$*C-S`C-SSS} PIC X.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("CB_WRK", DaCoDialect.NAME, COPYBOOK_CONTENT)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
