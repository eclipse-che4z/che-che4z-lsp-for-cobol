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
 * Test CICS ENQ command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-enq</a>
 *
 * <p>This class tests all variations of the ENQ command found in the link above.
 */
public class TestCICSEnqStatement {
    private static final String ENQ_ALL_VALID =
            "ENQ RESOURCE({$varFour}) LENGTH({$varFour})  \n"
                   + "NOHANDLE \n"
                   + "MAXLIFETIME({$varFour}) NOSUSPEND";
    private static final String ENQ_VALID =
            "ENQ RESOURCE({$varFour})";
    private static final String ENQ_RESOURCE_INVALID =
            "ENQ {LENGTH(100) | errorMissingRes }";
    private static final String ENQ_RESOURCE_MUTUALEX_INVALID =
            "ENQ RESOURCE({$varFour}) {UOW|errorMutualEx} {TASK|errorMutualEx}";

    @Test
    void testEnqAllValid() {
        CICSTestUtils.noErrorTest(ENQ_ALL_VALID);
    }
    @Test
    void testEnqValid() {
        CICSTestUtils.noErrorTest(ENQ_VALID);
    }
    @Test
    void testEnqMissingResInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingRes",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: RESOURCE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ENQ_RESOURCE_INVALID, expectedDiagnostic);
    }
    @Test
    void testEnqMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMutualEx",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: UOW or MAXLIFETIME or TASK",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(ENQ_RESOURCE_MUTUALEX_INVALID, expectedDiagnostic);
    }
}
