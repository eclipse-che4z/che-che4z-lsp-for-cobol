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
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.ca.lsp.cobol.service.delegates.validations.SourceInfoLevels.ERROR;
/**
 * This test checks that the error shown if the copybook that is used in the Cobol file contains a
 * link to itself.
 */
class TestCopybookWithRecursiveDependencyIsDetected {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        COPY {~REC-CPY|1}.\n\n"
          + "        PROCEDURE DIVISION.\n\n";

  private static final String REC_CPY = "        COPY {~REC-CPY}.";
  private static final String REC_CPY_NAME = "REC-CPY";
  private static final String MESSAGE = "Recursive copybook declaration for: " + REC_CPY_NAME;

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        List.of(new CobolText(REC_CPY_NAME, REC_CPY)),
        Map.of("1", new Diagnostic(null, MESSAGE, DiagnosticSeverity.Error, ERROR.getText())));
  }
}
