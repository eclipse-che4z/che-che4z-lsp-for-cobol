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
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.Collections;

/** This test checks if sql UPDATE statement works correctly when SQL id enabled and do not work if disabled. */
class TestSqlAnalysisDisabled {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*HV_RESUME}  PIC A  VALUE 'ONAT'.\n"
          + "       01 {$*HV_EMP_ROWID}  PIC 9  VALUE '44'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n";

  private static final String UPDATE_SQL_ENABLED =
      TEXT
          + "            UPDATE EMP1\n"
          + "             SET SALARY = SALARY + 1000,\n"
          + "              RESUME = UPDATE_RESUME(:{$HV_RESUME})\n"
          + "              WHERE EMP_ROWID = :{$HV_EMP_ROWID}; \n"
          + "           END-EXEC.\n";

  private static final String UPDATE_SQL_DISABLED =
      TEXT
          + "            UPDATE EMP1\n"
          + "             SET SALARY = SALARY + 1000,\n"
          + "              RESUME = UPDATE_RESUME(:HV_RESUME)\n"
          + "              WHERE EMP_ROWID = :HV_EMP_ROWID; \n"
          + "           END-EXEC.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(UPDATE_SQL_ENABLED, ImmutableList.of(), ImmutableMap.of());
    UseCaseEngine.runTest(UPDATE_SQL_DISABLED, ImmutableList.of(), ImmutableMap.of(), Collections.emptyList(),
        new AnalysisConfig(Collections.emptySet(), new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER), ImmutableList.of()));
  }
}
