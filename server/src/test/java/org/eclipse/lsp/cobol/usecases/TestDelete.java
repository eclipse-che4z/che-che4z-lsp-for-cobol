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

/** These test for variations of valid DELETE statements */
class TestDelete {

  private static final String BOILERPLATE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_QUEUEID} PIC X(8) SYNC.\r\n"
          + "        01 {$*WK_AREAID} PIC X(8) SYNC.\r\n"
          + "        01 {$*WK_RECORDID_1} PIC X(8) SYNC.\r\n"
          + "        01 {$*WK_RECORDID_2} PIC X(8) SYNC.\r\n"
          + "        PROCEDURE DIVISION. \r\n";

  private static final String DELETE_QUEUE = "           DELETE QUEUE.\r\n";

  private static final String DELETE_QUEUE_ID_LITERAL = "           DELETE QUEUE ID 'TEST' .\r\n";

  private static final String DELETE_QUEUE_ID_VARIABLE =
      "           DELETE QUEUE ID {$WK_QUEUEID} .\r\n";

  private static final String DELETE_QUEUE_ID_VARIABLE_CURRENT =
      "           DELETE QUEUE ID {$WK_QUEUEID} CURRENT.\r\n";

  private static final String DELETE_QUEUE_NO_ID = "           DELETE QUEUE CURRENT.\r\n";

  private static final String DELETE_SCRATCH = "           DELETE SCRATCH.\r\n";

  private static final String DELETE_SCRATCH_AREA_ID_LITERAL =
      "           DELETE SCRATCH AREA ID 'TEST'.\r\n";

  private static final String DELETE_SCRATCH_AREA_ID_VARIABLE =
      "           DELETE SCRATCH AREA ID {$WK_AREAID}.\r\n";

  private static final String DELETE_SCRATCH_ALL_PARMS =
      "           DELETE SCRATCH AREA ID {$WK_AREAID} RECORD ID {$WK_RECORDID_1} \n"
          + "             RETURN RECORD ID INTO {$WK_RECORDID_2}.\r\n";

  private static final String DELETE_SCRATCH_PRIOR = "           DELETE SCRATCH PRIOR.\r\n";

  private static Stream<String> textsToTest() {
    return Stream.of(
        BOILERPLATE + DELETE_QUEUE,
        BOILERPLATE + DELETE_QUEUE_ID_LITERAL,
        BOILERPLATE + DELETE_QUEUE_ID_VARIABLE,
        BOILERPLATE + DELETE_QUEUE_ID_VARIABLE_CURRENT,
        BOILERPLATE + DELETE_QUEUE_NO_ID,
        BOILERPLATE + DELETE_SCRATCH,
        BOILERPLATE + DELETE_SCRATCH_AREA_ID_LITERAL,
        BOILERPLATE + DELETE_SCRATCH_AREA_ID_VARIABLE,
        BOILERPLATE + DELETE_SCRATCH_ALL_PARMS,
        BOILERPLATE + DELETE_SCRATCH_PRIOR);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - varying tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
