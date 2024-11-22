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
 * Test CICS XCTL command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-xctl">XCTL
 * Command</a>
 *
 * <p>This class tests all variations of the XCTL command found in the link above.
 */
public class TestCicsXctl {
    private static final String ALL_OPTIONS_VALID_ONE = "XCTL PROGRAM(1) COMMAREA(2) LENGTH(4) INPUTMSG(5) INPUTMSGLEN(6)";
    private static final String ALL_OPTIONS_VALID_TWO = "XCTL PROGRAM(1) CHANNEL(3) INPUTMSG(5) INPUTMSGLEN(6)";

    private static final String SOME_OPTIONS_VALID_ONE = "XCTL PROGRAM(1) CHANNEL(3) INPUTMSG(5)";
    private static final String SOME_OPTIONS_VALID_TWO = "XCTL PROGRAM(1) COMMAREA(4) INPUTMSG(5) INPUTMSGLEN(6)";

    private static final String BARE_VALID = "XCTL PROGRAM(1)";

    private static final String INVALID_ONE = "XCTL PROGRAM(1) {COMMAREA|error1}(2) {CHANNEL|error1}(3) LENGTH(4) INPUTMSG(5) INPUTMSGLEN(6)";
    private static final String INVALID_TWO = "XCTL PROGRAM(1) CHANNEL(3) {INPUTMSGLEN|error1}(6)";
    private static final String INVALID_THREE = "XCTL PROGRAM(1) {LENGTH|error1}(3)";

    @Test
    void testAllOptionsValidOne() {
        CICSTestUtils.noErrorTest(ALL_OPTIONS_VALID_ONE);
    }

    @Test
    void testAllOptionsValidTwo() {
        CICSTestUtils.noErrorTest(ALL_OPTIONS_VALID_TWO);
    }

    @Test
    void testSomeOptionsValidOne() {
        CICSTestUtils.noErrorTest(SOME_OPTIONS_VALID_ONE);
    }

    @Test
    void testSomeOptionsValidTwo() {
        CICSTestUtils.noErrorTest(SOME_OPTIONS_VALID_TWO);
    }

    @Test
    void testBareValid() {
        CICSTestUtils.noErrorTest(BARE_VALID);
    }

    @Test
    void testInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: COMMAREA or CHANNEL",
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
                                "Invalid option provided: INPUTMSGLEN without INPUTMSG",
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
                                "Invalid option provided: LENGTH without COMMAREA",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_THREE, expectedDiagnostic);
    }
}
