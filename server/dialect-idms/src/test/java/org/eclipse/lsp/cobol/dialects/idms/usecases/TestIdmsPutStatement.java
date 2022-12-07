/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.dialects.idms.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.dialects.idms.utils.Fixtures;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test IDMS Put DML statement */
class TestIdmsPutStatement {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_ID} PIC X(8).\n"
          + "        01 {$*WK_AID} PIC X(8).\n"
          + "        01 {$*WK_RID} PIC X(8).\n"
          + "        01 {$*WK_AREA1} PIC X(8).\n"
          + "        01 {$*WK_AREA2} PIC X(8).\n"
          + "        01 {$*WK_RETURN} PIC S9(8) COMP.\n"
          + "        01 {$*WK_LENGTH} PIC S9(8) .\n"
          + "        01 {$*WK_RETENTION} PIC S9(8) .\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String PUT_QUEUE = "            PUT QUEUE FROM {$WK_AREA1} LENGTH 8.\r\n";

  private static final String PUT_QUEUE_WITH_ALL_VARB =
      "           MOVE 'QUEUEID' TO {$WK_ID}.\r\n"
          + "           MOVE 255 TO {$WK_RETENTION}.  \r\n"
          + "           PUT QUEUE ID {$WK_ID} FIRST FROM {$WK_AREA1} TO {$WK_AREA2}\r\n  "
          + "           RETURN RECORD ID INTO {$WK_RETURN} RETENTION {$WK_RETENTION}. \r\n";

  private static final String PUT_QUEUE_WITH_ALL_LITERAL =
      "           PUT QUEUE ID 'TESTQID' FIRST FROM {$WK_AREA1} TO {$WK_AREA2}\r\n  "
          + "           RETURN RECORD ID INTO {$WK_RETURN} RETENTION +255. \r\n";

  private static final String PUT_SCRATCH =
      "            PUT QUEUE FROM {$WK_AREA1} TO {$WK_AREA2}.\r\n";

  private static final String PUT_SCRATCH_WITH_ALL_VARB =
      "           MOVE 'SCRATCH' TO {$WK_AID}.\r\n"
          + "           MOVE '1000' TO {$WK_RID}.\r\n"
          + "           PUT SCRATCH AREA ID {$WK_AID} FROM {$WK_AREA1} TO {$WK_AREA2}\r\n  "
          + "           RECORD ID {$WK_RID} REPLACE RETURN RECORD ID INTO {$WK_RETURN}. \r\n";

  private static final String PUT_SCRATCH_WITH_ALL_LITERAL =
      "           PUT SCRATCH AREA ID 'TESTID' FROM {$WK_AREA1} LENGTH 8\r\n  "
          + "           RECORD ID 1000 REPLACE RETURN RECORD ID INTO {$WK_RETURN}. \r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + PUT_QUEUE,
        BOILERPLATE + PUT_QUEUE_WITH_ALL_VARB,
        BOILERPLATE + PUT_QUEUE_WITH_ALL_LITERAL,
        BOILERPLATE + PUT_SCRATCH,
        BOILERPLATE + PUT_SCRATCH_WITH_ALL_VARB,
        BOILERPLATE + PUT_SCRATCH_WITH_ALL_LITERAL);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - IDMS put tests")
  void test(String text) {
    UseCaseEngine.runTestForDiagnostics(
        text,
        ImmutableList.of(Fixtures.subschemaCopy("")),
        ImmutableMap.of(),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
