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
 * href="https://techdocs.broadcom.com/us/en/ca-mainframe-software/database-management/ca-idms-reference/19-0/dml-reference-for-cobol/cobol-data-manipulation-language-dml-statements/obtain-lrf-cobol.html">Obtain
 * LR</a> statement
 */
public class TestObtainLRStatement {
  public static final String TEXT_OBTAIN_LR_STMT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  TESTLR.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "        PROTOCOL. MODE ABC.\n"
          + "        IDMS-RECORDS MANUAL\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*TEMP_VAR} PIC X.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           OBTAIN FIRST EMPLOYEE-TABLE                          \n"
          + "                   WHERE EMP-LAST-NAME-0415  EQ 'X'              \n"
          + "                   ON ALL NEXT SENTENCE.  \n"
          + "\n"
          + "           OBTAIN NEXT EMP-JOB-LR\n"
          + "           WHERE OFFICE-CODE-0450 EQ OFFICE-CODE-IN\n"
          + "           ON LR-NOT-FOUND \n"
          + "           GO TO {#END-OF-LR}. \n"
          + "           \n"
          + "           OBTAIN NEXT EMP-JOB-LR\n"
          + "           WHERE DEPT-ID-410 EQ DEPT-ID-0410 OF LR.\n"
          + "            \n"
          + "           OBTAIN NEXT TASK-ID WHERE DEPT-ID-410\n"
          + "            EQ DEPT-ID-0410 OF LR               \n"
          + "              ON DB-REC-NOT-FOUND               \n"
          + "              MOVE 'Y' TO {$TEMP_VAR}          \n"
          + "           END-IF.\n"
          + "\n"
          + "       {#*END-OF-LR}.\n"
          + "           DISPLAY \"END-OF-LR\". ";

  @Test
  void testLRStatementWithImperativeStatement() {
    UseCaseEngine.runTest(
        TEXT_OBTAIN_LR_STMT,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
