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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the copybook not processed if this document is an extended document. Here:
 * check the copybook not recognized and its content not resolved.
 */
class TestCopybookNotProcessedInExtendedSource {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. TEST1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        01 {$*PARENT} PIC 9.\r\n"
          + "        COPY CPB.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "        {#*PROCB}.\r\n"
          + "            DISPLAY {$PARENT}.\r\n"
          + "        END PROGRAM TEST1.";

  @Test
  void assertCopybookProcessingModeNotChangesLogic() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        AnalysisConfig.defaultConfig(CopybookProcessingMode.DISABLED));
  }
}
