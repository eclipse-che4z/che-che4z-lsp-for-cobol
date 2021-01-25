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

/** Test deprecated COMMUNICATION SECTION produces error */
class TestSyntaxErrorOnCommunicationSection {
  private static final String TEXT =
      "         IDENTIFICATION DIVISION.\n"
          + "         PROGRAM-ID. TEST1.\n"
          + "         DATA DIVISION.\n"
          + "         {COMMUNICATION|1} SECTION. \n"
          + "         WORKING-STORAGE SECTION.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        List.of(),
        Map.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on 'COMMUNICATION' expected {<EOF>, ID, IDENTIFICATION, LINKAGE, LOCAL-STORAGE,"
                    + " WORKING-STORAGE, PROCEDURE, SCHEMA, END, FILE, MAP}",
                DiagnosticSeverity.Error,
                ERROR.getText())));
  }
}
