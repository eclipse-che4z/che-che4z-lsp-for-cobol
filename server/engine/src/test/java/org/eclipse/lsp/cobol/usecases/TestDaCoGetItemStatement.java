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
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests the DaCo GET ITEM statement */
class TestDaCoGetItemStatement {

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
          + "            GET ITEM ANY {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
          + "            GET ITEM ANY 'SDF' 'GTERE' 'TYERWE'. \r\n"
          + "            GET ITEM ANY 'SDF' 'GTERE' 'TYERWE'. \r\n"
          + "            GET ITEM GRS {$DET001-XW1} {$DET001-XW1}. \r\n"
          + "            GET ITEM SEQ 'SDF' 'GTERE'. \r\n"
          + "            GET ITEM SEQ 'SDF'. \r\n"
          + "            GET ITEM SEQ {$DET001-XW1} {$DET001-XW1}. \r\n"
          + "            GET ITEM SEQ {$DET001-XW1}. \r\n"
          + "            GET ITEM GRS 'RETERW' 'DFDFD'. \r\n"
          + "            GET ITEM GRS {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
          // Negative Tests
          + "            GET ITEM ANY {DSR443-RW1|1} 'FGTREW' 'GTREE'. \r\n"
          + "            GET ITEM ANY {$DET001-XW1} {$DET001-XW1} {DSR443-RW1|1}. \r\n"
          + "            GET ITEM ANY {$DET001-XW1} {DSR443-RW1|1} {$DET001-XW1}. \r\n"
          + "            GET ITEM SEQ {DSR443-RW1|1} \r\n"
          + "            GET ITEM SEQ 'SDFSS' {DSR443-RW1|1}. \r\n"
          + "            GET ITEM GRS 'FERES' {DSR443-RW1|1}. \r\n"
          + "            GET ITEM GRS 'FERES' 'DFERETS' {DSR443-RW1|1}. \r\n";

  @Test
  void test() {

    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable DSR443-RW1 is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
