/*
 * Copyright (c) 2025 Broadcom.
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
 * Test CICS REWIND COUNTER command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-rewind-counter-rewind-dcounter">REWIND COUNTER Command</a>
 *
 * <p>This class tests all variations of the REWIND COUNTER command found in the link above.
 */
public class TestCicsRewindCounter {
    private static final String REWIND_COUNTER_ALL_VALID =
            "REWIND NOHANDLE COUNTER({$varFour}) POOL({$varFour}) INCREMENT({$varFour}) NOSUSPEND";
    private static final String REWIND_DCOUNTER_ALL_VALID =
            "REWIND NOHANDLE DCOUNTER({$varFour}) POOL({$varFour}) INCREMENT({$varFour}) NOSUSPEND";
    private static final String REWIND_INVALID =
            "REWIND {COUNTER|error}({$varFour}) {DCOUNTER|error2}({$varFour})";
    private static final String REWIND_COUNTER_INVALID =
            "REWIND COUNTER({$varFour}) {COUNTER|error}({$varFour})";

    @Test
    void testRewindCounterValid() {
        CICSTestUtils.noErrorTest(REWIND_COUNTER_ALL_VALID);
    }
    @Test
    void testRewindDCounterValid() {
        CICSTestUtils.noErrorTest(REWIND_DCOUNTER_ALL_VALID);
    }

    @Test
    void testRewindInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: COUNTER or DCOUNTER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: COUNTER or DCOUNTER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())
                        );
        CICSTestUtils.errorTest(REWIND_INVALID, expectedDiagnostic);
    }
    @Test
    void testRewindCounterInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Excessive options provided for: COUNTER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())
                );
        CICSTestUtils.errorTest(REWIND_COUNTER_INVALID, expectedDiagnostic);
    }
}
