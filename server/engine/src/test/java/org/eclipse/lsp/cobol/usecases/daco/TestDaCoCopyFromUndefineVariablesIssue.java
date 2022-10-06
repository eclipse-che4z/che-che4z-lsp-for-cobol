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
package org.eclipse.lsp.cobol.usecases.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Some variables are undefined defined. */
public class TestDaCoCopyFromUndefineVariablesIssue {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  UNDEFVARS.\n"
          + "       ENVIRONMENT  DIVISION.\n"
          + "       IDMS-CONTROL SECTION.\n"
          + "       PROTOCOL.    MODE IS BATCH           DEBUG\n"
          + "                    IDMS-RECORDS            MANUAL.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT}.\n"
          + "           02 {$*TBLCRI-XW4}.\n"
          + "            11 {$*RUSCRI-BW4`&RUSCRI-BW5} PIC S9(2) VALUE ZERO COMP.\n"
          + "            11 {$*ROWCRI-XW4`&ROWCRI-XW5} OCCURS 2.\n"
          + "              13 COPY MAID {~POLCRI!DACO} WRK.\n"
          + "           02 {$*TBLCRI-XW5}  COPY-FROM W4.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$POLCRI-XW5}.\n";

  private static final String CB =
      "       01  {$*POLCRI-XW4`&POLCRI-XW5}.\n"
          + "           03 {$*VLGNUM-XW4`&VLGNUM-XW5} PIC S9(4) VALUE ZERO COMP.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("POLCRI", DaCoDialect.NAME, CB)),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
