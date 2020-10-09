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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.List;
import java.util.Map;

/** This use case checks that the program ID check works correctly even with quotes */
class TestProgramIdWithQuotes {

  private static final String TEXT_WITH_SINGLE_QUOTES =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'TEST1'.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       END PROGRAM 'TEST1'.";

  private static final String TEXT_WITH_DOUBLE_QUOTES =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. \"TEST1\".\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       END PROGRAM \"TEST1\".";

  private static final String TEXT_WITH_ID_QUOTED =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'TEST1'.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       END PROGRAM TEST1.";

  private static final String TEXT_WITH_END_QUOTED =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       END PROGRAM 'TEST1'.";

  @ParameterizedTest
  @ValueSource(
      strings = {
        TEXT_WITH_SINGLE_QUOTES,
        TEXT_WITH_DOUBLE_QUOTES,
        TEXT_WITH_ID_QUOTED,
        TEXT_WITH_END_QUOTED
      })
  void test(String text) {
    UseCaseEngine.runTest(text, List.of(), Map.of());
  }
}
