/*
 * Copyright (c) 2022 Broadcom.
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

/** This tests the usage of declarative section in the USE FOR DEBUGGING statement. */
public class TestDeclarativeSectionNameUsageInUseDebugStatement {

  public static final String TEXT =
      "       identification division.\n"
          + "       program-id. DUMMY.\n"
          + "       author. COBOL-test.\n"
          + "       environment division.\n"
          + "       CONFIGURATION SECTION.                                     \n"
          + "       SOURCE-COMPUTER.                                           \n"
          + "           XXXXX082                                               \n"
          + "               WITH DEBUGGING MODE.                               \n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.                                                    \n"
          + "           SELECT {$GEN-FILE} ASSIGN TO                                    \n"
          + "           XXXXX014.                                                    \n"
          + "       DATA DIVISION.                                                   \n"
          + "       FILE SECTION.                                                    \n"
          + "       FD  {$*GEN-FILE}                                                        \n"
          + "       DATA RECORD IS {$PRINT-REC} {$DUMMY-RECORD}.\n"
          + "       01  {$*GEN-REC} PIC X(80).                                           \n"
          + "       01  {$*PRINT-REC} PIC X(80).                                           \n"
          + "       01  {$*DUMMY-RECORD} PIC X(80).                                           \n"
          + "       procedure division.\n"
          + "       DECLARATIVES.\n"
          + "       {@*SORT-IN-PROC} SECTION.                 \n"
          + "            USE FOR DEBUGGING ON {@AT-END-PROC}. \n"
          + "       {#*BEGIN-USE-PROC}.      \n"
          + "            DISPLAY \"TEST\".\n"
          + "       {@*AT-END-PROC} SECTION.                                     \n"
          + "            USE AFTER ERROR PROCEDURE ON {$GEN-FILE}. \n"
          + "       {#*BEGIN-USE-PROC}.      \n"
          + "            DISPLAY \"TEST\".                      \n"
          + "        END DECLARATIVES.  \n"
          + "           perform {@AT-END-PROC} .";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
