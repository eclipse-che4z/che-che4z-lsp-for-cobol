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

/** This test checks if the parser recognizes an unexpected symbol and shows it as an error. */
class TestUnexpectedCharErrorShown {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION{!|typo}.\r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "        END PROGRAM test1.";

  private static final String MESSAGE = "Extraneous input '!' expected '.'";

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of("typo", new Diagnostic(null, MESSAGE, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())));
  }
}
