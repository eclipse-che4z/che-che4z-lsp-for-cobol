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
 * Test CICS Cancel commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-cancel">CANCEL Command</a>
 * <a https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-cancel-bts">CANCEL(BTS) Command</a>
 * <p>This class tests all variations of the CANCEL command found in the link above.
 */
public class TestCICSCancel {

    private static final String CANCEL_ACTIVITY_VALID =
            "CANCEL ACTIVITY({$varOne})";

    private static final String CANCEL_ACQACTIVITY_VALID =
            "CANCEL ACQACTIVITY";

    private static final String CANCEL_ACQPROCESS_VALID =
            "CANCEL ACQPROCESS";
    private static final String CANCEL_REQID_VALID =
            "CANCEL REQID({$varFour})";
    private static final String CANCEL_REQID_SYSID_VALID =
            "CANCEL REQID({$varFour}) SYSID({$varFour})";
    private static final String CANCEL_REQID_SYSID_TRANSID_VALID =
            "CANCEL REQID({$varFour}) SYSID({$varFour}) TRANSID({$varFour})";
    private static final String CANCEL_REQID_TRANSID_SYSID_VALID =
            "CANCEL REQID({$varFour}) TRANSID({$varFour}) SYSID({$varFour}) ";

    private static final String CANCEL_REQID_ACTIVITY_INVALID =
            "CANCEL REQID({$varFour}) {ACTIVITY | error} ";

    private static final String CANCEL_SYSID_INVALID =
            "CANCEL {SYSID | errorSysid} ";
    private static final String CANCEL_TRANSID_INVALID =
            "CANCEL {TRANSID | errorTransid} ";
    private static final String CANCEL_ACQACTIVITY_ACQPROCESS_INVALID =
            "CANCEL ACQACTIVITY {ACQPROCESS | errorAcqactivityAcqProcess} ";

    private static final String CANCEL_ACTIVITY_ACQPROCESS_INVALID =
            "CANCEL ACTIVITY({$varOne}) {ACQPROCESS | errorActivityAcqProcess} ";
    @Test
    void testCancelActivityValid() {

        CICSTestUtils.noErrorTest(CANCEL_ACTIVITY_VALID);
    }

    @Test
    void testCancelAcqactivityValid() {
        CICSTestUtils.noErrorTest(CANCEL_ACQACTIVITY_VALID);
    }
    @Test
    void testCancelAcqprocessValid() {
        CICSTestUtils.noErrorTest(CANCEL_ACQPROCESS_VALID);
    }
    @Test
    void testCancelReqidValid() {
        CICSTestUtils.noErrorTest(CANCEL_REQID_VALID); }
    @Test
    void testCancelReqidSysidValid() {
        CICSTestUtils.noErrorTest(CANCEL_REQID_SYSID_VALID);
    }
    @Test
    void testCancelReqidSysidTransidValid() {
        CICSTestUtils.noErrorTest(CANCEL_REQID_SYSID_TRANSID_VALID);
    }
    @Test
    void testCancelReqidTransidSysidValid() {
        CICSTestUtils.noErrorTest(CANCEL_REQID_TRANSID_SYSID_VALID);
    }

    @Test
    void testCancelReqidActivityInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Extraneous input ACTIVITY",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CANCEL_REQID_ACTIVITY_INVALID, expectedDiagnostics);
    }
    @Test
    void testCancelSysidInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorSysid",
                        new Diagnostic(
                                new Range(),
                                "Syntax error on 'SYSID'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CANCEL_SYSID_INVALID, expectedDiagnostics);
    }
    @Test
    void testCancelTransidInvalid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorTransid",
                        new Diagnostic(
                                new Range(),
                                "Syntax error on 'TRANSID'",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CANCEL_TRANSID_INVALID, expectedDiagnostics);
    }
    @Test
    void testCancelAcqactivityAcqprocess() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorAcqactivityAcqProcess",
                        new Diagnostic(
                                new Range(),
                                "Extraneous input ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CANCEL_ACQACTIVITY_ACQPROCESS_INVALID, expectedDiagnostics);
    }
    @Test
    void testCancelActivityAcqprocess() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorActivityAcqProcess",
                        new Diagnostic(
                                new Range(),
                                "Extraneous input ACQPROCESS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CANCEL_ACTIVITY_ACQPROCESS_INVALID, expectedDiagnostics);
    }
}
