/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Test CICS ASSIGN command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-assign">.assign command</a>
 */
public class TestCicsAssignStatement {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. Untitled-1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       SPECIAL-NAMES.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "        FILE SECTION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*test1}.\n"
          + "            03 {$*WM-CICS-TEXT2}.\n"
          + "             05 FILLER                       PIC X(06) VALUE 'SYSID:'.\n"
          + "             05 {$*WM-CICS-SYSID}                PIC X(04) VALUE SPACES.\n"
          + "             05 FILLER                       PIC X(06) VALUE ' | IP:'.\n"
          + "             05 {$*WM-INVOKING-PROGRAM}          PIC X(08) VALUE SPACES.\n"
          + "        LINKAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC CICS\n"
          + "                ASSIGN\n"
          + "                SYSID        ({$WM-CICS-SYSID})\n"
          + "                MAPHEIGHT        ({$WM-CICS-SYSID})\n"
          + "                INVOKINGPROG ({$WM-INVOKING-PROGRAM})\n"
          + "                STARTCODE({$WM-INVOKING-PROGRAM})\n"
          + "                TWALENG({$WM-INVOKING-PROGRAM})\n"
          + "                MAJORVERSION({$WM-INVOKING-PROGRAM})\n"
          + "           END-EXEC           .\n"
          + "       END PROGRAM Untitled-1.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
