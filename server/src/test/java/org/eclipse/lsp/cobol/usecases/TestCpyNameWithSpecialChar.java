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

import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/**
 * This test proves that special chars (@,#,$) in copybook name recognized correctly, and the error
 * appears because of the missing copybook.
 */
class TestCpyNameWithSpecialChar {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        01 {$*VAR1}.\r\n"
          + "          02 {$*VAR2} PIC 9.\r\n"
          + "        COPY {~@SPE#-$|1}.\r\n"
          + "        PROCEDURE DIVISION.\r\n";

  private static final String MESSAGE = "@SPE#-$: Copybook not found";
  private static final String CODE = "MISSING_COPYBOOK";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1", new Diagnostic(null, MESSAGE, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText(), CODE)));
  }
}
