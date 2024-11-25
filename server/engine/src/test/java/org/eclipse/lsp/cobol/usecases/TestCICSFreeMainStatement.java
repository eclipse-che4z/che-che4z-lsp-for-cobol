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
 * Test CICS Freemain & Freemain64 commands. Documentation link:
 *<a https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-freemain"> Freemain Command</a>
 *<a https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-freemain64"> Freemain64 Command</a>
 * <p>This class tests all variations of the Freemain commands found in the links above.
 */
public class TestCICSFreeMainStatement {
    private static final String FREEMAIN_DATA_VALID =
            "FREEMAIN DATA({$varFour})";
    private static final String FREEMAIN_DATAPOINTER_VALID =
            "FREEMAIN DATAPOINTER({$varFour})";
    private static final String FREEMAIN_DATA_MISSING_INVALID =
            "FREEMAIN {NOHANDLE|errorDataMissing}";
    private static final String FREEMAIN_DATA_DATAPOINTER_INVALID =
            "FREEMAIN {DATA|error}({$varFour}) {DATAPOINTER|error2}({$varFour})";

    @Test
    void testFreeMainDataValid() {
        CICSTestUtils.noErrorTest(FREEMAIN_DATA_VALID);
    }
    @Test
    void testFreeMainDataPointerValid() {
        CICSTestUtils.noErrorTest(FREEMAIN_DATAPOINTER_VALID);
    }

    @Test
    void testFreeMainDataMissingInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorDataMissing",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, none provided: DATA or DATAPOINTER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())
                        );
        CICSTestUtils.errorTest(FREEMAIN_DATA_MISSING_INVALID, expectedDiagnostic);
    }
    @Test
    void testFreeMainDataDataPointerInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: DATA or DATAPOINTER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: DATA or DATAPOINTER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(FREEMAIN_DATA_DATAPOINTER_INVALID, expectedDiagnostic);
    }
}
