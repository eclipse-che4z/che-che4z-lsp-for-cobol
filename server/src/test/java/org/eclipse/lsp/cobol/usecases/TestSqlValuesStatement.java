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

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/** This test checks if sql VALUES statement works correctly. */
class TestSqlValuesStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL\n"
          + "        CREATE TRIGGER EMPISRT1\n"
          + "        AFTER INSERT ON EMP\n"
          + "        REFERENCING NEW AS N\n"
          + "        FOR EACH ROW\n"
          + "        MODE DB2SQL\n"
          + "        BEGIN ATOMIC\n"
          + "         VALUES(NEWEMP(N.EMPNO, N.LASTNAME,N.FIRSTNAME));\n"
          + "        END\n"
          + "       END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
