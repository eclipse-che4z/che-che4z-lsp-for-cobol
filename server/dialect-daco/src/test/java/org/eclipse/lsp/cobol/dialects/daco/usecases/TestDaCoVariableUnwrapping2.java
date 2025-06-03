/*
 * Copyright (c) 2025 Broadcom.
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
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Test for DaCo variable unwrapping */
class TestDaCoVariableUnwrapping2 {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    BMUSRA1M.\n"
          + "       ENVIRONMENT  DIVISION.\n"
          + "       IDMS-CONTROL SECTION.\n"
          + "       PROTOCOL. IDMS-RECORDS MANUAL.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  COPY MAID {~CPBM!DaCo}.\n"
          + "       01  COPY IDMS {~CPBI!IDMS}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$SNAME} IN {$IN-ROOT}.\n"
          + "           DISPLAY {$MNAME} IN {$IN-ROOT}.\n";
  private static final String COPYBOOK1 = "       01  {$*MAIN2} PIC X(27) VALUE SPACE.\n";
  private static final String COPYBOOK2 =
      "       01 {$*IN-ROOT}.\n"
          + "           03 {$*MNAME} PIC X(8) VALUE 'UNKNOWN'.\n"
          + "           03 {$*SNAME} PIC X(8) VALUE SPACE.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("CPBM", DaCoDialect.NAME, COPYBOOK1),
            new CobolText("CPBI", IdmsDialect.NAME, COPYBOOK2)),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
