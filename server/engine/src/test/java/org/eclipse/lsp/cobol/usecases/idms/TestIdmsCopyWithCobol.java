/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.idms;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * These test for COPY IDMS statements in FILE SECTION, WS/LINKAGE SECTIONS AND PROCEDURE DIVISION
 */
class TestIdmsCopyWithCobol {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*EMPLOYEE} PIC X(10).\n"
          + "        PROCEDURE DIVISION.\n"
          + "        COPY IDMS {~CB!IDMS}.\n"
          + "        COPY IDMS {~CB!IDMS}.\n"
          + "        DISPLAY \"HELLO\".\n";

  private static final String TEXT_IDMS_COPYBOOK = "DISPLAY {$EMPLOYEE}.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("CB", IdmsDialect.NAME, TEXT_IDMS_COPYBOOK)),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
