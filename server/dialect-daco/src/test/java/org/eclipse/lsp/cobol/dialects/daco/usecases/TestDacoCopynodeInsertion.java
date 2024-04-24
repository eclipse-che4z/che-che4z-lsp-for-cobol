/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** Tests right insertion of {@link org.eclipse.lsp.cobol.dialects.daco.nodes.DaCoCopyNode} */
public class TestDacoCopynodeInsertion {
    public static final String TEXT =
            "000200 IDENTIFICATION DIVISION.\n"
                    + "000300 PROGRAM-ID.    TEST12.\n"
                    + "006700 ENVIRONMENT  DIVISION.\n"
                    + "006800 IDMS-CONTROL SECTION.\n"
                    + "006900 PROTOCOL.    MODE IS IDMS-DC-NONAUTO DEBUG\n"
                    + "007000              IDMS-RECORDS MANUAL.\n"
                    + "007100 CONFIGURATION    SECTION.\n"
                    + "007200 OBJECT-COMPUTER. IBM-370.\n"
                    + "007300 DATA   DIVISION.\n"
                    + "007400 WORKING-STORAGE SECTION.\n"
                    + "007500 01  {$*WS-AREA}.\n"
                    + "053500     03 {$*AREA-XWE}.                                                \n"
                    + "053600       05 COPY MAID {~TESTCPY!DaCo} KMK.                                \n"
                    + "055300 01  COPY IDMS {~SUBSCHEMA-NAMES!IDMS}.";

    public static final String COPYBOOK_CONTENT =
            "     1 01  {$*TEST-X`TEST-XWE}.          \n"
                    + "     2     03 {$*TEST1-X`TEST1-XWE}                 PIC X(4)    VALUE SPACE.";

    private static final String SUBSCHEMA_NAMES =
            "      *   * This copybook remains empty,\n"
                    + "      *   * because the content is of no interest while editing COBOL\n"
                    + "       01  FILLER                      PIC X(0).\n";

    @Test
    void test() {
        UseCaseEngine.runTest(
                TEXT,
                ImmutableList.of(
                        new CobolText("TESTCPY", DaCoDialect.NAME, COPYBOOK_CONTENT),
                        new CobolText("SUBSCHEMA-NAMES", IdmsDialect.NAME, SUBSCHEMA_NAMES, "url", true)),
                ImmutableMap.of(),
                ImmutableList.of(),
                DialectConfigs.getDaCoAnalysisConfig());
    }
}
