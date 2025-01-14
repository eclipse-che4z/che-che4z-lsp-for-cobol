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

import java.util.HashMap;

/**
 * Test CICS READ command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-read">READ
 * Command</a>
 *
 * <p>This class tests all variations of the READ command found in the link above.
 */

public class TestCicsReadStatement {

    // Test Strings
    private static final String READ_VALID_1 = "READ FILE({$varOne}) UNCOMMITTED INTO({$varOne}) RIDFLD({$varOne}) KEYLENGTH({$varOne}) GENERIC SYSID({$varOne}) LENGTH({$varOne}) DEBKEY EQUAL NOSUSPEND";
    private static final String READ_VALID_2 = "READ FILE({$varOne}) INTO({$varOne}) RIDFLD({$varOne})";

    private static final String READ_INVALID_1 = "READ {_RIDFLD({$varOne}) INTO({$varOne})|errorOne_}";
    private static final String READ_INVALID_2 = "READ {FILE|errorOne}({$varOne}) {DATASET|errorTwo}({$varOne}) RIDFLD({$varOne}) INTO({$varOne})";
    private static final String READ_INVALID_3 = "READ {_FILE({$varOne}) INTO({$varOne}) RIDFLD({$varOne}) GENERIC|errorOne_}";
    private static final String READ_INVALID_4 = "READ FILE({$varOne}) UNCOMMITTED {CONSISTENT|errorOne} INTO({$varOne}) RIDFLD({$varOne}) DEBKEY {RBA|errorTwo} EQUAL {GTEQ|errorThree}";
    private static final String READ_INVALID_5 = "READ {_FILE({$varOne}) INTO({$varOne}) RIDFLD({$varOne}) TOKEN({$varOne} )|errorOne_}";

    // Test Functions
    @Test
    void testReadValid1() {
        CICSTestUtils.noErrorTest(READ_VALID_1);
    }

    @Test
    void testReadValid2() {
        CICSTestUtils.noErrorTest(READ_VALID_2);
    }

    @Test
    void testReadInvalid1() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Exactly one option required, none provided: FILE or DATASET", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READ_INVALID_1, expectedDiagnostics);
    }

    @Test
    void testReadInvalid2() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Exactly one option required, options are mutually exclusive: FILE or DATASET", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorTwo", new Diagnostic(new Range(), "Exactly one option required, options are mutually exclusive: FILE or DATASET", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READ_INVALID_2, expectedDiagnostics);
    }

    @Test
    void testReadInvalid3() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option for: GENERIC without KEYLENGTH", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READ_INVALID_3, expectedDiagnostics);
    }

    @Test
    void testReadInvalid4() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"UNCOMMITTED, CONSISTENT, REPEATABLE or UPDATE\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorTwo", new Diagnostic(new Range(), "Options \"DEBKEY, DEBREC, RBA, RRN or XRBA\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorThree", new Diagnostic(new Range(), "Options \"EQUAL or GTEQ\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READ_INVALID_4, expectedDiagnostics);
    }

    @Test
    void testReadInvalid5() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option for: TOKEN without UPDATE", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READ_INVALID_5, expectedDiagnostics);
    }
}
