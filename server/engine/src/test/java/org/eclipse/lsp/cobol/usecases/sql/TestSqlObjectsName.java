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

/** Test SQL objects names with unicode char not in [A-z0-9] doesn't break parsing */
public class TestSqlObjectsName {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. test232.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*ARB-HELLO} pic x.\n"
          + "        01 {$*ARB-MD} pic x.\n"
          + "        LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "003428     EXEC SQL\n"
          + "003429         SELECT FÖ1R\n"
          + "003430         INTO :{$ARB-HELLO}\n"
          + "003431         FROM 你好\n"
          + "003432         WHERE AD.FÖLR = :{$ARB-HELLO}\n"
          + "                  and AD.XYZ = 'hello'\n"
          + "                  and AD.OIY =  :{$ARB-MD}\n"
          + "                  and привет = hello_halo \n"
          + "                  and сайнуу = 'asa' \n"
          + "                  and नमस = 'नमस्ते'\n"
          + "003434         WITH UR\n"
          + "003435     END-EXEC. ";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
