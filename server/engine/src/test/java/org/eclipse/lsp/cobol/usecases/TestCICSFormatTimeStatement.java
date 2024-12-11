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
 * Test CICS FORMATTIME command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-formattime">FORMATTIME Command</a>
 *
 * <p>This class tests all variations of the FORMAT TIME command found in the link above.
 */
public class TestCICSFormatTimeStatement {
    private static final String FORMAT_TIME_ALL_VALID =
            "FORMATTIME DATE({$varFour}) ABSTIME({$varFour}) \n"
            + "FULLDATE({$varFour}) DATEFORM({$varFour}) DATESEP \n"
            + "DATESTRING({$varFour}) STRINGZONE({$varOne}) \n"
            + "DAYCOUNT({$varFour}) DAYOFMONTH({$varFour}) \n"
            + "DAYOFWEEK({$varFour}) DDMMYY({$varFour}) \n"
            + "DDMMYYYY({$varFour}) MILLISECONDS({$varFour}) \n"
            + "MMDDYY({$varFour}) MMDDYYYY({$varFour}) \n"
            + "MONTHOFYEAR({$varFour}) STRINGFORMAT({$varOne}) \n"
            + "TIME ({$varFour}) TIMESEP YEAR({$varFour}) \n"
            + "YYDDD({$varFour}) YYDDMM({$varFour}) \n"
            + "YYMMDD({$varFour}) YYYYDDD({$varFour}) \n"
            + "YYYYDDMM({$varFour}) YYYYMMDD({$varFour})";
    private static final String FORMAT_TIME_VALID =
            "FORMATTIME ABSTIME({$varFour})";
    private static final String FORMAT_TIME_MISSING_ABSTIME_INVALID =
            "FORMATTIME {_DATE({$varOne})|errorMissingAbstime_}";
    private static final String FORMAT_TIME_MISSING_DATESTRING_INVALID =
            "FORMATTIME {_ABSTIME({$varOne})STRINGZONE({$varTwo})|errorMissingDatestring_}";
    private static final String FORMAT_TIME_MISSING_TIME_INVALID =
            "FORMATTIME {_ABSTIME({$varFour})TIMESEP|errorMissingTime_}";

    @Test
    void testFormatTimeAllValid() {
        CICSTestUtils.noErrorTest(FORMAT_TIME_ALL_VALID);
    }

    @Test
    void testFormatTimeValid() {
        CICSTestUtils.noErrorTest(FORMAT_TIME_VALID);
    }

    @Test
    void testFormatTimeInvalidMissingTime() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingTime",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: TIME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(FORMAT_TIME_MISSING_TIME_INVALID, expectedDiagnostic);
    }
    @Test
    void testFormatTimeInvalidMissingAbstime() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingAbstime",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: ABSTIME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(FORMAT_TIME_MISSING_ABSTIME_INVALID, expectedDiagnostic);
    }
    @Test
    void testFormatTimeInvalidMissingDateString() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorMissingDatestring",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: DATESTRING",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(FORMAT_TIME_MISSING_DATESTRING_INVALID, expectedDiagnostic);
    }
}
