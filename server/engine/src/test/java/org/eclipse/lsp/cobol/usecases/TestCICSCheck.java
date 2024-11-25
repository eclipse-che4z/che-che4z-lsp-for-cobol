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
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

/**
 * Test CICS Check commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-check-acqprocess">CHECK ACQPROCESS Command</a>
 * <a https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-check-activity">CHECK ACTIVITY Command</a>
 * <a https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-check-timer">CHECK TIMER Command</a>
 * <p>This class tests all variations of the CHECK command found in the link above.
 */
public class TestCICSCheck {

    private static final String CHECK_ACQPROCESS_VALID =
            "CHECK ACQPROCESS COMPSTATUS({$varOne}) ABCODE({$varFour}) ABPROGRAM({$varFour})"
                    + "MODE({$varOne}) SUSPSTATUS({$varOne})";
    private static final String CHECK_ACTIVITY_VALID =
            "CHECK ACTIVITY ({$varOne}) COMPSTATUS({$varOne}) ABCODE({$varFour}) ABPROGRAM({$varFour})"
                    + "MODE({$varOne}) SUSPSTATUS({$varOne})";
    private static final String CHECK_TIMER_VALID =
            "CHECK TIMER({$varFour}) STATUS({$varOne}) ";
    private static final String CHECK_ACTIVITY_ACQPROCESS_INVALID =
            "CHECK COMPSTATUS({$varOne}) {ACTIVITY(100) ACQPROCESS | errorAcqprocess | errorAcqprocess2} ";
    private static final String CHECK_ACTIVITY_INVALID_COMPSTATUS =
            "CHECK ACTIVITY ({$varOne}) {SUSPSTATUS(100) | errorMissingCompstatus }";
    @Test
    void testCheckAcqprocessValid() {
        CICSTestUtils.noErrorTest(CHECK_ACQPROCESS_VALID);
    }
    @Test
    void testCheckActivityValid() {
        CICSTestUtils.noErrorTest(CHECK_ACTIVITY_VALID);
    }
    @Test
    void testCheckTimerValid() {
        CICSTestUtils.noErrorTest(CHECK_TIMER_VALID);
    }

    @Test
    void testCheckActivityInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorAcqprocess",
                        new Diagnostic(
                                new Range(new Position(14, 12), new Position(14, 20)),
                                "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY or ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorAcqprocess2",
                        new Diagnostic(
                                new Range(new Position(14, 25), new Position(14, 35)),
                                "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY or ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CHECK_ACTIVITY_ACQPROCESS_INVALID, expectedDiagnostics);
    }

    @Test
    void testCancelTransidInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorMissingCompstatus",
                        new Diagnostic(
                                new Range(new Position(13, 12), new Position(15, 27)),
                                "Missing required option: COMPSTATUS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CHECK_ACTIVITY_INVALID_COMPSTATUS, expectedDiagnostics);
    }
}
