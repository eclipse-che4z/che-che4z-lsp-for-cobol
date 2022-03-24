/*
 * Copyright (c) 2022 DAF Trucks NV.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * DAF Trucks NV – implementation of DaCo COBOL statements
 * and DAF development standards
 */
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** Tests the DAF ROW Add statement */
class TestDAFTableGetStatement {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "            GET TABLE ANY GACP. \r\n"
          + "            GET TABLE SEQ GACP. \r\n"
          // Negative tests
          + "            GET TABLE {.|1} \r\n"
          + "            GET TABLE ANY {.|2|3} \r\n"
          + "            GET TABLE SEQ {.|2|3} \r\n"
          + "            GET TABLE ANY {GA|2}. \r\n"
          + "            GET TABLE SEQ {GA|2}. \r\n"
          + "            GET TABLE ANY {GAFSD|2}. \r\n"
          + "            GET TABLE SEQ {GAFSD|2}. \r\n";

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Syntax error on '.' expected {ANY, SEQ}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "Exact length of table reference must be 4 bytes",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "3",
            new Diagnostic(
                null,
                "Syntax error on '.' expected {IDENTIFIER}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
