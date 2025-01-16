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
 * Test GET64 CONTAINER commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-get64-container">GET64 CONTAINER
 * Command</a>
 *
 * <p>This class tests all variations of the GET64 CONTAINER command found in the link above.
 */
public class TestCicsGet64ContainerStatement {

    // Test Strings
    private static final String GET64CONTAINER_VALID_1 = "GET64 CONTAINER({$varOne}) INTO({$varOne}) FLENGTH({$varOne}) BYTEOFFSET({$varOne}) CONVERTST({$varOne}) CCSID({$varOne})";
    private static final String GET64CONTAINER_VALID_2 = "GET64 CONTAINER({$varOne}) NODATA FLENGTH({$varOne})";

    private static final String GET64CONTAINER_INVALID_1 = "GET64 CONTAINER({$varOne}) INTO({$varOne}) {NODATA|errorOne} FLENGTH({$varOne})";
    private static final String GET64CONTAINER_INVALID_2 = "GET64 CONTAINER({$varOne}) NODATA FLENGTH({$varOne}) {BYTEOFFSET|errorOne}({$varOne})";
    private static final String GET64CONTAINER_INVALID_3 = "GET64 {_CONTAINER({$varOne}) NODATA FLENGTH({$varOne}) CCSID({$varOne} )|errorOne_}";
    private static final String GET64CONTAINER_INVALID_4 = "GET64 CONTAINER({$varOne}) INTO({$varOne}) FLENGTH({$varOne}) BYTEOFFSET({$varOne}) {CONVERTST|errorOne}({$varOne}) INTOCODEPAGE({$varOne}) CCSID({$varOne})";;

    // Test Functions
    @Test
    void testCicsGet64ContainerValid() {
        CICSTestUtils.noErrorTest(GET64CONTAINER_VALID_1);
        CICSTestUtils.noErrorTest(GET64CONTAINER_VALID_2);
    }

    // Invalid Tests
    @Test
    void testCicsGet64ContainerInvalid_1() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"INTO, SET or NODATA\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(GET64CONTAINER_INVALID_1, expectedDiagnostics);
    }

    @Test
    void testCicsGet64ContainerInvalid_2() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Invalid option provided: BYTEOFFSET", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(GET64CONTAINER_INVALID_2, expectedDiagnostics);
    }

    @Test
    void testCicsGet64ContainerInvalid_3() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option for: CCSID without CONVERTST", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(GET64CONTAINER_INVALID_3, expectedDiagnostics);
    }

    @Test
    void testCicsGet64ContainerInvalid_4() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"INTOCCSID, INTOCODEPAGE or CONVERTST\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(GET64CONTAINER_INVALID_4, expectedDiagnostics);
    }

}
