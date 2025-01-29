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

/**
 * Test CICS ACQUIRE TERMINAL system command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-acquire-terminal">
 * ACQUIRE TERMINAL</a>
 *
 * <p>This class tests all variations of the ACQUIRE TERMINAL command found in the link above.
 */
public class TestCicsAcquireTerminal {
    private static final String BARE_VALID = "ACQUIRE TERMINAL({$varOne})";
    private static final String SOME_VALID_ONE = "ACQUIRE TERMINAL({$varOne}) NOQUEUE";
    private static final String SOME_VALID_TWO = "ACQUIRE TERMINAL({$varOne}) USERDATA({$varTwo})";
    private static final String SOME_VALID_THREE = "ACQUIRE TERMINAL({$varOne}) USERDATA({$varTwo}) USERDATALEN({$varTwo})";
    private static final String SOME_VALID_FOUR = "ACQUIRE TERMINAL({$varOne}) QALL";
    private static final String SOME_VALID_FIVE = "ACQUIRE TERMINAL({$varOne}) QSESSLIM RELREQ";
    private static final String SOME_VALID_SIX = "ACQUIRE TERMINAL({$varOne}) QNOTENAB";
    private static final String ALL_VALID = "ACQUIRE TERMINAL({$varOne}) QALL RELREQ USERDATA({$varTwo}) USERDATALEN({$varThree})";
    private static final String DEFAULT_INVALID_ONE = "ACQUIRE TERMINAL({$varOne}) {RELREQ|error1}";
    private static final String DEFAULT_INVALID_TWO = "ACQUIRE TERMINAL({$varOne}) {USERDATALEN|error1}({$varThree})";
    private static final String DEFAULT_INVALID_THREE = "ACQUIRE TERMINAL({$varOne}) {QALL|error1} {QNOTENAB|error1}";
    private static final String DEFAULT_INVALID_FOUR = "ACQUIRE TERMINAL({$varOne}) NOQUEUE {RELREQ|error1}";
    private static final String DEFAULT_INVALID_FIVE = "ACQUIRE {QSESSLIM|error1}";

    @Test
    void testDefaultAllValid() {
        CICSTestUtils.noErrorTest(ALL_VALID, "SP");
    }

    @Test
    void testSomeValidOne() {
        CICSTestUtils.noErrorTest(SOME_VALID_ONE, "SP");
    }

    @Test
    void testSomeValidTwo() {
        CICSTestUtils.noErrorTest(SOME_VALID_TWO, "SP");
    }

    @Test
    void testSomeValidThree() {
        CICSTestUtils.noErrorTest(SOME_VALID_THREE, "SP");
    }

    @Test
    void testSomeValidFour() {
        CICSTestUtils.noErrorTest(SOME_VALID_FOUR, "SP");
    }

    @Test
    void testSomeValidFive() {
        CICSTestUtils.noErrorTest(SOME_VALID_FIVE, "SP");
    }

    @Test
    void testSomeValidSix() {
        CICSTestUtils.noErrorTest(SOME_VALID_SIX, "SP");
    }

    @Test
    void testBareValid() {
        CICSTestUtils.noErrorTest(BARE_VALID, "SP");
    }

    @Test
    void testDefaultInvalidOne() {
        CICSTestUtils.errorTest(DEFAULT_INVALID_ONE, ImmutableMap.of(
                "error1",
                new Diagnostic(
                        new Range(),
                        "Invalid option provided: RELREQ without QALL or QSESSLIM",
                        DiagnosticSeverity.Error,
                        ErrorSource.PARSING.getText()
                )
        ), "SP");
    }

    @Test
    void testDefaultInvalidTwo() {
        CICSTestUtils.errorTest(DEFAULT_INVALID_TWO, ImmutableMap.of(
                "error1",
                new Diagnostic(
                        new Range(),
                        "Invalid option provided: USERDATALEN without USERDATA",
                        DiagnosticSeverity.Error,
                        ErrorSource.PARSING.getText()
                )
        ), "SP");
    }

    @Test
    void testDefaultInvalidThree() {
        CICSTestUtils.errorTest(DEFAULT_INVALID_THREE, ImmutableMap.of(
                "error1",
                new Diagnostic(
                        new Range(),
                        "Exactly one option required, options are mutually exclusive: NOQUEUE or QALL or QNOTENAB or QSESSLIM",
                        DiagnosticSeverity.Error,
                        ErrorSource.PARSING.getText()
                )
        ), "SP");
    }

    @Test
    void testDefaultInvalidFour() {
        CICSTestUtils.errorTest(DEFAULT_INVALID_FOUR, ImmutableMap.of(
                "error1",
                new Diagnostic(
                        new Range(),
                        "Invalid option provided: RELREQ without QALL or QSESSLIM",
                        DiagnosticSeverity.Error,
                        ErrorSource.PARSING.getText()
                )
        ), "SP");
    }

    @Test
    void testDefaultInvalidFive() {
        CICSTestUtils.errorTest(DEFAULT_INVALID_FIVE, ImmutableMap.of(
                "error1",
                new Diagnostic(
                        new Range(),
                        "Missing required option: TERMINAL",
                        DiagnosticSeverity.Error,
                        ErrorSource.PARSING.getText()
                )
        ), "SP");
    }
}
