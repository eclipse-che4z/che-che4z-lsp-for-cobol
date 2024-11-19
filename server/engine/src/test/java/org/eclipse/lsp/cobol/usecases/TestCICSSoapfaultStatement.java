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

package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.*;

/**
 * Test CICS WEB command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">WEB
 * Command</a>
 *
 * <p>This class tests all variations of the WEB command found in the link above.
 */

public class TestCICSSoapfaultStatement {
    // Main Building Blocks
    private static final String BASE_TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. ABCDEF.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "            EXEC CICS \n"
                    + "            END-EXEC.";

    // Test Strings
    private static final String SOAPFAULT_DELETE_VALID = "SOAPFAULT DELETE";

    private static final String SOAPFAULT_ADD_1 = "SOAPFAULT ADD FAULTSTRING(123) FAULTSTRLEN(123) NATLANG(123) FROMCCSID(123)";
    private static final String SOAPFAULT_ADD_2 = "SOAPFAULT ADD FAULTSTRING(123)";

    private static final String SOAPFAULT_CREATE_1 = "SOAPFAULT CREATE FAULTCODE(123) FAULTSTRING(123) FAULTSTRLEN(123) NATLANG(123) ROLE(123) ROLELENGTH(123) FAULTACTOR(123) FAULTACTLEN(123) DETAIL(123) DETAILLENGTH(123) FROMCCSID(123)";
    private static final String SOAPFAULT_CREATE_2 = "SOAPFAULT CREATE CLIENT FAULTSTRING(123)";

    // Invalid Tests
    private static final String SOAPFAULT_DELETE_INVALID = "SOAPFAULT DELETE {FILE|errorOne}(123)";

    // Utility Functions
    private static void noErrorTest(String newCommand) {
        UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), ImmutableMap.of());
    }

    private static String getTestString(String newCommand) {
        List<String> instances = Arrays.asList(newCommand.split("\\s"));
        instances.replaceAll(String.join("", Collections.nCopies(12, " "))::concat);
        ArrayList<String> base = new ArrayList<String>(Arrays.asList(BASE_TEXT.split("\n")));
        base.addAll(base.size() - 1, instances);
        return String.join("\n", base);
    }

    // Valid Test Cases
    @Test
    void testDelete() {
        noErrorTest(SOAPFAULT_DELETE_VALID);
    }

    @Test
    void testAdd() {
        noErrorTest(SOAPFAULT_ADD_1);
        noErrorTest(SOAPFAULT_ADD_2);
    }

    @Test
    void testCreate() {
        noErrorTest(SOAPFAULT_CREATE_1);
        noErrorTest(SOAPFAULT_CREATE_2);
    }


    @Test
    void testDeleteInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Extraneous input FILE", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SOAPFAULT_DELETE_INVALID, expectedDiagnostics);
    }
}
