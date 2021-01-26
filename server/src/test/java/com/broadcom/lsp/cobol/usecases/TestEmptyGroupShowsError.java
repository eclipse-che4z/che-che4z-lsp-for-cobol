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
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * THis test checks that an empty structure produces an error on the parent without PIC. Here:
 * PARENT has no PIC clause neither nested element items
 */
class TestEmptyGroupShowsError {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. TEST1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*PARENT|nopic}.\n"
          + "        PROCEDURE DIVISION.\n"
          + "        END PROGRAM TEST1.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "nopic",
            new Diagnostic(
                null,
                "A \"PICTURE\" clause was not found for elementary item PARENT",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
