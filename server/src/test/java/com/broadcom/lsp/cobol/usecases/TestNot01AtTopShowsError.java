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

import com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/**
 * This test checks that a variable definition with the level not 01, 66 or 77 produce syntax error.
 * Here: 05 PARENT1 is treated as a top element and should show a syntax error
 */
class TestNot01AtTopShowsError {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. TEST1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        05 {$*PARENT1|1} PIC 9.\n"
          + "        01 {$*PARENT2} PIC 9.\n"
          + "        77 {$*PARENT3} PIC 9.\n"
          + "        01 {$*PARENT4}.\n"
          + "        02 {$*CHILD} PIC 9.\n"
          + "        66 {$*PARENT5} RENAMES {$CHILD}.\n"
          + "        PROCEDURE DIVISION.\n"
          + "        END PROGRAM TEST1.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "PARENT1: Only 01, 66 and 77 level numbers are allowed at the highest level",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
