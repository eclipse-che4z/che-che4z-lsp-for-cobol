/*
 * Copyright (c) 2024 DAF Trucks NV.
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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

/** A test case for DACO-CONTROL section statements */
class TestDaCoControlSection {
    private static final String TEXT =
    "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1. \r\n"
          + "        ENVIRONMENT DIVISION.\r\n"
          + "        DACO-CONTROL SECTION.\r\n"
          + "            ROW BUFFER {$TBLLAY-XW4} IS YES.\r\n"
          // Negative test
          + "        DACO-CONTROL SECTION.\r\n"
          + "            ROW BUFFER {UNKVAR-XW4|1} IS YES.\r\n"
          + "        IDMS-CONTROL SECTION.\r\n"
          + "            PROTOCOL. MODE ABC.\r\n"
          + "            IDMS-RECORDS MANUAL\r\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WS-AREA}. \r\n"
          + "           03 {$*AREA-XW4}. \r\n"
          + "             05 {$*TBLLAY-XW4}         PIC X(4)    VALUE SPACE.\r\n"
          + "        PROCEDURE DIVISION. \r\n"
          + "            DISPLAY {$TBLLAY-XW4}. \r\n";

    @Test
    void test() {

    Map<String, Diagnostic> diagnosticMap = new HashMap<>();
    diagnosticMap.put(
        "1",
        new Diagnostic(
            new Range(),
            "Variable UNKVAR-XW4 is not defined",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    UseCaseEngine.runTest(
        TEXT, ImmutableList.of(), diagnosticMap, ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
    }
}
