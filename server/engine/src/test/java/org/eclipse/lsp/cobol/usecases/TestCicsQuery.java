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
 * Test CICS QUERY command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-query">QUERY
 * Command</a>
 *
 * <p>This class tests all variations of the QUERY command found in the link above.
 */
public class TestCicsQuery {
    private static final String QUERY_CHANNEL_VALID_ONE = "QUERY CHANNEL({$varFour}) CONTAINERCNT({$varSix})";
    private static final String QUERY_CHANNEL_VALID_TWO = "QUERY CONTAINERCNT({$varFour}) CHANNEL({$varSix}) ";

    private static final String QUERY_CHANNEL_INVALID = "QUERY {CONTAINERCNT(2)|error1} ";

    private static final String QUERY_COUNTER_VALID_ALL_ONE =
            "QUERY COUNTER({$varOne}) POOL({$varFive}) VALUE({$varSix}) MINIMUM({$varTwo}) MAXIMUM({$varTwo}) NOSUSPEND";
    private static final String QUERY_COUNTER_VALID_ALL_TWO =
            "QUERY MINIMUM({$varTwo}) COUNTER({$varOne}) POOL({$varFive}) NOSUSPEND VALUE({$varSix})  MAXIMUM({$varTwo}) ";
    private static final String QUERY_COUNTER_VALID_ALL_THREE =
            "QUERY VALUE({$varSix}) MINIMUM({$varTwo}) NOSUSPEND  MAXIMUM({$varTwo}) POOL({$varFive}) COUNTER({$varOne})";

    private static final String QUERY_DCOUNTER_VALID_ALL_ONE =
            "QUERY DCOUNTER({$varOne}) MINIMUM({$varTwo}) MAXIMUM({$varTwo}) POOL({$varFive}) VALUE({$varSix}) NOSUSPEND";
    private static final String QUERY_DCOUNTER_VALID_ALL_TWO =
            "QUERY NOSUSPEND POOL({$varFive}) MINIMUM({$varTwo}) DCOUNTER({$varOne}) MAXIMUM({$varTwo}) VALUE({$varSix})";


    private static final String QUERY_COUNTER_VALID_SOME_ONE =
            "QUERY COUNTER({$varOne}) NOSUSPEND";
    private static final String QUERY_COUNTER_VALID_SOME_TWO =
            "QUERY MINIMUM({$varTwo}) MAXIMUM({$varTwo}) COUNTER({$varOne})";

    private static final String QUERY_DCOUNTER_VALID_SOME_ONE =
            "QUERY POOL({$varFive}) VALUE({$varSix}) DCOUNTER({$varOne}) NOSUSPEND";
    private static final String QUERY_DCOUNTER_VALID_SOME_TWO =
            "QUERY VALUE({$varSix}) DCOUNTER({$varOne}) POOL({$varFive}) MAXIMUM({$varTwo})";

    private static final String QUERY_COUNTER_INVALID_ONE = "QUERY {COUNTER|error1}(1) {DCOUNTER|error1}(1) NOSUSPEND";
    private static final String QUERY_COUNTER_INVALID_TWO = "QUERY VALUE(6) COUNTER({$varFour}) {VALUE|error1}(6)";

    private static final String QUERY_COUNTER_VALID_BARE = "QUERY COUNTER({$varFour})";
    private static final String QUERY_DCOUNTER_VALID_BARE = "QUERY DCOUNTER({$varFour})";

    private static final String QUERY_SECURITY_VALID_ALL_ONE =
            "QUERY SECURITY RESTYPE({$varTwo}) RESID({$varThree}) LOGMESSAGE({$varFour}) USERID({$varFour}) READ({$varSix}) "
                    + "UPDATE({$varFour}) CONTROL({$varTwo}) ALTER({$varFive})";
    private static final String QUERY_SECURITY_VALID_ALL_TWO =
            "QUERY RESID({$varThree}) CONTROL({$varTwo}) USERID({$varFour}) RESIDLENGTH({$varSix}) ALTER({$varFive}) "
                    + "RESCLASS({$varFour}) UPDATE({$varFour}) SECURITY LOGMESSAGE({$varFour}) READ({$varSix})";
    private static final String QUERY_SECURITY_VALID_ALL_THREE =
            "QUERY ALTER({$varFive}) LOGMESSAGE({$varFour}) READ({$varSix}) SECURITY RESID({$varThree}) UPDATE({$varFour})"
                    + "RESTYPE({$varTwo}) USERID({$varFour}) CONTROL({$varTwo})";
    private static final String QUERY_SECURITY_VALID_ALL_FOUR =
            "QUERY RESCLASS({$varFour}) SECURITY RESID({$varThree}) RESIDLENGTH({$varSix}) CONTROL({$varTwo}) USERID({$varFour})"
                    + "LOGMESSAGE({$varFour}) READ({$varSix}) ALTER({$varFive}) UPDATE({$varFour})";

