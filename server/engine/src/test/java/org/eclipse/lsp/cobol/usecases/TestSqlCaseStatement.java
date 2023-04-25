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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Tests the DB2 SQL CASE statement.
 * Ref - https://www.ibm.com/docs/en/db2/11.5?topic=expressions-case-expression#sdx-synid_search-condition
 */
public class TestSqlCaseStatement {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARS}.\n"
          + "           05 {$*WS-VAR1} PIC X(9).\n"
          + "           05 {$*WS-VAR2} PIC X(9).\n"
          + "           05 {$*WS-VAR3} PIC X(9).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n"
          + "           SELECT\n"
          + "                    A.COL4\n"
          + "                   ,CASE (A.COL5)\n"
          + "                    WHEN '00' THEN 'OK        '\n"
          + "                    WHEN '01' THEN 'OK        '\n"
          + "                    WHEN '02' THEN 'KO        '\n"
          + "                    WHEN '03' THEN 'KO        '\n"
          + "      *             WHEN '04' THEN '=BLAH'\n"
          + "                    ELSE      'KO        '\n"
          + "                    END AS CASETEST\n"
          + "           INTO    :{$WS-VAR1}\n"
          + "                  ,:{$WS-VAR2}\n"
          + "           FROM  TABLEA A,\n"
          + "                 TABLEB B\n"
          + "           WHERE   A.COL1   = B.COL9\n"
          + "             AND   B.COL2  = :{$WS-VAR3}\n"
          + "             AND   A.COL6     <> 'C';\n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
