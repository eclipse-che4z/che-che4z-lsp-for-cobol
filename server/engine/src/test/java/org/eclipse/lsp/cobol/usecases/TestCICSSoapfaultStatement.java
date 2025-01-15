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

import org.eclipse.lsp.cobol.common.error.ErrorSource;
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
    // Test Strings
    private static final String SOAPFAULT_DELETE_VALID = "SOAPFAULT DELETE";

    private static final String SOAPFAULT_ADD_1 = "SOAPFAULT ADD FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne}) NATLANG({$varOne}) FROMCCSID({$varOne})";
    private static final String SOAPFAULT_ADD_2 = "SOAPFAULT ADD FAULTSTRING({$varOne})";

    private static final String SOAPFAULT_CREATE_1 = "SOAPFAULT CREATE FAULTCODE({$varOne}) FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne}) NATLANG({$varOne}) ROLE({$varOne}) ROLELENGTH({$varOne}) FAULTACTOR({$varOne}) FAULTACTLEN({$varOne}) DETAIL({$varOne}) DETAILLENGTH({$varOne}) FROMCCSID({$varOne})";
    private static final String SOAPFAULT_CREATE_2 = "SOAPFAULT CREATE CLIENT FAULTSTRING({$varOne})";

    // Invalid Tests
    private static final String SOAPFAULT_DELETE_INVALID = "SOAPFAULT DELETE {CLIENT|errorOne}";
    private static final String SOAPFAULT_ADD_INVALID = "SOAPFAULT ADD FAULTSTRING({$varOne}) {SUBCODESTR|errorOne}({$varOne})";
    private static final String SOAPFAULT_CREATE_INVALID = "SOAPFAULT CREATE {CLIENT|errorOne} FAULTCODESTR({$varOne}) FAULTSTRING({$varOne})";

    // Valid Test Cases
    @Test
    void testDelete() {
        CICSTestUtils.noErrorTest(SOAPFAULT_DELETE_VALID);
    }

    @Test
    void testAdd() {
        CICSTestUtils.noErrorTest(SOAPFAULT_ADD_1);
        CICSTestUtils.noErrorTest(SOAPFAULT_ADD_2);
    }

    @Test
    void testCreate() {
        CICSTestUtils.noErrorTest(SOAPFAULT_CREATE_1);
        CICSTestUtils.noErrorTest(SOAPFAULT_CREATE_2);
    }

    // Invalid Tests
    @Test
    void testDeleteInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Extraneous input CLIENT", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SOAPFAULT_DELETE_INVALID, expectedDiagnostics);
    }

    @Test
    void testAddInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"FAULTSTRING or SUBCODESTR\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SOAPFAULT_ADD_INVALID, expectedDiagnostics);
    }

    @Test
    void testCreateInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"FAULTCODESTR, CLIENT, SERVER, SENDER or RECEIVER\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SOAPFAULT_CREATE_INVALID, expectedDiagnostics);
    }
}
