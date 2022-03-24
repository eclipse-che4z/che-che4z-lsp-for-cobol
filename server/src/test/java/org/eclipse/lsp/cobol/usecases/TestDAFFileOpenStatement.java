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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

/** Tests the DAF OPEN FILE statement */
class TestDAFFileOpenStatement {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WS-AREA}. \r\n"
          + "           03 {$*AREA-XW1}. \r\n"
          + "             05 {$*DET001-XW1}. \r\n"
          + "               07 FILLER               PIC X(5)    VALUE 2. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "            OPEN FILE 0123. \r\n"
          + "            OPEN FILE 0123 MAX LENGTH 2. \r\n"
          + "            OPEN FILE 0123 MAX LENGTH {$DET001-XW1}. \r\n"
          + "            OPEN FILE 0123 MAX LENGTH LAYOUT. \r\n"
          // Negative Tests
          + "            OPEN FILE {.|1|2} \r\n"
          + "            OPEN FILE {01|1}. \r\n"
          + "            OPEN FILE {01234|1}. \r\n"
          + "            OPEN FILE {#*ABCD|3|7}. \r\n"
          + "            OPEN FILE 0123 MAX {.|4} \r\n"
          + "            OPEN FILE 0123 MAX LENGTH {.|5} \r\n"
          + "            OPEN FILE 0123 MAX LENGTH {ABCD|6}. \r\n";

  @Test
  void test() {

    Map<String, Diagnostic> diagnosticMap = new HashMap<>();
    diagnosticMap.put(
        "1",
        new Diagnostic(
            null,
            "Exact length of file reference must be 4 bytes",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "2",
        new Diagnostic(
            null,
            "Missing token {'01-49', '66', '77', '88', INTEGERLITERAL} at integerLiteral",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "3",
        new Diagnostic(
            null,
            "Syntax error on 'ABCD' expected {'01-49', '66', '77', '88', INTEGERLITERAL}",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "4",
        new Diagnostic(
            null,
            "Syntax error on '.' expected LENGTH",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "5",
        new Diagnostic(
            null,
            "Syntax error on '.' expected {LAYOUT, '01-49', '66', '77', '88', INTEGERLITERAL, IDENTIFIER}",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "6",
        new Diagnostic(
            null,
            "Variable ABCD is not defined",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "7",
        new Diagnostic(
            null,
            "The following token must start in Area A: ABCD",
            DiagnosticSeverity.Warning,
            SourceInfoLevels.WARNING.getText()));
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(), diagnosticMap, ImmutableList.of(), IdmsBase.getAnalysisConfig());
  }
}
