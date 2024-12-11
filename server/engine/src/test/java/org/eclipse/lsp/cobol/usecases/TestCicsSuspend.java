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
 * Test CICS SUSPEND command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-suspend">SUSPEND
 * Command</a>
 *
 * <p>This class tests all variations of the SUSPEND command found in the link above.
 */
public class TestCicsSuspend {
    private static final String SUSPEND_BARE = "SUSPEND";
    private static final String SUSPEND_ACTIVITY = "SUSPEND ACTIVITY({$varOne})";
    private static final String SUSPEND_ACQACTIVITY = "SUSPEND ACQACTIVITY";
    private static final String SUSPEND_ACQPROCESS = "SUSPEND ACQPROCESS";

    private static final String SUSPEND_INVALID_ONE = "SUSPEND {ACQACTIVITY|error1} {ACQPROCESS|error1}";
    private static final String SUSPEND_INVALID_TWO = "SUSPEND {ACTIVITY|error1}({$varOne}) {ACQPROCESS|error1}";
    private static final String SUSPEND_INVALID_THREE = "SUSPEND {ACQACTIVITY|error1} {ACTIVITY|error1}({$varOne})";

    @Test
    void testSuspend() {
        CICSTestUtils.noErrorTest(SUSPEND_BARE);
    }

    @Test
    void testSuspendActivity() {
        CICSTestUtils.noErrorTest(SUSPEND_ACTIVITY);
    }

    @Test
    void testSuspendAcqActivity() {
        CICSTestUtils.noErrorTest(SUSPEND_ACQACTIVITY);
    }

    @Test
    void testSuspendAcqProcess() {
        CICSTestUtils.noErrorTest(SUSPEND_ACQPROCESS);
    }

    @Test
    void testSuspendInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACQACTIVITY or ACQPROCESS or ACTIVITY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SUSPEND_INVALID_ONE, expectedDiagnostic);
    }

    @Test
    void testSuspendInvalidTwo() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACQACTIVITY or ACQPROCESS or ACTIVITY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SUSPEND_INVALID_TWO, expectedDiagnostic);
    }

    @Test
    void testSuspendInvalidThree() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACQACTIVITY or ACQPROCESS or ACTIVITY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SUSPEND_INVALID_THREE, expectedDiagnostic);
    }

}
