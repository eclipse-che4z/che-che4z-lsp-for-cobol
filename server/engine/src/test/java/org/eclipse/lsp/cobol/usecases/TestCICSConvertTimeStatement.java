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
 * Test CICS Converttime command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-converttime">CONVERTTIME Command</a>
 * <p>This class tests all variations of the CONVERTTIME command found in the link above.
 */
public class TestCICSConvertTimeStatement {

    private static final String CONVERTTIME_VALID =
            "CONVERTTIME ABSTIME({$varOne}) DATESTRING({$varOne})";

    private static final String CONVERTTIME_VALID_2 =
            "CONVERTTIME DATESTRING({$varOne}) ABSTIME({$varOne}) ";

    private static final String CONVERTTIME_ABSTIME_INVALID =
            "CONVERTTIME {DATESTRING(100) | errorMissingAbstime}";
    private static final String CONVERTTIME_DATESTRING_INVALID =
            "CONVERTTIME {ABSTIME(100) | errorMissingDatestring}";

    @Test
    void testConvertTimeValid() {
        CICSTestUtils.noErrorTest(CONVERTTIME_VALID);
    }

    @Test
    void testConvertTimeValid2() {
        CICSTestUtils.noErrorTest(CONVERTTIME_VALID_2);
    }

    @Test
    void testConvertTimeAbstimeInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorMissingAbstime",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: ABSTIME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CONVERTTIME_ABSTIME_INVALID, expectedDiagnostics);
    }
    @Test
    void testConvertTimeDateStringInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorMissingDatestring",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: DATESTRING",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CONVERTTIME_DATESTRING_INVALID, expectedDiagnostics);
    }
}

