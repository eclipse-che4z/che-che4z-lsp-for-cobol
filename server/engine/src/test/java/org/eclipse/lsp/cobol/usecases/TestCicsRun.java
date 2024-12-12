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
 * Test CICS RUN command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-run">RUN
 * Command</a>
 *
 * <p>This class tests all variations of the RUN command found in the link above.
 */
public class TestCicsRun {
    private static final String DEFAULT_ALL_VALID_ONE = "RUN ACQACTIVITY ASYNCHRONOUS INPUTEVENT({$varThree}) FACILITYTOKN({$varTwo})";
    private static final String DEFAULT_ALL_VALID_TWO = "RUN ACQPROCESS INPUTEVENT({$varFour}) SYNCHRONOUS";
    private static final String DEFAULT_ALL_VALID_THREE = "RUN SYNCHRONOUS ACTIVITY({$varThree}) INPUTEVENT({$varThree})";
    private static final String DEFAULT_ALL_VALID_FOUR = "RUN INPUTEVENT({$varThree}) ASYNCHRONOUS FACILITYTOKN({$varTwo}) ACTIVITY({$varThree})";
    private static final String DEFAULT_ALL_VALID_FIVE = "RUN FACILITYTOKN({$varTwo}) ACQACTIVITY INPUTEVENT({$varThree}) ASYNCHRONOUS";

    private static final String DEFAULT_SOME_VALID_ONE = "RUN ASYNCHRONOUS ACTIVITY({$varThree}) INPUTEVENT({$varThree})";
    private static final String DEFAULT_SOME_VALID_TWO = "RUN ASYNCHRONOUS FACILITYTOKN({$varTwo}) ACQACTIVITY";
    private static final String DEFAULT_SOME_VALID_THREE = "RUN ACQPROCESS ASYNCHRONOUS INPUTEVENT({$varThree})";

    private static final String DEFAULT_BARE_VALID_ONE = "RUN SYNCHRONOUS ACQPROCESS";
    private static final String DEFAULT_BARE_VALID_TWO = "RUN ACQACTIVITY ASYNCHRONOUS";
    private static final String DEFAULT_BARE_VALID_THREE = "RUN SYNCHRONOUS ACQACTIVITY";
    private static final String DEFAULT_BARE_VALID_FOUR = "RUN FACILITYTOKN({$varTwo}) ACQACTIVITY";

    private static final String DEFAULT_INVALID_ONE = "RUN SYNCHRONOUS ACTIVITY({$varThree}) {FACILITYTOKN|error1}({$varTwo})";
    private static final String DEFAULT_INVALID_TWO = "RUN ASYNCHRONOUS {ACQPROCESS|error1}  {ACQACTIVITY|error1} INPUTEVENT({$varThree})";
    private static final String DEFAULT_INVALID_THREE = "RUN ACTIVITY({$varThree}) SYNCHRONOUS INPUTEVENT({$varThree}) {ASYNCHRONOUS|error1}";
    private static final String DEFAULT_INVALID_FOUR = "RUN {ACQACTIVITY|error1}";

    private static final String TRANSID_ALL = "RUN TRANSID({$varThree}) CHANNEL({$varTwo}) CHILD({$varOne})";
    private static final String TRANSID_BARE = "RUN CHILD({$varOne}) TRANSID({$varThree})";

    @Test
    void testDefaultAllValidOne() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_ONE);
    }

    @Test
    void testDefaultAllValidTwo() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_TWO);
    }

    @Test
    void testDefaultAllValidThree() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_THREE);
    }

    @Test
    void testDefaultAllValidFour() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_FOUR);
    }

    @Test
    void testDefaultAllValidFive() {
        CICSTestUtils.noErrorTest(DEFAULT_ALL_VALID_FIVE);
    }

    @Test
    void testDefaultSomeValidOne() {
        CICSTestUtils.noErrorTest(DEFAULT_SOME_VALID_ONE);
    }

    @Test
    void testDefaultSomeValidTwo() {
        CICSTestUtils.noErrorTest(DEFAULT_SOME_VALID_TWO);
    }

    @Test
    void testDefaultSomeValidThree() {
        CICSTestUtils.noErrorTest(DEFAULT_SOME_VALID_THREE);
    }

    @Test
    void testDefaultBareValidOne() {
        CICSTestUtils.noErrorTest(DEFAULT_BARE_VALID_ONE);
    }

    @Test
    void testDefaultBareValidTwo() {
        CICSTestUtils.noErrorTest(DEFAULT_BARE_VALID_TWO);
    }

    @Test
    void testDefaultBareValidThree() {
        CICSTestUtils.noErrorTest(DEFAULT_BARE_VALID_THREE);
    }

    @Test
    void testDefaultBareValidFour() {
        CICSTestUtils.noErrorTest(DEFAULT_BARE_VALID_FOUR);
    }

    @Test
    void testDefaultInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Options \"SYNCHRONOUS or FACILITYTOKN\" are mutually exclusive.",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(DEFAULT_INVALID_ONE, expectedDiagnostic);
    }

    @Test
    void testDefaultInvalidTwo() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY or ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(DEFAULT_INVALID_TWO, expectedDiagnostic);
    }

    @Test
    void testDefaultInvalidThree() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Options \"SYNCHRONOUS or ASYNCHRONOUS\" are mutually exclusive.",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(DEFAULT_INVALID_THREE, expectedDiagnostic);
    }

    @Test
    void testDefaultInvalidFour() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: SYNCHRONOUS or ASYNCHRONOUS or FACILITYTOKN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(DEFAULT_INVALID_FOUR, expectedDiagnostic);
    }

    @Test
    void testTransidAll() {
        CICSTestUtils.noErrorTest(TRANSID_ALL);
    }

    @Test
    void testTransidBare() {
        CICSTestUtils.noErrorTest(TRANSID_BARE);
    }
}
