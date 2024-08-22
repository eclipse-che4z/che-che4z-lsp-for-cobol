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
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Tests the DAF Show Result statement with paragraph
 */
class TestDaCoShowResultStatementWithParagraph {

    private static final String TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. test1.\n"
                    + "       ENVIRONMENT DIVISION.\n"
                    + "       IDMS-CONTROL SECTION.\n"
                    + "           PROTOCOL. MODE ABC.\n"
                    + "           IDMS-RECORDS MANUAL\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "           IF TRUE \n"
                    + "               SHOW RESULT QMES.\n"
                    + "       {#*S157-999}.";

    @Test
    void test() {
        UseCaseEngine.runTest(
                TEXT,
                ImmutableList.of(),
                ImmutableMap.of(),
                ImmutableList.of(),
                DialectConfigs.getDaCoAnalysisConfig());
    }
}
