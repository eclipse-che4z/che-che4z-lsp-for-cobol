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
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests the DaCo STRING MATCH statement
 */
class TestDaCoStringMatchStatement {

    private static final String TEXT =
            "        IDENTIFICATION DIVISION. \r\n"
                    + "        PROGRAM-ID. test1. \r\n"
                    + "        DATA DIVISION. \r\n"
                    + "        WORKING-STORAGE SECTION. \r\n"
                    + "        01 {$*WS-AREA}. \r\n"
                    + "           03 {$*AREA-XW1}. \r\n"
                    + "             05 {$*DSAPRO-XL1}. \r\n"
                    + "               07 FILLER               PIC X(5)    VALUE 'REMBD'. \r\n"
                    + "             05 {$*DSAPRO-XL2}. \r\n"
                    + "               07 FILLER               PIC X(5)    VALUE 10. \r\n"
                    + "        PROCEDURE DIVISION. \r\n"
                    + "            STRING MATCH {$DSAPRO-XL1} {$DSAPRO-XL1}. \r\n"
                    + "            STRING MATCH 'SFDFDFDSFF' 'SDFSDSFWE'. \r\n"
                    + "            STRING MATCH {$DSAPRO-XL1} {$DSAPRO-XL1} {$DSAPRO-XL2}. \r\n"
                    + "            STRING MATCH 'SFDFDFDSFF' 'SDFSDSFWE' 10. \r\n"
                    // Negative tests
                    + "            STRING MATCH {GBR4|1} {$DSAPRO-XL1}. \r\n"
                    + "            STRING MATCH {$DSAPRO-XL1} {GBR4|1}. \r\n"
                    + "            STRING MATCH {$DSAPRO-XL1} {$DSAPRO-XL1} {GBR4|1}. \r\n"
                    + "            STRING MATCH {$DSAPRO-XL1} {$DSAPRO-XL1} {256|2}. \r\n";

    @Test
    void test() {

        UseCaseEngine.runTest(
                TEXT,
                ImmutableList.of(),
                ImmutableMap.of(
                        "1",
                        new Diagnostic(
                                new Range(),
                                "Variable GBR4 is not defined",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText()),
                        "2",
                        new Diagnostic(
                                new Range(),
                                "Allowed range is 0 to 255",
                                DiagnosticSeverity.Error,
                                SourceInfoLevels.ERROR.getText())),
                ImmutableList.of(), DialectConfigs.getDaCoAnalysisConfig());
    }
}
