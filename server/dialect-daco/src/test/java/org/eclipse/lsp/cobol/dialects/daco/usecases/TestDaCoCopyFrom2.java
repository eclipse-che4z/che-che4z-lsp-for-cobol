/*
 * Copyright (c) 2022 DAF Trucks NV.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * DAF Trucks NV – implementation of DaCo COBOL statements
 * and DAF development standards
 */
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** A test case for COPY FROM statement with group variables*/
public class TestDaCoCopyFrom2 {
  private static final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    CPYFROM.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT}.\n"
          + "           03 {$*AREA-XXX} COPY-FROM DY.\n"
          + "       01  COPY MAID {~PROTOCB!DACO}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$PR1-XXX}.\n";

  private static final String PROTOCB =
      "       01  {$*ROOT}.\n"
          + "           03 {$*AREA-XDY}.\n"
          + "             05 {$*PROTO-XDY`&PROTO-XXX}.\n"
          + "               07 {$*PR1-XDY`&PR1-XXX} PIC 9(9).\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("PROTOCB", DaCoDialect.NAME, PROTOCB)),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
