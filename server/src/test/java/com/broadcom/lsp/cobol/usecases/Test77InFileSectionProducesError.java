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
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.broadcom.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;

/** This test checks 77 in FILE SECTION produces semantic error */
class Test77InFileSectionProducesError {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       FD  REPORT-OUT\n"
          + "           BLOCK CONTAINS 1 RECORDS\n"
          + "           LABEL RECORDS ARE STANDARD\n"
          + "           RECORDING MODE F.\n"
          + "       01  {$*LINE-OUT}.\n"
          + "           03 FILLER PIC X(79).\n"
          + "       77 {$*VARNAME|1} PIC 9(2) VALUE 77 COMP.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$VARNAME}.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "1",
            new Diagnostic(
                null,
                "This section doesn't allow a data definition of that type",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
