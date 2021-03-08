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

/** Test IDMS KEEP DML statements */
class TestIdmsKeepStatement {

  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String KEEP1 = DEFS + "           KEEP CURRENT EMPLOYEE.\n";

  private static final String KEEP2 = DEFS + "           KEEP EXCLUSIVE CURRENT WITHIN DEPT-EMP\n";

  private static final String KEEP3 = DEFS + "           KEEP CURRENT.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(KEEP1, KEEP2, KEEP3);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - idms keep tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
