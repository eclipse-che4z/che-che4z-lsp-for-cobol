/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.usecases;

import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** These test for variations of valid IDMS-CONTROL SECTION definitions */
class TestIdmsControlSectionAll {

    private static final String MESSAGE_1 = "The length 17 is not allowed. Allowed values are 16, 18.";

    private static final String BOILERPLATE =
            "        IDENTIFICATION DIVISION. \r\n"
                    + "        PROGRAM-ID. test1.\r\n"
                    + "        ENVIRONMENT DIVISION.\r\n"
                    + "        IDMS-CONTROL SECTION.\r\n";

    private static final String IDMSCS_WITH_ALL_CLAUSES =
            "            PROTOCOL. MODE ABC\r\n"
                    + "            SUBSCHEMA-NAMES LENGTH 18\r\n"
                    + "            IDMS-RECORDS WITHIN WORKING-STORAGE";

    private static final String IDMSCS_WITH_ALL_CLAUSES_PUNCT =
            "            PROTOCOL. MODE ABC.\r\n"
                    + "            IDMS-RECORDS WITHIN LINKAGE,\r\n"
                    + "            SUBSCHEMA-NAMES LENGTH 18;";

    private static final String IDMSCS_WITH_SSN_IDMSREC =
            "            PROTOCOL. SUBSCHEMA-NAMES LENGTH IS 16\r\n"
                    + "            IDMS-RECORDS WITHIN WORKING-STORAGE LEVELS INCREMENTED 18";

    private static final String IDMSCS_WITH_ONLY_PROTOCOL =
            "            PROTOCOL.";

    private static final String IDMSCS_WITH_SSN_LEN_ERROR =
            "            PROTOCOL. \r\n"
                    + "            SUBSCHEMA-NAMES LENGTH IS {17|1}\r\n"
                    + "            IDMS-RECORDS WITHIN WORKING-STORAGE LEVELS INCREMENTED 18";

    private static Stream<String> textsToTest() {
        return Stream.of(
                BOILERPLATE + IDMSCS_WITH_ALL_CLAUSES, BOILERPLATE + IDMSCS_WITH_ALL_CLAUSES_PUNCT, BOILERPLATE + IDMSCS_WITH_SSN_IDMSREC,
                BOILERPLATE + IDMSCS_WITH_ONLY_PROTOCOL, BOILERPLATE + IDMSCS_WITH_SSN_LEN_ERROR);
    }

    @ParameterizedTest
    @MethodSource("textsToTest")
    @DisplayName("Parameterized - varying tests")
    void test(String text) {
        UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of("1",
                new Diagnostic(null, MESSAGE_1, DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())));
    }
}
