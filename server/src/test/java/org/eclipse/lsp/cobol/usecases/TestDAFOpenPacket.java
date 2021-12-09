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

/** Tests the DAF OPEN PACKET statement */
class TestDAFOpenPacket {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WS-AREA}. \r\n"
          + "           03 {$*AREA-XW1}. \r\n"
          + "             05 {$*DET001-XW1}. \r\n"
          + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1}. \r\n"
          + "            OPEN PACKET ABCD FOR 'DEF'. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} SORT {$DET001-XW1}. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} VERSION {$DET001-XW1}. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} VERSION 3. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} SORT {$DET001-XW1} \r\n"
          + "            VERSION {$DET001-XW1}. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} SORT {$DET001-XW1} \r\n"
          + "            VERSION 3. \r\n"
          // Negative tests
          + "            OPEN PACKET {A|1} FOR {.|6} \r\n"
          + "            OPEN PACKET {A|1} FOR {$DET001-XW1}. \r\n"
          + "            OPEN PACKET {A|1} FOR {'AS'|5}. \r\n"
          + "            OPEN PACKET {ABCDE|1} FOR {$DET001-XW1}. \r\n"
          + "            OPEN PACKET ABCD FOR {ASD|3}. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} SORT {ASD|3}. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} SORT {$DET001-XW1} \r\n"
          + "            VERSION {ASD|3}. \r\n"
          + "            OPEN PACKET ABCD FOR {$DET001-XW1} SORT {$DET001-XW1} \r\n"
          + "            VERSION {FD|4}. \r\n";

  @Test
  void test() {

    Map<String, Diagnostic> diagnosticMap = new HashMap<>();
    diagnosticMap.put(
        "1",
        new Diagnostic(
            null,
            "Exact length of task name must be 4 bytes",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "2",
        new Diagnostic(
            null,
            "Extraneous input 'FOR' expected {'01-49', '66', '77', '88', INTEGERLITERAL, IDENTIFIER}",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "3",
        new Diagnostic(
            null,
            "Variable ASD is not defined",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "4",
        new Diagnostic(
            null,
            "Syntax error on 'FD' expected {'01-49', '66', '77', '88', INTEGERLITERAL, IDENTIFIER}",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "5",
        new Diagnostic(
            null,
            "Exact length of receiver packet must be 3 bytes",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    diagnosticMap.put(
        "6",
        new Diagnostic(
            null,
            "Syntax error on '.' expected {NONNUMERICLITERAL, IDENTIFIER}",
            DiagnosticSeverity.Error,
            SourceInfoLevels.ERROR.getText()));
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), diagnosticMap);
  }
}
