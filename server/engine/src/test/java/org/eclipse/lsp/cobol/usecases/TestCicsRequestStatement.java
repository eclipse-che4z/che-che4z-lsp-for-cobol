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
 * <p>This class tests all variations of the CONVERSE command found in the link above.
 */
public class TestCicsRequestStatement {

    // Test Strings
    private static final String ENCRYPTPTKT_VALID_1 = "REQUEST ENCRYPTPTKT(123) FLENGTH(3) ENCRYPTKEY(123) ESMAPPNAME(123) ESMREASON(123) ESMRESP(123)";
    private static final String ENCRYPTPTKT_VALID_2 = "REQUEST ENCRYPTPTKT(123) FLENGTH(3) ENCRYPTKEY(123) ESMAPPNAME(123)";

    private static final String PASSTICKET_VALID_1 = "REQUEST PASSTICKET(123) ESMAPPNAME(123) ESMRESP(123) ESMREASON(123)";
    private static final String PASSTICKET_VALID_2 = "REQUEST PASSTICKET(123) ESMAPPNAME(123)";

    // Invalid Test Strings
    private static final String ENCRYPTPTKT_INVALID = "REQUEST {ENCRYPTPTKT(123) ENCRYPTKEY(123) ESMAPPNAME(123)|errorOne}";
    private static final String PASSTICKET_INVALID = "REQUEST {PASSTICKET(123) ESMREASON(123)|errorOne}";

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
}
