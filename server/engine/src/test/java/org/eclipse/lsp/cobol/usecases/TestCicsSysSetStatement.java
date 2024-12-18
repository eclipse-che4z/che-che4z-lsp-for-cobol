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

import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.*;

/**
 * Test SET commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-set-association-usercorrdata">SET
 * Command</a>
 *
 * <p>This class tests all variations of the SET command found in the link above.
 */
public class TestCicsSysSetStatement {

    private static final String ASSOCIATION_USERCORRDATA_VALID_1 = "SET ASSOCIATION USERCORRDATA(123)";
    private static final String ATOMSERVICE_VALID_1 = "SET ATOMSERVICE(123)";
    private static final String ATOMSERVICE_VALID_2 = "SET ATOMSERVICE(123) ENABLESTATUS(123)";
    private static final String AUTOINSTALL_VALID_1 = "SET AUTOINSTALL";
    private static final String AUTOINSTALL_VALID_2 = "SET AUTOINSTALL AIBRIDGE(123) CONSOLES(123) MAXREQS(123) PROGRAM(123)";
    private static final String BRFACILITY_VALID_1 = "SET BRFACILITY(123)";
    private static final String BRFACILITY_VALID_2 = "SET BRFACILITY(123) TERMSTATUS(123)";
    private static final String BUNDLE_VALID_1 = "SET BUNDLE(123)";
    private static final String BUNDLE_VALID_2 = "SET BUNDLE(123) AVAILSTATUS(123)";
    private static final String BUNDLE_VALID_3 = "SET BUNDLE(123) COPY(123)";
    private static final String CONNECTION_VALID_1 = "SET CONNECTION(123)";
    private static final String CONNECTION_VALID_2 = "SET CONNECTION(123) ACQSTATUS(123) AFFINITY(123) EXITTRACING(123) PENDSTATUS(123) CANCEL NORECOVDATA INSERVICE UOWACTION(123) ZCPTRACE";
    private static final String DB2CONN_VALID_1 = "SET DB2CONN";
    private static final String DB2CONN_VALID_2 = "SET DB2CONN ACCOUNTREC(123) AUTHID(123) AUTHTYPE(123) BUSY(123) COMAUTHID(123) COMAUTHTYPE(123) COMTHREADLIM(123) CONNECTERROR(123) CONNECTST(123) DB2GROUPID(123) DB2ID(123) MSGQUEUE1(1) MSGQUEUE2(2) MSGQUEUE3(3) NONTERMREL(123) PLAN(1) PLANEXITNAME(2) PRIORITY(123) PURGECYCLEM(123) PURGECYCLES(2) RESYNCMEMBER(123) REUSELIMIT(1) SECURITY(REBUILD) SIGNID(123) STANDBYMODE(123) STATSQUEUE(2) TCBLIMIT(1) THREADLIMIT(9001) THREADWAIT(3)";
    private static final String DB2ENTRY_VALID_1 = "SET DB2ENTRY ";
    private static final String DB2ENTRY_VALID_2 = "SET DB2ENTRY(123) ACCOUNTREC(123) AUTHID(123) AUTHTYPE(123) BUSY(123) DISABLEDACT(123) ENABLESTATUS(123) PLAN(123) PLANEXITNAME(123) PRIORITY(123) SHARELOCKS(123) THREADLIMIT(1) THREADWAIT(1)";
    private static final String DB2TRAN_VALID_1 = "SET DB2TRAN";
    private static final String DB2TRAN_VALID_2 = "SET DB2TRAN DB2ENTRY(123) TRANSID(123)";
    private static final String DELETSHIPPED_VALID_1 = "SET DELETSHIPPED";
    private static final String DELETSHIPPED_VALID_2 = "SET DELETSHIPPED IDLE(123) INTERVALHRS(1) INTERVALMINS(12) INTERVALSECS(50)";
    private static final String DISPATCHER_VALID_1 = "SET DISPATCHER";
    private static final String DISPATCHER_VALID_2 = "SET DISPATCHER MAXOPENTCBS(123) MAXSSLTCBS(123) MAXXPTCBS(123) MROBATCH(123) PRTYAGING(123) RUNAWAY(123) SCANDELAY(123) TIME(123)";
    private static final String DOCTEMPLATE_VALID_1 = "SET DOCTEMPLATE(123) COPY(3)";
    private static final String DOCTEMPLATE_VALID_2 = "SET DOCTEMPLATE(123) NEWCOPY";
    private static final String DSNAME_VALID_1 = "SET DSNAME(123)";
    private static final String DSNAME_VALID_2 = "SET DSNAME(123) ACTION(123) AVAILABILITY(123) QUESCESTATE(123) BUSY(123) UOWACTION(123)";
    private static final String DUMPDS_VALID_1 = "SET DUMPDS";
    private static final String DUMPDS_VALID_2 = "SET DUMPDS OPEN NOSWITCH";
    private static final String ENQMODEL_VALID_1 = "SET ENQMODEL(123) STATUS(1)";
    private static final String ENQMODEL_VALID_2 = "SET ENQMODEL(123) DISABLED";
    private static final String EPADAPTER_VALID_1 = "SET EPADAPTER(123) ENABLESTATUS(123)";
    private static final String EPADAPTER_VALID_2 = "SET EPADAPTER(123) ENABLED";
    private static final String EPADAPTERSET_VALID_1 = "SET EPADAPTERSET(123) ENABLESTATUS(123) ENABLED";
    private static final String EVENTBINDING_VALID_1 = "SET EVENTBINDING(123) ENABLESTATUS(123)";
    private static final String EVENTBINDING_VALID_2 = "SET EVENTBINDING(123) ENABLED";
    private static final String EVENTPROCESS_VALID_1 = "SET EVENTPROCESS STARTED";

    private static final String FILE_VALID_1 = "SET FILE(123)";
    private static final String FILE_VALID_2 = "SET FILE(123) ADD(123) BROWSE(123) WAIT CFDTPOOL(123) DELETE(123) DISPOSITION(123) DSNAME(123) EMPTYSTATUS(123) ENABLESTATUS(123) OPENSTATUS(123) EXCLUSIVE(123) KEYLENGTH(1) LOADTYPE(1) LSRPOOLNUM(3) MAXNUMRECS(3) READABLE RECORDSIZE(1) CONSISTENT RLS STRINGS(123) TABLE(123) TABLENAME(123) UPDATE(3) UPDATEMODEL(1)";
    private static final String FILE_VALID_3 = "SET FILE(123) ENABLED";
    private static final String FILE_VALID_4 = "SET FILE(123) DISABLED WAIT";
    private static final String FILE_VALID_5 = "SET FILE(123) OPEN EMPTY";
    private static final String FILE_VALID_6 = "SET FILE(123) CLOSED EMPTY FORCE";

