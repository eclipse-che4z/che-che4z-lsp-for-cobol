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

/** Test that special words are not treated as a variable **/
class TestSqlSpecialNames {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    VVB002.\n"
      + "       DATA DIVISION.\n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01  {$*WS-F900-JOUR-TRAIT} PIC X(9).\n"
      + "       PROCEDURE DIVISION.\n"
      + "           EXEC SQL DECLARE CUR-550 CURSOR FOR\n"
      + "               SELECT C_ISIN\n"
      + "               FROM   VVA550\n"
      + "               WHERE  D_EFF_DEB >= :{$WS-F900-JOUR-TRAIT}\n"
      + "               UNION\n"
      + "               SELECT C_ISIN\n"
      + "               FROM   VVA550\n"
      + "               WHERE  D_EFF_FIN >= :{$WS-F900-JOUR-TRAIT}\n"
      + "               FOR FETCH ONLY\n"
      + "           END-EXEC.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

}
