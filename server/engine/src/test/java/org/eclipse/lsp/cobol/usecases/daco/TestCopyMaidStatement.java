/*
 * Copyright (c) 2021 Broadcom.
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

/** This test checks that COPY MAID statement is parsed correctly */
class TestCopyMaidStatement {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. PARTEST.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          01 COPY MAID {~NAME!DaCo}.\n"
          + "          PROCEDURE DIVISION.\n"
          + "              DISPLAY {$ABC}.";

  private static final String COPYBOOK = "         01 {$*ABC} PIC 9.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("NAME", DaCoDialect.NAME, COPYBOOK)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