    private static final String HOST_VALID_1 = "SET HOST(123)";
    private static final String HOST_VALID_2 = "SET HOST(123) ENABLESTATUS(123)";
    private static final String IPCONN_VALID_1 = "SET IPCONN(123)";
    private static final String IPCONN_VALID_2 = "SET IPCONN(123) CONNSTATUS(123) PENDSTATUS(123) CANCEL NORECOVDATA INSERVICE BACKOUT";
    private static final String IRC_VALID_1 = "SET IRC";
    private static final String IRC_VALID_2 = "SET IRC OPENSTATUS(123)";
    private static final String JOURNALNAME_VALID_1 = "SET JOURNALNAME(123) ACTION(123) STATUS(123)";
    private static final String JOURNALNAME_VALID_2 = "SET JOURNALNAME(123) FLUSH ENABLED";
    //private static final String JOURNALNUM_VALID_1 = "SET JOURNALNUM ";
    private static final String JVMENDPOINT_VALID_1 = "SET JVMENDPOINT(1) JVMSERVER(1) DISABLED";
    private static final String JVMENDPOINT_VALID_2 = "SET JVMENDPOINT(1) JVMSERVER(1) ENABLED";
    private static final String JVMSERVER_VALID_1 = "SET JVMSERVER(123) ENABLED";
    private static final String JVMSERVER_VALID_2 = "SET JVMSERVER(123) THREADLIMIT(1) ENABLED PHASEOUT";
    private static final String LIBRARY_VALID_1 = "SET LIBRARY(1)";
    private static final String LIBRARY_VALID_2 = "SET LIBRARY(1) CRITICALST(1) ENABLESTATUS(1) RANKING(3)";
    private static final String MODENAME_VALID_1 = "SET MODENAME ";
    private static final String MODENAME_VALID_2 = "SET MODENAME ";
    private static final String MONITOR_VALID_1 = "SET MONITOR ";
    private static final String MONITOR_VALID_2 = "SET MONITOR ";
    private static final String MQCONN_VALID_1 = "SET MQCONN ";
    private static final String MQCONN_VALID_2 = "SET MQCONN ";
    private static final String MQMONITOR_VALID_1 = "SET MQMONITOR ";
    private static final String MQMONITOR_VALID_2 = "SET MQMONITOR ";
    private static final String NETNAME_VALID_1 = "SET NETNAME ";
    private static final String NETNAME_VALID_2 = "SET NETNAME ";
    private static final String PIPELINE_VALID_1 = "SET PIPELINE ";
    private static final String PIPELINE_VALID_2 = "SET PIPELINE ";
    private static final String PROCESSTYPE_VALID_1 = "SET PROCESSTYPE ";
    private static final String PROCESSTYPE_VALID_2 = "SET PROCESSTYPE ";
    private static final String PROGRAM_VALID_1 = "SET PROGRAM ";
    private static final String PROGRAM_VALID_2 = "SET PROGRAM ";
    private static final String SECDISCOVERY_VALID_1 = "SET SECDISCOVERY ";
    private static final String SECDISCOVERY_VALID_2 = "SET SECDISCOVERY ";
    private static final String SECRECORDING_VALID_1 = "SET SECRECORDING ";
    private static final String SECRECORDING_VALID_2 = "SET SECRECORDING ";
    private static final String STATISTICS_VALID_1 = "SET STATISTICS ";
    private static final String STATISTICS_VALID_2 = "SET STATISTICS ";
    private static final String SYSDUMPCODE_VALID_1 = "SET SYSDUMPCODE ";
    private static final String SYSDUMPCODE_VALID_2 = "SET SYSDUMPCODE ";
    private static final String SYSTEM_VALID_1 = "SET SYSTEM ";
    private static final String SYSTEM_VALID_2 = "SET SYSTEM ";
    private static final String TAGS_REFRESH_VALID_1 = "SET TAGS_REFRESH ";
    private static final String TAGS_REFRESH_VALID_2 = "SET TAGS_REFRESH ";
    private static final String TASK_VALID_1 = "SET TASK ";
    private static final String TASK_VALID_2 = "SET TASK ";
    private static final String TCLASS_VALID_1 = "SET TCLASS ";
    private static final String TCLASS_VALID_2 = "SET TCLASS ";
    private static final String TCPIP_VALID_1 = "SET TCPIP ";
    private static final String TCPIP_VALID_2 = "SET TCPIP ";
    private static final String TCPIPSERVICE_VALID_1 = "SET TCPIPSERVICE ";
    private static final String TCPIPSERVICE_VALID_2 = "SET TCPIPSERVICE ";
    private static final String TDQUEUE_VALID_1 = "SET TDQUEUE ";
    private static final String TDQUEUE_VALID_2 = "SET TDQUEUE ";
    private static final String TEMPSTORAGE_VALID_1 = "SET TEMPSTORAGE ";
    private static final String TEMPSTORAGE_VALID_2 = "SET TEMPSTORAGE ";
    private static final String TERMINAL_VALID_1 = "SET TERMINAL ";
    private static final String TERMINAL_VALID_2 = "SET TERMINAL ";
    private static final String TRACEDEST_VALID_1 = "SET TRACEDEST ";
    private static final String TRACEDEST_VALID_2 = "SET TRACEDEST ";
    private static final String TRACEFLAG_VALID_1 = "SET TRACEFLAG ";
    private static final String TRACEFLAG_VALID_2 = "SET TRACEFLAG ";
    private static final String TRACETYPE_VALID_1 = "SET TRACETYPE ";
    private static final String TRACETYPE_VALID_2 = "SET TRACETYPE ";
    private static final String TRANCLASS_VALID_1 = "SET TRANCLASS ";
    private static final String TRANCLASS_VALID_2 = "SET TRANCLASS ";
    private static final String TRANDUMPCODE_VALID_1 = "SET TRANDUMPCODE ";
    private static final String TRANDUMPCODE_VALID_2 = "SET TRANDUMPCODE ";
    private static final String TRANSACTION_VALID_1 = "SET TRANSACTION ";
    private static final String TRANSACTION_VALID_2 = "SET TRANSACTION ";
    private static final String TSQUEUE_VALID_1 = "SET TSQUEUE ";
    private static final String TSQUEUE_VALID_2 = "SET TSQUEUE ";
    private static final String UOW_VALID_1 = "SET UOW ";
    private static final String UOW_VALID_2 = "SET UOW ";
    private static final String UOWLINK_VALID_1 = "SET UOWLINK ";
    private static final String UOWLINK_VALID_2 = "SET UOWLINK ";
    private static final String URIMAP_VALID_1 = "SET URIMAP ";
    private static final String URIMAP_VALID_2 = "SET URIMAP ";
    private static final String VOLUME_VALID_1 = "SET VOLUME ";
    private static final String VOLUME_VALID_2 = "SET VOLUME ";
    private static final String VTAM_VALID_1 = "SET VTAM ";
    private static final String VTAM_VALID_2 = "SET VTAM ";
    private static final String WEB_VALID_1 = "SET WEB ";
    private static final String WEB_VALID_2 = "SET WEB ";
    private static final String WEBSERVICE_VALID_1 = "SET WEBSERVICE ";
    private static final String WEBSERVICE_VALID_2 = "SET WEBSERVICE ";
    private static final String WLMHEALTH_VALID_1 = "SET WLMHEALTH ";
    private static final String WLMHEALTH_VALID_2 = "SET WLMHEALTH ";
    private static final String XMLTRANSFORM_VALID_1 = "SET XMLTRANSFORM ";
    private static final String XMLTRANSFORM_VALID_2 = "SET XMLTRANSFORM ";

