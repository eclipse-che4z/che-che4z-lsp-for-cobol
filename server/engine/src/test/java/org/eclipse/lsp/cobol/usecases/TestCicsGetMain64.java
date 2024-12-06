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

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

/**
 * Test CICS GETMAIN64 command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-getmain64">GETMAIN64
 * Command</a>
 *
 * <p>This class tests all variations of the GETMAIN64 command found in the link above.
 */
public class TestCicsGetMain64 {
    private static final String ALL_VALID_ONE = "GETMAIN64 SET({$varOne}) FLENGTH({$varTwo})  LOCATION({$varThree}) EXECUTABLE SHARED NOSUSPEND USERDATAKEY";
    private static final String ALL_VALID_TWO = "GETMAIN64 FLENGTH({$varTwo}) SHARED EXECUTABLE LOCATION({$varTwo}) NOSUSPEND CICSDATAKEY SET({$varOne})";

    private static final String SOME_VALID_ONE = "GETMAIN64 FLENGTH({$varThree}) SHARED CICSDATAKEY SET({$varOne}) LOCATION({$varTwo})";
    private static final String SOME_VALID_TWO = "GETMAIN64 NOSUSPEND FLENGTH({$varThree}) SET({$varOne}) LOCATION({$varTwo}) EXECUTABLE";
    private static final String SOME_VALID_THREE = "GETMAIN64 SET({$varOne}) NOSUSPEND FLENGTH({$varTwo}) USERDATAKEY";

    private static final String BARE_VALID = "GETMAIN64 FLENGTH({$varTwo}) SET({$varOne})";

    private static final String INVALID_ONE = "GETMAIN64 SET({$varTwo}) FLENGTH({$varThree}) {EXECUTABLE|error1} SHARED";
    private static final String INVALID_TWO = "GETMAIN64 {USERDATAKEY|error1} FLENGTH({$varTwo}) SET({$varOne}) {CICSDATAKEY|error1}";

    @Test
    void testAllValidOne() {
        CICSTestUtils.noErrorTest(ALL_VALID_ONE);
    }

    @Test
    void testAllValidTwo() {
        CICSTestUtils.noErrorTest(ALL_VALID_TWO);
    }

    @Test
    void testSomeValidOne() {
        CICSTestUtils.noErrorTest(SOME_VALID_ONE);
    }

    @Test
    void testSomeValidTwo() {
        CICSTestUtils.noErrorTest(SOME_VALID_TWO);
    }

    @Test
    void testSomeValidThree() {
        CICSTestUtils.noErrorTest(SOME_VALID_THREE);
    }

    @Test
    void testBareValidOne() {
        CICSTestUtils.noErrorTest(BARE_VALID);
    }

    @Test
    void testInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: EXECUTABLE without LOCATION",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_ONE, expectedDiagnostic);
    }

    @Test
    void testInvalidTwo() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: USERDATAKEY or CICSDATAKEY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_TWO, expectedDiagnostic);
    }
}
