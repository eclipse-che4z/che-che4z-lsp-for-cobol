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
 * Test CICS CONNECT PROCESS command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-connect-process"> Connect Process Command</a>
 *
 * <p>This class tests all variations of the Connect Process command found in the link above.
 */
public class TestCICSConnectProcessStatement {
    private static final String CONNECT_PROCESS_VALID_PATH_ONE =
            "CONNECT PROCESS CONVID({$varFour}) PROCNAME({$varFour}) PROCLENGTH({$varFour}) PIPLIST({$varFour}) "
                    + "PIPLENGTH({$varFour}) SYNCLEVEL({$varFour}) STATE({$varFour})";
    private static final String CONNECT_PROCESS_VALID_PATH_TWO =
            "CONNECT PROCESS CONVID({$varFour}) PARTNER({$varFour}) "
                    + "SYNCLEVEL({$varFour}) ";
    private static final String CONNECT_PROCESS_INVALID =
            "CONNECT PROCESS SESSION({$varFour}) SYNCLEVEL({$varFour}) {PARTNER | errorMissingProc | errorPartner}(100)";
    private static final String CONNECT_PROCESS_PIPLENGTH_INVALID =
            "CONNECT {_PROCESS CONVID(100) PIPLENGTH(100) \n "
                   + "SYNCLEVEL(100) PROCNAME(100)|errorPiplength_}";

    @Test
    void testConnectProcessValid() {
        CICSTestUtils.noErrorTest(CONNECT_PROCESS_VALID_PATH_ONE);
    }
    @Test
    void testConnectProcessPathTwoValidT() {
        CICSTestUtils.noErrorTest(CONNECT_PROCESS_VALID_PATH_TWO);
    }
    @Test
    void testConnectProcessSessionPartnerInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingProc",
                        new Diagnostic(
                                new Range(new Position(13, 12), new Position(16, 24)),
                                "Missing required option: PROCNAME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorPartner",
                        new Diagnostic(
                                new Range(new Position(16, 12), new Position(16,  19)),
                                "Invalid option provided: PARTNER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                                )
                        );
        CICSTestUtils.errorTest(CONNECT_PROCESS_INVALID, expectedDiagnostic);
    }
    @Test
    void testConnectProcessPiplengthInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorPiplength",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: PIPLIST",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText())
                );
        CICSTestUtils.errorTest(CONNECT_PROCESS_PIPLENGTH_INVALID, expectedDiagnostic);
    }
}