    /* --------------------------------------------------- */
    // Invalid test cases
    private static final String ATOMSERVICE_INVALID_1 = "SET ATOMSERVICE(123) ENABLED {DISABLED|errorOne}";
    private static final String AUTOINSTALL_INVALID_1 = "SET AUTOINSTALL AIBRIDGE(123) {AIBRIDGE|errorOne}(123)";
    private static final String BRFACILITY_INVALID_1 = "SET BRFACILITY(123) TERMSTATUS(123) {RELEASED|errorOne}";
    private static final String BUNDLE_INVALID_1 = "SET BUNDLE(123) COPY(123) {PHASEIN|errorOne}";
    private static final String CONNECTION_INVALID_1 = "SET CONNECTION(123) ACQSTATUS(123) {ACQUIRED|errorOne}";
    private static final String CONNECTION_INVALID_2 = "SET CONNECTION(123) BACKOUT {COMMIT|errorOne}";
    private static final String DB2CONN_INVALID_1 = "SET DB2CONN TASK {NONE|errorOne}";
    private static final String DB2CONN_INVALID_2 = "SET DB2CONN TWAIT {NOTWAIT|errorOne}";
    private static final String DB2ENTRY_INVALID_1 = "SET DB2ENTRY ABEND {SQLCODE|errorOne}";
    private static final String DB2ENTRY_INVALID_2 = "SET DB2ENTRY(123) YES {NO|errorOne}";
    private static final String DB2TRAN_INVALID_1 = "SET DB2TRAN DB2ENTRY(123) {DB2ENTRY|errorOne}(123)";
    private static final String DELETSHIPPED_INVALID_1 = "SET DELETSHIPPED IDLE(3) {IDLEHRS|errorOne}(3)";
    private static final String DELETSHIPPED_INVALID_2 = "SET DELETSHIPPED INTERVAL(3) {INTERVALHRS|errorOne}(3)";
    private static final String DISPATCHER_INVALID_1 = "SET DISPATCHER TIME(123) {TIME|errorOne}(123)";
    private static final String DOCTEMPLATE_INVALID_1 = "SET {DOCTEMPLATE|errorOne} {NEWCOPY|errorTwo} COPY(123)";
    private static final String DSNAME_INVALID_1 = "SET DSNAME(123) REMOVE {RECOVERED|errorOne}";
    private static final String DSNAME_INVALID_2 = "SET DSNAME(123) QUIESCED {UNQUIESCED|errorOne}";
    private static final String DUMPDS_INVALID_1 = "SET DUMPDS {OPEN|errorOne} CLOSED";
    private static final String DUMPDS_INVALID_2 = "SET DUMPDS NOSWITCH {SWITCHNEXT|errorOne}";
    private static final String ENQMODEL_INVALID_1 = "SET {_ENQMODEL(123) STATUS(123) DISABLED|errorOne_}";
    private static final String EPADAPTER_INVALID_1 = "SET EPADAPTER(123) ENABLESTATUS(123) {ENABLED|errorOne}";
    //private static final String EPADAPTERSET_INVALID_1 = "SET EPADAPTERSET ";
    private static final String EVENTBINDING_INVALID_1 = "SET EVENTBINDING(123) ENABLESTATUS(123) {DISABLED|errorOne}";
    private static final String EVENTPROCESS_INVALID_1 = "SET {_EVENTPROCESS STARTED STOPPED|errorOne_}";
    private static final String FILE_INVALID_1 = "SET FILE(3) ADDABLE {NOTADDABLE|errorOne}";
    private static final String FILE_INVALID_2 = "SET FILE(3) CICSTABLE {NOTTABLE|errorOne}";
    //private static final String HOST_INVALID_1 = "SET HOST ";
    private static final String IPCONN_INVALID_1 = "SET IPCONN(123) ACQUIRED {RELEASED|errorOne}";
    private static final String IPCONN_INVALID_2 = "SET IPCONN(123) CANCEL {FORCECANCEL|errorOne}";
    private static final String IRC_INVALID_1 = "SET IRC CLOSED {OPEN|errorOne}";
    private static final String JOURNALNAME_INVALID_1 = "SET {_JOURNALNAME(123) FLUSH RESET ENABLED|errorOne_}";
    private static final String JOURNALNAME_INVALID_2 = "SET {_JOURNALNAME(123) FLUSH|errorOne_}";
    //private static final String JOURNALNUM_INVALID_1 = "SET JOURNALNUM ";
    private static final String JVMENDPOINT_INVALID_1 = "SET {_JVMENDPOINT(1) ENABLED|errorOne_}";
    private static final String JVMENDPOINT_INVALID_2 = "SET {_JVMENDPOINT(1) JVMSERVER(1)|errorOne_}";
    private static final String JVMSERVER_INVALID_1 = "SET {_JVMSERVER(123) ENABLED DISABLED|errorOne_}";
    private static final String JVMSERVER_INVALID_2 = "SET JVMSERVER(123) ENABLED PHASEOUT {PURGE|errorOne} ";
    private static final String LIBRARY_INVALID_1 = "SET LIBRARY ";
    private static final String LIBRARY_INVALID_2 = "SET LIBRARY ";
    private static final String MODENAME_INVALID_1 = "SET MODENAME ";
    private static final String MODENAME_INVALID_2 = "SET MODENAME ";
    private static final String MONITOR_INVALID_1 = "SET MONITOR ";
    private static final String MONITOR_INVALID_2 = "SET MONITOR ";
    private static final String MQCONN_INVALID_1 = "SET MQCONN ";
    private static final String MQCONN_INVALID_2 = "SET MQCONN ";
    private static final String MQMONITOR_INVALID_1 = "SET MQMONITOR ";
    private static final String MQMONITOR_INVALID_2 = "SET MQMONITOR ";
    private static final String NETNAME_INVALID_1 = "SET NETNAME ";
    private static final String NETNAME_INVALID_2 = "SET NETNAME ";
    private static final String PIPELINE_INVALID_1 = "SET PIPELINE ";
    private static final String PIPELINE_INVALID_2 = "SET PIPELINE ";
    private static final String PROCESSTYPE_INVALID_1 = "SET PROCESSTYPE ";
    private static final String PROCESSTYPE_INVALID_2 = "SET PROCESSTYPE ";
    private static final String PROGRAM_INVALID_1 = "SET PROGRAM ";
    private static final String PROGRAM_INVALID_2 = "SET PROGRAM ";
    private static final String SECDISCOVERY_INVALID_1 = "SET SECDISCOVERY ";
    private static final String SECDISCOVERY_INVALID_2 = "SET SECDISCOVERY ";
    private static final String SECRECORDING_INVALID_1 = "SET SECRECORDING ";
    private static final String SECRECORDING_INVALID_2 = "SET SECRECORDING ";
    private static final String STATISTICS_INVALID_1 = "SET STATISTICS ";
    private static final String STATISTICS_INVALID_2 = "SET STATISTICS ";
    private static final String SYSDUMPCODE_INVALID_1 = "SET SYSDUMPCODE ";
    private static final String SYSDUMPCODE_INVALID_2 = "SET SYSDUMPCODE ";
    private static final String SYSTEM_INVALID_1 = "SET SYSTEM ";
    private static final String SYSTEM_INVALID_2 = "SET SYSTEM ";
    private static final String TAGS_REFRESH_INVALID_1 = "SET TAGS_REFRESH ";
    private static final String TAGS_REFRESH_INVALID_2 = "SET TAGS_REFRESH ";
    private static final String TASK_INVALID_1 = "SET TASK ";
    private static final String TASK_INVALID_2 = "SET TASK ";
    private static final String TCLASS_INVALID_1 = "SET TCLASS ";
    private static final String TCLASS_INVALID_2 = "SET TCLASS ";
    private static final String TCPIP_INVALID_1 = "SET TCPIP ";
    private static final String TCPIP_INVALID_2 = "SET TCPIP ";
    private static final String TCPIPSERVICE_INVALID_1 = "SET TCPIPSERVICE ";
    private static final String TCPIPSERVICE_INVALID_2 = "SET TCPIPSERVICE ";
    private static final String TDQUEUE_INVALID_1 = "SET TDQUEUE ";
    private static final String TDQUEUE_INVALID_2 = "SET TDQUEUE ";
    private static final String TEMPSTORAGE_INVALID_1 = "SET TEMPSTORAGE ";
    private static final String TEMPSTORAGE_INVALID_2 = "SET TEMPSTORAGE ";
    private static final String TERMINAL_INVALID_1 = "SET TERMINAL ";
    private static final String TERMINAL_INVALID_2 = "SET TERMINAL ";
    private static final String TRACEDEST_INVALID_1 = "SET TRACEDEST ";
    private static final String TRACEDEST_INVALID_2 = "SET TRACEDEST ";
    private static final String TRACEFLAG_INVALID_1 = "SET TRACEFLAG ";
    private static final String TRACEFLAG_INVALID_2 = "SET TRACEFLAG ";
    private static final String TRACETYPE_INVALID_1 = "SET TRACETYPE ";
    private static final String TRACETYPE_INVALID_2 = "SET TRACETYPE ";
    private static final String TRANCLASS_INVALID_1 = "SET TRANCLASS ";
    private static final String TRANCLASS_INVALID_2 = "SET TRANCLASS ";
    private static final String TRANDUMPCODE_INVALID_1 = "SET TRANDUMPCODE ";
    private static final String TRANDUMPCODE_INVALID_2 = "SET TRANDUMPCODE ";
    private static final String TRANSACTION_INVALID_1 = "SET TRANSACTION ";
    private static final String TRANSACTION_INVALID_2 = "SET TRANSACTION ";
    private static final String TSQUEUE_INVALID_1 = "SET TSQUEUE ";
    private static final String TSQUEUE_INVALID_2 = "SET TSQUEUE ";
    private static final String UOW_INVALID_1 = "SET UOW ";
    private static final String UOW_INVALID_2 = "SET UOW ";
    private static final String UOWLINK_INVALID_1 = "SET UOWLINK ";
    private static final String UOWLINK_INVALID_2 = "SET UOWLINK ";
    private static final String URIMAP_INVALID_1 = "SET URIMAP ";
    private static final String URIMAP_INVALID_2 = "SET URIMAP ";
    private static final String VOLUME_INVALID_1 = "SET VOLUME ";
    private static final String VOLUME_INVALID_2 = "SET VOLUME ";
    private static final String VTAM_INVALID_1 = "SET VTAM ";
    private static final String VTAM_INVALID_2 = "SET VTAM ";
    private static final String WEB_INVALID_1 = "SET WEB ";
    private static final String WEB_INVALID_2 = "SET WEB ";
    private static final String WEBSERVICE_INVALID_1 = "SET WEBSERVICE ";
    private static final String WEBSERVICE_INVALID_2 = "SET WEBSERVICE ";
    private static final String WLMHEALTH_INVALID_1 = "SET WLMHEALTH ";
    private static final String WLMHEALTH_INVALID_2 = "SET WLMHEALTH ";
    private static final String XMLTRANSFORM_INVALID_1 = "SET XMLTRANSFORM ";
    private static final String XMLTRANSFORM_INVALID_2 = "SET XMLTRANSFORM ";

