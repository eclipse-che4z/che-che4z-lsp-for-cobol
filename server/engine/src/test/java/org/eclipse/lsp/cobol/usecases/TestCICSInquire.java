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

import java.util.Map;
import java.util.stream.Stream;

/**
 * Test CICS INQUIRE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-inquire-activityid">INQUIRE SP
 * Command</a>
 *
 * <p>This class tests all variations of the ISSUE command found in the link above.
 */
public class TestCICSInquire {
    private static Stream<String> getValidOptions() {
        return Stream.of(
                "ACTIVITYID({$varOne}) COMPSTATUS({$varOne}) MODE({$varOne}) SUSPSTATUS({$varOne}) ABCODE({$varOne}) ABPROGRAM({$varOne}) ACTIVITY({$varOne}) EVENT({$varOne}) PROCESS({$varOne}) PROCESSTYPE({$varOne}) PROGRAM({$varOne}) TRANSID({$varOne}) USERID({$varOne})",
                "CONTAINER({$varOne}) PROCESS({$varOne}) PROCESSTYPE({$varOne}) DATALENTH({$varOne}) SET({$varOne})",
                "EVENT({$varOne}) ACTIVITYID({$varOne}) EVENTTYPE({$varOne}) FIRESTATUS({$varOne}) PREDICATE({$varOne}) COMPOSITE({$varOne}) TIMER({$varOne})",
                "PROCESS({$varOne}) PROCESSTYPE({$varOne}) ACTIVITYID({$varOne})",
                "TIMER({$varOne}) ACTIVITYID({$varOne}) EVENT({$varOne}) ABSTIME({$varOne})");
    }

    private static final String CONTAINER_INVALID =
            "CONTAINER(1) {PROCESS|errorOne}(1) {ACTIVITYID|errorTwo}(2)";

    private static final String PROCESS_INVALID = "{_PROCESS(2) ACTIVITYID(2)|errorOne_}";

    @ParameterizedTest
    @MethodSource("getValidOptions")
    void testOption(String cicsOption) {
        CICSTestUtils.noErrorTest("INQUIRE " + cicsOption);
    }

    @Test
    void testContainerInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTIVITYID and PROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorTwo",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTIVITYID and PROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest("INQUIRE " + CONTAINER_INVALID, expectedDiagnostics);
    }

    @Test
    void testProcessInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: PROCESSTYPE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest("INQUIRE " + PROCESS_INVALID, expectedDiagnostics);
    }
}
