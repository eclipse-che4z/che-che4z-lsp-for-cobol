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
 * Test SIGNON commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-signon">SIGNON
 * Command</a>
 *
 * <p>This class tests all variations of the SIGNON command found in the link above.
 */
public class TestCicsSignonStatement {

    // Test Strings
    private static final String SIGNON_VALID_1 = "SIGNON USERID(123) CHANGETIME(123) DAYSLEFT(999) ESMREASON(123) ESMRESP(123) EXPIRYTIME(123) GROUPID(568) INVALIDCOUNT(2) LANGUAGECODE(123) LANGINUSE(1) LASTUSETIME(123) NATLANGINUSE(123) PHRASE(3) PHRASELEN(3) NEWPHRASE(123) NEWPHRASELEN(123) OIDCARD(123)";
    private static final String SIGNON_VALID_2 = "SIGNON USERID(123)";

    private static final String SIGNONTOKEN_VALID_1 = "SIGNON TOKEN(123) TOKENLEN(123) KERBEROS";
    private static final String SIGNONTOKEN_VALID_2 = "SIGNON TOKEN(123) TOKENLEN(123) TOKENTYPE(1) DATATYPE(1) GROUPID(1) LANGUAGECODE(1) LANGINUSE(1) NATLANGINUSE(1) ESMREASON(1) ESMRESP(1)";

    private static final String SIGNON_INVALID_1 = "SIGNON {CHANGETIME(123)|errorOne}";
    private static final String SIGNON_INVALID_2 = "SIGNON USERID(123) PASSWORD(123) {PHRASE|errorOne}(123)";

    private static final String SIGNONTOKEN_INVALID_1 = "SIGNON TOKEN(123) TOKENLEN(123) {TOKENTYPE|errorOne}(1) {KERBEROS|errorTwo}";
    private static final String SIGNONTOKEN_INVALID_2 = "SIGNON TOKEN(123) TOKENLEN(123) TOKENTYPE(1) BIT {BASE64|errorOne}";

    // Test Functions
    @Test
    void testCicsSignonValid() {
        CICSTestUtils.noErrorTest(SIGNON_VALID_1);
        CICSTestUtils.noErrorTest(SIGNON_VALID_2);
    }

    @Test
    void testCicsSignonTokenValid() {
        CICSTestUtils.noErrorTest(SIGNONTOKEN_VALID_1);
        CICSTestUtils.noErrorTest(SIGNONTOKEN_VALID_2);
    }

    // Invalid Tests
    @Test
    void testCicsSignonInvalid_1() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option: USERID", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SIGNON_INVALID_1, expectedDiagnostics);
    }

    @Test
    void testCicsSignonInvalid_2() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"PASSWORD or PHRASE\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SIGNON_INVALID_2, expectedDiagnostics);
    }

    @Test
    void testCicsSignonTokenInvalid_1() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Exactly one option required, options are mutually exclusive: TOKENTYPE or KERBEROS", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorTwo", new Diagnostic(new Range(), "Exactly one option required, options are mutually exclusive: TOKENTYPE or KERBEROS", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SIGNONTOKEN_INVALID_1, expectedDiagnostics);
    }

    @Test
    void testCicsSignonTokenInvalid_2() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"BIT, DATATYPE or BASE64\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SIGNONTOKEN_INVALID_2, expectedDiagnostics);
    }

}
