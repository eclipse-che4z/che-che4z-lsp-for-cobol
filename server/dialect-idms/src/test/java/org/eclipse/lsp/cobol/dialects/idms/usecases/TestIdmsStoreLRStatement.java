/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.idms.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test <a
 * href="https://techdocs.broadcom.com/us/en/ca-mainframe-software/database-management/ca-idms-reference/19-0/dml-reference-for-cobol/cobol-data-manipulation-language-dml-statements/store-lrf-cobol.html">Store
 * LR</a> statement
 */
public class TestIdmsStoreLRStatement {
  public static final String STORELR_STATEMENT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TESTLR.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "        PROTOCOL. MODE ABC.\n"
          + "        IDMS-RECORDS MANUAL\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VAR} PIC X.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           STORE SOME-DATA-LR\n"
          + "           WHERE DATA = ANOTHER-DATA\n"
          + "           ON LR-NOT-FOUND\n"
          + "           STORE SOME-LR\n"
          + "           WHERE DATA > '1'\n"
          + "           AND SOME-DATA EQ 'SOME-DATA'\n"
          + "           ON INVALID-DATA\n"
          + "           MOVE 'X' TO {$VAR}\n"
          + "           END-IF.\n"
          + "           EXIT.";

  @Test
  void testStoreLRStatement() {
    UseCaseEngine.runTest(
        STORELR_STATEMENT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
