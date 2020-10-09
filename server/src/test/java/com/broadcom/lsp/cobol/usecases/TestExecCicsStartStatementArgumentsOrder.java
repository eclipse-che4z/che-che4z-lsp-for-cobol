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
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks the positive scenario of using START in EXEC CICS statement. Note, the order
 * of parameters inside the grammar relaxed comparing to the CICS specification to avoid
 * false-positive errors caused by CICS preprocessor.
 */
class TestExecCicsStartStatementArgumentsOrder {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.   TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       LINKAGE SECTION.\n"
          + "       01  {$*PRINT-TRANSID}                 PIC x(4) VALUE SPACES.\n"
          + "       01  {$*CA-PRINTER}                  PIC x(4).\n"
          + "       01  {$*RESPONSE}                      PIC s9(8) COMP-4 VALUE 0.\n"
          + "       01  {$*REASON-CODE}                   PIC s9(8) COMP-4 VALUE 0.\n"
          + "       01  {$*ACCTDTLO}                   PIC s9(8) COMP-4 VALUE 0.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*NACT}.\n"
          + "           EXEC CICS START\n"
          + "                TRANSID({$PRINT-TRANSID}) \n"
          + "                TERMID({$CA-PRINTER})\n"
          + "                FROM({$ACCTDTLO})\n"
          + "                RESP({$RESPONSE})\n"
          + "                RESP2({$REASON-CODE})\n"
          + "           END-EXEC.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
