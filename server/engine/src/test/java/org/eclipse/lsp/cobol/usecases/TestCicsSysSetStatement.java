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

    private static final String ASSOCIATION_USERCORRDATA_VALID_1 = "SET ASSOCIATION USERCORRDATA({$varOne})";
    private static final String ATOMSERVICE_VALID_1 = "SET ATOMSERVICE({$varOne})";
    private static final String ATOMSERVICE_VALID_2 = "SET ATOMSERVICE({$varOne}) ENABLESTATUS({$varOne})";
    private static final String AUTOINSTALL_VALID_1 = "SET AUTOINSTALL";
    private static final String AUTOINSTALL_VALID_2 = "SET AUTOINSTALL AIBRIDGE({$varOne}) CONSOLES({$varOne}) MAXREQS({$varOne}) PROGRAM({$varOne})";
    private static final String BRFACILITY_VALID_1 = "SET BRFACILITY({$varOne})";
    private static final String BRFACILITY_VALID_2 = "SET BRFACILITY({$varOne}) TERMSTATUS({$varOne})";
    private static final String BUNDLE_VALID_1 = "SET BUNDLE({$varOne})";
    private static final String BUNDLE_VALID_2 = "SET BUNDLE({$varOne}) AVAILSTATUS({$varOne})";
    private static final String BUNDLE_VALID_3 = "SET BUNDLE({$varOne}) COPY({$varOne})";
    private static final String CONNECTION_VALID_1 = "SET CONNECTION({$varOne})";
    private static final String CONNECTION_VALID_2 = "SET CONNECTION({$varOne}) ACQSTATUS({$varOne}) AFFINITY({$varOne}) EXITTRACING({$varOne}) PENDSTATUS({$varOne}) CANCEL NORECOVDATA INSERVICE UOWACTION({$varOne}) ZCPTRACE";
    private static final String DB2CONN_VALID_1 = "SET DB2CONN";
    private static final String DB2CONN_VALID_2 = "SET DB2CONN ACCOUNTREC({$varOne}) AUTHID({$varOne}) AUTHTYPE({$varOne}) BUSY({$varOne}) COMAUTHID({$varOne}) COMAUTHTYPE({$varOne}) COMTHREADLIM({$varOne}) CONNECTERROR({$varOne}) CONNECTST({$varOne}) DB2GROUPID({$varOne}) DB2ID({$varOne}) MSGQUEUE1({$varOne}) MSGQUEUE2({$varOne}) MSGQUEUE3({$varOne}) NONTERMREL({$varOne}) PLAN({$varOne}) PLANEXITNAME({$varOne}) PRIORITY({$varOne}) PURGECYCLEM({$varOne}) PURGECYCLES({$varOne}) RESYNCMEMBER({$varOne}) REUSELIMIT({$varOne}) SECURITY(REBUILD) SIGNID({$varOne}) STANDBYMODE({$varOne}) STATSQUEUE({$varOne}) TCBLIMIT({$varOne}) THREADLIMIT({$varOne}) THREADWAIT({$varOne})";
    private static final String DB2ENTRY_VALID_1 = "SET DB2ENTRY({$varOne})";
    private static final String DB2ENTRY_VALID_2 = "SET DB2ENTRY({$varOne}) ACCOUNTREC({$varOne}) AUTHID({$varOne}) AUTHTYPE({$varOne}) BUSY({$varOne}) DISABLEDACT({$varOne}) ENABLESTATUS({$varOne}) PLAN({$varOne}) PLANEXITNAME({$varOne}) PRIORITY({$varOne}) SHARELOCKS({$varOne}) THREADLIMIT({$varOne}) THREADWAIT({$varOne})";
    private static final String DB2TRAN_VALID_1 = "SET DB2TRAN";
    private static final String DB2TRAN_VALID_2 = "SET DB2TRAN DB2ENTRY({$varOne}) TRANSID({$varOne})";
    private static final String DELETSHIPPED_VALID_1 = "SET DELETSHIPPED";
    private static final String DELETSHIPPED_VALID_2 = "SET DELETSHIPPED IDLE({$varOne}) INTERVALHRS({$varOne}) INTERVALMINS({$varOne}) INTERVALSECS({$varOne})";
    private static final String DISPATCHER_VALID_1 = "SET DISPATCHER";
    private static final String DISPATCHER_VALID_2 = "SET DISPATCHER MAXOPENTCBS({$varOne}) MAXSSLTCBS({$varOne}) MAXXPTCBS({$varOne}) MROBATCH({$varOne}) PRTYAGING({$varOne}) RUNAWAY({$varOne}) SCANDELAY({$varOne}) TIME({$varOne})";
    private static final String DOCTEMPLATE_VALID_1 = "SET DOCTEMPLATE({$varOne}) COPY({$varOne})";
    private static final String DOCTEMPLATE_VALID_2 = "SET DOCTEMPLATE({$varOne}) NEWCOPY";
    private static final String DSNAME_VALID_1 = "SET DSNAME({$varOne})";
    private static final String DSNAME_VALID_2 = "SET DSNAME({$varOne}) ACTION({$varOne}) AVAILABILITY({$varOne}) QUESCESTATE({$varOne}) BUSY({$varOne}) UOWACTION({$varOne})";
    private static final String DUMPDS_VALID_1 = "SET DUMPDS";
    private static final String DUMPDS_VALID_2 = "SET DUMPDS OPEN NOSWITCH";
    private static final String ENQMODEL_VALID_1 = "SET ENQMODEL({$varOne}) STATUS({$varOne})";
    private static final String ENQMODEL_VALID_2 = "SET ENQMODEL({$varOne}) DISABLED";
    private static final String EPADAPTER_VALID_1 = "SET EPADAPTER({$varOne}) ENABLESTATUS({$varOne})";
    private static final String EPADAPTER_VALID_2 = "SET EPADAPTER({$varOne}) ENABLED";
    private static final String EPADAPTERSET_VALID_1 = "SET EPADAPTERSET({$varOne}) ENABLED";
    private static final String EVENTBINDING_VALID_1 = "SET EVENTBINDING({$varOne}) ENABLESTATUS({$varOne})";
    private static final String EVENTBINDING_VALID_2 = "SET EVENTBINDING({$varOne}) ENABLED";
    private static final String EVENTPROCESS_VALID_1 = "SET EVENTPROCESS STARTED";

    private static final String FILE_VALID_1 = "SET FILE({$varOne})";
    private static final String FILE_VALID_2 = "SET FILE({$varOne}) ADD({$varOne}) BROWSE({$varOne}) WAIT CFDTPOOL({$varOne}) DELETE({$varOne}) DISPOSITION({$varOne}) DSNAME({$varOne}) EMPTYSTATUS({$varOne}) ENABLESTATUS({$varOne}) OPENSTATUS({$varOne}) EXCLUSIVE({$varOne}) KEYLENGTH({$varOne}) LOADTYPE({$varOne}) LSRPOOLNUM({$varOne}) MAXNUMRECS({$varOne}) READABLE RECORDSIZE({$varOne}) CONSISTENT RLS STRINGS({$varOne}) TABLE({$varOne}) TABLENAME({$varOne}) UPDATE({$varOne}) UPDATEMODEL({$varOne})";
    private static final String FILE_VALID_3 = "SET FILE({$varOne}) ENABLED";
    private static final String FILE_VALID_4 = "SET FILE({$varOne}) DISABLED WAIT";
    private static final String FILE_VALID_5 = "SET FILE({$varOne}) OPEN EMPTY";
    private static final String FILE_VALID_6 = "SET FILE({$varOne}) CLOSED EMPTY FORCE";

    private static final String HOST_VALID_1 = "SET HOST({$varOne})";
    private static final String HOST_VALID_2 = "SET HOST({$varOne}) ENABLESTATUS({$varOne})";
    private static final String IPCONN_VALID_1 = "SET IPCONN({$varOne})";
    private static final String IPCONN_VALID_2 = "SET IPCONN({$varOne}) CONNSTATUS({$varOne}) PENDSTATUS({$varOne}) CANCEL NORECOVDATA INSERVICE BACKOUT";
    private static final String IRC_VALID_1 = "SET IRC";
    private static final String IRC_VALID_2 = "SET IRC OPENSTATUS({$varOne})";
    private static final String JOURNALNAME_VALID_1 = "SET JOURNALNAME({$varOne}) ACTION({$varOne})";
    private static final String JOURNALNAME_VALID_2 = "SET JOURNALNAME({$varOne}) FLUSH";
    //private static final String JOURNALNUM_VALID_1 = "SET JOURNALNUM ";
    private static final String JVMENDPOINT_VALID_1 = "SET JVMENDPOINT({$varOne}) JVMSERVER({$varOne}) DISABLED";
    private static final String JVMENDPOINT_VALID_2 = "SET JVMENDPOINT({$varOne}) JVMSERVER({$varOne}) ENABLED";
    private static final String JVMSERVER_VALID_1 = "SET JVMSERVER({$varOne}) ENABLED";
    private static final String JVMSERVER_VALID_2 = "SET JVMSERVER({$varOne}) THREADLIMIT({$varOne}) ENABLED PHASEOUT";
    private static final String LIBRARY_VALID_1 = "SET LIBRARY({$varOne})";
    private static final String LIBRARY_VALID_2 = "SET LIBRARY({$varOne}) CRITICALST({$varOne}) ENABLESTATUS({$varOne}) RANKING({$varOne})";
    private static final String MODENAME_VALID_1 = "SET MODENAME({$varOne}) CONNECTION({$varOne})";
    private static final String MODENAME_VALID_2 = "SET MODENAME({$varOne}) CONNECTION({$varOne}) AVAILABLE({$varOne}) ACQUIRED";
    private static final String MONITOR_VALID_1 = "SET MONITOR";
    private static final String MONITOR_VALID_2 = "SET MONITOR COMPRESS CONVERSE DPLLIMIT({$varOne}) EXCEPT FILELIMIT({$varOne}) FREQUENCY({$varOne}) IDNTY PERF NORESRCE OFF SYNCPOINT TSQUEUELIMIT({$varOne}) URIMAPLIMIT({$varOne}) WEBSERVLIMIT({$varOne})";
    private static final String MQCONN_VALID_1 = "SET MQCONN";
    private static final String MQCONN_VALID_2 = "SET MQCONN NOWAIT CONNECTED MQNAME({$varOne}) RESYNC";
    private static final String MQMONITOR_VALID_1 = "SET MQMONITOR({$varOne})";
    private static final String MQMONITOR_VALID_2 = "SET MQMONITOR({$varOne}) AUTOSTATUS({$varOne}) ENABLED STARTED";
    private static final String NETNAME_VALID_1 = "SET NETNAME({$varOne})";
    private static final String NETNAME_VALID_2 = "SET NETNAME({$varOne}) EXITTRACE";
    private static final String OTEL_VALID_1 = "SET OTEL";
    private static final String OTEL_VALID_2 = "SET OTEL TRACE({$varOne})";
    private static final String PIPELINE_VALID_1 = "SET PIPELINE({$varOne})";
    private static final String PIPELINE_VALID_2 = "SET PIPELINE({$varOne}) ENABLESTATUS({$varOne}) RESPWAIT({$varOne})";
    private static final String PROCESSTYPE_VALID_1 = "SET PROCESSTYPE({$varOne})";
    private static final String PROCESSTYPE_VALID_2 = "SET PROCESSTYPE({$varOne}) STATUS({$varOne}) ACTIVITY";
    private static final String PROGRAM_VALID_1 = "SET PROGRAM({$varOne})";
    private static final String PROGRAM_VALID_2 = "SET PROGRAM({$varOne}) CEDF NEWCOPY DPLSUBSET JVMCLASS({$varOne}) JVMPROFILE({$varOne}) OPERATION({$varOne}) REPLICATOR JVM SHARESTATUS({$varOne}) STATUS({$varOne}) VERSION({$varOne})";
    private static final String SECDISCOVERY_VALID_1 = "SET SECDISCOVERY";
    private static final String SECDISCOVERY_VALID_2 = "SET SECDISCOVERY STATUS({$varOne}) CMD({$varOne}) DB2({$varOne}) DCT({$varOne}) FCT({$varOne}) HFS({$varOne}) JCT({$varOne}) PCT({$varOne}) PPT({$varOne}) PSB({$varOne}) RES({$varOne}) TST({$varOne}) USER({$varOne})";
    private static final String SECRECORDING_VALID_1 = "SET SECRECORDING({$varOne}) REMOVE";
    private static final String SECRECORDING_VALID_2 = "SET SECRECORDING({$varOne}) ADD MAXIMUM({$varOne}) ODTCPIPS({$varOne})";
    private static final String STATISTICS_VALID_1 = "SET STATISTICS";
    private static final String STATISTICS_VALID_2 = "SET STATISTICS ENDOFDAY({$varOne}) INTERVAL({$varOne}) RECORDING({$varOne}) RECORDNOW RESETNOW";
    private static final String SYSDUMPCODE_VALID_1 = "SET SYSDUMPCODE({$varOne})";
    private static final String SYSDUMPCODE_VALID_2 = "SET SYSDUMPCODE({$varOne}) ACTION({$varOne}) DAEOPTION({$varOne}) DSPLIST({$varOne}) DUMPSCOPE({$varOne}) JOBLIST({$varOne}) MAXIMUM({$varOne}) SHUTOPTION({$varOne}) SYSDUMPING({$varOne})";
    private static final String SYSTEM_VALID_1 = "SET SYSTEM";
    private static final String SYSTEM_VALID_2 = "SET SYSTEM AKP({$varOne}) DEBUGTOOL({$varOne}) DSALIMIT({$varOne}) DSRTPROGRAM({$varOne}) DTRPROGRAM({$varOne}) DUMPING({$varOne}) EDSALIMIT({$varOne}) FORCEQR({$varOne}) GMMTEXT({$varOne})";
    private static final String TAGS_REFRESH_VALID_1 = "SET TAGS REFRESH";
    private static final String TASK_VALID_1 = "SET TASK({$varOne})";
    private static final String TASK_VALID_2 = "SET TASK({$varOne}) PRIORITY({$varOne}) PURGETYPE({$varOne}) SRRSTATUS({$varOne})";
    private static final String TCLASS_VALID_1 = "SET TCLASS({$varOne})";
    private static final String TCLASS_VALID_2 = "SET TCLASS({$varOne}) MAXIMUM({$varOne})";
    private static final String TCPIP_VALID_1 = "SET TCPIP MAXSOCKETS({$varOne}) NEWMAXSOCKET({$varOne}) OPENSTATUS({$varOne})";
    private static final String TCPIP_VALID_2 = "SET TCPIP MAXSOCKETS({$varOne}) NEWMAXSOCKET({$varOne}) CLOSED";
    private static final String TCPIPSERVICE_VALID_1 = "SET TCPIPSERVICE({$varOne}) BACKLOG({$varOne}) MAXDATALEN({$varOne})";
    private static final String TCPIPSERVICE_VALID_2 = "SET TCPIPSERVICE({$varOne}) BACKLOG({$varOne}) MAXDATALEN({$varOne}) OPENSTATUS({$varOne}) URM({$varOne})";
    private static final String TDQUEUE_VALID_1 = "SET TDQUEUE({$varOne})";
    private static final String TDQUEUE_VALID_2 = "SET TDQUEUE({$varOne}) ATIFACILITY({$varOne}) ATITERMID({$varOne}) ATITRANID({$varOne}) ATIUSERID({$varOne}) ENABLESTATUS({$varOne}) OPENSTATUS({$varOne}) TRIGGERLEVEL({$varOne})";
    private static final String TEMPSTORAGE_VALID_1 = "SET TEMPSTORAGE TSMAINLIMIT({$varOne})";
    private static final String TERMINAL_VALID_1 = "SET TERMINAL({$varOne})";
    private static final String TERMINAL_VALID_2 = "SET TERMINAL({$varOne}) ACQSTATUS({$varOne}) ALTPRINTER({$varOne}) ALTPRTCOPYST({$varOne}) ATISTATUS({$varOne}) EXITTRACING({$varOne}) MAPNAME({$varOne}) MAPSETNAME({$varOne}) NEXTTRANSID({$varOne}) OBFORMATST({$varOne}) OPERID({$varOne}) AUTOPAGEABLE PRINTER({$varOne}) PRTCOPYST({$varOne}) PURGE FORCE RELREQ INSERVICE TCAMCONTROL({$varOne}) TERMPRIORITY({$varOne}) TRACING({$varOne}) TTISTATUS({$varOne}) UCTRANST({$varOne}) ZCPTRACE";
    private static final String TRACEDEST_VALID_1 = "SET TRACEDEST";
    private static final String TRACEDEST_VALID_2 = "SET TRACEDEST AUXPAUSE GTFSTART INTSTART SWITCH SWITCHNEXT TABLESIZE({$varOne})";
    private static final String TRACEFLAG_VALID_1 = "SET TRACEFLAG";
    private static final String TRACEFLAG_VALID_2 = "SET TRACEFLAG SINGLEOFF SYSTEMOFF TCEXITALLOFF USEROFF";
    private static final String TRACETYPE_VALID_1 = "SET TRACETYPE STANDARD";
    private static final String TRACETYPE_VALID_2 = "SET TRACETYPE SPECIAL APPLICATION({$varOne}) ASYNCSERVICE({$varOne}) BM({$varOne}) BRIDGE({$varOne}) BUSAPPMGR({$varOne}) CPI({$varOne}) DC({$varOne}) DEBUGTOOL({$varOne}) DIRMGR({$varOne}) DISPATCHER({$varOne}) DOCUMENT({$varOne}) DOMAINMGR({$varOne}) DUMP({$varOne}) EI({$varOne}) ENQUEUE({$varOne}) ENTJAVA({$varOne}) EVENTCAPTURE({$varOne}) EVENTMGR({$varOne}) EVENTPROC({$varOne}) FC({$varOne}) GLOBALCATLG({$varOne}) IC({$varOne}) IPECI({$varOne}) IS({$varOne}) KC({$varOne}) KERNEL({$varOne}) LOADER({$varOne}) LOCALCATLG({$varOne}) LOCKMGR({$varOne}) LOGGER({$varOne}) MANAGEDPLAT({$varOne}) MESSAGE({$varOne}) ML({$varOne}) MONITOR({$varOne}) OBJECTTRAN({$varOne}) PARAMGR({$varOne}) PARTNER({$varOne}) PC({$varOne}) PIPEMGR({$varOne}) PROGMGR({$varOne}) RECOVERY({$varOne}) REGIONSTAT({$varOne}) REQUESTSTRM({$varOne}) RESLIFEMGR({$varOne}) RMI({$varOne}) RMIADAPTERS({$varOne}) RRS({$varOne}) SC({$varOne}) SCHEDULER({$varOne}) SECURITY({$varOne}) SJVM({$varOne}) SOCKETS({$varOne}) STATISTICS({$varOne}) STORAGE({$varOne}) SZ({$varOne}) TC({$varOne}) TD({$varOne}) TEMPSTORAGE({$varOne}) TIMER({$varOne}) TRACE({$varOne}) TRANMGR({$varOne}) UE({$varOne}) USER({$varOne}) WEB({$varOne}) WEB2({$varOne}) WEBRESTMGR({$varOne})";
    private static final String TRANCLASS_VALID_1 = "SET TRANCLASS({$varOne})";
    private static final String TRANCLASS_VALID_2 = "SET TRANCLASS({$varOne}) MAXACTIVE({$varOne}) ABEND PURGETHRESH({$varOne})";
    private static final String TRANDUMPCODE_VALID_1 = "SET TRANDUMPCODE({$varOne})";
    private static final String TRANDUMPCODE_VALID_2 = "SET TRANDUMPCODE({$varOne}) ADD LOCAL MAXIMUM({$varOne}) SHUTDOWN SYSDUMP TRANDUMP";
    private static final String TRANSACTION_VALID_1 = "SET TRANSACTION({$varOne})";
    private static final String TRANSACTION_VALID_2 = "SET TRANSACTION({$varOne}) TRANDUMP PRIORITY({$varOne}) PURGEABLE RUNAWAY({$varOne}) SYSTEM SHUTDISABLED DISABLED TRANCLASS({$varOne}) SPECTRACE";
    private static final String TSQUEUE_VALID_1 = "SET TSQUEUE({$varOne})";
    private static final String TSQUEUE_VALID_2 = "SET TSQNAME({$varOne}) SYSID({$varOne}) ACTION({$varOne}) LASTUSEDINT({$varOne})";
    private static final String UOW_VALID_1 = "SET UOW({$varOne}) UOWSTATE({$varOne})";
    private static final String UOW_VALID_2 = "SET UOW({$varOne}) COMMIT";
    private static final String UOWLINK_VALID_1 = "SET UOWLINK({$varOne})";
    private static final String UOWLINK_VALID_2 = "SET UOWLINK({$varOne}) DELETE";
    private static final String URIMAP_VALID_1 = "SET URIMAP({$varOne})";
    private static final String URIMAP_VALID_2 = "SET URIMAP({$varOne}) ENABLED NONE LOCATION({$varOne})";
    //private static final String VOLUME_VALID_1 = "SET VOLUME "; // No valid instances of VOLUME exist
    private static final String VTAM_VALID_1 = "SET VTAM";
    private static final String VTAM_VALID_2 = "SET VTAM CLOSED PSDINTERVAL({$varOne}) DEREGISTERED";
    private static final String WEB_VALID_1 = "SET WEB";
    private static final String WEB_VALID_2 = "SET WEB GARBAGEINT({$varOne}) TIMEOUTINT({$varOne})";
    private static final String WEBSERVICE_VALID_1 = "SET WEBSERVICE({$varOne})";
    private static final String WEBSERVICE_VALID_2 = "SET WEBSERVICE({$varOne}) VALIDATION";
    private static final String WLMHEALTH_VALID_1 = "SET WLMHEALTH";
    private static final String WLMHEALTH_VALID_2 = "SET WLMHEALTH ADJUSTMENT({$varOne})";
    private static final String XMLTRANSFORM_VALID_1 = "SET XMLTRANSFORM({$varOne})";
    private static final String XMLTRANSFORM_VALID_2 = "SET XMLTRANSFORM({$varOne}) NOVALIDATION";

    /* --------------------------------------------------- */
    // Invalid test cases
    private static final String ATOMSERVICE_INVALID_1 = "SET ATOMSERVICE({$varOne}) ENABLED {DISABLED|errorOne}";
    private static final String AUTOINSTALL_INVALID_1 = "SET AUTOINSTALL AIBRIDGE({$varOne}) {AIBRIDGE|errorOne}({$varOne})";
    private static final String BRFACILITY_INVALID_1 = "SET BRFACILITY({$varOne}) TERMSTATUS({$varOne}) {RELEASED|errorOne}";
    private static final String BUNDLE_INVALID_1 = "SET BUNDLE({$varOne}) COPY({$varOne}) {PHASEIN|errorOne}";
    private static final String CONNECTION_INVALID_1 = "SET CONNECTION({$varOne}) ACQSTATUS({$varOne}) {ACQUIRED|errorOne}";
    private static final String CONNECTION_INVALID_2 = "SET CONNECTION({$varOne}) BACKOUT {COMMIT|errorOne}";
    private static final String DB2CONN_INVALID_1 = "SET DB2CONN TASK {NONE|errorOne}";
    private static final String DB2CONN_INVALID_2 = "SET DB2CONN TWAIT {NOTWAIT|errorOne}";
    private static final String DB2ENTRY_INVALID_1 = "SET DB2ENTRY({$varOne}) ABEND {SQLCODE|errorOne}";
    private static final String DB2ENTRY_INVALID_2 = "SET DB2ENTRY({$varOne}) YES {NO|errorOne}";
    private static final String DB2TRAN_INVALID_1 = "SET DB2TRAN DB2ENTRY({$varOne}) {DB2ENTRY|errorOne}({$varOne})";
    private static final String DELETSHIPPED_INVALID_1 = "SET DELETSHIPPED IDLE({$varOne}) {IDLEHRS|errorOne}({$varOne})";
    private static final String DELETSHIPPED_INVALID_2 = "SET DELETSHIPPED INTERVAL({$varOne}) {INTERVALHRS|errorOne}({$varOne})";
    private static final String DISPATCHER_INVALID_1 = "SET DISPATCHER TIME({$varOne}) {TIME|errorOne}({$varOne})";
    private static final String DOCTEMPLATE_INVALID_1 = "SET DOCTEMPLATE({$varOne}) {_NEWCOPY|errorOne_} {_COPY|errorOne_}({$varOne})";
    private static final String DSNAME_INVALID_1 = "SET DSNAME({$varOne}) REMOVE {RECOVERED|errorOne}";
    private static final String DSNAME_INVALID_2 = "SET DSNAME({$varOne}) QUIESCED {UNQUIESCED|errorOne}";
    private static final String DUMPDS_INVALID_1 = "SET DUMPDS {OPEN|errorOne} CLOSED";
    private static final String DUMPDS_INVALID_2 = "SET DUMPDS NOSWITCH {SWITCHNEXT|errorOne}";
    private static final String ENQMODEL_INVALID_1 = "SET ENQMODEL({$varOne}) STATUS({$varOne}) {DISABLED|errorOne}";
    private static final String EPADAPTER_INVALID_1 = "SET EPADAPTER({$varOne}) ENABLESTATUS({$varOne}) {ENABLED|errorOne}";
    //private static final String EPADAPTERSET_INVALID_1 = "SET EPADAPTERSET ";
    private static final String EVENTBINDING_INVALID_1 = "SET EVENTBINDING({$varOne}) ENABLESTATUS({$varOne}) {DISABLED|errorOne}";
    private static final String EVENTPROCESS_INVALID_1 = "SET EVENTPROCESS STARTED {STOPPED|errorOne}";
    private static final String FILE_INVALID_1 = "SET FILE({$varOne}) ADDABLE {NOTADDABLE|errorOne}";
    private static final String FILE_INVALID_2 = "SET FILE({$varOne}) CICSTABLE {NOTTABLE|errorOne}";
    //private static final String HOST_INVALID_1 = "SET HOST ";
    private static final String IPCONN_INVALID_1 = "SET IPCONN({$varOne}) ACQUIRED {RELEASED|errorOne}";
    private static final String IPCONN_INVALID_2 = "SET IPCONN({$varOne}) CANCEL {FORCECANCEL|errorOne}";
    private static final String IRC_INVALID_1 = "SET IRC CLOSED {OPEN|errorOne}";
    private static final String JOURNALNAME_INVALID_1 = "SET JOURNALNAME({$varOne}) FLUSH {RESET|errorOne} ENABLED";
    private static final String JOURNALNAME_INVALID_2 = "SET JOURNALNAME({$varOne}) FLUSH {STATUS|errorOne}({$varOne})";
    //private static final String JOURNALNUM_INVALID_1 = "SET JOURNALNUM ";
    private static final String JVMENDPOINT_INVALID_1 = "SET {_JVMENDPOINT({$varOne}) ENABLED|errorOne_}";
    private static final String JVMENDPOINT_INVALID_2 = "SET JVMENDPOINT({$varOne}) JVMSERVER({$varOne}) {ENABLED|errorOne} DISABLED";
    private static final String JVMSERVER_INVALID_1 = "SET JVMSERVER({$varOne}) ENABLED {DISABLED|errorOne} PHASEOUT";
    private static final String JVMSERVER_INVALID_2 = "SET JVMSERVER({$varOne}) ENABLED PHASEOUT {PURGE|errorOne} ";
    private static final String LIBRARY_INVALID_1 = "SET LIBRARY({$varOne}) CRITICAL {NONCRITICAL|errorOne}";
    private static final String LIBRARY_INVALID_2 = "SET LIBRARY({$varOne}) ENABLED {DISABLED|errorOne}";
    private static final String MODENAME_INVALID_1 = "SET {_MODENAME({$varOne}) CLOSED|errorOne_}";
    private static final String MODENAME_INVALID_2 = "SET {_MODENAME({$varOne}) CONNECTION({$varOne}) CLOSED ACQUIRED|errorOne_}";
    private static final String MONITOR_INVALID_1 = "SET MONITOR ON {OFF|errorOne}";
    private static final String MONITOR_INVALID_2 = "SET MONITOR FREQUENCY({$varOne}) {FREQUENCYMIN|errorOne}({$varOne})";
    private static final String MQCONN_INVALID_1 = "SET MQCONN WAIT CONNECTST({$varOne}) {CONNECTED|errorOne}";
    private static final String MQCONN_INVALID_2 = "SET MQCONN RESYNC {NORESYNC|errorOne}";
    private static final String MQMONITOR_INVALID_1 = "SET MQMONITOR({$varOne}) AUTOSTATUS({$varOne}) {AUTOSTART|errorOne}";
    private static final String MQMONITOR_INVALID_2 = "SET MQMONITOR({$varOne}) ENABLED MONSTATUS({$varOne}) {STOPPED|errorOne}";
    private static final String NETNAME_INVALID_1 = "SET NETNAME({$varOne}) EXITTRACE {NOEXITTRACE|errorOne}";
    private static final String OTEL_INVALID_1 = "SET OTEL {OTEL|errorOne}";
    private static final String PIPELINE_INVALID_1 = "SET PIPELINE({$varOne}) ENABLED {DISABLED|errorOne}";
    private static final String PROCESSTYPE_INVALID_1 = "SET PROCESSTYPE({$varOne}) {ENABLED|errorOne} DISABLED";
    private static final String PROCESSTYPE_INVALID_2 = "SET PROCESSTYPE({$varOne}) FULL {OFF|errorOne}";
    private static final String PROGRAM_INVALID_1 = "SET PROGRAM({$varOne}) CEDF {NOCEDF|errorOne} ";
    private static final String PROGRAM_INVALID_2 = "SET PROGRAM({$varOne}) JVM {NOJVM|errorOne}";
    private static final String SECDISCOVERY_INVALID_1 = "SET SECDISCOVERY ON {OFF|errorOne}";
    private static final String SECDISCOVERY_INVALID_2 = "SET SECDISCOVERY CMD({$varOne}) {DISCOVERALL|errorOne}";
    private static final String SECRECORDING_INVALID_1 = "SET {_SECRECORDING({$varOne}) MAXIMUM({$varOne})|errorOne|errorTwo_}";
    private static final String SECRECORDING_INVALID_2 = "SET SECRECORDING({$varOne}) {ACTION|errorOne}({$varOne}) {ADD|errorOne} MAXIMUM({$varOne})";
    private static final String STATISTICS_INVALID_1 = "SET STATISTICS ENDOFDAY({$varOne}) {ENDOFDAYHRS|errorOne}({$varOne})";
    private static final String STATISTICS_INVALID_2 = "SET {_STATISTICS RECORDNOW|errorOne_}";
    private static final String SYSDUMPCODE_INVALID_1 = "SET SYSDUMPCODE({$varOne}) ADD {REMOVE|errorOne}";
    private static final String SYSDUMPCODE_INVALID_2 = "SET SYSDUMPCODE({$varOne}) NOSHUTDOWN {SHUTDOWN|errorOne}";
    private static final String SYSTEM_INVALID_1 = "SET SYSTEM DEBUG {NODEBUG|errorOne}";
    private static final String SYSTEM_INVALID_2 = "SET SYSTEM FORCE {NOFORCE|errorOne}";
    //private static final String TAGS_REFRESH_INVALID_1 = "SET TAGS";
    private static final String TASK_INVALID_1 = "SET TASK({$varOne}) KILL {PURGE|errorOne}";
    private static final String TASK_INVALID_2 = "SET TASK({$varOne}) SRRACTIVE {SRRINACTIVE|errorOne}";
    //private static final String TCLASS_INVALID_1 = "SET TCLASS ";
    //private static final String TCLASS_INVALID_2 = "SET TCLASS ";
    private static final String TCPIP_INVALID_1 = "SET TCPIP MAXSOCKETS({$varOne}) NEWMAXSOCKET({$varOne}) CLOSED {OPEN|errorOne} ";
    private static final String TCPIPSERVICE_INVALID_1 = "SET TCPIPSERVICE({$varOne}) BACKLOG({$varOne}) MAXDATALEN({$varOne}) CLOSED {OPEN|errorOne}";
    private static final String TDQUEUE_INVALID_1 = "SET TDQUEUE({$varOne}) TERMINAL {NOTERMINAL|errorOne}";
    private static final String TDQUEUE_INVALID_2 = "SET TDQUEUE({$varOne}) {DISABLED|errorOne} ENABLED";
    //private static final String TEMPSTORAGE_INVALID_1 = "SET TEMPSTORAGE ";
    private static final String TERMINAL_INVALID_1 = "SET TERMINAL({$varOne}) NOTTI {TTI|errorOne}";
    private static final String TERMINAL_INVALID_2 = "SET {_TERMINAL({$varOne}) FORCE|errorOne_}";
    private static final String TRACEDEST_INVALID_1 = "SET TRACEDEST INTSTART {INTSTOP|errorOne}";
    private static final String TRACEDEST_INVALID_2 = "SET TRACEDEST AUXPAUSE {AUXSTART|errorOne}";
    private static final String TRACEFLAG_INVALID_1 = "SET TRACEFLAG SINGLEOFF {SINGLEON|errorOne}";
    private static final String TRACEFLAG_INVALID_2 = "SET TRACEFLAG SYSTEMOFF {SYSTEMON|errorOne}";
    private static final String TRACETYPE_INVALID_1 = "SET {TRACETYPE|errorOne} {NORESP|errorTwo}";
    private static final String TRACETYPE_INVALID_2 = "SET TRACETYPE STANDARD AP({$varOne}) {APPLICATION|errorOne}({$varOne})";
    private static final String TRANCLASS_INVALID_1 = "SET TRANCLASS({$varOne}) ABEND {DISCARD|errorOne}";
    private static final String TRANDUMPCODE_INVALID_1 = "SET TRANDUMPCODE({$varOne}) ADD {REMOVE|errorOne}";
    private static final String TRANDUMPCODE_INVALID_2 = "SET TRANDUMPCODE({$varOne}) NOSHUTDOWN {SHUTDOWN|errorOne}";
    private static final String TRANSACTION_INVALID_1 = "SET TRANSACTION({$varOne}) TRANDUMP {NOTRANDUMP|errorOne}";
    private static final String TRANSACTION_INVALID_2 = "SET TRANSACTION({$varOne}) SPECTRACE {SPRSTRACE|errorOne}";
    private static final String TSQUEUE_INVALID_1 = "SET {TSQUEUE|errorOne}({$varOne}) {TSQNAME|errorOne}({$varOne}) SYSID({$varOne})";
    private static final String TSQUEUE_INVALID_2 = "SET {_TSQUEUE({$varOne}) LASTUSEDINT({$varOne} )|errorOne_}";
    private static final String UOW_INVALID_1 = "SET UOW({$varOne}) COMMIT {FORCE|errorOne}";
    private static final String UOWLINK_INVALID_1 = "SET UOWLINK({$varOne}) ACTION({$varOne}) {DELETE|errorOne}";
    private static final String URIMAP_INVALID_1 = "SET URIMAP({$varOne}) DISABLED {ENABLED|errorOne}";
    private static final String URIMAP_INVALID_2 = "SET URIMAP({$varOne}) PERMANENT {TEMPORARY|errorOne}";
    private static final String VOLUME_INVALID_1 = "SET {_VOLUME {_NORESP|errorTwo_}({$varOne})|errorOne_}";
    private static final String VTAM_INVALID_1 = "SET VTAM CLOSED {FORCECLOSE|errorOne}";
    private static final String VTAM_INVALID_2 = "SET VTAM PSDINTERVAL({$varOne}) {PSDINTHRS|errorOne}({$varOne})";
    //private static final String WEB_INVALID_1 = "SET WEB ";
    private static final String WEBSERVICE_INVALID_1 = "SET WEBSERVICE({$varOne}) VALIDATION {NOVALIDATION|errorOne}";
    private static final String WLMHEALTH_INVALID_1 = "SET WLMHEALTH INTERVAL({$varOne}) {OPENSTATUS|errorOne}({$varOne})";
    private static final String XMLTRANSFORM_INVALID_1 = "SET XMLTRANSFORM({$varOne}) VALIDATION {NOVALIDATION|errorOne}";

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
    void testCicsOtelValid() {
        CICSTestUtils.noErrorTest(OTEL_VALID_1);
        CICSTestUtils.noErrorTest(OTEL_VALID_2);
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
        // No valid instances of VOLUME exist
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
        testSingleError(DOCTEMPLATE_INVALID_1, "Exactly one option required, options are mutually exclusive: COPY or NEWCOPY");
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
        testSingleError(ENQMODEL_INVALID_1, "Options \"STATUS, ENABLED or DISABLED\" are mutually exclusive.");
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
        testSingleError(EVENTPROCESS_INVALID_1, "Options \"EPSTATUS, STARTED, DRAIN or STOPPED\" are mutually exclusive.");
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
        testSingleError(JOURNALNAME_INVALID_1, "Options \"ACTION, FLUSH, RESET, STATUS, DISABLED or ENABLED\" are mutually exclusive.");
        testSingleError(JOURNALNAME_INVALID_2, "Options \"ACTION, FLUSH, RESET, STATUS, DISABLED or ENABLED\" are mutually exclusive.");
    }

    // See JOURNALNUM for JOURNALNAME tests due to NAME being obsolete.

    @Test
    void testCicsJvmendpointInvalid() {
        testSingleError(JVMENDPOINT_INVALID_1, "Missing required option: JVMSERVER");
        testSingleError(JVMENDPOINT_INVALID_2, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    @Test
    void testCicsJvmserverInvalid() {
        testSingleError(JVMSERVER_INVALID_1, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
        testSingleError(JVMSERVER_INVALID_2, "Options \"PHASEOUT, PURGETYPE, PURGE, FORCEPURGE or KILL\" are mutually exclusive.");
    }

    @Test
    void testCicsLibraryInvalid() {
        testSingleError(LIBRARY_INVALID_1, "Options \"CRITICALST, CRITICAL or NONCRITICAL\" are mutually exclusive.");
        testSingleError(LIBRARY_INVALID_2, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    @Test
    void testCicsModenameInvalid() {
        testSingleError(MODENAME_INVALID_1, "Missing required option: CONNECTION");
        testSingleError(MODENAME_INVALID_2, "Missing required option for: ACQUIRED without AVAILABLE");
    }

    @Test
    void testCicsMonitorInvalid() {
        testSingleError(MONITOR_INVALID_1, "Options \"STATUS, ON or OFF\" are mutually exclusive.");
        testSingleError(MONITOR_INVALID_2, "Options \"FREQUENCY or FREQUENCYMIN\" are mutually exclusive.");
    }

    @Test
    void testCicsMqconnInvalid() {
        testSingleError(MQCONN_INVALID_1, "Options \"CONNECTST, CONNECTED or NOTCONNECTED\" are mutually exclusive.");
        testSingleError(MQCONN_INVALID_2, "Options \"RESYNCMEMBER, RESYNC, NORESYNC or GROUPRESYNC\" are mutually exclusive.");
    }

    @Test
    void testCicsMqmonitorInvalid() {
        testSingleError(MQMONITOR_INVALID_1, "Options \"AUTOSTATUS, AUTOSTART or NOAUTOSTART\" are mutually exclusive.");
        testSingleError(MQMONITOR_INVALID_2, "Options \"MONSTATUS, STARTED or STOPPED\" are mutually exclusive.");
    }

    @Test
    void testCicsNetnameInvalid() {
        testSingleError(NETNAME_INVALID_1, "Options \"EXITTRACING, EXITTRACE or NOEXITTRACE\" are mutually exclusive.");
    }

    @Test
    void testCicsOtelInvalid() {
        testSingleError(OTEL_INVALID_1, "Excessive options provided for: OTEL");
    }

    @Test
    void testCicsPipelineInvalid() {
        testSingleError(PIPELINE_INVALID_1, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    @Test
    void testCicsProcesstypeInvalid() {
        testSingleError(PROCESSTYPE_INVALID_1, "Options \"STATUS, DISABLED or ENABLED\" are mutually exclusive.");
        testSingleError(PROCESSTYPE_INVALID_2, "Options \"AUDITLEVEL, ACTIVITY, FULL, OFF or PROCESS\" are mutually exclusive.");
    }

    @Test
    void testCicsProgramInvalid() {
        testSingleError(PROGRAM_INVALID_1, "Options \"CEDFSTATUS, CEDF or NOCEDF\" are mutually exclusive.");
        testSingleError(PROGRAM_INVALID_2, "Options \"RUNTIME, JVM or NOJVM\" are mutually exclusive.");
    }

    @Test
    void testCicsSecdiscoveryInvalid() {
        testSingleError(SECDISCOVERY_INVALID_1, "Options \"ON, OFF or STATUS\" are mutually exclusive.");
        testSingleError(SECDISCOVERY_INVALID_2, "Options \"CMD or DISCOVERALL\" are mutually exclusive.");
    }

    @Test
    void testCicsSecrecordingInvalid() {
        testTwoErrors(SECRECORDING_INVALID_1, "Exactly one option required, none provided: ACTION, ADD MAXIMUM, MODIFY or REMOVE", "If one option is specified, all options must be present: ADD and MAXIMUM");
        testSingleError(SECRECORDING_INVALID_2, "Exactly one option required, options are mutually exclusive: ACTION, ADD MAXIMUM, MODIFY or REMOVE");
    }

    @Test
    void testCicsStatisticsInvalid() {
        testSingleError(STATISTICS_INVALID_1, "Options \"ENDOFDAY or ENDOFDAYHRS\" are mutually exclusive.");
        testSingleError(STATISTICS_INVALID_2, "Exactly one option required, none provided: RECORDING, ON or OFF");
    }

    @Test
    void testCicsSysdumpcodeInvalid() {
        testSingleError(SYSDUMPCODE_INVALID_1, "Options \"ACTION, ADD, REMOVE or RESET\" are mutually exclusive.");
    }

    @Test
    void testCicsSystemInvalid() {
        testSingleError(SYSTEM_INVALID_1, "Options \"DEBUGTOOL, DEBUG or NODEBUG\" are mutually exclusive.");
        testSingleError(SYSTEM_INVALID_2, "Options \"FORCEQR, FORCE or NOFORCE\" are mutually exclusive.");
    }

    @Test
    void testCicsTags_refreshInvalid() {
        // REFRESH missing adds an error onto END-EXEC.
    }

    @Test
    void testCicsTaskInvalid() {
        testSingleError(TASK_INVALID_1, "Options \"PURGETYPE, FORCEPURGE, KILL or PURGE\" are mutually exclusive.");
        testSingleError(TASK_INVALID_2, "Options \"SRRSTATUS, SRRACTIVE or SRRINACTIVE\" are mutually exclusive.");
    }

    @Test
    void testCicsTclassInvalid() {
        // No checks other than duplicates
    }

    @Test
    void testCicsTcpipInvalid() {
        testSingleError(TCPIP_INVALID_1, "Options \"OPENSTATUS, CLOSED, IMMCLOSE or OPEN\" are mutually exclusive.");
    }

    @Test
    void testCicsTcpipserviceInvalid() {
        testSingleError(TCPIPSERVICE_INVALID_1, "Options \"OPENSTATUS, CLOSED, IMMCLOSE or OPEN\" are mutually exclusive.");
    }

    @Test
    void testCicsTdqueueInvalid() {
        testSingleError(TDQUEUE_INVALID_1, "Options \"ATIFACILITY, TERMINAL or NOTERMINAL\" are mutually exclusive.");
        testSingleError(TDQUEUE_INVALID_2, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    @Test
    void testCicsTempstorageInvalid() {
        // No checks other than duplicates
    }

    @Test
    void testCicsTerminalInvalid() {
        testSingleError(TERMINAL_INVALID_1, "Options \"TTISTATUS, NOTTI or TTI\" are mutually exclusive.");
        testSingleError(TERMINAL_INVALID_2, "Missing required option for: FORCE without PURGE");
    }

    @Test
    void testCicsTracedestInvalid() {
        testSingleError(TRACEDEST_INVALID_1, "Options \"INTSTATUS, INTSTART or INTSTOP\" are mutually exclusive.");
        testSingleError(TRACEDEST_INVALID_2, "Options \"AUXSTATUS, AUXPAUSE, AUXSTART or AUXSTOP\" are mutually exclusive.");
    }

    @Test
    void testCicsTraceflagInvalid() {
        testSingleError(TRACEFLAG_INVALID_1, "Options \"SINGLESTATUS, SINGLEOFF or SINGLEON\" are mutually exclusive.");
        testSingleError(TRACEFLAG_INVALID_2, "Options \"SYSTEMSTATUS, SYSTEMOFF or SYSTEMON\" are mutually exclusive.");
    }

    @Test
    void testCicsTracetypeInvalid() {
        testTwoErrors(TRACETYPE_INVALID_1, "Exactly one option required, none provided: FLAGSET, SPECIAL or STANDARD", "Extraneous input NORESP");
        testSingleError(TRACETYPE_INVALID_2, "Options \"AP or APPLICATION\" are mutually exclusive.");
    }

    @Test
    void testCicsTranclassInvalid() {
        testSingleError(TRANCLASS_INVALID_1, "Options \"PURGEACTION, ABEND or DISCARD\" are mutually exclusive.");
    }

    @Test
    void testCicsTrandumpcodeInvalid() {
        testSingleError(TRANDUMPCODE_INVALID_1, "Options \"ACTION, ADD, REMOVE or RESET\" are mutually exclusive.");
        testSingleError(TRANDUMPCODE_INVALID_2, "Options \"SHUTOPTION, NOSHUTDOWN or SHUTDOWN\" are mutually exclusive.");
    }

    @Test
    void testCicsTransactionInvalid() {
        testSingleError(TRANSACTION_INVALID_1, "Options \"DUMPING, TRANDUMP or NOTRANDUMP\" are mutually exclusive.");
        testSingleError(TRANSACTION_INVALID_2, "Options \"TRACING, SPECTRACE, SPRSTRACE or STANTRACE\" are mutually exclusive.");
    }

    @Test
    void testCicsTsqueueInvalid() {
        testSingleError(TSQUEUE_INVALID_1, "Exactly one option required, options are mutually exclusive: TSQUEUE or TSQNAME");
        testSingleError(TSQUEUE_INVALID_2, "Missing required option for: LASTUSEDINT without ACTION");
    }

    @Test
    void testCicsUowInvalid() {
        testSingleError(UOW_INVALID_1, "Options \"UOWSTATE, COMMIT, BACKOUT or FORCE\" are mutually exclusive.");
    }

    @Test
    void testCicsUowlinkInvalid() {
        testSingleError(UOWLINK_INVALID_1, "Options \"ACTION or DELETE\" are mutually exclusive.");
    }

    @Test
    void testCicsUrimapInvalid() {
        testSingleError(URIMAP_INVALID_1, "Options \"ENABLESTATUS, DISABLED or ENABLED\" are mutually exclusive.");
        testSingleError(URIMAP_INVALID_2, "Options \"REDIRECTTYPE, NONE, PERMANENT or TEMPORARY\" are mutually exclusive.");
    }

    @Test
    void testCicsVolumeInvalid() {
        testTwoErrors(VOLUME_INVALID_1, "Obsolete option provided: VOLUME", "Extraneous input NORESP");
    }

    @Test
    void testCicsVtamInvalid() {
        testSingleError(VTAM_INVALID_1, "Options \"OPENSTATUS, CLOSED, FORCECLOSE, IMMCLOSE or OPEN\" are mutually exclusive.");
        testSingleError(VTAM_INVALID_2, "Options \"PSDINTERVAL or PSDINTHRS\" are mutually exclusive.");
    }

    @Test
    void testCicsWebInvalid() {
        // Nothing to test outside of duplicates
    }

    @Test
    void testCicsWebserviceInvalid() {
        testSingleError(WEBSERVICE_INVALID_1, "Options \"VALIDATIONST, VALIDATION or NOVALIDATION\" are mutually exclusive.");
    }

    @Test
    void testCicsWlmhealthInvalid() {
        testSingleError(WLMHEALTH_INVALID_1, "Options \"ADJUSTMENT, INTERVAL or OPENSTATUS\" are mutually exclusive.");
    }

    @Test
    void testCicsXmltransformInvalid() {
        testSingleError(XMLTRANSFORM_INVALID_1, "Options \"VALIDATIONST, VALIDATION or NOVALIDATION\" are mutually exclusive.");
    }

}
