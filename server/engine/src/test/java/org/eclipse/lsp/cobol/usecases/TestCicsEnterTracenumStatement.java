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
 * Test CICS Enter Tracenum command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-enter-tracenum">Enter Tracenum Command</a>
 *
 * <p>This class tests all variations of the Enter Tracenum command found in the link above.
 */
public class TestCicsEnterTracenumStatement {
    private static final String ENTER_TRACENUM_VALID =
            "ENTER TRACENUM({$varFour})";
    private static final String ENTER_TRACENUM_ALL_VALID =
            "ENTER TRACENUM({$varFour}) FROM({$varFour}) \n"
                   + "FROMLENGTH({$varFour}) RESOURCE({$varFour}) EXCEPTION";
    private static final String ENTER_TRACENUM_FROMLENGTH_INVALID =
            "ENTER  {_TRACENUM({$varOne})FROMLENGTH({$varTwo})|errorMissingFrom_}";

    @Test
    void testEnterTracenumValid() {
        CICSTestUtils.noErrorTest(ENTER_TRACENUM_VALID);
    }
    @Test
    void testEnterTracenumAllValid() {
        CICSTestUtils.noErrorTest(ENTER_TRACENUM_ALL_VALID);
    }
    @Test
    void testEnterTracenumFromLengthInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingFrom",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: FROM",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ENTER_TRACENUM_FROMLENGTH_INVALID, expectedDiagnostic);
    }
}

