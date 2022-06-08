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
import org.junit.jupiter.api.Test;

/**
 * Tests the DaCo Show Message statement
 */
class TestDaCoShowMessageStatement {

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
                    + "            SHOW INFO 002. \r\n"
                    + "            SHOW STD INFO 002. \r\n"
                    + "            SHOW INFO 002 {$DET001-XW1}. \r\n"
                    + "            SHOW STD INFO 002 {$DET001-XW1}. \r\n"
                    + "            SHOW INFO 002 {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW STD INFO 002 {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW INFO 002 {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW STD INFO 002 {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW INFO 002 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD INFO 002 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW INFO 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD INFO 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW INFO 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST' \r\n"
                    + "            'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD INFO 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST' \r\n"
                    + "            'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW WARNING 002. \r\n"
                    + "            SHOW STD WARNING 002. \r\n"
                    + "            SHOW WARNING 002 {$DET001-XW1}. \r\n"
                    + "            SHOW STD WARNING 002 {$DET001-XW1}. \r\n"
                    + "            SHOW WARNING 002 {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW STD WARNING 002 {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW WARNING 002 {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW STD WARNING 002 {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW WARNING 002 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD WARNING 002 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW WARNING 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD WARNING 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW WARNING 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST' \r\n"
                    + "             'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD WARNING 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST' \r\n"
                    + "             'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW ERROR 002. \r\n"
                    + "            SHOW STD ERROR 002. \r\n"
                    + "            SHOW ERROR 002 {$DET001-XW1}. \r\n"
                    + "            SHOW STD ERROR 002 {$DET001-XW1}. \r\n"
                    + "            SHOW ERROR 002 {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW STD ERROR 002 {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW ERROR 002 {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW STD ERROR 002 {$DET001-XW1} {$DET001-XW1} {$DET001-XW1}. \r\n"
                    + "            SHOW ERROR 002 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD ERROR 002 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW ERROR 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD ERROR 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW ERROR 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST' \r\n"
                    + "            'VRZMAS NOT EXIST'. \r\n"
                    + "            SHOW STD ERROR 002 'VRZMAS NOT EXIST' 'VRZMAS NOT EXIST' \r\n"
                    + "            'VRZMAS NOT EXIST'. \r\n"
                    // Negative tests
                    + "            SHOW INFO {00|2}. \r\n"
                    + "            SHOW STD INFO {00|2}. \r\n"
                    + "            SHOW WARNING {00|2}. \r\n"
                    + "            SHOW STD WARNING {00|2}. \r\n"
                    + "            SHOW ERROR {00|2}. \r\n"
                    + "            SHOW STD ERROR {00|2}. \r\n"
                    + "            SHOW INFO {0012|2}. \r\n"
                    + "            SHOW STD INFO {0012|2}. \r\n"
                    + "            SHOW WARNING {0012|2}. \r\n"
                    + "            SHOW STD WARNING {0012|2}. \r\n"
                    + "            SHOW ERROR {0012|2}. \r\n"
                    + "            SHOW STD ERROR {0012|2}. \r\n"
                    + "            SHOW INFO 002 {ASD|1}. \r\n"
                    + "            SHOW STD INFO 002 {ASD|1}. \r\n"
                    + "            SHOW WARNING 002 {ASD|1}. \r\n"
                    + "            SHOW STD WARNING 002 {ASD|1}. \r\n"
                    + "            SHOW ERROR 002 {ASD|1}. \r\n"
                    + "            SHOW STD ERROR 002 {ASD|1}. \r\n"
                    + "            SHOW INFO 002 {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW STD INFO 002 {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW WARNING 002 {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW STD WARNING 002 {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW ERROR 002 {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW STD ERROR 002 {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW INFO 002 {$DET001-XW1} {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW STD INFO 002 {$DET001-XW1} {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW WARNING 002 {$DET001-XW1} {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW STD WARNING 002 {$DET001-XW1} {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW ERROR 002 {$DET001-XW1} {$DET001-XW1} {ASD|1}. \r\n"
                    + "            SHOW STD ERROR 002 {$DET001-XW1} {$DET001-XW1} {ASD|1}. \r\n";

    @Test
    void test() {

        UseCaseEngine.runTest(
                TEXT,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                null,
                                "Variable ASD is not defined",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText()),
                        "2",
                        new Diagnostic(
                                null,
                                "Exact length of message code must be 3 bytes",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText())
                ),
                ImmutableList.of(),
                DialectConfigs.getDaCoAnalysisConfig());
    }
}
