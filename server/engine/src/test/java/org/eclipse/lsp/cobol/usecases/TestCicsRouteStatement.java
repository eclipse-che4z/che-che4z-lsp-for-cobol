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
 * Test ROUTE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-route">ROUTE
 * Command</a>
 *
 * <p>This class tests all variations of the ROUTE command found in the link above.
 */
public class TestCicsRouteStatement {

    // Test Strings
    private static final String ROUTE_VALID_1 = "ROUTE AFTER HOURS({$varOne}) MINUTES({$varOne}) SECONDS({$varOne}) ERRTERM({$varOne}) TITLE({$varOne}) LIST({$varOne}) OPCLASS({$varOne}) REQID({$varOne}) LDC({$varOne}) NLEOM";
    private static final String ROUTE_VALID_2 = "ROUTE";

    private static final String ROUTE_INVALID_1 = "ROUTE INTERVAL({$varOne}) {AFTER|errorOne} HOURS({$varOne})";
    private static final String ROUTE_INVALID_2 = "ROUTE {AFTER|errorOne}";

    // Test Functions
    @Test
    void testCicsRouteValid() {
        CICSTestUtils.noErrorTest(ROUTE_VALID_1);
        CICSTestUtils.noErrorTest(ROUTE_VALID_2);
    }

    // Invalid Tests
    @Test
    void testCicsRouteInvalid_1() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"INTERVAL, TIME, AFTER or AT\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ROUTE_INVALID_1, expectedDiagnostics);
    }

    @Test
    void testCicsRouteInvalid_2() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Must include one or more of the following: HOURS, MINUTES or SECONDS", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ROUTE_INVALID_2, expectedDiagnostics);
    }

}
