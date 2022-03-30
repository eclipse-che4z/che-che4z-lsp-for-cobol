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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** These test for variations of valid CHANGE PRIORITY statements */
class TestChangePriority {

  private static final String MESSAGE_1 = "Variable 1X3 is not defined";

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_PRIORITY} PIC S9(3).\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String CHANGE_PRIORITY_TO_VARIABLE =
      "           MOVE 123 TO {$WK_PRIORITY}.\r\n"
          + "            CHANGE PRIORITY TO {$WK_PRIORITY}.\r\n";

  private static final String CHANGE_PRIORITY_TO_LITERAL = "           CHANGE PRIORITY TO 123.\r\n";

  private static final String CHANGE_PRIORITY_TO_LITERAL_INVALID =
      "           CHANGE PRIORITY TO {1X3|1}.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + CHANGE_PRIORITY_TO_VARIABLE,
        BOILERPLATE + CHANGE_PRIORITY_TO_LITERAL,
        BOILERPLATE + CHANGE_PRIORITY_TO_LITERAL_INVALID);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null, MESSAGE_1, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())),
        ImmutableList.of(),
        IdmsBase.getAnalysisConfig());
  }
}
