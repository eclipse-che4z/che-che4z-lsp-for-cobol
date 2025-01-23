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
        import org.junit.jupiter.params.ParameterizedTest;
        import org.junit.jupiter.params.provider.MethodSource;

        import java.util.Map;
        import java.util.stream.Stream;

/**
 * Test CICS Perform Command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-perform-dump">Perform System Commands</a>
 *
 * <p>This class tests all variations of the Perform System Commands found in the link above.
 */
public class TestCICSPerformSP {

    private static Stream<String> getValidOptions() {
        return Stream.of(
                "PERFORM NOHANDLE DELETSHIPPED",
                "PERFORM NOHANDLE DUMP TITLE({$varFour}) DUMPCODE({$varFour}) TITLELENGTH({$varFour})",
                "PERFORM DUMP NOHANDLE CALLER({$varFour}) CALLERLENGTH({$varFour}) DUMPCODE({$varFour})",
                "PERFORM DUMPID({$varFour}) NOHANDLE DUMPCODE({$varFour}) DUMP",
                "PERFORM ENDAFFINITY NETNAME({$varFour}) NETID({$varFour})",
                "PERFORM JVMSERVER({$varFour}) JVMTYPE({$varFour})",
                "PERFORM JVMSERVER({$varFour}) JVM JVMACTION({$varFour})",
                "PERFORM JVMSERVER({$varFour}) JVM DUMP DUMPTYPE({$varFour})",
                "PERFORM JVMSERVER({$varFour}) JVM DUMP ALL",
                "PERFORM JVMSERVER({$varFour}) JVM DUMP JAVACORE",
                "PERFORM JVMSERVER({$varFour}) JVM DUMP HEAP",
                "PERFORM JVMSERVER({$varFour}) JVM DUMP SNAPTRACE",
                "PERFORM JVMSERVER({$varFour}) JVM GATHER GATHERTYPE({$varFour})",
                "PERFORM JVMSERVER({$varFour}) JVM GATHER DIAGNOSTICS",
                "PERFORM JVMSERVER({$varFour}) JVM STACKTRACE TASKID({$varFour})",
                "PERFORM JVMSERVER({$varFour}) LIBERTY LIBRTYACTION({$varFour})",
                "PERFORM JVMSERVER({$varFour}) LIBERTY REFRESH RESOURCETYPE({$varFour})",
                "PERFORM JVMSERVER({$varFour}) LIBERTY REFRESH APPLICATION APPID({$varFour}) APPIDLEN({$varFour})",
                "PERFORM JVMSERVER({$varFour}) LIBERTY REFRESH CONFIG",
                "PERFORM JVMSERVER({$varFour}) LIBERTY SERVERDUMP",
                "PERFORM JVMSERVER({$varFour}) OSGI REFRESHPKGS",
                "PERFORM JVMSERVER({$varFour}) OSGI OSGIACTION({$varFour})",
                "PERFORM PIPELINE({$varFour}) ACTION({$varFour})",
                "PERFORM PIPELINE({$varFour}) SCAN",
                "PERFORM RESETTIME",
                "PERFORM SECDISCOVERY WRITE",
                "PERFORM SECDISCOVERY ACTION(123)",
                "PERFORM SECURITY REBUILD ESMRESP({$varFour})",
                "PERFORM SHUTDOWN PLT({$varFour}) DUMP",
                "PERFORM SHUTDOWN PLTNAME({$varFour}) DUMP",
                "PERFORM SHUTDOWN DUMP RESTART",
                "PERFORM SHUTDOWN SDTRAN({$varFour})",
                "PERFORM SHUTDOWN XLT({$varFour})",
                "PERFORM SHUTDOWN IMMEDIATE NORESTART SDTRAN({$varFour})",
                "PERFORM SHUTDOWN TAKEOVER SDTRAN({$varFour})",
                "PERFORM SSL REBUILD GSKRESP({$varFour})",
                "PERFORM STATISTICS RECORD ASYNCSERVICE ATOMSERVICE AUTOINSTALL BUNDLE CAPTURESPEC CIPHER CONNECTION DB2 DISPATCHER DOCTEMPLATE ENQUEUE EPADAPTER EVENTBINDING EVENTPROCESS FEPI FILE IPCONN",
                "PERFORM STATISTICS RECORD ALL",
                "PERFORM STATISTICS RECORD ALL RESETNOW",
                "PERFORM STATISTICS RECORD JOURNALNUM",
                "PERFORM STATISTICS RECORD JOURNALNAME",
                "PERFORM STATISTICS RECORD JVMPROGRAM JVMSERVER LIBRARY LSRPOOL MONITOR MQCONN MQMONITOR NODEJSAPP PIPELINE POLICY PROGAUTO PROGRAM PROGRAMDEF RECOVERY SECURITY STATS STORAGE STREAMNAME SYSDUMP TABLEMGR TCPIP TCPIPSERVICE TDQUEUE TERMINAL TRANCLASS",
                "PERFORM STATISTICS RECORD TCLASS TRANDUMP TRANSACTION TSQUEUE URIMAP USER VTAM WEBSERVICE XMLTRANSFORM");
    };

