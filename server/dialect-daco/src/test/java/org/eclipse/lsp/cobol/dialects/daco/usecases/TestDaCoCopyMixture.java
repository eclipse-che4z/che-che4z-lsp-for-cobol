/*
 * Copyright (c) 2025 Broadcom.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 */
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** A test case for COPY FROM statement */
public class TestDaCoCopyMixture {
  private static final String TEXT =
      "       ID DIVISION. PROGRAM-ID. A.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       IDMS-CONTROL SECTION.\n"
          + "       PROTOCOL. MODE ABC.\n"
          + "       IDMS-RECORDS MANUAL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT}.\n"
          + "           03 COPY MAID {~DC1!DaCo}.\n"
          + "           03 COPY IDMS {~IC1!IDMS}.\n"
          + "       COPY {~CC}.\n"
          + "           03 COPY IDMS {~IC1!IDMS}.\n"
          + "           03 COPY MAID {~DC1!DaCo}.\n"
          + "       02 COPY IDMS {~ISC!IDMS}.\n"
          + "           03 COPY MAID {~DC1!DaCo}.\n"
          + "           03 {$*SUB}.\n"
          + "               04 {$*A} PIC X.\n"
          + "           03 COPY IDMS {~IC1!IDMS}.\n"
          + "       02 COPY MAID {~DSC!DaCo}.\n"
          + "           03 COPY MAID {~DC1!DaCo}.\n"
          + "           03 COPY IDMS {~IC1!IDMS}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$DACO-NODE} OF {$ROOT}.\n"
          + "           DISPLAY {$IDMS-NODE} OF {$ROOT}.\n"
          + "           DISPLAY {$DACO-NODE} OF {$SUBNODE} OF {$ROOT}.\n"
          + "           DISPLAY {$IDMS-NODE} OF {$SUBNODE} OF {$ROOT}.\n"
          + "           DISPLAY {$DACO-NODE} OF {$ISUBNODE} OF {$ROOT}.\n"
          + "           DISPLAY {$IDMS-NODE} OF {$ISUBNODE} OF {$ROOT}.\n"
          + "           DISPLAY {$DACO-NODE} OF {$DSUBNODE} OF {$ROOT}.\n"
          + "           DISPLAY {$A} OF {$SUB} OF {$ISUBNODE} OF {$ROOT}.\n"
          + "           DISPLAY {$IDMS-NODE} OF {$DSUBNODE} OF {$ROOT}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("DC1", DaCoDialect.NAME, "       01  {$*DACO-NODE} PIC X.\n"),
            new CobolText("IC1", IdmsDialect.NAME, "       01  {$*IDMS-NODE} PIC X.\n"),
            new CobolText("ISC", IdmsDialect.NAME, "       02  {$*ISUBNODE}."),
            new CobolText("DSC", DaCoDialect.NAME, "       02  {$*DSUBNODE}.\n"),
            new CobolText("CC", "       02  {$*SUBNODE}.\n")),
        ImmutableMap.of(),
        ImmutableList.of(),
        new AnalysisConfig(
            CopybookProcessingMode.ENABLED,
            ImmutableList.of(DaCoDialect.NAME, IdmsDialect.NAME),
            true,
            false,
            ImmutableList.of(),
            ImmutableMap.of()));
  }
}
