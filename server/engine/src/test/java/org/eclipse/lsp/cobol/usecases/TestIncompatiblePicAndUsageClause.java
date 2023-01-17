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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests incompatible PIC and USAGE clause for variables. */
class TestIncompatiblePicAndUsageClause {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TESTREPL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "         01  {$*Payroll}.\n"
          + "            02  {$*Payroll-WEEK|1}   PIC X COMP-1.\n"
          + "            02  {$*Payroll-WEEK1|2}   PIC X COMP-2.\n"
          + "            02  {$*Payroll-WEEK2|3}   PIC X COMP-3.\n"
          + "            02  {$*Payroll-WEEK3|4}   PIC X UTF-8 BLANK WHEN ZERO.\n"
          + "            02  {$*Payroll-GROSS-PAY}   COMP-2 BLANK WHEN ZERO.\n"
          + "            02  {$*Payroll-HOURS} OCCURS 1 TO 52 TIMES.\n"
          + "            05  {$*A} COMP-1.\n"
          + "                10 {$*B-1|5} PICTURE X(2).\n"
          + "                10 {$*B-2} PICTURE 9(4) COMP-5.";

  private static final String MESSAGE_1 = "PICTURE clause incompatible with usage ";
  private static final String MESSAGE_2 = "PICTURE and USAGE clause are not compatible";
  private static final String MESSAGE_3 = "BLANK WHEN ZERO not compatible with USAGE clause";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                MESSAGE_1 + "COMP_1",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                MESSAGE_1 + "COMP_2",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(), MESSAGE_2, DiagnosticSeverity.Warning, ErrorSource.PARSING.getText()),
            "4",
            new Diagnostic(
                new Range(), MESSAGE_3, DiagnosticSeverity.Warning, ErrorSource.PARSING.getText()),
            "5",
            new Diagnostic(
                new Range(),
                MESSAGE_1 + "COMP_1",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }
}
