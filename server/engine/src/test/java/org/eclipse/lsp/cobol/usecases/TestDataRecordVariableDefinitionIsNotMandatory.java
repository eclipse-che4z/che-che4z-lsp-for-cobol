/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test Data record is not mandatory to be defined. Ref
 * https://www.ibm.com/docs/en/developer-for-zos/14.1?topic=entries-data-records-clause
 */
public class TestDataRecordVariableDefinitionIsNotMandatory {
  public static final String BASE_TEXT =
      "       IDENTIFICATION DIVISION.                         \n"
          + "       PROGRAM-ID. PGMNAME.                             \n"
          + "       ENVIRONMENT DIVISION.                            \n"
          + "       INPUT-OUTPUT SECTION.                            \n"
          + "       FILE-CONTROL.                                    \n"
          + "           SELECT {$AAAA} ASSIGN TO AAAAAAA                \n"
          + "                  ORGANIZATION IS INDEXED               \n"
          + "                  ACCESS IS SEQUENTIAL                  \n"
          + "                  RECORD KEY IS {$AAAA-KEY}.               \n"
          + "       DATA DIVISION.                                   \n"
          + "       FILE SECTION.                                    \n"
          + "       FD  {$*AAAA}                                         \n"
          + "           RECORD IS VARYING IN SIZE TO 12345 CHARACTERS\n";

  public static final String TEXT_DATA_RECORD_VARIABLE_NOT_DEFINED =
      BASE_TEXT
          + "           DATA RECORD IS WHATEVER.                     \n"
          + "       01  {$*UNRELATED-STUFF}.                             \n"
          + "           05  {$*AAAA-KEY}         PIC X(1234).   \n";

  public static final String TEXT_DATA_RECORD_VARIABLE_IS_DEFINED =
      BASE_TEXT
          + "           DATA RECORD IS {$WHATEVER}.                     \n"
          + "       01  {$*UNRELATED-STUFF}.                             \n"
          + "           05  {$*AAAA-KEY}         PIC X(1234).   \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*WHATEVER}           PIC X(10).";

  @Test
  void testDataRecordVariableNeedNotBeDefined() {
    UseCaseEngine.runTest(TEXT_DATA_RECORD_VARIABLE_NOT_DEFINED, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testWhenDataRecordVariableIsDefinedUsageIsCorrectlyReflected() {
    UseCaseEngine.runTest(TEXT_DATA_RECORD_VARIABLE_IS_DEFINED, ImmutableList.of(), ImmutableMap.of());
  }
}
