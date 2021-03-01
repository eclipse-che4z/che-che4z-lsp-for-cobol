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

/** This test checks if sql DROP statement works correctly. */
class TestSqlDropStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL\n";

  private static final String DROP1 = TEXT + "        DROP TABLE DSN8C10.DEPT END-EXEC.\n";

  private static final String DROP2 =
      TEXT + "        DROP TABLESPACE DSN8D12A.DSN8S12D END-EXEC.\n";

  private static final String DROP3 = TEXT + "        DROP VIEW DSN8C10.VPROJRE1 END-EXEC.\n";

  private static final String DROP4 =
      TEXT + "        DROP PACKAGE DSN8CC61.DSN8CC0 VERSION VERSZZZZ END-EXEC.\n";

  private static final String DROP5 =
      TEXT + "        DROP PACKAGE DSN8.CC0 VERSION '1994sw3' END-EXEC.\n";

  private static final String DROP6 = TEXT + "        DROP TYPE DOCUMENT END-EXEC.\n";

  private static final String DROP7 = TEXT + "        DROP FUNCTION CHEM.ATOMIC_WEIGHT END-EXEC.\n";

  private static final String DROP8 =
      TEXT + "        DROP FUNCTION CENTER(INTEGER, FLOAT) END-EXEC.\n";

  private static final String DROP9 =
      TEXT + "        DROP SPECIFIC FUNCTION JOHNSON.FOCUS97 END-EXEC.\n";

  private static final String DROP10 = TEXT + "        DROP PROCEDURE BIOLOGY.OSMOSIS END-EXEC.\n";

  private static final String DROP11 = TEXT + "        DROP TRIGGER BONUS END-EXEC.\n";

  private static final String DROP12 = TEXT + "        DROP ROLE CTXROLE END-EXEC.\n";

  private static final String DROP13 = TEXT + "        DROP TRUSTED CONTEXT CTX1 END-EXEC.\n";

  private static final String DROP14 =
      TEXT + "        DROP PUBLIC ALIAS PUBALIAS1 FOR SEQUENCE END-EXEC.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        DROP1, DROP2, DROP3, DROP4, DROP5, DROP6, DROP7, DROP8, DROP9, DROP10, DROP11, DROP12,
        DROP13, DROP14);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql drop statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
