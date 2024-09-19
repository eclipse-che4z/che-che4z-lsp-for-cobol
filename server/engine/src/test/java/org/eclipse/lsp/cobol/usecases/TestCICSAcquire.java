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
 * Test CICS ACQUIRE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-acquire">ACQUIRE Command</a>
 *
 * <p>This class tests all variations of the ACQUIRE command found in the link above.
 */
public class TestCICSAcquire {
    private static final String ACQUIRE_ACTIVITYID_VALID =
            "ACQUIRE ACTIVITYID({$varFour})";
    private static final String ACQUIRE_PROCESS_PROCESSTYPE_VALID =
            "ACQUIRE PROCESS({$varFour}) PROCESSTYPE({$varFour})";
    private static final String ACQUIRE_ACTIVITYID_INVALID =
            "ACQUIRE ACTIVITYID (100) {PROCESS | error}";
    private static final String ACQUIRE_PROCESS_INVALID =
            "ACQUIRE PROCESS(100) PROCESSTYPE(100) {ACTIVITYID | error }";

    @Test
    void testAcquireActivityIdValid() {
        CICSTestUtils.noErrorTest(ACQUIRE_ACTIVITYID_VALID);
    }

    @Test
    void testAcquireProcessProcesstypeValid() {
        CICSTestUtils.noErrorTest(ACQUIRE_PROCESS_PROCESSTYPE_VALID);
    }

    @Test
    void testAcquireActivityIdInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Extraneous input PROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ACQUIRE_ACTIVITYID_INVALID, expectedDiagnostic);
    }
    @Test
    void testAcquireProcessInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Extraneous input ACTIVITYID",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(ACQUIRE_PROCESS_INVALID, expectedDiagnostic);
    }
}
