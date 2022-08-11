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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that the COPY MAID with qualifier works correctly */
class TestCopyMaidWithQualifier {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SETINDEX.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*MRB}.\n"
          + "           03 COPY MAID {~ABCDEFG123!DaCo} ABC.\n"
          + "       01  {$*QWE} PIC 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$QWE}.\n"
          + "           DISPLAY {$MRB}.\n"
          + "           DISPLAY {$VAR1}.\n";

  private static final String COPYBOOK = "            03 {$*VAR1} PIC X(3) VALUE \"ABC\".";
  private static final String COPYBOOK_NAME = "ABCDEFG123";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText(COPYBOOK_NAME, DaCoDialect.NAME, COPYBOOK)),
        ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