    // Utility
    void testSingleError(String invalidStatement, String errorMessage) {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), errorMessage, DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(invalidStatement, expectedDiagnostics);
    }

    void testTwoErrors(String invalidStatement, String errorMessage1, String errorMessage2) {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), errorMessage1, DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorTwo", new Diagnostic(new Range(), errorMessage2, DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(invalidStatement, expectedDiagnostics);
    }

    // Test Functions
    @Test
    void testCicsAssociationUsercorrdataValid() {
        CICSTestUtils.noErrorTest(ASSOCIATION_USERCORRDATA_VALID_1);
    }

    @Test
    void testCicsAtomserviceValid() {
        CICSTestUtils.noErrorTest(ATOMSERVICE_VALID_1);
        CICSTestUtils.noErrorTest(ATOMSERVICE_VALID_2);
    }

    @Test
    void testCicsAutoinstallValid() {
        CICSTestUtils.noErrorTest(AUTOINSTALL_VALID_1);
        CICSTestUtils.noErrorTest(AUTOINSTALL_VALID_2);
    }

    @Test
    void testCicsBrfacilityValid() {
        CICSTestUtils.noErrorTest(BRFACILITY_VALID_1);
        CICSTestUtils.noErrorTest(BRFACILITY_VALID_2);
    }

    @Test
    void testCicsBundleValid() {
        CICSTestUtils.noErrorTest(BUNDLE_VALID_1);
        CICSTestUtils.noErrorTest(BUNDLE_VALID_2);
        CICSTestUtils.noErrorTest(BUNDLE_VALID_3);
    }

    @Test
    void testCicsConnectionValid() {
        CICSTestUtils.noErrorTest(CONNECTION_VALID_1);
        CICSTestUtils.noErrorTest(CONNECTION_VALID_2);
    }

    @Test
    void testCicsDb2connValid() {
        CICSTestUtils.noErrorTest(DB2CONN_VALID_1);
        CICSTestUtils.noErrorTest(DB2CONN_VALID_2);
    }

    @Test
    void testCicsDb2entryValid() {
        CICSTestUtils.noErrorTest(DB2ENTRY_VALID_1);
        CICSTestUtils.noErrorTest(DB2ENTRY_VALID_2);
    }

    @Test
    void testCicsDb2tranValid() {
        CICSTestUtils.noErrorTest(DB2TRAN_VALID_1);
        CICSTestUtils.noErrorTest(DB2TRAN_VALID_2);
    }

    @Test
    void testCicsDeletshippedValid() {
        CICSTestUtils.noErrorTest(DELETSHIPPED_VALID_1);
        CICSTestUtils.noErrorTest(DELETSHIPPED_VALID_2);
    }

    @Test
    void testCicsDispatcherValid() {
        CICSTestUtils.noErrorTest(DISPATCHER_VALID_1);
        CICSTestUtils.noErrorTest(DISPATCHER_VALID_2);
    }

    @Test
    void testCicsDoctemplateValid() {
        CICSTestUtils.noErrorTest(DOCTEMPLATE_VALID_1);
        CICSTestUtils.noErrorTest(DOCTEMPLATE_VALID_2);
    }

    @Test
    void testCicsDsnameValid() {
        CICSTestUtils.noErrorTest(DSNAME_VALID_1);
        CICSTestUtils.noErrorTest(DSNAME_VALID_2);
    }

    @Test
    void testCicsDumpdsValid() {
        CICSTestUtils.noErrorTest(DUMPDS_VALID_1);
        CICSTestUtils.noErrorTest(DUMPDS_VALID_2);
    }

    @Test
    void testCicsEnqmodelValid() {
        CICSTestUtils.noErrorTest(ENQMODEL_VALID_1);
        CICSTestUtils.noErrorTest(ENQMODEL_VALID_2);
    }

    @Test
    void testCicsEpadapterValid() {
        CICSTestUtils.noErrorTest(EPADAPTER_VALID_1);
        CICSTestUtils.noErrorTest(EPADAPTER_VALID_2);
    }

    @Test
    void testCicsEpadaptersetValid() {
        CICSTestUtils.noErrorTest(EPADAPTERSET_VALID_1);
    }

    @Test
    void testCicsEventbindingValid() {
        CICSTestUtils.noErrorTest(EVENTBINDING_VALID_1);
        CICSTestUtils.noErrorTest(EVENTBINDING_VALID_2);
    }

    @Test
    void testCicsEventprocessValid() {
        CICSTestUtils.noErrorTest(EVENTPROCESS_VALID_1);
    }

    @Test
    void testCicsFileValid() {
        CICSTestUtils.noErrorTest(FILE_VALID_1);
        CICSTestUtils.noErrorTest(FILE_VALID_2);
        CICSTestUtils.noErrorTest(FILE_VALID_3);
        CICSTestUtils.noErrorTest(FILE_VALID_4);
        CICSTestUtils.noErrorTest(FILE_VALID_5);
        CICSTestUtils.noErrorTest(FILE_VALID_6);
    }

    @Test
    void testCicsHostValid() {
        CICSTestUtils.noErrorTest(HOST_VALID_1);
        CICSTestUtils.noErrorTest(HOST_VALID_2);
    }

    @Test
    void testCicsIpconnValid() {
        CICSTestUtils.noErrorTest(IPCONN_VALID_1);
        CICSTestUtils.noErrorTest(IPCONN_VALID_2);
    }

    @Test
    void testCicsIrcValid() {
        CICSTestUtils.noErrorTest(IRC_VALID_1);
        CICSTestUtils.noErrorTest(IRC_VALID_2);
    }

    @Test
    void testCicsJournalnameValid() {
        CICSTestUtils.noErrorTest(JOURNALNAME_VALID_1);
        CICSTestUtils.noErrorTest(JOURNALNAME_VALID_2);
    }

    // See JOURNALNUM for JOURNALNAME tests due to NAME being obsolete.

    @Test
    void testJvmendpointValid() {
        CICSTestUtils.noErrorTest(JVMENDPOINT_VALID_1);
        CICSTestUtils.noErrorTest(JVMENDPOINT_VALID_2);
    }

    @Test
    void testCicsJvmserverValid() {
        CICSTestUtils.noErrorTest(JVMSERVER_VALID_1);
        CICSTestUtils.noErrorTest(JVMSERVER_VALID_2);
    }

    @Test
    void testCicsLibraryValid() {
        CICSTestUtils.noErrorTest(LIBRARY_VALID_1);
        CICSTestUtils.noErrorTest(LIBRARY_VALID_2);
    }

    @Test
    void testCicsModenameValid() {
        CICSTestUtils.noErrorTest(MODENAME_VALID_1);
        CICSTestUtils.noErrorTest(MODENAME_VALID_2);
    }

    @Test
    void testCicsMonitorValid() {
        CICSTestUtils.noErrorTest(MONITOR_VALID_1);
        CICSTestUtils.noErrorTest(MONITOR_VALID_2);
    }

    @Test
    void testCicsMqconnValid() {
        CICSTestUtils.noErrorTest(MQCONN_VALID_1);
        CICSTestUtils.noErrorTest(MQCONN_VALID_2);
    }

    @Test
    void testCicsMqmonitorValid() {
        CICSTestUtils.noErrorTest(MQMONITOR_VALID_1);
        CICSTestUtils.noErrorTest(MQMONITOR_VALID_2);
    }

    @Test
    void testCicsNetnameValid() {
        CICSTestUtils.noErrorTest(NETNAME_VALID_1);
        CICSTestUtils.noErrorTest(NETNAME_VALID_2);
    }

    @Test
    void testCicsPipelineValid() {
        CICSTestUtils.noErrorTest(PIPELINE_VALID_1);
        CICSTestUtils.noErrorTest(PIPELINE_VALID_2);
    }

    @Test
    void testCicsProcesstypeValid() {
        CICSTestUtils.noErrorTest(PROCESSTYPE_VALID_1);
        CICSTestUtils.noErrorTest(PROCESSTYPE_VALID_2);
    }

    @Test
    void testCicsProgramValid() {
        CICSTestUtils.noErrorTest(PROGRAM_VALID_1);
        CICSTestUtils.noErrorTest(PROGRAM_VALID_2);
    }

    @Test
    void testCicsSecdiscoveryValid() {
        CICSTestUtils.noErrorTest(SECDISCOVERY_VALID_1);
        CICSTestUtils.noErrorTest(SECDISCOVERY_VALID_2);
    }

    @Test
    void testCicsSecrecordingValid() {
        CICSTestUtils.noErrorTest(SECRECORDING_VALID_1);
        CICSTestUtils.noErrorTest(SECRECORDING_VALID_2);
    }

    @Test
    void testCicsStatisticsValid() {
        CICSTestUtils.noErrorTest(STATISTICS_VALID_1);
        CICSTestUtils.noErrorTest(STATISTICS_VALID_2);
    }

    @Test
    void testCicsSysdumpcodeValid() {
        CICSTestUtils.noErrorTest(SYSDUMPCODE_VALID_1);
        CICSTestUtils.noErrorTest(SYSDUMPCODE_VALID_2);
    }

    @Test
    void testCicsSystemValid() {
        CICSTestUtils.noErrorTest(SYSTEM_VALID_1);
        CICSTestUtils.noErrorTest(SYSTEM_VALID_2);
    }

    @Test
    void testCicsTags_refreshValid() {
        CICSTestUtils.noErrorTest(TAGS_REFRESH_VALID_1);
        CICSTestUtils.noErrorTest(TAGS_REFRESH_VALID_2);
    }

    @Test
    void testCicsTaskValid() {
        CICSTestUtils.noErrorTest(TASK_VALID_1);
        CICSTestUtils.noErrorTest(TASK_VALID_2);
    }

    @Test
    void testCicsTclassValid() {
        CICSTestUtils.noErrorTest(TCLASS_VALID_1);
        CICSTestUtils.noErrorTest(TCLASS_VALID_2);
    }

    @Test
    void testCicsTcpipValid() {
        CICSTestUtils.noErrorTest(TCPIP_VALID_1);
        CICSTestUtils.noErrorTest(TCPIP_VALID_2);
    }

    @Test
    void testCicsTcpipserviceValid() {
        CICSTestUtils.noErrorTest(TCPIPSERVICE_VALID_1);
        CICSTestUtils.noErrorTest(TCPIPSERVICE_VALID_2);
    }

    @Test
    void testCicsTdqueueValid() {
        CICSTestUtils.noErrorTest(TDQUEUE_VALID_1);
        CICSTestUtils.noErrorTest(TDQUEUE_VALID_2);
    }

    @Test
    void testCicsTempstorageValid() {
        CICSTestUtils.noErrorTest(TEMPSTORAGE_VALID_1);
        CICSTestUtils.noErrorTest(TEMPSTORAGE_VALID_2);
    }

    @Test
    void testCicsTerminalValid() {
        CICSTestUtils.noErrorTest(TERMINAL_VALID_1);
        CICSTestUtils.noErrorTest(TERMINAL_VALID_2);
    }

    @Test
    void testCicsTracedestValid() {
        CICSTestUtils.noErrorTest(TRACEDEST_VALID_1);
        CICSTestUtils.noErrorTest(TRACEDEST_VALID_2);
    }

    @Test
    void testCicsTraceflagValid() {
        CICSTestUtils.noErrorTest(TRACEFLAG_VALID_1);
        CICSTestUtils.noErrorTest(TRACEFLAG_VALID_2);
    }

    @Test
    void testCicsTracetypeValid() {
        CICSTestUtils.noErrorTest(TRACETYPE_VALID_1);
        CICSTestUtils.noErrorTest(TRACETYPE_VALID_2);
    }

    @Test
    void testCicsTranclassValid() {
        CICSTestUtils.noErrorTest(TRANCLASS_VALID_1);
        CICSTestUtils.noErrorTest(TRANCLASS_VALID_2);
    }

    @Test
    void testCicsTrandumpcodeValid() {
        CICSTestUtils.noErrorTest(TRANDUMPCODE_VALID_1);
        CICSTestUtils.noErrorTest(TRANDUMPCODE_VALID_2);
    }

    @Test
    void testCicsTransactionValid() {
        CICSTestUtils.noErrorTest(TRANSACTION_VALID_1);
        CICSTestUtils.noErrorTest(TRANSACTION_VALID_2);
    }

    @Test
    void testCicsTsqueueValid() {
        CICSTestUtils.noErrorTest(TSQUEUE_VALID_1);
        CICSTestUtils.noErrorTest(TSQUEUE_VALID_2);
    }

    @Test
    void testCicsUowValid() {
        CICSTestUtils.noErrorTest(UOW_VALID_1);
        CICSTestUtils.noErrorTest(UOW_VALID_2);
    }

    @Test
    void testCicsUowlinkValid() {
        CICSTestUtils.noErrorTest(UOWLINK_VALID_1);
        CICSTestUtils.noErrorTest(UOWLINK_VALID_2);
    }

    @Test
    void testCicsUrimapValid() {
        CICSTestUtils.noErrorTest(URIMAP_VALID_1);
        CICSTestUtils.noErrorTest(URIMAP_VALID_2);
    }

    @Test
    void testCicsVolumeValid() {
        CICSTestUtils.noErrorTest(VOLUME_VALID_1);
        CICSTestUtils.noErrorTest(VOLUME_VALID_2);
    }

    @Test
    void testCicsVtamValid() {
        CICSTestUtils.noErrorTest(VTAM_VALID_1);
        CICSTestUtils.noErrorTest(VTAM_VALID_2);
    }

    @Test
    void testCicsWebValid() {
        CICSTestUtils.noErrorTest(WEB_VALID_1);
        CICSTestUtils.noErrorTest(WEB_VALID_2);
    }

    @Test
    void testCicsWebserviceValid() {
        CICSTestUtils.noErrorTest(WEBSERVICE_VALID_1);
        CICSTestUtils.noErrorTest(WEBSERVICE_VALID_2);
    }

    @Test
    void testCicsWlmhealthValid() {
        CICSTestUtils.noErrorTest(WLMHEALTH_VALID_1);
        CICSTestUtils.noErrorTest(WLMHEALTH_VALID_2);
    }

    @Test
    void testCicsXmltransformValid() {
        CICSTestUtils.noErrorTest(XMLTRANSFORM_VALID_1);
        CICSTestUtils.noErrorTest(XMLTRANSFORM_VALID_2);
    }

