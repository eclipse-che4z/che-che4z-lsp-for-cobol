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

/** Tests the DaCo Prefix D-B and D-C statement */
class TestDaCoPrefixStatement {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WS-AREA}. \r\n"
          + "           03 {$*AREA-XW1}. \r\n"
          + "             05 {$*A}. \r\n"
          + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "        D-B OPEN PACKET ABCD FOR 'DEF'. \r\n"
          + "        D-C OPEN PACKET ABCD FOR 'DEF'. \r\n"
          // Negative tests
          + "             {D-B|1} OPEN PACKET ABCD FOR 'DEF'. \r\n"
          + "             {D-C|2} OPEN PACKET ABCD FOR 'DEF'. \r\n";

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "The following token must start in Area A: D-B",
                DiagnosticSeverity.Warning,
                SourceInfoLevels.WARNING.getText()),
            "2",
            new Diagnostic(
                null,
                "The following token must start in Area A: D-C",
                DiagnosticSeverity.Warning,
                SourceInfoLevels.WARNING.getText())),
        ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig());
  }
}
