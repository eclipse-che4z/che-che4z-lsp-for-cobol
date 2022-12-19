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
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Ignore predefine variables in case we have them explicitly defined. */
public class TestDaCoCopyFromDuplicateVariablesIssue {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. CPFROM.\n"
          + "       ENVIRONMENT  DIVISION.\n"
          + "       IDMS-CONTROL SECTION.\n"
          + "       PROTOCOL. MODE IS BATCH DEBUG\n"
          + "                    IDMS-RECORDS MANUAL.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT}.\n"
          + "           03 {$*TBLCRI-XW5} COPY-FROM W4.\n"
          + "           03 {$*TBLCRI-XW4}.\n"
          + "              04 {$*RUSCRI-BW4`&RUSCRI-BW5} PIC S9(2) VALUE ZERO COMP.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE ZERO TO {$RUSCRI-BW5}.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