    private static final String QUERY_SECURITY_VALID_SOME_ONE =
            "QUERY SECURITY RESTYPE({$varTwo}) LOGMESSAGE({$varFour}) ALTER({$varFive}) RESID({$varThree})";
    private static final String QUERY_SECURITY_VALID_SOME_TWO =
            "QUERY RESID({$varThree}) CONTROL({$varTwo}) SECURITY USERID({$varFour}) RESIDLENGTH({$varSix}) RESCLASS({$varFour})";
    private static final String QUERY_SECURITY_VALID_SOME_THREE =
            "QUERY ALTER({$varFive}) UPDATE({$varFour}) CONTROL({$varTwo}) RESID({$varThree}) RESTYPE({$varTwo}) SECURITY";
    private static final String QUERY_SECURITY_VALID_SOME_FOUR =
            "QUERY RESCLASS({$varFour}) SECURITY RESID({$varThree}) RESIDLENGTH({$varSix}) READ({$varSix})";

    private static final String QUERY_SECURITY_VALID_BARE_ONE =
            "QUERY SECURITY RESID({$varThree}) RESTYPE({$varTwo})";
    private static final String QUERY_SECURITY_VALID_BARE_TWO =
            "QUERY SECURITY RESIDLENGTH({$varSix}) RESCLASS({$varFour}) RESID({$varThree})";

    private static final String QUERY_SECURITY_INVALID =
            "QUERY {RESTYPE|error1}(1) {RESCLASS|error1}(1) SECURITY RESIDLENGTH({$varSix}) RESID({$varThree})";
    private static final String QUERY_SECURITY_INVALID_TWO =
            "QUERY {_RESCLASS(1) SECURITY RESID(1)|error1_}";

    @Test
    void testQueryChannelValidCasesReturnNoErrorsOne() {
        CICSTestUtils.noErrorTest(QUERY_CHANNEL_VALID_ONE);
    }

    @Test
    void testQueryChannelValidCasesReturnNoErrorsTwo() {
        CICSTestUtils.noErrorTest(QUERY_CHANNEL_VALID_TWO);
    }

    @Test
    void testQueryChannelInvalidMissingChannel() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: CHANNEL",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(QUERY_CHANNEL_INVALID, expectedDiagnostics);
    }

    @Test
    void testQueryCounterValidCasesReturnNoErrorsOne() {
        CICSTestUtils.noErrorTest(QUERY_COUNTER_VALID_BARE);
    }

    @Test
    void testQueryCounterValidCasesReturnNoErrorsTwo() {
        CICSTestUtils.noErrorTest(QUERY_COUNTER_VALID_SOME_ONE);
    }

    @Test
    void testQueryCounterValidCasesReturnNoErrorsThree() {
        CICSTestUtils.noErrorTest(QUERY_COUNTER_VALID_SOME_TWO);
    }

    @Test
    void testQueryCounterValidCasesReturnNoErrorsFour() {
        CICSTestUtils.noErrorTest(QUERY_COUNTER_VALID_ALL_ONE);
    }

    @Test
    void testQueryCounterValidCasesReturnNoErrorsFive() {
        CICSTestUtils.noErrorTest(QUERY_COUNTER_VALID_ALL_TWO);
    }

    @Test
    void testQueryCounterValidCasesReturnNoErrorsSix() {
        CICSTestUtils.noErrorTest(QUERY_COUNTER_VALID_ALL_THREE);
    }

    @Test
    void testQueryCounterInvalidDCounter() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: COUNTER or DCOUNTER",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(QUERY_COUNTER_INVALID_ONE, expectedDiagnostics);
    }

    @Test
    void testQueryCounterInvalidDuplicateValue() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Excessive options provided for: VALUE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(QUERY_COUNTER_INVALID_TWO, expectedDiagnostics);
    }

    @Test
    void testQueryDCounterValidCasesReturnNoErrorsOne() {
        CICSTestUtils.noErrorTest(QUERY_DCOUNTER_VALID_BARE);
    }

    @Test
    void testQueryDCounterValidCasesReturnNoErrorsTwo() {
        CICSTestUtils.noErrorTest(QUERY_DCOUNTER_VALID_SOME_ONE);
    }

    @Test
    void testQueryDCounterValidCasesReturnNoErrorsThree() {
        CICSTestUtils.noErrorTest(QUERY_DCOUNTER_VALID_SOME_TWO);
    }

    @Test
    void testQueryDCounterValidCasesReturnNoErrorsFour() {
        CICSTestUtils.noErrorTest(QUERY_DCOUNTER_VALID_ALL_ONE);
    }

    @Test
    void testQueryDCounterValidCasesReturnNoErrorsFive() {
        CICSTestUtils.noErrorTest(QUERY_DCOUNTER_VALID_ALL_TWO);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsOne() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_BARE_ONE);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsTwo() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_BARE_TWO);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsThree() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_SOME_ONE);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsFour() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_SOME_TWO);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsFive() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_SOME_THREE);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsSix() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_SOME_FOUR);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsSeven() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_ALL_ONE);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsEight() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_ALL_TWO);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorsNine() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_ALL_THREE);
    }

    @Test
    void testQuerySecurityValidCasesReturnNoErrorTen() {
        CICSTestUtils.noErrorTest(QUERY_SECURITY_VALID_ALL_FOUR);
    }

    @Test
    void testQuerySecurityInvalidRestypeAndResclass() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: RESTYPE or RESCLASS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(QUERY_SECURITY_INVALID, expectedDiagnostic);
    }

    @Test
    void testQuerySecurityResclassWithoutResidLength() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error1",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: RESIDLENGTH",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()
                        )
                );
        CICSTestUtils.errorTest(QUERY_SECURITY_INVALID_TWO, expectedDiagnostic);
    }
}
