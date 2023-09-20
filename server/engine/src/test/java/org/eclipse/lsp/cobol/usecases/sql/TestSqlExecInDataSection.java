/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.sql;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test EXEC SQL in data definition section
 */
class TestSqlExecInDataSection {
  private static final String TEXT_WHENEVER = "       IDENTIFICATION DIVISION.\n"
          +          "       PROGRAM-ID. WE.\n"
          +          "       ENVIRONMENT DIVISION.\n"
          +          "       DATA DIVISION.\n"
          +          "       WORKING-STORAGE SECTION.\n"
          +          "           EXEC SQL \n"
          +          "               WHENEVER SQLERROR GO TO 1000-ABEND-RTN \n" // FIXME 1000-ABEND-RTN should cause an error
          +          "           END-EXEC.";
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SQLISSUE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       LOCAL-STORAGE SECTION.\n"
          + "           EXEC SQL\n"
          + "               BEGIN DECLARE SECTION\n"
          + "           END-EXEC.\n"
          + "       01  {$*ROOT}.\n"
          + "           03  {$*A} PIC X(8).\n"
          + "           EXEC SQL\n"
          + "               END DECLARE SECTION\n"
          + "           END-EXEC.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
  @Test
  void testWhenever() {
    UseCaseEngine.runTest(TEXT_WHENEVER, ImmutableList.of(), ImmutableMap.of());
  }
}
