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
 * Test CICS Force Timer command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-force-timer">Force Timer Command</a>
 *
 * <p>This class tests all variations of the Force Timer command found in the link above.
 */
public class TestCICSForceStatement {
    private static final String FORCE_TIMER_VALID =
            "FORCE TIMER({$varFour})";
    private static final String FORCE_TIMER_ALL_VALID =
            "FORCE TIMER({$varFour}) ACQACTIVITY";
    private static final String FORCE_TIMER_INVALID =
            "FORCE {ACQACTIVITY|errorMissingTimer}";
    private static final String FORCE_TIMER_ACQACTIVITY_ACQPROCESS_INVALID =
            "FORCE TIMER({$varFour})  {ACQPROCESS|errorMutualEx} {ACQACTIVITY|errorMutualEx2}";

    @Test
    void testForceTimerValid() {
        CICSTestUtils.noErrorTest(FORCE_TIMER_VALID);
    }

    @Test
    void testForceTimerAllValid() {
        CICSTestUtils.noErrorTest(FORCE_TIMER_ALL_VALID);
    }

    @Test
    void testForceTimerInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingTimer",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: TIMER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(FORCE_TIMER_INVALID, expectedDiagnostic);
    }
    @Test
    void testForceTimerMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMutualEx",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive:"
                                        + " ACQACTIVITY or ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorMutualEx2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive:"
                                        +  " ACQACTIVITY or ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())
                        );

        CICSTestUtils.errorTest(FORCE_TIMER_ACQACTIVITY_ACQPROCESS_INVALID, expectedDiagnostic);
    }
}
