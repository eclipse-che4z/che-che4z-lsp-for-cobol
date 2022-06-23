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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests the DaCo WRITE TRANSACTION statement
 */
class TestDaCoWriteTransaction {

    private static final String TEXT =
            "        IDENTIFICATION DIVISION. \r\n"
                    + "        PROGRAM-ID. test1. \r\n"
                    + "        DATA DIVISION. \r\n"
                    + "        WORKING-STORAGE SECTION. \r\n"
                    + "        01 {$*TRANSACTION-SIZE} PIC 9(5).\r\n"
                    + "        01 {$*FDERESS4342} PIC 9(5).\r\n"
                    + "        01 {$*SDFERTSFERTSQAWED5GHT} PIC 9(5).\r\n"
                    + "        PROCEDURE DIVISION. \r\n"
                    + "            WRITE TRANSACTION INPUT. \r\n"
                    + "            WRITE TRANSACTION PIBV. \r\n"
                    + "            WRITE TRANSACTION OSD2. \r\n"
                    + "            WRITE TRANSACTION 3167. \r\n"
                    + "            WRITE TRANSACTION 3167 LENGTH 4. \r\n"
                    + "            WRITE TRANSACTION INPUT LENGTH 4. \r\n"
                    + "            WRITE TRANSACTION 3167 LENGTH 2048. \r\n"
                    + "            WRITE TRANSACTION INPUT LENGTH 2048. \r\n"
                    + "            WRITE TRANSACTION 3167 LENGTH {$TRANSACTION-SIZE}. \r\n"
                    + "            WRITE TRANSACTION 3167 LENGTH 2048 TO {$FDERESS4342}. \r\n"
                    + "            WRITE TRANSACTION INPUT LENGTH 2048 TO {$FDERESS4342}. \r\n"
                    // Negative Tests
                    + "            WRITE TRANSACTION {R-DS|1}. \r\n"
                    + "            WRITE TRANSACTION {RD|2}. \r\n"
                    + "            WRITE TRANSACTION {RDERW|2}. \r\n"
                    + "            WRITE TRANSACTION 3167 LENGTH {3|3}. \r\n"
                    + "            WRITE TRANSACTION INPUT LENGTH {3|3}. \r\n"
                    + "            WRITE TRANSACTION 3167 LENGTH {2049|3}. \r\n"
                    + "            WRITE TRANSACTION INPUT LENGTH {2049|3}. \r\n"
                    + "            WRITE TRANSACTION 3167 LENGTH 25 TO {$SDFERTSFERTSQAWED5GHT|4}. \r\n"
                    + "            WRITE TRANSACTION INPUT LENGTH 25 TO {$SDFERTSFERTSQAWED5GHT|4}. \r\n";

    @Test
    void test() {

        UseCaseEngine.runTest(
                TEXT,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Only alphanumerics are allowed for task name",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText()),
                        "2",
                        new Diagnostic(
                                new Range(),
                                "Exact length of task name must be 4 bytes",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText()),
                        "3",
                        new Diagnostic(
                                new Range(),
                                "Allowed range is 4 to 2048",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText()),
                        "4",
                        new Diagnostic(
                                new Range(),
                                "Max length limit of 19 bytes allowed for dbu.",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText())),
                ImmutableList.of(),
                DialectConfigs.getDaCoAnalysisConfig());
    }
}