/* ---------------------------------------------------------------- */

    // Invalid Tests
    // No cases for ASSOCIATION USERCORRDATA.

    @Test
    void testCicsAtomserviceInvalid() {
        testSingleError(ATOMSERVICE_INVALID_1, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    @Test
    void testCicsAutoinstallInvalid() {
        testSingleError(AUTOINSTALL_INVALID_1, "Excessive options provided for: AIBRIDGE");
    }

    @Test
    void testCicsBrfacilityInvalid() {
        testSingleError(BRFACILITY_INVALID_1, "Options \"TERMSTATUS or RELEASED\" are mutually exclusive.");
    }

    @Test
    void testCicsBundleInvalid() {
        testSingleError(BUNDLE_INVALID_1, "Options \"AVAILSTATUS, AVAILABLE, UNAVAILABLE, ENABLESTATUS, ENABLED, DISABLED, COPY or PHASEIN\" are mutually exclusive.");
    }

    @Test
    void testCicsConnectionInvalid() {
        testSingleError(CONNECTION_INVALID_1, "Options \"ACQSTATUS, CONNSTATUS, ACQUIRED or RELEASED\" are mutually exclusive.");
        testSingleError(CONNECTION_INVALID_2, "Options \"UOWACTION, BACKOUT, COMMIT, FORCEUOW or RESYNC\" are mutually exclusive.");
    }

    @Test
    void testCicsDb2connInvalid() {
        testSingleError(DB2CONN_INVALID_1, "Options \"ACCOUNTREC, UOW, TASK, TXID or NONE\" are mutually exclusive.");
        testSingleError(DB2CONN_INVALID_2, "Options \"THREADWAIT, TWAIT or NOTWAIT\" are mutually exclusive.");
    }

    @Test
    void testCicsDb2entryInvalid() {
        testSingleError(DB2ENTRY_INVALID_1, "Options \"DISABLEDACT, ABEND, SQLCODE or POOL\" are mutually exclusive.");
        testSingleError(DB2ENTRY_INVALID_2, "Options \"SHARELOCKS, YES or NO\" are mutually exclusive.");
    }

    @Test
    void testCicsDb2tranInvalid() {
        testSingleError(DB2TRAN_INVALID_1, "Excessive options provided for: DB2ENTRY");
    }

    @Test
    void testCicsDeletshippedInvalid() {
        testSingleError(DELETSHIPPED_INVALID_1, "Options \"IDLE or IDLEHRS\" are mutually exclusive.");
        testSingleError(DELETSHIPPED_INVALID_2, "Options \"INTERVAL or INTERVALHRS\" are mutually exclusive.");
    }

    @Test
    void testCicsDispatcherInvalid() {
        testSingleError(DISPATCHER_INVALID_1, "Excessive options provided for: TIME");
    }

    @Test
    void testCicsDoctemplateInvalid() {
        testTwoErrors(DOCTEMPLATE_INVALID_1, "Must use exactly one of the following: COPY or NEWCOPY", "Syntax error on 'NEWCOPY'");
    }

    @Test
    void testCicsDsnameInvalid() {
        testSingleError(DSNAME_INVALID_1, "Options \"ACTION, REMOVE, RECOVERED, RESETLOCKS or RETRY\" are mutually exclusive.");
        testSingleError(DSNAME_INVALID_2, "Options \"QUESCESTATE, QUIESCED, IMMQUIESCED or UNQUIESCED\" are mutually exclusive.");
    }

    @Test
    void testCicsDumpdsInvalid() {
        testSingleError(DUMPDS_INVALID_1, "Options \"OPENSTATUS, CLOSED, OPEN or SWITCH\" are mutually exclusive.");
        testSingleError(DUMPDS_INVALID_2, "Options \"SWITCHSTATUS, NOSWITCH, SWITCHNEXT or SWITCHALL\" are mutually exclusive.");
    }

    @Test
    void testCicsEnqmodelInvalid() {
        testSingleError(ENQMODEL_INVALID_1, "Must use exactly one of the following: STATUS, ENABLED or DISABLED");
    }

    @Test
    void testCicsEpadapterInvalid() {
        testSingleError(EPADAPTER_INVALID_1, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    // No invalid cases for EPADAPTERSET.

    @Test
    void testCicsEventbindingInvalid() {
        testSingleError(EVENTBINDING_INVALID_1, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    @Test
    void testCicsEventprocessInvalid() {
        testSingleError(EVENTPROCESS_INVALID_1, "Must use exactly one of the following: EPSTATUS, STARTED, DRAIN or STOPPED");
    }

    @Test
    void testCicsFileInvalid() {
        testSingleError(FILE_INVALID_1, "Options \"ADD, ADDABLE or NOTADDABLE\" are mutually exclusive.");
        testSingleError(FILE_INVALID_2, "Options \"TABLE, CFTABLE, CICSTABLE, NOTTABLE or USERTABLE\" are mutually exclusive.");
    }

    //@Test
    //void testCicsHostInvalid() {}

    @Test
    void testCicsIpconnInvalid() {
        testSingleError(IPCONN_INVALID_1, "Options \"CONNSTATUS, ACQUIRED or RELEASED\" are mutually exclusive.");
        testSingleError(IPCONN_INVALID_2, "Options \"PURGETYPE, CANCEL, FORCECANCEL, FORCEPURGE, KILL or PURGE\" are mutually exclusive.");
    }

    @Test
    void testCicsIrcInvalid() {
        testSingleError(IRC_INVALID_1, "Options \"OPENSTATUS, CLOSED, IMMCLOSE or OPEN\" are mutually exclusive.");
    }

    @Test
    void testCicsJournalnameInvalid() {
        testSingleError(JOURNALNAME_INVALID_1, "Must use exactly one of the following: ACTION, FLUSH or RESET");
        testSingleError(JOURNALNAME_INVALID_2, "Must use exactly one of the following: STATUS, DISABLED or ENABLED");
    }

    // See JOURNALNUM for JOURNALNAME tests due to NAME being obsolete.

    @Test
    void testCicsJvmendpointInvalid() {
        testSingleError(JVMENDPOINT_INVALID_1, "Missing required option: JVMSERVER");
        testSingleError(JVMENDPOINT_INVALID_2, "Must use exactly one of the following: ENABLESTATUS, ENABLED or DISABLED");
    }

    @Test
    void testCicsJvmserverInvalid() {
        testSingleError(JVMSERVER_INVALID_1, "Must use exactly one of the following: ENABLESTATUS, ENABLED or DISABLED");
        testSingleError(JVMSERVER_INVALID_2, "Options \"PHASEOUT, PURGETYPE, PURGE, FORCEPURGE or KILL\" are mutually exclusive.");
    }

    @Test
    void testCicsLibraryInvalid() {
        testSingleError(LIBRARY_INVALID_1, "");
        testSingleError(LIBRARY_INVALID_2, "");
    }

    @Test
    void testCicsModenameInvalid() {
        testSingleError(MODENAME_INVALID_1, "");
        testSingleError(MODENAME_INVALID_2, "");
    }

    @Test
    void testCicsMonitorInvalid() {
        testSingleError(MONITOR_INVALID_1, "");
        testSingleError(MONITOR_INVALID_2, "");
    }

    @Test
    void testCicsMqconnInvalid() {
        testSingleError(MQCONN_INVALID_1, "");
        testSingleError(MQCONN_INVALID_2, "");
    }

    @Test
    void testCicsMqmonitorInvalid() {
        testSingleError(MQMONITOR_INVALID_1, "");
        testSingleError(MQMONITOR_INVALID_2, "");
    }

    @Test
    void testCicsNetnameInvalid() {
        testSingleError(NETNAME_INVALID_1, "");
        testSingleError(NETNAME_INVALID_2, "");
    }

    @Test
    void testCicsPipelineInvalid() {
        testSingleError(PIPELINE_INVALID_1, "");
        testSingleError(PIPELINE_INVALID_2, "");
    }

    @Test
    void testCicsProcesstypeInvalid() {
        testSingleError(PROCESSTYPE_INVALID_1, "");
        testSingleError(PROCESSTYPE_INVALID_2, "");
    }

    @Test
    void testCicsProgramInvalid() {
        testSingleError(PROGRAM_INVALID_1, "");
        testSingleError(PROGRAM_INVALID_2, "");
    }

    @Test
    void testCicsSecdiscoveryInvalid() {
        testSingleError(SECDISCOVERY_INVALID_1, "");
        testSingleError(SECDISCOVERY_INVALID_2, "");
    }

    @Test
    void testCicsSecrecordingInvalid() {
        testSingleError(SECRECORDING_INVALID_1, "");
        testSingleError(SECRECORDING_INVALID_2, "");
    }

    @Test
    void testCicsStatisticsInvalid() {
        testSingleError(STATISTICS_INVALID_1, "");
        testSingleError(STATISTICS_INVALID_2, "");
    }

    @Test
    void testCicsSysdumpcodeInvalid() {
        testSingleError(SYSDUMPCODE_INVALID_1, "");
        testSingleError(SYSDUMPCODE_INVALID_2, "");
    }

    @Test
    void testCicsSystemInvalid() {
        testSingleError(SYSTEM_INVALID_1, "");
        testSingleError(SYSTEM_INVALID_2, "");
    }

    @Test
    void testCicsTags_refreshInvalid() {
        testSingleError(TAGS_REFRESH_INVALID_1, "");
        testSingleError(TAGS_REFRESH_INVALID_2, "");
    }

    @Test
    void testCicsTaskInvalid() {
        testSingleError(TASK_INVALID_1, "");
        testSingleError(TASK_INVALID_2, "");
    }

    @Test
    void testCicsTclassInvalid() {
        testSingleError(TCLASS_INVALID_1, "");
        testSingleError(TCLASS_INVALID_2, "");
    }

    @Test
    void testCicsTcpipInvalid() {
        testSingleError(TCPIP_INVALID_1, "");
        testSingleError(TCPIP_INVALID_2, "");
    }

    @Test
    void testCicsTcpipserviceInvalid() {
        testSingleError(TCPIPSERVICE_INVALID_1, "");
        testSingleError(TCPIPSERVICE_INVALID_2, "");
    }

    @Test
    void testCicsTdqueueInvalid() {
        testSingleError(TDQUEUE_INVALID_1, "");
        testSingleError(TDQUEUE_INVALID_2, "");
    }

    @Test
    void testCicsTempstorageInvalid() {
        testSingleError(TEMPSTORAGE_INVALID_1, "");
        testSingleError(TEMPSTORAGE_INVALID_2, "");
    }

    @Test
    void testCicsTerminalInvalid() {
        testSingleError(TERMINAL_INVALID_1, "");
        testSingleError(TERMINAL_INVALID_2, "");
    }

    @Test
    void testCicsTracedestInvalid() {
        testSingleError(TRACEDEST_INVALID_1, "");
        testSingleError(TRACEDEST_INVALID_2, "");
    }

    @Test
    void testCicsTraceflagInvalid() {
        testSingleError(TRACEFLAG_INVALID_1, "");
        testSingleError(TRACEFLAG_INVALID_2, "");
    }

    @Test
    void testCicsTracetypeInvalid() {
        testSingleError(TRACETYPE_INVALID_1, "");
        testSingleError(TRACETYPE_INVALID_2, "");
    }

    @Test
    void testCicsTranclassInvalid() {
        testSingleError(TRANCLASS_INVALID_1, "");
        testSingleError(TRANCLASS_INVALID_2, "");
    }

    @Test
    void testCicsTrandumpcodeInvalid() {
        testSingleError(TRANDUMPCODE_INVALID_1, "");
        testSingleError(TRANDUMPCODE_INVALID_2, "");
    }

    @Test
    void testCicsTransactionInvalid() {
        testSingleError(TRANSACTION_INVALID_1, "");
        testSingleError(TRANSACTION_INVALID_2, "");
    }

    @Test
    void testCicsTsqueueInvalid() {
        testSingleError(TSQUEUE_INVALID_1, "");
        testSingleError(TSQUEUE_INVALID_2, "");
    }

    @Test
    void testCicsUowInvalid() {
        testSingleError(UOW_INVALID_1, "");
        testSingleError(UOW_INVALID_2, "");
    }

    @Test
    void testCicsUowlinkInvalid() {
        testSingleError(UOWLINK_INVALID_1, "");
        testSingleError(UOWLINK_INVALID_2, "");
    }

    @Test
    void testCicsUrimapInvalid() {
        testSingleError(URIMAP_INVALID_1, "");
        testSingleError(URIMAP_INVALID_2, "");
    }

    @Test
    void testCicsVolumeInvalid() {
        testSingleError(VOLUME_INVALID_1, "");
        testSingleError(VOLUME_INVALID_2, "");
    }

    @Test
    void testCicsVtamInvalid() {
        testSingleError(VTAM_INVALID_1, "");
        testSingleError(VTAM_INVALID_2, "");
    }

    @Test
    void testCicsWebInvalid() {
        testSingleError(WEB_INVALID_1, "");
        testSingleError(WEB_INVALID_2, "");
    }

    @Test
    void testCicsWebserviceInvalid() {
        testSingleError(WEBSERVICE_INVALID_1, "");
        testSingleError(WEBSERVICE_INVALID_2, "");
    }

    @Test
    void testCicsWlmhealthInvalid() {
        testSingleError(WLMHEALTH_INVALID_1, "");
        testSingleError(WLMHEALTH_INVALID_2, "");
    }

    @Test
    void testCicsXmltransformInvalid() {
        testSingleError(XMLTRANSFORM_INVALID_1, "");
        testSingleError(XMLTRANSFORM_INVALID_2, "");
    }

}
