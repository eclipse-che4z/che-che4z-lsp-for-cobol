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
 * Test REWRITE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-rewrite">REWRITE
 * Command</a>
 *
 * <p>This class tests all variations of the REWRITE command found in the link above.
 */
public class TestCicsRewriteStatement {

    // Test Strings
    private static final String REWRITE_VALID_1 = "REWRITE FILE({$varOne}) TOKEN({$varOne}) FROM({$varOne}) SYSID({$varOne}) LENGTH({$varOne}) NOSUSPEND";
    private static final String REWRITE_VALID_2 = "REWRITE FILE({$varOne}) FROM({$varOne})";

    private static final String REWRITE_INVALID_1 = "REWRITE {_FILE({$varOne})|errorOne_}";
    private static final String REWRITE_INVALID_2 = "REWRITE {_FROM({$varOne})|errorOne_}";

    // Test Functions
    @Test
    void testCicsRewriteValid() {
        CICSTestUtils.noErrorTest(REWRITE_VALID_1);
        CICSTestUtils.noErrorTest(REWRITE_VALID_2);
    }

    // Invalid Tests
    @Test
    void testCicsRewriteInvalid_1() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option: FROM", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(REWRITE_INVALID_1, expectedDiagnostics);
    }

    @Test
    void testCicsRewriteInvalid_2() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Exactly one option required, none provided: FILE or DATASET", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(REWRITE_INVALID_2, expectedDiagnostics);
    }

}
