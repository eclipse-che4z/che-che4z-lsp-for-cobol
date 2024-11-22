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
 * Test CICS GETMAIN command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-getmain">GETMAIN
 * Command</a>
 *
 * <p>This class tests all variations of the GETMAIN command found in the link above.
 */
public class TestCicsGetMain {
    private static final String ALL_VALID_ONE = "GETMAIN SET(1) FLENGTH(2) BELOW INITIMG(3) EXECUTABLE SHARED NOSUSPEND USERDATAKEY";
    private static final String ALL_VALID_TWO = "GETMAIN LENGTH(2) SHARED EXECUTABLE INITIMG(2) NOSUSPEND USERDATAKEY SET(1)";
    private static final String ALL_VALID_THREE = "GETMAIN CICSDATAKEY NOSUSPEND SHARED FLENGTH(2) SET(1) EXECUTABLE INITIMG(2) BELOW";

    private static final String SOME_VALID_ONE = "GETMAIN BELOW FLENGTH(3) SHARED CICSDATAKEY SET(1)";
    private static final String SOME_VALID_TWO = "GETMAIN NOSUSPEND LENGTH(3) SET(1) INITIMG(2) EXECUTABLE";
    private static final String SOME_VALID_THREE = "GETMAIN SET(1) EXECUTABLE FLENGTH(2) USERDATAKEY";

    private static final String BARE_VALID_ONE = "GETMAIN LENGTH(2) SET(1)";
    private static final String BARE_VALID_TWO = "GETMAIN SET(1) FLENGTH(2)";

    private static final String INVALID_ONE = "GETMAIN SET(2) LENGTH(3) {BELOW|error1} SHARED";
    private static final String INVALID_TWO = "GETMAIN {LENGTH|error1}(2) SET(1) {FLENGTH|error1}(2) NOSUSPEND";
    private static final String INVALID_THREE = "GETMAIN {USERDATAKEY|error1} FLENGTH(2) SET(1) BELOW {CICSDATAKEY|error1}";

    @Test
    void testAllValidOne() {
        CICSTestUtils.noErrorTest(ALL_VALID_ONE);
    }

    @Test
    void testAllValidTwo() {
        CICSTestUtils.noErrorTest(ALL_VALID_TWO);
    }

    @Test
    void testAllValidThree() {
        CICSTestUtils.noErrorTest(ALL_VALID_THREE);
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
        CICSTestUtils.noErrorTest(BARE_VALID_ONE);
    }

    @Test
    void testBareValidTwo() {
        CICSTestUtils.noErrorTest(BARE_VALID_TWO);
    }

    @Test
    void testInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: BELOW without FLENGTH",
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
                                "Exactly one option required, options are mutually exclusive: FLENGTH or LENGTH",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_TWO, expectedDiagnostic);
    }

    @Test
    void testInvalidThree() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: USERDATAKEY or CICSDATAKEY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_THREE, expectedDiagnostic);
    }
}
