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

/**
 * Tests the DaCo EXEC statement
 */
class TestDaCoExecStatement {

    private static final String TEXT =
            "        IDENTIFICATION DIVISION. \r\n"
                    + "        PROGRAM-ID. test1. \r\n"
                    + "        DATA DIVISION. \r\n"
                    + "        WORKING-STORAGE SECTION. \r\n"
                    + "        01 {$*WS-AREA}. \r\n"
                    + "           03 {$*AREA-XW1}. \r\n"
                    + "             05 {$*DSAPRO-XL1}. \r\n"
                    + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
                    + "        PROCEDURE DIVISION. \r\n"
                    + "            EXEC 'SDSFREE' USING {$DSAPRO-XL1}. \r\n"
                    + "            EXEC 'SDSFREE'. \r\n"
                    // Negative tests
                    + "            EXEC 'SDSFERERE' USING {GBR4|1}. \r\n";

    private static final String TEXT_MULTIPLE = "000100 IDENTIFICATION DIVISION.\n"
        + "000200 PROGRAM-ID.    RAOMQP1M.                                           \n"
        + "000300 ENVIRONMENT  DIVISION.\n"
        + "000400 DATA   DIVISION.\n"
        + "000500 WORKING-STORAGE SECTION.\n"
        + "000550 01  {$*SUBSCHEMA-CTRL}.\n"
        + "000560    03  FILLER PIC X(12)   VALUE SPACE.\n"
        + "000570 01  {$*LDSHTI1M-XKB}.\n"
        + "000580    03  FILLER PIC X(12)   VALUE SPACE.\n"
        + "000600 PROCEDURE DIVISION.\n"
        + "000700 {#*S794-000}.\n"
        + "000800 D-B    EXEC 'BSSHTB1M'          USING {$SUBSCHEMA-CTRL}             \n"
        + "000900 D-C    EXEC 'CSSHTI1M'          USING {$SUBSCHEMA-CTRL}             \n"
        + "001000                                       {$LDSHTI1M-XKB}\n";

    @Test
    void test() {
        UseCaseEngine.runTest(
                TEXT,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                null,
                                "Variable GBR4 is not defined",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText())),
                ImmutableList.of(),
                DialectConfigs.getDaCoAnalysisConfig());
    }

    @Test
    void testMultipleParameters() {
        UseCaseEngine.runTest(TEXT_MULTIPLE, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig());
    }
}