    private static final String PERFORM_DUMP_INVALID =
            "PERFORM {_DUMPCODE({$varFour})|error_}";
    private static final String PERFORM_DUMPCODE_INVALID =
            "PERFORM {DUMP|error}";
    private static final String PERFORM_ENDAFFINITY_INVALID =
            "PERFORM {ENDAFFINITY|error}";
    private static final String PERFORM_JVMSERVER_MUTUALEX_INVALID =
            "PERFORM JVMSERVER({$varFour}) {JVMTYPE|error}({$varOne}) {JVM|error2} JVMACTION({$varFour})";
    private static final String PERFORM_JVMSERVER_MUTUALEX2_INVALID =
            "PERFORM JVMSERVER({$varFour}) {OSGI|error} {REFRESHPKGS|error3} {LIBERTY|error2} SERVERDUMP";
    private static final String PERFORM_JVMSERVER_JVMMUTUALEX_INVALID =
            "PERFORM JVMSERVER({$varFour}) JVM {JVMACTION|error}({$varOne}) {DUMP|error2} ALL";
    private static final String PERFORM_JVMSERVER_JVM_DUMPMUTUALEX_INVALID =
            "PERFORM JVMSERVER({$varFour}) JVM {JAVACORE|error} DUMP {ALL|error2}";
    private static final String PERFORM_JVMSERVER_JVM_GATHERMUTUALEX_INVALID =
            "PERFORM JVMSERVER({$varFour}) JVM GATHER {GATHERTYPE|error}({$varOne}) {DIAGNOSTICS|error2}";
    private static final String PERFORM_JVMSERVER_JVM_STACKTRACE_INVALID =
            "PERFORM {_JVMSERVER({$varFour}) JVM STACKTRACE|error_}";
    private static final String PERFORM_JVMSERVER_LIBERTY_MUTUALEX_INVALID =
            "PERFORM JVMSERVER({$varFour}) LIBERTY {LIBRTYACTION|error}({$varOne}) {REFRESH|error2} CONFIG";
    private static final String PERFORM_JVMSERVER_LIBERTY_REFRESH_MUTUALEX_INVALID =
            "PERFORM JVMSERVER({$varFour}) LIBERTY REFRESH {RESOURCETYPE|error}({$varOne}) {CONFIG|error2}";
    private static final String PERFORM_JVMSERVER_LIBERTY_REFRESH_APPLICATION_INVALID =
            "PERFORM {_JVMSERVER({$varFour}) LIBERTY REFRESH APPLICATION APPIDLEN({$varFour})|error_}";
    private static final String PERFORM_JVMSERVER_OSGI_INVALID =
            "PERFORM JVMSERVER({$varFour}) OSGI {OSGIACTION|error}({$varOne}) {REFRESHPKGS|error2}";
    private static final String PERFORM_PIPELINE_INVALID =
            "PERFORM PIPELINE({$varFour}) {SCAN|error} {ACTION|error2}({$varOne})";
    private static final String PERFORM_SECDISCOVERY_INVALID =
            "PERFORM SECDISCOVERY {WRITE|error} {ACTION|error2}({$varOne})";
    private static final String PERFORM_SECURITY_INVALID =
            "PERFORM {SECURITY|error}";
    private static final String PERFORM_SHUTDOWN_MUTUALEX_INVALID =
            "PERFORM SHUTDOWN {PLT|error}({$varFour}) {PLTNAME|error2}({$varFour})";
    private static final String PERFORM_SHUTDOWN_MUTUALEX2_INVALID =
            "PERFORM SHUTDOWN {SDTRAN|error}({$varFour}) {NOSDTRAN|error2}";
    private static final String PERFORM_SSL_INVALID =
            "PERFORM {SSL|error}";
    private static final String PERFORM_STATISTICS_INVALID =
            "PERFORM {STATISTICS|error}";
    private static final String PERFORM_STATISTICS_ALL_INVALID =
            "PERFORM {_STATISTICS RECORD RESETNOW|error_}";
    private static final String PERFORM_STATISTICS_MUTUALEX_INVALID =
            "PERFORM STATISTICS RECORD {JOURNALNAME|error} {JOURNALNUM|error2}";
    private static final String PERFORM_STATISTICS_MUTUALEX2_INVALID =
            "PERFORM STATISTICS RECORD {TRANCLASS|error} {TCLASS|error2}";

