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
    private static final String MODENAME_VALID_1 = "SET MODENAME(123) CONNECTION(123)";
    private static final String MODENAME_VALID_2 = "SET MODENAME(123) CONNECTION(123) AVAILABLE(123) ACQUIRED";
    private static final String MONITOR_VALID_1 = "SET MONITOR";
    private static final String MONITOR_VALID_2 = "SET MONITOR COMPRESS CONVERSE DPLLIMIT(123) EXCEPT FILELIMIT(1) FREQUENCY(1) IDNTY PERF NORESRCE OFF SYNCPOINT TSQUEUELIMIT(1) URIMAPLIMIT(1) WEBSERVLIMIT(1)";
    private static final String MQCONN_VALID_1 = "SET MQCONN";
    private static final String MQCONN_VALID_2 = "SET MQCONN NOWAIT CONNECTED MQNAME(3) RESYNC";
    private static final String MQMONITOR_VALID_1 = "SET MQMONITOR(123)";
    private static final String MQMONITOR_VALID_2 = "SET MQMONITOR(123) AUTOSTATUS(1) ENABLED STARTED";
    private static final String NETNAME_VALID_1 = "SET NETNAME(123)";
    private static final String NETNAME_VALID_2 = "SET NETNAME(123) EXITTRACE";
    private static final String PIPELINE_VALID_1 = "SET PIPELINE(1)";
    private static final String PIPELINE_VALID_2 = "SET PIPELINE(1) ENABLESTATUS(1) RESPWAIT(1)";
    private static final String PROCESSTYPE_VALID_1 = "SET PROCESSTYPE(123)";
    private static final String PROCESSTYPE_VALID_2 = "SET PROCESSTYPE(123) STATUS(3) ACTIVITY";
    private static final String PROGRAM_VALID_1 = "SET PROGRAM(123)";
    private static final String PROGRAM_VALID_2 = "SET PROGRAM(123) CEDF NEWCOPY DPLSUBSET JVMCLASS(1) JVMPROFILE(1) OPERATION(1) REPLICATOR JVM SHARESTATUS(1) STATUS(1) VERSION(1)";
    private static final String SECDISCOVERY_VALID_1 = "SET SECDISCOVERY";
    private static final String SECDISCOVERY_VALID_2 = "SET SECDISCOVERY STATUS(1) CMD(123) DB2(123) DCT(123) FCT(123) HFS(123) JCT(123) PCT(123) PPT(123) PSB(123) RES(123) TST(123) USER(123)";
    private static final String SECRECORDING_VALID_1 = "SET SECRECORDING(1)";
    private static final String SECRECORDING_VALID_2 = "SET SECRECORDING(1) ADD MAXIMUM(123) ODTCPIPS(1)";
    private static final String STATISTICS_VALID_1 = "SET STATISTICS";
    private static final String STATISTICS_VALID_2 = "SET STATISTICS ENDOFDAY(120101) INTERVAL(001122) RECORDING(1) RECORDNOW RESETNOW";
    private static final String SYSDUMPCODE_VALID_1 = "SET SYSDUMPCODE(4)";
    private static final String SYSDUMPCODE_VALID_2 = "SET SYSDUMPCODE(4) ACTION(1) DAEOPTION(1) DSPLIST(1) DUMPSCOPE(1) JOBLIST(1) MAXIMUM(1) SHUTOPTION(1) SYSDUMPING(1)";
    private static final String SYSTEM_VALID_1 = "SET SYSTEM";
    private static final String SYSTEM_VALID_2 = "SET SYSTEM AKP(1) DEBUGTOOL(1) DSALIMIT(1) DSRTPROGRAM(1) DTRPROGRAM(1) DUMPING(1) EDSALIMIT(1) FORCEQR(1) GMMTEXT(1)";
    private static final String TAGS_REFRESH_VALID_1 = "SET TAGS REFRESH";
    private static final String TASK_VALID_1 = "SET TASK(123)";
    private static final String TASK_VALID_2 = "SET TASK(123) PRIORITY(1) PURGETYPE(1) SRRSTATUS(1)";
    private static final String TCLASS_VALID_1 = "SET TCLASS(123)";
    private static final String TCLASS_VALID_2 = "SET TCLASS(123) MAXIMUM(123)";
    private static final String TCPIP_VALID_1 = "SET TCPIP MAXSOCKETS(1) NEWMAXSOCKET(2) OPENSTATUS(1)";
    private static final String TCPIP_VALID_2 = "SET TCPIP MAXSOCKETS(1) NEWMAXSOCKET(2) CLOSED";
    private static final String TCPIPSERVICE_VALID_1 = "SET TCPIPSERVICE(123) BACKLOG(1) MAXDATALEN(1)";
    private static final String TCPIPSERVICE_VALID_2 = "SET TCPIPSERVICE(123) BACKLOG(1) MAXDATALEN(1) OPENSTATUS(1) URM(1)";
    private static final String TDQUEUE_VALID_1 = "SET TDQUEUE(1)";
    private static final String TDQUEUE_VALID_2 = "SET TDQUEUE(1) ATIFACILITY(1) ATITERMID(1) ATITRANID(1) ATIUSERID(1) ENABLESTATUS(1) OPENSTATUS(1) TRIGGERLEVEL(1)";
    private static final String TEMPSTORAGE_VALID_1 = "SET TEMPSTORAGE TSMAINLIMIT(1)";
    private static final String TERMINAL_VALID_1 = "SET TERMINAL(1)";
    private static final String TERMINAL_VALID_2 = "SET TERMINAL(1) ACQSTATUS(1) ALTPRINTER(1) ALTPRTCOPYST(1) ATISTATUS(1) EXITTRACING(1) MAPNAME(1) MAPSETNAME(1) NEXTTRANSID(1) OBFORMATST(1) OPERID(1) AUTOPAGEABLE PRINTER(2) PRTCOPYST(1) PURGE FORCE RELREQ INSERVICE TCAMCONTROL(1) TERMPRIORITY(1) TRACING(1) TTISTATUS(1) UCTRANST(1) ZCPTRACE";
    private static final String TRACEDEST_VALID_1 = "SET TRACEDEST";
    private static final String TRACEDEST_VALID_2 = "SET TRACEDEST AUXPAUSE GTFSTART INTSTART SWITCH SWITCHNEXT TABLESIZE(1)";
    private static final String TRACEFLAG_VALID_1 = "SET TRACEFLAG";
    private static final String TRACEFLAG_VALID_2 = "SET TRACEFLAG SINGLEOFF SYSTEMOFF TCEXITALLOFF USEROFF";
    private static final String TRACETYPE_VALID_1 = "SET TRACETYPE STANDARD";
    private static final String TRACETYPE_VALID_2 = "SET TRACETYPE SPECIAL APPLICATION(1) ASYNCSERVICE(1) BM(1) BRIDGE(1) BUSAPPMGR(1) CPI(1) DC(1) DEBUGTOOL(1) DIRMGR(1) DISPATCHER(1) DOCUMENT(1) DOMAINMGR(1) DUMP(1) EI(1) ENQUEUE(1) ENTJAVA(1) EVENTCAPTURE(1) EVENTMGR(1) EVENTPROC(1) FC(1) GLOBALCATLG(1) IC(1) IPECI(1) IS(1) KC(1) KERNEL(1) LOADER(1) LOCALCATLG(1) LOCKMGR(1) LOGGER(1) MANAGEDPLAT(1) MESSAGE(1) ML(1) MONITOR(1) OBJECTTRAN(1) PARAMGR(1) PARTNER(1) PC(1) PIPEMGR(1) PROGMGR(1) RECOVERY(1) REGIONSTAT(1) REQUESTSTRM(1) RESLIFEMGR(1) RMI(1) RMIADAPTERS(1) RRS(1) SC(1) SCHEDULER(1) SECURITY(1) SJVM(1) SOCKETS(1) STATISTICS(1) STORAGE(1) SZ(1) TC(1) TD(1) TEMPSTORAGE(1) TIMER(1) TRACE(1) TRANMGR(1) UE(1) USER(1) WEB(1) WEB2(1) WEBRESTMGR(1)";
    private static final String TRANCLASS_VALID_1 = "SET TRANCLASS(1)";
    private static final String TRANCLASS_VALID_2 = "SET TRANCLASS(1) MAXACTIVE(1) ABEND PURGETHRESH(1)";
    private static final String TRANDUMPCODE_VALID_1 = "SET TRANDUMPCODE(1)";
    private static final String TRANDUMPCODE_VALID_2 = "SET TRANDUMPCODE(1) ADD LOCAL MAXIMUM(1) SHUTDOWN SYSDUMP TRANDUMP";
    private static final String TRANSACTION_VALID_1 = "SET TRANSACTION(1)";
    private static final String TRANSACTION_VALID_2 = "SET TRANSACTION(1) TRANDUMP PRIORITY(1) PURGEABLE RUNAWAY(1) SYSTEM SHUTDISABLED DISABLED TRANCLASS(1) SPECTRACE";
    private static final String TSQUEUE_VALID_1 = "SET TSQUEUE(1)";
    private static final String TSQUEUE_VALID_2 = "SET TSQNAME(1) SYSID(1) ACTION(1) LASTUSEDINT(1)";
    private static final String UOW_VALID_1 = "SET UOW(1) UOWSTATE(1)";
    private static final String UOW_VALID_2 = "SET UOW(1) COMMIT";
    private static final String UOWLINK_VALID_1 = "SET UOWLINK(1)";
    private static final String UOWLINK_VALID_2 = "SET UOWLINK(1) DELETE";
    private static final String URIMAP_VALID_1 = "SET URIMAP(1)";
    private static final String URIMAP_VALID_2 = "SET URIMAP(1) ENABLED NONE LOCATION(1)";
    //private static final String VOLUME_VALID_1 = "SET VOLUME "; // No valid instances of VOLUME exist
    private static final String VTAM_VALID_1 = "SET VTAM";
    private static final String VTAM_VALID_2 = "SET VTAM CLOSED PSDINTERVAL(1) DEREGISTERED";
    private static final String WEB_VALID_1 = "SET WEB";
    private static final String WEB_VALID_2 = "SET WEB GARBAGEINT(1) TIMEOUTINT(1)";
    private static final String WEBSERVICE_VALID_1 = "SET WEBSERVICE(1)";
    private static final String WEBSERVICE_VALID_2 = "SET WEBSERVICE(1) VALIDATION";
    private static final String WLMHEALTH_VALID_1 = "SET WLMHEALTH";
    private static final String WLMHEALTH_VALID_2 = "SET WLMHEALTH ADJUSTMENT(1)";
    private static final String XMLTRANSFORM_VALID_1 = "SET XMLTRANSFORM(1)";
    private static final String XMLTRANSFORM_VALID_2 = "SET XMLTRANSFORM(1) NOVALIDATION";

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
    private static final String LIBRARY_INVALID_1 = "SET LIBRARY(123) CRITICAL {NONCRITICAL|errorOne}";
    private static final String LIBRARY_INVALID_2 = "SET LIBRARY(123) ENABLED {DISABLED|errorOne}";
    private static final String MODENAME_INVALID_1 = "SET {_MODENAME(123) CLOSED|errorOne_}";
    private static final String MODENAME_INVALID_2 = "SET {_MODENAME(123) CONNECTION(1) CLOSED ACQUIRED|errorOne_}";
    private static final String MONITOR_INVALID_1 = "SET MONITOR ON {OFF|errorOne}";
    private static final String MONITOR_INVALID_2 = "SET MONITOR FREQUENCY(1) {FREQUENCYMIN|errorOne}(1)";
    private static final String MQCONN_INVALID_1 = "SET {_MQCONN WAIT RESYNC|errorOne_}";
    private static final String MQCONN_INVALID_2 = "SET MQCONN RESYNC {NORESYNC|errorOne}";
    private static final String MQMONITOR_INVALID_1 = "SET {_MQMONITOR(123) AUTOSTATUS(1) STOPPED|errorOne_}";
    private static final String MQMONITOR_INVALID_2 = "SET {_MQMONITOR(123) ENABLED MONSTATUS(1)|errorOne_}";
    private static final String NETNAME_INVALID_1 = "SET NETNAME(123) EXITTRACE {NOEXITTRACE|errorOne}";
    private static final String PIPELINE_INVALID_1 = "SET PIPELINE(1) ENABLED {DISABLED|errorOne}";
    private static final String PROCESSTYPE_INVALID_1 = "SET PROCESSTYPE(123) {ENABLED|errorOne} DISABLED";
    private static final String PROCESSTYPE_INVALID_2 = "SET PROCESSTYPE(123) FULL {OFF|errorOne}";
    private static final String PROGRAM_INVALID_1 = "SET PROGRAM(123) CEDF {NOCEDF|errorOne} ";
    private static final String PROGRAM_INVALID_2 = "SET PROGRAM(123) JVM {NOJVM|errorOne}";
    private static final String SECDISCOVERY_INVALID_1 = "SET SECDISCOVERY ON {OFF|errorOne}";
    private static final String SECDISCOVERY_INVALID_2 = "SET SECDISCOVERY CMD(1) {DISCOVERALL|errorOne}";
    private static final String SECRECORDING_INVALID_1 = "SET {_SECRECORDING(1) MAXIMUM(1)|errorOne_}";
    private static final String SECRECORDING_INVALID_2 = "SET SECRECORDING(1) ODADPTRID(1) {ODADPTRDATA1|errorOne}(2)";
    private static final String STATISTICS_INVALID_1 = "SET STATISTICS ENDOFDAY(123) {ENDOFDAYHRS|errorOne}(2)";
    private static final String STATISTICS_INVALID_2 = "SET {_STATISTICS RECORDNOW|errorOne_}";
    private static final String SYSDUMPCODE_INVALID_1 = "SET SYSDUMPCODE(4) ADD {REMOVE|errorOne}";
    private static final String SYSDUMPCODE_INVALID_2 = "SET SYSDUMPCODE(4) NOSHUTDOWN {SHUTDOWN|errorOne}";
    private static final String SYSTEM_INVALID_1 = "SET SYSTEM DEBUG {NODEBUG|errorOne}";
    private static final String SYSTEM_INVALID_2 = "SET SYSTEM FORCE {NOFORCE|errorOne}";
    //private static final String TAGS_REFRESH_INVALID_1 = "SET TAGS";
    private static final String TASK_INVALID_1 = "SET TASK(123) KILL {PURGE|errorOne}";
    private static final String TASK_INVALID_2 = "SET TASK(123) SRRACTIVE {SRRINACTIVE|errorOne}";
    //private static final String TCLASS_INVALID_1 = "SET TCLASS ";
    //private static final String TCLASS_INVALID_2 = "SET TCLASS ";
    private static final String TCPIP_INVALID_1 = "SET {_TCPIP NEWMAXSOCKET(1) CLOSED|errorOne_}";
    private static final String TCPIP_INVALID_2 = "SET TCPIP MAXSOCKETS(1) NEWMAXSOCKET(2) CLOSED {OPEN|errorOne} ";
    private static final String TCPIPSERVICE_INVALID_1 = "SET {_TCPIPSERVICE(123) MAXDATALEN(1)|errorOne_}";
    private static final String TCPIPSERVICE_INVALID_2 = "SET TCPIPSERVICE(123) BACKLOG(1) MAXDATALEN(1) CLOSED {OPEN|errorOne}";
    private static final String TDQUEUE_INVALID_1 = "SET TDQUEUE(1) TERMINAL {NOTERMINAL|errorOne}";
    private static final String TDQUEUE_INVALID_2 = "SET TDQUEUE(1) {DISABLED|errorOne} ENABLED";
    private static final String TEMPSTORAGE_INVALID_1 = "SET {TEMPSTORAGE|errorOne} {NORESP|errorTwo}";
    private static final String TERMINAL_INVALID_1 = "SET TERMINAL(1) NOTTI {TTI|errorOne}";
    private static final String TERMINAL_INVALID_2 = "SET {_TERMINAL(1) FORCE|errorOne_}";
    private static final String TRACEDEST_INVALID_1 = "SET TRACEDEST INTSTART {INTSTOP|errorOne}";
    private static final String TRACEDEST_INVALID_2 = "SET TRACEDEST AUXPAUSE {AUXSTART|errorOne}";
    private static final String TRACEFLAG_INVALID_1 = "SET TRACEFLAG SINGLEOFF {SINGLEON|errorOne}";
    private static final String TRACEFLAG_INVALID_2 = "SET TRACEFLAG SYSTEMOFF {SYSTEMON|errorOne}";
    private static final String TRACETYPE_INVALID_1 = "SET {TRACETYPE|errorOne} {NORESP|errorTwo}";
    private static final String TRACETYPE_INVALID_2 = "SET TRACETYPE STANDARD AP(1) {APPLICATION|errorOne}(1)";
    private static final String TRANCLASS_INVALID_1 = "SET TRANCLASS(1) ABEND {DISCARD|errorOne}";
    private static final String TRANDUMPCODE_INVALID_1 = "SET TRANDUMPCODE(1) ADD {REMOVE|errorOne}";
    private static final String TRANDUMPCODE_INVALID_2 = "SET TRANDUMPCODE(1) NOSHUTDOWN {SHUTDOWN|errorOne}";
    private static final String TRANSACTION_INVALID_1 = "SET TRANSACTION(1) TRANDUMP {NOTRANDUMP|errorOne}";
    private static final String TRANSACTION_INVALID_2 = "SET TRANSACTION(1) SPECTRACE {SPRSTRACE|errorOne}";
    private static final String TSQUEUE_INVALID_1 = "SET {_TSQUEUE(1) TSQNAME(1) SYSID(1)|errorOne_}";
    private static final String TSQUEUE_INVALID_2 = "SET {_TSQUEUE(1) LASTUSEDINT(1)|errorOne_}";
    private static final String UOW_INVALID_1 = "SET {_UOW(1) COMMIT FORCE|errorOne_}";
    private static final String UOWLINK_INVALID_1 = "SET UOWLINK(1) ACTION(1) {DELETE|errorOne}";
    private static final String URIMAP_INVALID_1 = "SET URIMAP(1) DISABLED {ENABLED|errorOne}";
    private static final String URIMAP_INVALID_2 = "SET URIMAP(1) PERMANENT {TEMPORARY|errorOne}";
    private static final String VOLUME_INVALID_1 = "SET {VOLUME|errorOne} {NORESP|errorTwo}(1)";
    private static final String VTAM_INVALID_1 = "SET VTAM CLOSED {FORCECLOSE|errorOne}";
    private static final String VTAM_INVALID_2 = "SET VTAM PSDINTERVAL(1) {PSDINTHRS|errorOne}(1)";
    //private static final String WEB_INVALID_1 = "SET WEB ";
    private static final String WEBSERVICE_INVALID_1 = "SET WEBSERVICE(1) VALIDATION {NOVALIDATION|errorOne}";
    private static final String WLMHEALTH_INVALID_1 = "SET WLMHEALTH INTERVAL(1) {OPENSTATUS|errorOne}(1)";
    private static final String XMLTRANSFORM_INVALID_1 = "SET XMLTRANSFORM(1) VALIDATION {NOVALIDATION|errorOne}";

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
        testSingleError(MQCONN_INVALID_1, "Must use exactly one of the following: CONNECTST, CONNECTED or NOTCONNECTED");
        testSingleError(MQCONN_INVALID_2, "Options \"RESYNCMEMBER, RESYNC, NORESYNC or GROUPRESYNC\" are mutually exclusive.");
    }

    @Test
    void testCicsMqmonitorInvalid() {
        testSingleError(MQMONITOR_INVALID_1, "Must use exactly one of the following: ENABLESTATUS, ENABLED or DISABLED");
        testSingleError(MQMONITOR_INVALID_2, "Must use exactly one of the following: AUTOSTATUS, AUTOSTART or NOAUTOSTART");
    }

    @Test
    void testCicsNetnameInvalid() {
        testSingleError(NETNAME_INVALID_1, "Options \"EXITTRACING, EXITTRACE or NOEXITTRACE\" are mutually exclusive.");
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
        testSingleError(SECRECORDING_INVALID_1, "Missing required option for: MAXIMUM without ADD");
        testSingleError(SECRECORDING_INVALID_2, "Options \"ODADPTRID, ODADPTRDATA1, ODADPTRDATA2, ODADPTRDATA3, ODAPPLID, ODCLNTIPADDR, ODCLNTPORT, ODFACILNAME, ODFACILTYPE, ODIPFAMILY, ODLUNAME, ODNETID, ODNETWORKID, ODSERVERPORT, ODTCPIPS, ODTRANSID or ODUSERID\" are mutually exclusive.");
    }

    @Test
    void testCicsStatisticsInvalid() {
        testSingleError(STATISTICS_INVALID_1, "Options \"ENDOFDAY or ENDOFDAYHRS\" are mutually exclusive.");
        testSingleError(STATISTICS_INVALID_2, "Must use exactly one of the following: RECORDING, ON or OFF");
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
        testSingleError(TCPIP_INVALID_1, "Missing required option: MAXSOCKETS");
        testSingleError(TCPIP_INVALID_2, "Options \"OPENSTATUS, CLOSED, IMMCLOSE or OPEN\" are mutually exclusive.");
    }

    @Test
    void testCicsTcpipserviceInvalid() {
        testSingleError(TCPIPSERVICE_INVALID_1, "Missing required option: BACKLOG");
        testSingleError(TCPIPSERVICE_INVALID_2, "Options \"OPENSTATUS, CLOSED, IMMCLOSE or OPEN\" are mutually exclusive.");
    }

    @Test
    void testCicsTdqueueInvalid() {
        testSingleError(TDQUEUE_INVALID_1, "Options \"ATIFACILITY, TERMINAL or NOTERMINAL\" are mutually exclusive.");
        testSingleError(TDQUEUE_INVALID_2, "Options \"ENABLESTATUS, ENABLED or DISABLED\" are mutually exclusive.");
    }

    @Test
    void testCicsTempstorageInvalid() {
        testTwoErrors(TEMPSTORAGE_INVALID_1, "Missing required option: TSMAINLIMIT", "Extraneous input NORESP");
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
        testTwoErrors(TRACETYPE_INVALID_1, "Must use exactly one of the following: FLAGSET, SPECIAL or STANDARD", "Extraneous input NORESP");
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
        testSingleError(TSQUEUE_INVALID_1, "Must use exactly one of the following: TSQUEUE or TSQNAME");
        testSingleError(TSQUEUE_INVALID_2, "Missing required option for: LASTUSEDINT without ACTION");
    }

    @Test
    void testCicsUowInvalid() {
        testSingleError(UOW_INVALID_1, "Must use exactly one of the following: UOWSTATE, COMMIT, BACKOUT or FORCE");
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
