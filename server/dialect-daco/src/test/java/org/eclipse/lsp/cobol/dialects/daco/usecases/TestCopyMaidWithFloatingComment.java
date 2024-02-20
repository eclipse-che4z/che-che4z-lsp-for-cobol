/*
 * Copyright (c) 2024 DAF Trucks NV.
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

import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;

/** This test checks that COPY MAID statement is parsed correctly with a floating comment */
public class TestCopyMaidWithFloatingComment {
    private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. PARTEST.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          01 COPY MAID {~NAME!DaCo}. *>@@Hello, World!!@#$\n"
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
