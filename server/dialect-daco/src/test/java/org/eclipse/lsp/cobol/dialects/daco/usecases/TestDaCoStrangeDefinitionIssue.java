/*
 * Copyright (c) 2021 DAF Trucks NV.
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

/** Strange issue with navigation */
public class TestDaCoStrangeDefinitionIssue {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. NAVISSUE.\n"
          + "       ENVIRONMENT  DIVISION.\n"
          + "       IDMS-CONTROL SECTION.\n"
          + "       PROTOCOL.    MODE IS BATCH           DEBUG\n"
          + "                    IDMS-RECORDS            MANUAL.\n"
          + "       CONFIGURATION    SECTION.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT-XW3}.\n"
          + "           03 COPY MAID {~LDDPSA1M!DaCo} WRK.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  COPY MAID {~LDBCOM1M!DaCo}.\n";

  private static final String CB = "       01  {$*CBROOT-X`CBROOT-XW3}.\n"
          + "           03 {$*F01-X`F01-XW3}.\n"
          + "    \n"
          + "    \n\n\n\n\n\n\n\n\n\n"
          + "                 09 {$*A-X`A-XW3}        PIC X.\n";

    @Test
    void test() {
      UseCaseEngine.runTest(
              TEXT,
              ImmutableList.of(new CobolText("LDDPSA1M", DaCoDialect.NAME, CB),
                      new CobolText("LDBCOM1M", DaCoDialect.NAME, "")),
              ImmutableMap.of(),
              ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
    }
}
