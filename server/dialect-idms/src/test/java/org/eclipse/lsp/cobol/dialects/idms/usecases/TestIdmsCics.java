/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.dialects.idms.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/** Test CICS SEND statements with the IDMS dialect enabled. */
public class TestIdmsCics {
  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE IS IDMS-DC.\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_NAME} PIC X(8).\n"
          + "        01 {$*WK_MSG} PIC X(8).\n"
          + "        01 {$*WK_BYTE} PIC X(1).\n"
          + "        01 {$*WK_LENGTH} PIC S9(8).\n"
          + "        PROCEDURE DIVISION.\n";
  private static final String CICS_SEND_MAP =
      DEFS
          + "           EXEC CICS SEND MAP({$WK_LENGTH}) \r\n"
          + "           MAPSET({$WK_NAME}) FROM({$WK_NAME}) \r\n"
          + "           ERASE FREEKB RESP({$WK_LENGTH}) END-EXEC.";

  @Test
  @DisplayName("IDMS-CICS send test")
  void test() {
    UseCaseEngine.runTestForDiagnostics(
        CICS_SEND_MAP,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
