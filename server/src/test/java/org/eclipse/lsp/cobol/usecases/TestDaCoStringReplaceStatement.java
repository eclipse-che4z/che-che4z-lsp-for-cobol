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
 * Tests the DaCo STRING REPLACE statement
 */
class TestDaCoStringReplaceStatement {

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
                    + "            STRING REPLACE ALL {$DSAPRO-XL1} {$DSAPRO-XL1} BY {$DSAPRO-XL1}. \r\n"
                    + "            STRING REPLACE {$DSAPRO-XL1} {$DSAPRO-XL1} BY {$DSAPRO-XL1}. \r\n"
                    + "            STRING REPLACE ALL {$DSAPRO-XL1} 'SFSDFER' BY 'FERE'. \r\n"
                    + "            STRING REPLACE {$DSAPRO-XL1} 'DFDERE' BY 'FD'. \r\n"
                    // Negative tests
                    + "            STRING REPLACE {GBR4|1} {$DSAPRO-XL1} BY {$DSAPRO-XL1}. \r\n"
                    + "            STRING REPLACE ALL {GBR4|1} {$DSAPRO-XL1} BY {$DSAPRO-XL1}. \r\n"
                    + "            STRING REPLACE {$DSAPRO-XL1} {GBR4|1} BY {$DSAPRO-XL1}. \r\n"
                    + "            STRING REPLACE ALL {$DSAPRO-XL1} {GBR4|1} BY {$DSAPRO-XL1}. \r\n"
                    + "            STRING REPLACE {$DSAPRO-XL1} {$DSAPRO-XL1} BY {GBR4|1}. \r\n"
                    + "            STRING REPLACE ALL {$DSAPRO-XL1} {$DSAPRO-XL1} BY {GBR4|1}. \r\n";

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
                ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
    }
}
