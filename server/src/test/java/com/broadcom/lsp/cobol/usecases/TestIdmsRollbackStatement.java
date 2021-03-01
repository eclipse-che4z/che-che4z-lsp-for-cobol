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
package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS Rollbacl DML statements */
class TestIdmsRollbackStatement {

  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String ROLL1 = DEFS + "           ROLLBACK.\n";

  private static final String ROLL2 = DEFS + "           ROLLBACK CONTINUE\n";

  private static final String ROLL3 = DEFS + "           ROLLBACK TASK.\n";

  private static final String ROLL4 = DEFS + "           ROLLBACK TASK CONTINUE\n";

  private static Stream<String> textsToTest() {
    return Stream.of(ROLL1, ROLL2, ROLL3, ROLL4);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - idms rollback tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
