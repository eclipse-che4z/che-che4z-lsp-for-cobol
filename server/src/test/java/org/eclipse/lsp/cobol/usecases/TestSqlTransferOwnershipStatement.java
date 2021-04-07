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
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** This test checks if sql TRANSFER OWNERSHIP statement works correctly. */
class TestSqlTransferOwnershipStatement {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n";

  private static final String TRANSFER_OWNERSHIP1 =
      TEXT
          + "           EXEC SQL\n"
          + "            TRANSFER OWNERSHIP OF DATABASE DBCC001 TO USER USRT001  \n"
          + "            REVOKE PRIVILEGES  \n"
          + "           END-EXEC.\n";

  private static final String TRANSFER_OWNERSHIP2 =
      TEXT
          + "           EXEC SQL\n"
          + "            TRANSFER OWNERSHIP OF DATABASE DBCC002 TO ROLE OWNRROLE  \n"
          + "            REVOKE PRIVILEGES  \n"
          + "           END-EXEC.\n";

  private static final String TRANSFER_OWNERSHIP3 =
      TEXT
          + "           EXEC SQL\n"
          + "            TRANSFER OWNERSHIP OF DATABASE DBCC003 TO SESSION_USER  \n"
          + "            REVOKE PRIVILEGES  \n"
          + "           END-EXEC.\n";

  private static final String TRANSFER_OWNERSHIP4 =
      TEXT
          + "           EXEC SQL\n"
          + "            TRANSFER OWNERSHIP OF TABLE EMPLOYEE.DEPT TO ROLE TBOWNR_ROLE  \n"
          + "            REVOKE PRIVILEGES  \n"
          + "           END-EXEC.\n";

  private static final String TRANSFER_OWNERSHIP5 =
      TEXT
          + "           EXEC SQL\n"
          + "            TRANSFER OWNERSHIP OF INDEX EMPLOYEE.SALARYIX TO USER IXOWNER  \n"
          + "            REVOKE PRIVILEGES  \n"
          + "           END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        TRANSFER_OWNERSHIP1,
        TRANSFER_OWNERSHIP2,
        TRANSFER_OWNERSHIP3,
        TRANSFER_OWNERSHIP4,
        TRANSFER_OWNERSHIP5);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql transfer ownership statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
