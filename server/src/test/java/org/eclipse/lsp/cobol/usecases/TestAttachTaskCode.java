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

/** These test for variations of valid ATTACH statements */
class TestAttachTaskCode {

  private static final String MESSAGE_1 = "Variable 1XX is not defined";

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_TASKCODE} PIC X(8) SYNC.\r\n"
          + "        01 {$*WK_PRIORITY} PIC S9(3) SYNC.\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String ATTACH_TASK_CODE_CODE_VARIABLE =
      "           MOVE 'TESTCODE' TO {$WK_TASKCODE}.\r\n"
          + "           ATTACH TASK CODE {$WK_TASKCODE}.\r\n";

  private static final String ATTACH_TASK_CODE_CODE_LITERAL =
      "           ATTACH TASK CODE 'TASKCODE'.\r\n";

  private static final String ATTACH_TASK_CODE_PRIORITY_VARIABLE =
      "           MOVE '123' TO {$WK_PRIORITY}.\r\n"
          + "           ATTACH TASK CODE 'TASKCODE' PRIORITY {$WK_PRIORITY}.\r\n";

  private static final String ATTACH_TASK_CODE_PRIORITY_LITERAL =
      "           ATTACH TASK CODE 'TASKCODE' PRIORITY 123.\r\n";

  private static final String ATTACH_TASK_CODE_PRIORITY_INVALID_LITERAL =
      "           ATTACH TASK CODE 'TASKCODE' PRIORITY {1XX|1}.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + ATTACH_TASK_CODE_CODE_LITERAL,
        BOILERPLATE + ATTACH_TASK_CODE_CODE_VARIABLE,
        BOILERPLATE + ATTACH_TASK_CODE_PRIORITY_VARIABLE,
        BOILERPLATE + ATTACH_TASK_CODE_PRIORITY_LITERAL,
        BOILERPLATE + ATTACH_TASK_CODE_PRIORITY_INVALID_LITERAL);
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
                null, MESSAGE_1, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())));
  }
}
