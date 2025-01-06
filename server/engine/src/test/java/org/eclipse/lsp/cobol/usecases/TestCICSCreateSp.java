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
        import org.junit.jupiter.params.ParameterizedTest;
        import org.junit.jupiter.params.provider.MethodSource;

        import java.util.Map;
        import java.util.stream.Stream;

/**
 * Test CICS Create System Command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-create-atomservice">Create System Commands</a>
 *
 * <p>This class tests all variations of the Create System Commands found in the link above.
 */
public class TestCICSCreateSp {

    private static Stream<String> getValidOptions() {
        return Stream.of(
                "CREATE ATOMSERVICE({$varFour}) NOLOG ATTRLEN({$varFour}) ATTRIBUTES(anything)",
                "CREATE BUNDLE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE CONNECTION({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE DB2CONN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE DB2ENTRY({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE DB2TRAN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE DOCTEMPLATE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE DUMPCODE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE ENQMODEL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE FILE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE IPCONN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE JOURNALMODEL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE JVMSERVER({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE LIBRARY({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE LSRPOOL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE MAPSET({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE MQCONN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE MQMONITOR({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE PARTITIONSET({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE PARTNER({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE PIPELINE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE PROCESSTYPE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE PROFILE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE PROGRAM({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE TCPIPSERVICE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE TDQUEUE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE TRANCLASS({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE TRANSACTION({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE TSMODEL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE TYPETERM({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE URIMAP({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE WEBSERVICE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE SESSIONS({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE TERMINAL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES(anything)",
                "CREATE CONNECTION({$varFour}) ATTRLEN({$varOne}) ATTRIBUTES(anything) NOLOG");
    };

    private static final String CREATE_INVALID =
            "CREATE CONNECTION({$varFour})"
                   + "{ATTRIBUTES|errorInvalidDiscard}(1)"
                   + "{DISCARD|errorInvalidDiscard2}";
    private static final String CREATE_BUNDLE_MISSING_ATTRIBUTES_INVALID =
            "CREATE {_BUNDLE({$varFour}) NOLOG |error_}";
    private static final String CREATE_CONNECTION_MUTUALEX_INVALID =
            "CREATE CONNECTION({$varFour}) {COMPLETE|error} {DISCARD|error2}";
    private static final String CREATE_DB2CONN_MUTUALEX_INVALID =
            "CREATE DB2CONN({$varFour}) ATTRIBUTES(anything) {LOG|error} {NOLOG|error2}";
    private static final String CREATE_DB2ENTRY_DISCARD_INVALID =
            "CREATE DB2ENTRY({$varFour}) ATTRIBUTES(anything) {DISCARD|error}";
    @ParameterizedTest
    @MethodSource("getValidOptions")
    void testCreateSpAllValid(String valid) {
        CICSTestUtils.noErrorTest(valid, "SP");
    }
    @Test
    void testCreateSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "errorInvalidDiscard",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or COMPLETE or DISCARD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorInvalidDiscard2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or COMPLETE or DISCARD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CREATE_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testCreateBundleSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: ATTRIBUTES",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CREATE_BUNDLE_MISSING_ATTRIBUTES_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testCreateConnectionSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or COMPLETE or DISCARD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                                "error2",
                                new Diagnostic(
                                        new Range(),
                                        "Exactly one option required, options are mutually exclusive: ATTRIBUTES or COMPLETE or DISCARD",
                                        DiagnosticSeverity.Error,
                                        ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(CREATE_CONNECTION_MUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testCreateDb2ConnSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: LOG or NOLOG or LOGMESSAGE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: LOG or NOLOG or LOGMESSAGE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(CREATE_DB2CONN_MUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testCreateDb2EntrySpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: DISCARD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(CREATE_DB2ENTRY_DISCARD_INVALID, expectedDiagnostic, "SP");
    }
}

