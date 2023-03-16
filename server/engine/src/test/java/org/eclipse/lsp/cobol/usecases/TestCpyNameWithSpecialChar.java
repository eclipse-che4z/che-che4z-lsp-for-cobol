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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test proves that special chars (@,#,$) in copybook name recognized correctly, and the error
 * appears because of the missing copybook. Copybook name with underscore is not allowed.
 */
class TestCpyNameWithSpecialChar {

  private static final String BASE =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        01 {$*VAR1}.\r\n"
          + "          02 {$*VAR2} PIC 9.\r\n";
  private static final String TEXT =
      BASE + "        COPY {~@SPE#-$|1}.\r\n" + "        PROCEDURE DIVISION.\r\n";
  private static final String TEXT_CONTAINS_UNDERSCORE =
      BASE + "        COPY {~@SPE#_$|1|2}.\r\n" + "        PROCEDURE DIVISION.\r\n";

  private static final String MESSAGE = "@SPE#-$: Copybook not found";
  private static final String MESSAGE_1 = "@SPE#_$: Copybook not found";
  private static final String MESSAGE_2 = "Copybook declaration has '_' characters for: @SPE#_$";
  private static final String CODE = ErrorCodes.MISSING_COPYBOOK.getLabel();

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), MESSAGE, DiagnosticSeverity.Error, ErrorSource.COPYBOOK.getText(), CODE)));
  }

  @Test
  void testCopybookNameContainsUnderScore() {
    UseCaseEngine.runTest(
        TEXT_CONTAINS_UNDERSCORE,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
                new Diagnostic(
                    new Range(),
                    MESSAGE_1,
                    DiagnosticSeverity.Error,
                    ErrorSource.COPYBOOK.getText(),
                    CODE),
            "2",
                new Diagnostic(
                    new Range(),
                    MESSAGE_2,
                    DiagnosticSeverity.Error,
                    ErrorSource.COPYBOOK.getText(),
                    null)));
  }
}
