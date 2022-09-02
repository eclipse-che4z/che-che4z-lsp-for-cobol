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
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Tests DaCo RCU cases */
class TestDaCoRcu {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT} PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           INQUIRE MAP {$ROOT}\n"
          + "           IF CURSOR AT DFLD {$ROOT} ON RCU THEN\n"
          + "              CONTINUE\n"
          + "           END-IF";

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
