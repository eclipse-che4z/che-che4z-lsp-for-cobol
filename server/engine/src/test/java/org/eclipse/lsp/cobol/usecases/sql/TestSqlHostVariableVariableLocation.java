/*
 * Copyright (c) 2024 Broadcom.
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
 * Tests db2 sql host variables usage are properly referenced to the variable definition in the
 * cobol code
 */
public class TestSqlHostVariableVariableLocation {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. hostvariales.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*ASD}.\n"
          + "           05 {$*O-P-R} PIC X.\n"
          + "        01 {$*QWE}.\n"
          + "           05 {$*D-E-F} PIC X.\n"
          + "        LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "        {@*MAIN-PROCESSING} SECTION.\n"
          + "         {#*MAINLINE-PARAGRAPH}.\n"
          + "       EXEC SQL\n"
          + "        UPDATE QWE_STATUS\n"
          + "            SET A_B_C  = :{$QWE}.{$D-E-F}\n"
          + "            WHERE TKN_UNIQUE_REFERENCE = :{$ASD}.{$O-P-R}\n"
          + "       END-EXEC  \n"
          + "           STOP RUN.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
