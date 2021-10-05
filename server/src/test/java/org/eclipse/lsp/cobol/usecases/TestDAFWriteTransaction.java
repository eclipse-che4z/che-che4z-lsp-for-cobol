/*
 * Copyright (c) 2021 DAF Trucks NV.
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

/** Tests the DAF WRITE TRANSACTION statement */
class TestDAFWriteTransaction {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "            WRITE TRANSACTION PIBV. \r\n"
          + "            WRITE TRANSACTION OSD2. \r\n"
          + "            WRITE TRANSACTION 3167. \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH 4. \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH 2048. \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH 2048 TO FDERESS4342. \r\n"
          + "            WRITE TRANSACTION {.|1|2|5} \r\n"
          + "            WRITE TRANSACTION {R-DS|1}. \r\n"
          + "            WRITE TRANSACTION {RD|2}. \r\n"
          + "            WRITE TRANSACTION {RDERW|2}. \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH {.|7} \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH {3|3}. \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH {2049|3}. \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH 25 TO {.|5} \r\n"
          + "            WRITE TRANSACTION 3167 LENGTH 25 TO {SDFERTSFERTSQAWED5GHT|4}. \r\n"
          + "            WRITE TRANSACTION{|1|2|6}\r\n";

  @Test
  void test() {

    Map<String, Diagnostic> diagnosticMap = new HashMap<>();
    diagnosticMap.put(
        "1",
        new Diagnostic(
            null,
            "Only alphanumerics are allowed for task name",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "2",
        new Diagnostic(
            null,
            "Exact length of task name must be 4 bytes",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "3",
        new Diagnostic(
            null,
            "Allowed range is 4 to 2048",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "4",
        new Diagnostic(
            null,
            "Max length limit of 19 bytes allowed for dbu.",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "5",
        new Diagnostic(
            null,
            "Syntax error on '.' expected {'01-49', '66', '77', '88', INTEGERLITERAL, IDENTIFIER}",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "6",
        new Diagnostic(
            null,
            "Unexpected end of file",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "7",
        new Diagnostic(
            null,
            "Missing token {'01-49', '66', '77', '88', INTEGERLITERAL} at integerLiteral",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));

    UseCaseEngine.runTest(TEXT, ImmutableList.of(), diagnosticMap);
  }
}
