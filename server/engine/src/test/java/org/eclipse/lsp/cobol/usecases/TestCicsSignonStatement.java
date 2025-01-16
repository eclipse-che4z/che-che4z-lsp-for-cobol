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
    private static final String SIGNON_VALID_1 = "SIGNON USERID({$varOne}) CHANGETIME({$varOne}) DAYSLEFT({$varOne}) ESMREASON({$varOne}) ESMRESP({$varOne}) EXPIRYTIME({$varOne}) GROUPID({$varOne}) INVALIDCOUNT({$varOne}) LANGUAGECODE({$varOne}) LANGINUSE({$varOne}) LASTUSETIME({$varOne}) NATLANGINUSE({$varOne}) PHRASE({$varOne}) PHRASELEN({$varOne}) NEWPHRASE({$varOne}) NEWPHRASELEN({$varOne}) OIDCARD({$varOne})";
    private static final String SIGNON_VALID_2 = "SIGNON USERID({$varOne})";

    private static final String SIGNONTOKEN_VALID_1 = "SIGNON TOKEN({$varOne}) TOKENLEN({$varOne}) KERBEROS";
    private static final String SIGNONTOKEN_VALID_2 = "SIGNON TOKEN({$varOne}) TOKENLEN({$varOne}) TOKENTYPE({$varOne}) DATATYPE({$varOne}) GROUPID({$varOne}) LANGUAGECODE({$varOne}) LANGINUSE({$varOne}) NATLANGINUSE({$varOne}) ESMREASON({$varOne}) ESMRESP({$varOne})";

    private static final String SIGNON_INVALID_1 = "SIGNON {_CHANGETIME({$varOne})|errorOne_}";
    private static final String SIGNON_INVALID_2 = "SIGNON USERID({$varOne}) PASSWORD({$varOne}) {PHRASE|errorOne}({$varOne})";

    private static final String SIGNONTOKEN_INVALID_1 = "SIGNON TOKEN({$varOne}) TOKENLEN({$varOne}) {TOKENTYPE|errorOne}({$varOne}) {KERBEROS|errorTwo}";
    private static final String SIGNONTOKEN_INVALID_2 = "SIGNON TOKEN({$varOne}) TOKENLEN({$varOne}) TOKENTYPE({$varOne}) BIT {BASE64|errorOne}";

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