    @ParameterizedTest
    @MethodSource("getValidOptions")
    void testPerformSpAllValid(String valid) {
        CICSTestUtils.noErrorTest(valid, "SP");
    }

    @Test
    void testPerformDumpCodeSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: DUMP",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_DUMP_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformDumpSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: DUMPCODE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_DUMPCODE_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformEndAffinitySpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: NETNAME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_ENDAFFINITY_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JVMTYPE or JVM or LIBERTY or OSGI",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JVMTYPE or JVM or LIBERTY or OSGI",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_MUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerSpMutualEx2Invalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JVMTYPE or JVM or LIBERTY or OSGI",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JVMTYPE or JVM or LIBERTY or OSGI",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error3",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: REFRESHPKGS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_MUTUALEX2_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerJvmSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JVMACTION or DUMP or GATHER or STACKTRACE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JVMACTION or DUMP or GATHER or STACKTRACE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));

        CICSTestUtils.errorTest(PERFORM_JVMSERVER_JVMMUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerJvmDumpSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: DUMPTYPE or ALL or JAVACORE or HEAP or SNAPTRACE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: DUMPTYPE or ALL or JAVACORE or HEAP or SNAPTRACE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_JVM_DUMPMUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerJvmGatherSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: GATHERTYPE or DIAGNOSTICS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: GATHERTYPE or DIAGNOSTICS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_JVM_GATHERMUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerJvmStackTraceSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: TASKID",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_JVM_STACKTRACE_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerJvmLibertySpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: LIBRTYACTION or REFRESH or SERVERDUMP",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: LIBRTYACTION or REFRESH or SERVERDUMP",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_LIBERTY_MUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerJvmLibertyRefreshSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: RESOURCETYPE or APPLICATION or CONFIG",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: RESOURCETYPE or APPLICATION or CONFIG",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_LIBERTY_REFRESH_MUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerJvmLibertyRefreshApplicationSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option for: APPIDLEN without APPID",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_LIBERTY_REFRESH_APPLICATION_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformJvmServerOsgiSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: OSGIACTION or REFRESHPKGS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: OSGIACTION or REFRESHPKGS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_JVMSERVER_OSGI_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformPipelineSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTION or SCAN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTION or SCAN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_PIPELINE_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformSecdiscoverySpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTION or WRITE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: ACTION or WRITE",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_SECDISCOVERY_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformSecuritySpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: REBUILD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_SECURITY_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformShutdownSpMutualExInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: PLT or PLTNAME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: PLT or PLTNAME",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_SHUTDOWN_MUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformShutdownSpMutualEx2Invalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: SDTRAN or NOSDTRAN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: SDTRAN or NOSDTRAN",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_SHUTDOWN_MUTUALEX2_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformSslSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: REBUILD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_SSL_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformStatisticsSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: RECORD",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_STATISTICS_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformStatisticsAllSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Missing required option for: RESETNOW without ALL",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_STATISTICS_ALL_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformStatisticsMutualExSpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JOURNALNAME or JOURNALNUM",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: JOURNALNAME or JOURNALNUM",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_STATISTICS_MUTUALEX_INVALID, expectedDiagnostic, "SP");
    }
    @Test
    void testPerformStatisticsMutualEx2SpInvalid() {
        Map<String, Diagnostic> expectedDiagnostic =
                ImmutableMap.of(
                        "error",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: TRANCLASS or TCLASS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "error2",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: TRANCLASS or TCLASS",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(PERFORM_STATISTICS_MUTUALEX2_INVALID, expectedDiagnostic, "SP");
    }
}

