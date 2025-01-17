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
 * Test CICS PUT CONTAINER command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-put-container-channel">PUT CONTAINER
 * Command</a>
 *
 * <p>This class tests all variations of the CONVERSE command found in the link above.
 */
public class TestCicsPutContainerStatement {

    // Test Strings
    private static final String PUT_BTS_VALID_1 = "PUT CONTAINER({$varOne}) ACTIVITY({$varOne}) FROM({$varOne}) FLENGTH({$varOne})";
    private static final String PUT_BTS_VALID_2 = "PUT CONTAINER({$varOne}) ACQACTIVITY FROM({$varOne})";

    private static final String PUT_CHANNEL_VALID_1 = "PUT CONTAINER({$varOne}) CHANNEL({$varOne}) FROM({$varOne}) FLENGTH({$varOne}) BIT FROMCCSID({$varOne}) APPEND";
    private static final String PUT_CHANNEL_VALID_2 = "PUT CONTAINER({$varOne}) FROM({$varOne})";
    private static final String PUT64_CHANNEL = "{PUT64|errorOne} CONTAINER({$varOne}) FROM({$varOne})";

    private static final String PUT_BTS_INVALID = "PUT CONTAINER({$varOne}) ACTIVITY({$varOne}) {ACQACTIVITY|errorOne} FROM({$varOne}) FLENGTH({$varOne})";
    private static final String PUT_CHANNEL_INVALID = "PUT CONTAINER({$varOne}) CHANNEL({$varOne}) FROM({$varOne}) FLENGTH({$varOne}) BIT {DATATYPE|errorOne}({$varOne}) APPEND";
    private static final String PUT_BTS_INVALID_2 = "PUT {_CONTAINER({$varOne}) ACQACTIVITY|errorOne_}";

    // Test Functions
    @Test
    void testBTSValid() {
        CICSTestUtils.noErrorTest(PUT_BTS_VALID_1);
        CICSTestUtils.noErrorTest(PUT_BTS_VALID_2);
    }

    @Test
    void testChannelValid() {
        CICSTestUtils.noErrorTest(PUT_CHANNEL_VALID_1);
        CICSTestUtils.noErrorTest(PUT_CHANNEL_VALID_2);
    }

    // Invalid Tests
    @Test
    void testPut64() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Invalid option provided: PUT64 is only available in Assembly", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PUT64_CHANNEL, expectedDiagnostics);
    }

    @Test
    void testBTSInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"ACTIVITY, ACQACTIVITY, PROCESS or ACQPROCESS\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PUT_BTS_INVALID, expectedDiagnostics);
    }

    @Test
    void testBTSInvalid2() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option: FROM", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PUT_BTS_INVALID_2, expectedDiagnostics);
    }

    @Test
    void testChannelInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"BIT, DATATYPE or CHAR\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PUT_CHANNEL_INVALID, expectedDiagnostics);
    }
}
