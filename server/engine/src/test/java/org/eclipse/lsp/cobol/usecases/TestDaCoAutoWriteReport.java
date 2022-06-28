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
import org.eclipse.lsp.cobol.core.model.ErrorStage;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

/** Tests the DaCo AUTO WRITE REPORT statement */
class TestDaCoAutoWriteReport {

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
          + "            WRITE REPORT AUTO {$DET001-XW1}. \r\n"
          + "            WRITE REPORT AUTO {$DET001-XW1} END {$DET001-XW1}. \r\n"
          // Negative tests
          + "            WRITE REPORT AUTO {ASD|1}. \r\n"
          + "            WRITE REPORT AUTO {ASD|1} END {ASD|1}. \r\n"
          + "            WRITE REPORT AUTO {$DET001-XW1} END {ASD|1}. \r\n"
          + "            WRITE REPORT AUTO {ASD|1} END {$DET001-XW1}. \r\n";

  @Test
  void test() {

    Map<String, Diagnostic> diagnosticMap = new HashMap<>();
    diagnosticMap.put(
        "1",
        new Diagnostic(
            new Range(),
            "Variable ASD is not defined",
            DiagnosticSeverity.Error,
            ErrorStage.SYNTAX.getText()));
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(), diagnosticMap, ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
  }
}
