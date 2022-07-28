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
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * Tests the DaCo END WRITE REPORT statement
 */
class TestDaCoEndWriteReport {

    private static final String TEXT =
            "        IDENTIFICATION DIVISION. \r\n"
                    + "        PROGRAM-ID. test1. \r\n"
                    + "        DATA DIVISION. \r\n"
                    + "        WORKING-STORAGE SECTION. \r\n"
                    + "        PROCEDURE DIVISION. \r\n"
                    + "            WRITE REPORT ENDRPT. \r\n"
                    + "            WRITE REPORT TGD11 ENDRPT. \r\n"
                    + "            WRITE REPORT RGD11 ENDRPT. \r\n"
                    // Negative tests
                    + "            WRITE REPORT {R-CA|1|2} ENDRPT. \r\n"
                    + "            WRITE REPORT {R-CAS|1} ENDRPT. \r\n"
                    + "            WRITE REPORT {RFDRGR|2} ENDRPT. \r\n"
                    + "            WRITE REPORT {STDFE|3} ENDRPT. \r\n";

    @Test
    void test() {

        Map<String, Diagnostic> diagnosticMap = new HashMap<>();
        diagnosticMap.put(
                "1",
                new Diagnostic(
                        new Range(),
                        "Only alphanumerics are allowed for report name",
                        DiagnosticSeverity.Error,
                        ErrorSource.DIALECT.getText()));
        diagnosticMap.put(
                "2",
                new Diagnostic(
                        new Range(),
                        "Exact length of report name must be 5 bytes",
                        DiagnosticSeverity.Error,
                        ErrorSource.DIALECT.getText()));
        diagnosticMap.put(
                "3",
                new Diagnostic(
                        new Range(),
                        "String must starts with R or T values",
                        DiagnosticSeverity.Error,
                        ErrorSource.DIALECT.getText()));

        UseCaseEngine.runTest(
                TEXT, ImmutableList.of(), diagnosticMap, ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
    }
}
