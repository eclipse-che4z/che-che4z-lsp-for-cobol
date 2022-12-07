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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests the DaCo WRITE REPORT with name statement
 */
class TestDaCoWriteReportWithName {

    private static final String TEXT =
            "        IDENTIFICATION DIVISION. \r\n"
                    + "        PROGRAM-ID. test1. \r\n"
                + "        ENVIRONMENT DIVISION.\n"
                + "        IDMS-CONTROL SECTION.\n"
                + "            PROTOCOL. MODE ABC.\n"
                + "            IDMS-RECORDS MANUAL\n"
                    + "        DATA DIVISION. \r\n"
                    + "        WORKING-STORAGE SECTION. \r\n"
                    + "        01 {$*WS-AREA}. \r\n"
                    + "           03 {$*AREA-XW1}. \r\n"
                    + "             05 {$*DET001-XW1}. \r\n"
                    + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
                    + "        PROCEDURE DIVISION. \r\n"
                    + "            WRITE REPORT FROM {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT FROM {$DET001-XW1} AFTER 85 LINES. \r\n"
                    + "            WRITE REPORT FROM {$DET001-XW1} AFTER 1 LINE. \r\n"
                    + "            WRITE REPORT FROM {$DET001-XW1} AFTER PAGE. \r\n"
                    + "            WRITE REPORT FROM {$DET001-XW1} AFTER {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT FROM {$DET001-XW1} LENGTH 80 \r\n"
                    + "                  AFTER {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT TGD11 FROM {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT FROM {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} AFTER 85 LINES. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} AFTER 1 LINE. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} AFTER PAGE. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} AFTER {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} LENGTH 80 \r\n"
                    + "                  AFTER {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} LENGTH 80. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} LENGTH 80 AFTER PAGE. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} LENGTH 80 AFTER 20 LINES. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} AFTER PAGE. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} \r\n"
                    + "                  AFTER 20 LINES. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} \r\n"
                    + "                  AFTER {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} LENGTH 80. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} LENGTH 80 \r\n"
                    + "                  AFTER PAGE. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} LENGTH 80 \r\n"
                    + "                  AFTER 20 LINES. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} LENGTH 80 \r\n"
                    + "                  AFTER {$DET001-XW1}. \r\n"
                    // Negative tests
                    + "            WRITE REPORT {R-CA|1|2} FROM {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT {RFDRGR|2} FROM {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT {STDFE|5} FROM {$DET001-XW1}. \r\n"
                    + "            WRITE REPORT RTDFE FROM {$DET001-XW1} LENGTH {75|3}. \r\n"
                    + "            WRITE REPORT RTDFE FROM {$DET001-XW1} LENGTH {205|3}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {ASD|4}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} LENGTH {75|3}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {$DET001-XW1} LENGTH {205|3}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {ASD|4} LENGTH {205|3}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} AFTER {ASD|4}. \r\n"
                    + "            WRITE REPORT RGD11 FROM {$DET001-XW1} TO {ASD|4} LENGTH {205|3} \r\n"
                    + "                  AFTER {ASD|4}. \r\n";

    @Test
    void test() {

        UseCaseEngine.runTest(
                TEXT,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Only alphanumerics are allowed for report name",
                                DiagnosticSeverity.Error,
                                ErrorSource.DIALECT.getText()),
                        "2",
                        new Diagnostic(
                                new Range(),
                                "Exact length of report name must be 5 bytes",
                                DiagnosticSeverity.Error,
                                ErrorSource.DIALECT.getText()),
                        "3",
                        new Diagnostic(
                                new Range(),
                                "Allowed range is 80 to 200",
                                DiagnosticSeverity.Warning,
                                ErrorSource.DIALECT.getText()),
                        "4",
                        new Diagnostic(
                                new Range(),
                                "Variable ASD is not defined",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "5",
                        new Diagnostic(
                                new Range(),
                                "String must starts with R or T values",
                                DiagnosticSeverity.Error,
                                ErrorSource.DIALECT.getText())),
                ImmutableList.of(),
                DialectConfigs.getDaCoAnalysisConfig());
    }
}
