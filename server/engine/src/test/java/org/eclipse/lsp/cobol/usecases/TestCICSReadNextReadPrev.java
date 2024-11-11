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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.Arrays;
import java.util.Map;
import java.util.stream.Stream;

/**
 * Test CICS READNEXT commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-readnext">READNEXT Command</a>
 *
 * Test CICS READprev commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-readprev">READPREV Command</a>
 *
 * <p>This class tests all variations of the READNEXT READPREV command found in the link above.
 */
public class TestCICSReadNextReadPrev {

    private static Stream<Object[]> provideReadCommands() {
        String[] commands = {"READNEXT", "READPREV"};
        String[] templates = {
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive})",
                "FILE({$varFour}) SET({$varOne}) RIDFLD({$varFive})",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) UNCOMMITTED",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) CONSISTENT",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) REPEATABLE",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) UPDATE TOKEN({$varFive})",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) SYSID({$varFour}) LENGTH({$varFive})",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) RBA NOSUSPEND",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) UPDATE TOKEN({$varFive}) SYSID({$varFour}) LENGTH({$varFive})",
                "FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) UPDATE TOKEN({$varFive}) SYSID({$varFour}) LENGTH(LENGTH OF {$varFive})",
        };
        return Arrays.stream(commands)
                .flatMap(cmd -> Arrays.stream(templates)
                        .map(template -> new Object[]{cmd + " " + template}));
    }

    private static final String READNEXT_CONSISTENT_REPEATABLE_INVALID = "READNEXT FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) {CONSISTENT|error1} {REPEATABLE|error2}";
    private static final String READNEXT_TOKEN_NO_UPDATE_INVALID = "READNEXT FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) {TOKEN|error1}(123)";
    private static final String READPREV_TOKEN_NO_UPDATE_INVALID = "READPREV FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) {TOKEN|error1}(123)";
    private static final String READNEXT_RBA_RRN_INVALID = "READNEXT FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) {RBA|error1} {RRN|error2}";
    private static final String READPREV_RBA_RRN_INVALID = "READPREV FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) {RBA|error1} {RRN|error2}";
    private static final String READNEXT_DOUBLE_UPDATE_INVALID = "READNEXT FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) UPDATE {UPDATE|error1} TOKEN({$varFive})";
    private static final String READPREV_DOUBLE_UPDATE_INVALID = "READPREV FILE({$varFour}) INTO({$varFive}) RIDFLD({$varFive}) UPDATE {UPDATE|error1} TOKEN({$varFive})";

    @ParameterizedTest
    @MethodSource("provideReadCommands")
    void testReadCommands(String command) {
        CICSTestUtils.noErrorTest(command);
    }

    @Test
    void testReadnextRepeatableInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
            ImmutableMap.of(
                "error1",
                new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: UNCOMMITTED or CONSISTENT or REPEATABLE or UPDATE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: UNCOMMITTED or CONSISTENT or REPEATABLE or UPDATE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READNEXT_CONSISTENT_REPEATABLE_INVALID, expectedDiagnostics);
    }

    @Test
    void testReadnextTokenNoUpdateInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: TOKEN without UPDATE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READNEXT_TOKEN_NO_UPDATE_INVALID, expectedDiagnostics);
    }

    @Test
    void testReadprevTokenNoUpdateInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: TOKEN without UPDATE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READPREV_TOKEN_NO_UPDATE_INVALID, expectedDiagnostics);
    }

    @Test
    void testReadnextRraRrnInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: RBA or RRN or XRBA",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: RBA or RRN or XRBA",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READNEXT_RBA_RRN_INVALID, expectedDiagnostics);
    }

    @Test
    void testReadprevRraRrnInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: RBA or RRN or XRBA",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: RBA or RRN or XRBA",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READPREV_RBA_RRN_INVALID, expectedDiagnostics);
    }

    @Test
    void testReadnextDoubleUpdateInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Excessive options provided for: UPDATE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READNEXT_DOUBLE_UPDATE_INVALID, expectedDiagnostics);
    }

    @Test
    void testReadprevDoubleUpdateInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Excessive options provided for: UPDATE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READPREV_DOUBLE_UPDATE_INVALID, expectedDiagnostics);
    }
}
