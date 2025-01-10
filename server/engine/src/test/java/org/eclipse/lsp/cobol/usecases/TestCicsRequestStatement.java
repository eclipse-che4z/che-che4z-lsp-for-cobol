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
 * Test CICS REQUEST commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-request-passticket">REQUEST PASSTICKET
 * Command</a>
 *
 * <p>This class tests all variations of the REQUEST command found in the link above.
 */
public class TestCicsRequestStatement {

    // Test Strings
    private static final String ENCRYPTPTKT_VALID_1 = "REQUEST ENCRYPTPTKT({$varOne}) FLENGTH({$varOne}) ENCRYPTKEY({$varOne}) ESMAPPNAME({$varOne}) ESMREASON({$varOne}) ESMRESP({$varOne})";
    private static final String ENCRYPTPTKT_VALID_2 = "REQUEST ENCRYPTPTKT({$varOne}) FLENGTH({$varOne}) ENCRYPTKEY({$varOne}) ESMAPPNAME({$varOne})";

    private static final String PASSTICKET_VALID_1 = "REQUEST PASSTICKET({$varOne}) ESMAPPNAME({$varOne}) ESMRESP({$varOne}) ESMREASON({$varOne})";
    private static final String PASSTICKET_VALID_2 = "REQUEST PASSTICKET({$varOne}) ESMAPPNAME({$varOne})";

    // Invalid Test Strings
    private static final String ENCRYPTPTKT_INVALID = "REQUEST {_ENCRYPTPTKT({$varOne}) ENCRYPTKEY({$varTwo}) ESMAPPNAME({$varThree})|errorOne_}";
    private static final String PASSTICKET_INVALID = "REQUEST {_PASSTICKET({$varOne}) ESMREASON({$varOne})|errorOne_}";
    private static final String BOTH_MISSING_INVALID = "REQUEST {|errorOne}{NORESP|errorTwo}";

    @Test
    void testEncryptptkt() {
        CICSTestUtils.noErrorTest(ENCRYPTPTKT_VALID_1);
        CICSTestUtils.noErrorTest(ENCRYPTPTKT_VALID_2);
    }

    @Test
    void testPassticket() {
        CICSTestUtils.noErrorTest(PASSTICKET_VALID_1);
        CICSTestUtils.noErrorTest(PASSTICKET_VALID_2);
    }

    // Invalid Tests
    @Test
    void testEncryptptktInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option: FLENGTH", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ENCRYPTPTKT_INVALID, expectedDiagnostics);
    }

    @Test
    void testPassticketInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option: ESMAPPNAME", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PASSTICKET_INVALID, expectedDiagnostics);
    }

    @Test
    void testBothMissingInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Exactly one option required, none provided: ENCRYPTPTKT or PASSTICKET", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorTwo", new Diagnostic(new Range(), "Syntax error on 'NORESP'", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(BOTH_MISSING_INVALID, expectedDiagnostics);
    }
}
