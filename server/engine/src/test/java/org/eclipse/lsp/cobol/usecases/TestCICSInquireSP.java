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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
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
 * Test CICS INQUIRE SP (System Programming Translator Option) commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-inquire-association">INQUIRE SP
 * Command</a>
 *
 * <p>This class tests all variations of the ISSUE command found in the link above.
 */
public class TestCICSInquireSP {

    private static final String INQUIRE_ASSOCIATION = "INQUIRE ASSOCIATION({$varOne})";

    private static final String INQUIRE_ASSOCIATION_ERROR = "INQUIRE {ASSOCIATION(101)|errorOne}";

    private static Stream<String> getValidOptions() {
        return Stream.of(
                "ASSOCIATION({$varOne}) CLNTIPFAMILY({$varOne})",
                "ASSOCIATION LIST LISTSIZE({$varOne}) DNAME({$varOne}) DNAMELEN({$varOne}) REALM({$varOne}) REALMLEN({$varOne}) USERCORRDATA({$varOne}) SET({$varOne})",
                "ATOMSERVICE({$varOne}) ATOMTYPE({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne}) RESOURCETYPE({$varOne}) BINDFILE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CONFIGFILE({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) RESOURCENAME({$varOne}) URIMAP({$varOne}) XMLTRANSFORM({$varOne})",
                "AUTINSTMODEL({$varOne})",
                "AUTOINSTALL AIBRIDGE({$varOne}) CONSOLES({$varOne}) ENABLESTATUS({$varOne}) CURREQS({$varOne}) MAXREQS({$varOne}) PROGRAM({$varOne})",
                "BRFACILITY({$varOne}) KEEPTIME({$varOne}) LINKSYSTEM({$varOne}) LINKSYSNET({$varOne}) NETNAME({$varOne}) REMOTESYSNET({$varOne}) REMOTESYSTEM({$varOne}) TASKID({$varOne}) TERMID({$varOne}) TRANSACTION({$varOne}) NAMESPACE({$varOne}) TERMSTATUS({$varOne})",
                "BUNDLE({$varOne}) BUNDLEID({$varOne}) MAJORVERSION({$varOne}) MGMTPART({$varOne}) MICROVERSION({$varOne}) MINORVERSION({$varOne}) AVAILSTATUS({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne}) BASESCOPE({$varOne}) BUNDLEDIR({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) ENABLEDCOUNT({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) PARTCOUNT({$varOne}) TARGETCOUNT({$varOne})",
                "BUNDLEPART({$varOne}) BUNDLE({$varOne}) METADATAFILE({$varOne}) PARTTYPE({$varOne}) AVAILSTATUS({$varOne}) ENABLESTATUS({$varOne}) PARTCLASS({$varOne})",
                "CAPDATAPRED NEXT CONTAINER({$varOne}) FIELDLENGTH({$varOne}) FIELDOFFSET({$varOne}) FILENAME({$varOne}) FILTERVALUE({$varOne}) LOCATION({$varOne}) STRUCTNAME({$varOne}) VARIABLENAME({$varOne}) OPERATOR({$varOne})",
                "CAPINFOSRCE START CAPTURESPEC({$varOne}) EVENTBINDING({$varOne})",
                "CAPOPTPRED NEXT FILTERVALUE({$varOne}) OPTIONNAME({$varOne}) OPERATOR({$varOne})",
                "CAPTURESPEC({$varOne}) CAPTUREPOINT({$varOne}) CURRPGM({$varOne}) CURRTRANID({$varOne}) CURRUSERID({$varOne}) EVENTNAME({$varOne}) NUMDATAPRD({$varOne}) NUMINFOSRCE({$varOne}) NUMOPTPRED({$varOne}) PRIMPRED({$varOne}) EVENTBINDING({$varOne}) CAPTUREPTYPE({$varOne}) CURRPGMOP({$varOne}) CURRTRANIDOP({$varOne}) CURRUSERIDOP({$varOne}) PRIMPREDOP({$varOne}) PRIMPREDTYPE({$varOne})",
                "CONNECTION({$varOne}) ACCESSMETHOD({$varOne}) ACQSTATUS({$varOne}) AUTOCONNECT({$varOne}) CHANGEAGENT({$varOne}) CONNSTATUS({$varOne}) CONNTYPE({$varOne}) CQP({$varOne}) EXITTRACING({$varOne}) INSTALLAGENT({$varOne}) PENDSTATUS({$varOne}) PROTOCOL({$varOne}) RECOVSTATUS({$varOne}) SERVSTATUS({$varOne}) XLNSTATUS({$varOne}) ZCPTRACING({$varOne}) AIDCOUNT({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) GRNAME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) LINKSYSTEM({$varOne}) MEMBERNAME({$varOne}) NETNAME({$varOne}) NQNAME({$varOne}) RECEIVECOUNT({$varOne}) REMOTENAME({$varOne}) REMOTESYSNET({$varOne}) REMOTESYSTEM({$varOne}) SENDCOUNT({$varOne})",
                "CFDTPOOL({$varOne}) CONNSTATUS({$varOne})",
                "DB2CONN ACCOUNTREC({$varOne}) AUTHTYPE({$varOne}) CHANGEAGENT({$varOne}) COMAUTHTYPE({$varOne}) CONNECTERROR({$varOne}) CONNECTST({$varOne}) DROLLBACK({$varOne}) INSTALLAGENT({$varOne}) NONTERMREL({$varOne}) PRIORITY({$varOne}) RESYNCMEMBER({$varOne}) STANDBYMODE({$varOne}) THREADERROR({$varOne}) THREADWAIT({$varOne}) AUTHID({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) COMAUTHID({$varOne}) COMTHREADLIM({$varOne}) COMTHREADS({$varOne}) DB2GROUPID({$varOne}) DB2ID({$varOne}) DB2RELEASE({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) MSGQUEUE1({$varOne}) MSGQUEUE2({$varOne}) MSGQUEUE3({$varOne}) PLAN({$varOne}) PLANEXITNAME({$varOne}) PURGECYCLEM({$varOne}) PURGECYCLES({$varOne}) REUSELIMIT({$varOne}) SIGNID({$varOne}) STATSQUEUE({$varOne}) TCBLIMIT({$varOne}) TCBS({$varOne}) THREADLIMIT({$varOne}) THREADS({$varOne})",
                "DB2ENTRY({$varOne}) ACCOUNTREC({$varOne}) AUTHTYPE({$varOne}) CHANGEAGENT({$varOne}) DISABLEDACT({$varOne}) DROLLBACK({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne}) PRIORITY({$varOne}) SHARELOCKS({$varOne}) THREADWAIT({$varOne}) AUTHID({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) PLAN({$varOne}) PLANEXITNAME({$varOne}) PROTECTNUM({$varOne}) PTHREADS({$varOne}) THREADLIMIT({$varOne}) THREADS({$varOne})",
                "DB2TRAN({$varOne}) DB2ENTRY({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) PLAN({$varOne}) PLANEXITNAME({$varOne}) TRANSID({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne})",
                "DELETSHIPPED IDLEHRS({$varOne}) IDLEMINS({$varOne}) IDLESECS({$varOne}) INTERVALHRS({$varOne}) INTERVALMINS({$varOne}) INTERVALSECS({$varOne})",
                "DISPATCHER ACTOPENTCBS({$varOne}) ACTSSLTCBS({$varOne}) ACTTHRDTCBS({$varOne}) ACTXPTCBS({$varOne}) MAXOPENTCBS({$varOne}) MAXSSLTCBS({$varOne}) MAXTHRDTCBS({$varOne}) MAXXPTCBS({$varOne}) MROBATCH({$varOne}) PRTYAGING({$varOne}) RUNAWAY({$varOne}) SCANDELAY({$varOne}) SUBTASKS({$varOne}) TIME({$varOne})",
                "DOCTEMPLATE({$varOne}) APPENDCRLF({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) TEMPLATETYPE({$varOne}) TYPE({$varOne}) CACHESIZE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DDNAME({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) DSNAME({$varOne}) EXITPGM({$varOne}) FILE({$varOne}) HFSFILE({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) MEMBER({$varOne}) PROGRAM({$varOne}) TDQUEUE({$varOne}) TEMPLATENAME({$varOne}) TSQUEUE({$varOne})",
                "DSNAME({$varOne}) ACCESSMETHOD({$varOne}) AVAILABILITY({$varOne}) BACKUPTYPE({$varOne}) OBJECT({$varOne}) LOGREPSTATUS({$varOne}) LOSTLOCKS({$varOne}) QUIESCESTATE({$varOne}) RECOVSTATUS({$varOne}) RETLOCKS({$varOne}) VALIDITY({$varOne}) BASEDSNAME({$varOne}) FILECOUNT({$varOne}) FWDRECOVLOG({$varOne}) FWDRECOVLSN({$varOne})",
                "DUMPDS CURRENTDDS({$varOne}) INITIALDDS({$varOne}) OPENSTATUS({$varOne}) SWITCHSTATUS({$varOne})",
                "ENQ NEXT UOW({$varOne}) DURATION({$varOne}) ENQFAILS({$varOne}) NETUOWID({$varOne}) QUALIFIER({$varOne}) QUALLEN({$varOne}) TASKID({$varOne}) TRANSID({$varOne}) RELATION({$varOne}) STATE({$varOne}) TYPE({$varOne})",
                "ENQMODEL({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) STATUS({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) ENQSCOPE({$varOne}) ENQNAME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne})",
                "EPADAPTER({$varOne}) ADAPTERTYPE({$varOne}) AUTHORITY({$varOne}) DATAFORMAT({$varOne}) EMITMODE({$varOne}) ENABLESTATUS({$varOne}) INVOKETYPE({$varOne}) PRIORITY({$varOne}) TRANSMODE({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) AUTHUSERID({$varOne}) CONFIGDATA1({$varOne}) PROGRAM({$varOne}) TRANSACTION({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne})",
                "EPADAPTERSET({$varOne}) EPADAPTERNUM({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) ENABLESTATUS({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne})",
                "EPADAPTINSET EPADAPTERSET({$varOne}) EPADAPTER({$varOne})",
                "EVENTBINDING({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) EPADAPTERRES({$varOne}) INSTALLAGENT({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) EPADAPTER({$varOne}) EPADAPTERSET({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) USERTAG({$varOne})",
                "EVENTPROCESS EPSTATUS({$varOne}) SCHEMALEVEL({$varOne})",
                "EXCI({$varOne}) TASK({$varOne}) UTIL({$varOne})",
                "EXITPROGRAM({$varOne}) EXIT({$varOne}) ENTRYNAME({$varOne}) GAENTRYNAME({$varOne}) GALENGTH({$varOne}) GAUSECOUNT({$varOne}) NUMEXITS({$varOne}) QUALIFIER({$varOne}) TALENGTH({$varOne}) USECOUNT({$varOne}) APIST({$varOne}) CONCURRENTST({$varOne}) CONNECTST({$varOne}) FORMATEDFST({$varOne}) INDOUBTST({$varOne}) PURGEABLEST({$varOne}) SHUTDOWNST({$varOne}) SPIST({$varOne}) STARTSTATUS({$varOne}) TASKSTARTST({$varOne}) ENTRY({$varOne})",
                "FEATUREKEY({$varOne}) VALUE({$varOne}) FILEPATH({$varOne})",
                "FILE({$varOne}) ACCESSMETHOD({$varOne}) ADD({$varOne}) BLOCKFORMAT({$varOne}) BROWSE({$varOne}) CHANGEAGENT({$varOne}) DELETE({$varOne}) DISPOSITION({$varOne}) EMPTYSTATUS({$varOne}) ENABLESTATUS({$varOne}) EXCLUSIVE({$varOne}) FWDRECSTATUS({$varOne}) INSTALLAGENT({$varOne}) LOADTYPE({$varOne}) OBJECT({$varOne}) OPENSTATUS({$varOne}) RBATYPE({$varOne}) READ({$varOne}) READINTEG({$varOne}) RECORDFORMAT({$varOne}) RECOVSTATUS({$varOne}) RELTYPE({$varOne}) REMOTETABLE({$varOne}) RLSACCESS({$varOne}) TABLE({$varOne}) TYPE({$varOne}) UPDATE({$varOne}) UPDATEMODEL({$varOne}) BASEDSNAME({$varOne}) BLOCKKEYLEN({$varOne}) BLOCKSIZE({$varOne}) CFDTPOOL({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) DSNAME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) JOURNALNUM({$varOne}) KEYLENGTH({$varOne}) KEYPOSITION({$varOne}) LSRPOOLNUM({$varOne}) MAXNUMRECS({$varOne}) RECORDSIZE({$varOne}) REMOTENAME({$varOne}) REMOTESYSTEM({$varOne}) STRINGS({$varOne}) TABLENAME({$varOne})",
                "HOST({$varOne}) TCPIPSERVICE({$varOne}) ENABLESTATUS({$varOne})",
                "IPCONN({$varOne}) AUTOCONNECT({$varOne}) CHANGEAGENT({$varOne}) CONNSTATUS({$varOne}) HA({$varOne}) HOSTTYPE({$varOne}) IDPROP({$varOne}) IPFAMILY({$varOne}) INSTALLAGENT({$varOne}) LINKAUTH({$varOne}) MIRRORLIFE({$varOne}) PENDSTATUS({$varOne}) RECOVSTATUS({$varOne}) SERVSTATUS({$varOne}) SSLTYPE({$varOne}) USERAUTH({$varOne}) APPLID({$varOne}) CERTIFICATE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CIPHERS({$varOne}) CLIENTLOC({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) HOST({$varOne}) IPRESOLVED({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) MAXQTIME({$varOne}) NETWORKID({$varOne}) NUMCIPHERS({$varOne}) PARTNER({$varOne}) PORT({$varOne}) QUEUELIMIT({$varOne}) RECEIVECOUNT({$varOne}) SECURITYNAME({$varOne}) SENDCOUNT({$varOne}) TCPIPSERVICE({$varOne})",
                "IPFACILITY({$varOne}) IPCONN({$varOne}) IPFACILTYPE({$varOne})",
                "IRC OPENSTATUS({$varOne}) XCFGROUP({$varOne})",
                "JOURNALMODEL({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) TYPE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) JOURNALNAME({$varOne}) STREAMNAME({$varOne})",
                "JOURNALNAME({$varOne}) STATUS({$varOne}) TYPE({$varOne}) STREAMNAME({$varOne})",
                "JVMENDPOINT({$varOne}) JVMSERVER({$varOne}) TYPE({$varOne}) PORT({$varOne}) SECPORT({$varOne}) HOST({$varOne}) ENABLESTATUS({$varOne})",
                "JVMSERVER({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CURRENTHEAP({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) GCPOLICY({$varOne}) INITHEAP({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) JAVAHOME({$varOne}) JVMPROFILE({$varOne}) LERUNOPTS({$varOne}) LOG({$varOne}) MAXHEAP({$varOne}) OCCUPANCY({$varOne}) PID({$varOne}) PROFILE({$varOne}) PROFILEDIR({$varOne}) STDERR({$varOne}) STDOUT({$varOne}) THREADCOUNT({$varOne}) THREADLIMIT({$varOne}) TRACE({$varOne}) WORKDIR({$varOne})",
                "LIBRARY({$varOne}) APPLICATION({$varOne}) APPLMAJORVER({$varOne}) APPLMINORVER({$varOne}) APPLMICROVER({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) DSNAME01({$varOne}) DSNAME02({$varOne}) DSNAME03({$varOne}) DSNAME04({$varOne}) DSNAME05({$varOne}) DSNAME06({$varOne}) DSNAME07({$varOne}) DSNAME08({$varOne}) DSNAME09({$varOne}) DSNAME10({$varOne}) DSNAME11({$varOne}) DSNAME12({$varOne}) DSNAME13({$varOne}) DSNAME14({$varOne}) DSNAME15({$varOne}) DSNAME16({$varOne}) INSTALLUSRID({$varOne}) INSTALLTIME({$varOne}) NUMDSNAMES({$varOne}) PLATFORM({$varOne}) RANKING({$varOne}) SEARCHPOS({$varOne}) CHANGEAGENT({$varOne}) CRITICALST({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne}) DSNAMELIST({$varOne})",
                "MODENAME({$varOne}) CONNECTION({$varOne}) ACTIVE({$varOne}) AVAILABLE({$varOne}) MAXIMUM({$varOne}) MAXWINNERS({$varOne}) AUTOCONNECT({$varOne})",
                "MONITOR APPLNAMEST({$varOne}) COMPRESSST({$varOne}) CONVERSEST({$varOne}) EXCEPTCLASS({$varOne}) IDNTYCLASS({$varOne}) PERFCLASS({$varOne}) RESRCECLASS({$varOne}) RMIST({$varOne}) STATUS({$varOne}) SYNCPOINTST({$varOne}) TIME({$varOne}) DPLLIMIT({$varOne}) FILELIMIT({$varOne}) FREQUENCY({$varOne}) FREQUENCYHRS({$varOne}) FREQUENCYMINS({$varOne}) FREQUENCYSECS({$varOne}) TSQUEUELIMIT({$varOne}) URIMAPLIMIT({$varOne}) WEBSERVLIMIT({$varOne})",
                "MQCONN CHANGEAGENT({$varOne}) CONNECTST({$varOne}) INSTALLAGENT({$varOne}) RESYNCNUMBER({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) MQNAME({$varOne}) MQQMGR({$varOne}) MQRELEASE({$varOne}) TASKS({$varOne}) TRIGMONTASKS({$varOne})",
                "MQINI({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INITQNAME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne})",
                "MQMONITOR({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne}) MONSTATUS({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) MONDATA({$varOne}) MONUSERID({$varOne}) QNAME({$varOne}) TASKID({$varOne}) TRANSACTION({$varOne}) USERID({$varOne})",
                "MVSTCB({$varOne}) NEXT SET({$varOne}) NUMELEMENTS({$varOne})",
                "NODEJSAPP({$varOne}) TERMINAL({$varOne}) BUNDLE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) LERUNOPTS({$varOne}) LOG({$varOne}) NODEHOME({$varOne}) PID({$varOne}) PROFILE({$varOne}) STARTSCRIPT({$varOne}) STDERR({$varOne}) STDOUT({$varOne}) TRACE({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne})",
                "OSGIBUNDLE({$varOne}) OSGIVERSION({$varOne}) JVMSERVER({$varOne}) BUNDLE({$varOne}) BUNDLEPART({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) OSGIBUNDLEID({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) OSGISTATUS({$varOne})",
                "OSGISERVICE({$varOne}) JVMSERVER({$varOne}) BUNDLE({$varOne}) BUNDLEPART({$varOne}) OSGIBUNDLE({$varOne}) OSGIVERSION({$varOne}) SRVCNAME({$varOne}) SRVCSTATUS({$varOne})",
                "PARTNER({$varOne}) NETWORK({$varOne}) NETNAME({$varOne}) PROFILE({$varOne}) TPNAME({$varOne}) TPNAMELEN({$varOne})",
                "PIPELINE({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne}) MODE({$varOne}) MTOMNOXOPST({$varOne}) MTOMST({$varOne}) SENDMTOMST({$varOne}) XOPDIRECTST({$varOne}) XOPSUPPORTST({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CIDDOMAIN({$varOne}) CONFIGFILE({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) MSGFORMAT({$varOne}) RESPWAIT({$varOne}) SHELF({$varOne}) SOAPLEVEL({$varOne}) SOAPRNUM({$varOne}) SOAPVNUM({$varOne}) WSDIR({$varOne})",
                "POLICY({$varOne}) BUNDLE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) USERTAG({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne})",
                "POLICYRULE({$varOne}) POLICY({$varOne}) ABENDCODE({$varOne}) ACTIONCOUNT({$varOne}) EPADAPTER({$varOne}) EPADAPTERSET({$varOne}) LASTACTTIME({$varOne}) RULEITEM({$varOne}) THRESHOLD({$varOne}) ACTIONTYPE({$varOne}) RULEGROUP({$varOne}) RULETYPE({$varOne}) WLMOPENST({$varOne})",
                "PROCESSTYPE({$varOne}) AUDITLOG({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) FILE({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) AUDITLEVEL({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) STATUS({$varOne})",
                "PROFILE({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne})",
                "PROGRAM({$varOne}) APIST({$varOne}) CEDFSTATUS({$varOne}) CHANGEAGENT({$varOne}) COBOLTYPE({$varOne}) COPY({$varOne}) CONCURRENCY({$varOne}) DATALOCATION({$varOne}) DYNAMSTATUS({$varOne}) EXECKEY({$varOne}) EXECUTIONSET({$varOne}) HOLDSTATUS({$varOne}) INSTALLAGENT({$varOne}) LANGDEDUCED({$varOne}) LANGUAGE({$varOne}) LPASTATUS({$varOne}) PROGTYPE({$varOne}) REPLICATION({$varOne}) RESIDENCY({$varOne}) RUNTIME({$varOne}) SHARESTATUS({$varOne}) STATUS({$varOne}) APPLICATION({$varOne}) APPLMAJORVER({$varOne}) APPLMINORVER({$varOne}) APPLMICROVER({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) JVMCLASS({$varOne}) JVMPROFILE({$varOne}) JVMSERVER({$varOne}) LENGTH({$varOne}) LIBRARY({$varOne}) LIBRARYDSN({$varOne}) OPERATION({$varOne}) PLATFORM({$varOne}) REMOTENAME({$varOne}) REMOTESYSTEM({$varOne}) RESCOUNT({$varOne}) TRANSID({$varOne}) USECOUNT({$varOne}) ENTRYPOINT({$varOne}) LOADPOINT({$varOne})",
                "REQID({$varOne}) AFTER REQTYPE({$varOne}) FMHSTATUS({$varOne}) SET({$varOne}) TERMID({$varOne}) TRANSID({$varOne}) TIME({$varOne}) HOURS({$varOne}) MINUTES({$varOne}) SECONDS({$varOne}) LENGTH({$varOne}) RTRANSID({$varOne}) RTERMID({$varOne}) QUEUE({$varOne}) USERID({$varOne})",
                "RRMS OPENSTATUS({$varOne})",
                "SECDISCOVERY STATUS({$varOne}) CMD({$varOne}) DB2({$varOne}) DCT({$varOne}) FCT({$varOne}) HFS({$varOne}) JCT({$varOne}) PCT({$varOne}) PPT({$varOne}) PSB({$varOne}) RES({$varOne}) TRAN({$varOne}) TST({$varOne}) USER({$varOne}) LATSECDTIME({$varOne}) LASTWRITTIME({$varOne}) SECDCOUNT({$varOne}) NEWSECDCOUNT({$varOne})",
                "SECRECORDING({$varOne}) ODADPTRID({$varOne}) ODADPTRDATA1({$varOne}) ODADPTRDATA2({$varOne}) ODADPTRDATA3({$varOne}) ODAPPLID({$varOne}) ODCLNTIPADDR({$varOne}) ODCLNTPORT({$varOne}) ODFACILNAME({$varOne}) ODFACILTYPE({$varOne}) ODIPFAMILY({$varOne}) ODLUNAME({$varOne}) ODNETID({$varOne}) ODNETWORKID({$varOne}) ODSERVERPORT({$varOne}) ODTCPIPS({$varOne}) ODTRANSID({$varOne}) ODUSERID({$varOne}) MAXIMUM({$varOne}) CURRENT({$varOne})",
                "STATISTICS RECORDING({$varOne}) ENDOFDAY({$varOne}) ENDOFDAYHRS({$varOne}) ENDOFDAYMINS({$varOne}) ENDOFDAYSECS({$varOne}) INTERVAL({$varOne}) INTERVALHRS({$varOne}) INTERVALMINS({$varOne}) INTERVALSECS({$varOne}) NEXTTIME({$varOne}) NEXTTIMEHRS({$varOne}) NEXTTIMEMINS({$varOne}) NEXTTIMESECS({$varOne})",
                "STORAGE ADDRESS({$varOne}) ELEMENT({$varOne}) ELEMENTLIST({$varOne}) LENGTHLIST({$varOne}) FLENGTH({$varOne}) NUMELEMENTS({$varOne}) TASK({$varOne})",
                "STORAGE64 ELEMENT64({$varOne}) ELEMENTLIST({$varOne}) LENGTHLIST({$varOne}) ADRESS64({$varOne}) DSANAME({$varOne}) TASK({$varOne}) FLENGTH({$varOne}) NUMELEMENTS({$varOne})",
                "STREAMNAME({$varOne}) STATUS({$varOne}) SYSTEMLOG({$varOne}) USECOUNT({$varOne})",
                "SUBPOOL({$varOne}) DSANAME({$varOne})",
                "SYSDUMPCODE({$varOne}) CHANGEAGENT({$varOne}) DAEOPTION({$varOne}) DUMPSCOPE({$varOne}) INSTALLAGENT({$varOne}) SHUTOPTION({$varOne}) SYSDUMPING({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CURRENT({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) DSPLIST({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) JOBLIST({$varOne}) MAXIMUM({$varOne})",
                "SYSTEM ACTOPENTCBS({$varOne}) AIDCOUNT({$varOne}) AKP({$varOne}) CDSASIZE({$varOne}) CICSSYS({$varOne}) CICSTSLEVEL({$varOne}) DB2CONN({$varOne}) DFLTUSER({$varOne}) DSALIMIT({$varOne}) DSRTPROGRAM({$varOne}) DTRPROGRAM({$varOne}) ECDSASIZE({$varOne}) EDSALIMIT({$varOne}) EPCDSASIZE({$varOne}) EPUDSASIZE({$varOne}) ERDSASIZE({$varOne}) ESDSASIZE({$varOne}) EUDSASIZE({$varOne}) GCDSASIZE({$varOne}) GMMTEXT({$varOne}) GMMLENGTH({$varOne}) GSDSASIZE({$varOne}) GUDSASIZE({$varOne}) GMMTRANID({$varOne}) JOBNAME({$varOne}) LASTCOLDTIME({$varOne}) LASTEMERTIME({$varOne}) LASTINITTIME({$varOne}) LASTWARMTIME({$varOne}) LOGDEFER({$varOne}) MAXOPENTCBS({$varOne}) MAXTASKS({$varOne}) MEMLIMIT({$varOne}) MQCONN({$varOne}) MROBATCH({$varOne}) MVSSMFID({$varOne}) MVSSYSNAME({$varOne}) OPREL({$varOne}) OPSYS({$varOne}) OSLEVEL({$varOne}) PCDSASIZE({$varOne}) PLTPIUSR({$varOne}) PROGAUTOEXIT({$varOne}) PRTYAGING({$varOne}) PUDSASIZE({$varOne}) RDSASIZE({$varOne}) REGIONUSERID({$varOne}) RELEASE({$varOne}) RUNAWAY({$varOne}) SCANDELAY({$varOne}) SDSASIZE({$varOne}) SDTMEMLIMIT({$varOne}) SDTRAN({$varOne}) STARTUPDATE({$varOne}) TIME({$varOne}) UDSASIZE({$varOne}) SRRTASKS({$varOne}) CICSSTATUS({$varOne}) CMDPROTECT({$varOne}) COLDSTATUS({$varOne}) DEBUGTOOL({$varOne}) DUMPING({$varOne}) FORCEQR({$varOne}) HEALTHCHECK({$varOne}) INITSTATUS({$varOne}) MESSAGECASE({$varOne}) PROGAUTOCTLG({$varOne}) PROGAUTOINST({$varOne}) REENTPROTECT({$varOne}) RLSSTATUS({$varOne}) SECURITYMGR({$varOne}) SHUTSTATUS({$varOne}) SOSABOVEBAR({$varOne}) SOSABOVELINE({$varOne}) SOSBELOWLINE({$varOne}) SOSSTATUS({$varOne}) STARTUP({$varOne}) STOREPROTECT({$varOne}) TRANISOLATE({$varOne}) XRFSTATUS({$varOne})",
                "TAG START NEXT END",
                "TASK ACTIVITY({$varOne}) ACTIVITYID({$varOne}) ATTACHTIME({$varOne}) BRFACILITY({$varOne}) BRIDGE({$varOne}) CURRENTPROG({$varOne}) DB2PLAN({$varOne}) DTIMEOUT({$varOne}) FACILITY({$varOne}) IDENTIFIER({$varOne}) INDOUBTMINS({$varOne}) IPFLISTSIZE({$varOne}) PRIORITY({$varOne}) PROCESS({$varOne}) PROCESSTYPE({$varOne}) PROFILE({$varOne}) PROGRAM({$varOne}) REMOTENAME({$varOne}) REMOTESYSTEM({$varOne}) RTIMEOUT({$varOne}) RUNAWAY({$varOne}) STARTCODE({$varOne}) SUSPENDTIME({$varOne}) SUSPENDTYPE({$varOne}) SUSPENDVALUE({$varOne}) RESNAME({$varOne}) TRANCLASS({$varOne}) TCLASS({$varOne}) TRANPRIORITY({$varOne}) TRANSACTION({$varOne}) TRPROF({$varOne}) TWASIZE({$varOne}) UOW({$varOne}) USERID({$varOne}) CMDSEC({$varOne}) DUMPING({$varOne}) FACILITYTYPE({$varOne}) INDOUBT({$varOne}) INDOUBTWAIT({$varOne}) ISOLATEST({$varOne}) PURGEABILITY({$varOne}) RESSEC({$varOne}) ROUTING({$varOne}) RUNSTATUS({$varOne}) SCRNSIZE({$varOne}) SRRSTATUS({$varOne}) STORAGECLEAR({$varOne}) TASKDATAKEY({$varOne}) TASKDATALOC({$varOne}) TCB({$varOne}) TRACING({$varOne}) IPFACILITIES({$varOne})",
                "TASK LIST DISPATCHABLE RUNNING SUSPENDED LISTSIZE({$varOne}) SET({$varOne}) SETTRANSID({$varOne})",
                "TCLASS({$varOne}) CURRENT({$varOne}) MAXIMUM({$varOne})",
                "TCPIP ACTSOCKETS({$varOne}) CRLPROFILE({$varOne}) MAXSOCKETS({$varOne}) OPENSTATUS({$varOne}) SSLCACHE({$varOne})",
                "TCPIPSERVICE({$varOne}) CERTIFICATE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CIPHERS({$varOne}) CLOSETIMEOUT({$varOne}) CONNECTIONS({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) GENERICTCPS({$varOne}) HOST({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) IPADDRESS({$varOne}) IPRESOLVED({$varOne}) MAXDATALEN({$varOne}) MAXPERSIST({$varOne}) NUMCIPHERS({$varOne}) OPTIONSPGM({$varOne}) PORT({$varOne}) REALM({$varOne}) SPECIFTCPS({$varOne}) TRANSID({$varOne}) URM({$varOne}) BACKLOG({$varOne}) ATTACHSEC({$varOne}) ATTLS({$varOne}) AUTHENTICATE({$varOne}) CHANGEAGENT({$varOne}) HOSTTYPE({$varOne}) INSTALLAGENT({$varOne}) IPFAMILY({$varOne}) OPENSTATUS({$varOne}) PRIVACY({$varOne}) PROTOCOL({$varOne}) SOCKETCLOSE({$varOne}) SSLTYPE({$varOne})",
                "TDQUEUE({$varOne}) ATITERMID({$varOne}) ATITRANID({$varOne}) ATIUSERID({$varOne}) BLOCKSIZE({$varOne}) DATABUFFERS({$varOne}) DDNAME({$varOne}) DSNAME({$varOne}) INDIRECTNAME({$varOne}) MEMBER({$varOne}) NUMITEMS({$varOne}) RECORDLENGTH({$varOne}) REMOTENAME({$varOne}) REMOTESYSTEM({$varOne}) TRIGGERLEVEL({$varOne}) ATIFACILITY({$varOne}) BLOCKFORMAT({$varOne}) DISPOSITION({$varOne}) EMPTYSTATUS({$varOne}) ENABLESTATUS({$varOne}) ERROROPTION({$varOne}) INDOUBT({$varOne}) INDOUBTWAIT({$varOne}) IOTYPE({$varOne}) OPENSTATUS({$varOne}) PRINTCONTROL({$varOne}) RECORDFORMAT({$varOne}) RECOVSTATUS({$varOne}) REWIND({$varOne}) SYSOUTCLASS({$varOne}) TYPE({$varOne})",
                "TEMPSTORAGE TSMAININUSE({$varOne}) TSMAINLIMIT({$varOne})",
                "TERMINAL({$varOne}) NETNAME({$varOne}) AIDCOUNT({$varOne}) ALTPAGEHT({$varOne}) ALTPAGEWD({$varOne}) ALTPRINTER({$varOne}) ALTSCRNHT({$varOne}) ALTSCRNWD({$varOne}) ALTSUFFIX({$varOne}) CONSOLE({$varOne}) CORRELID({$varOne}) DEFPAGEHT({$varOne}) DEFPAGEWD({$varOne}) DEFSCRNHT({$varOne}) DEFSCRNWD({$varOne}) GCHARS({$varOne}) GCODES({$varOne}) LINKSYSTEM({$varOne}) MAPNAME({$varOne}) MAPSETNAME({$varOne}) MODENAME({$varOne}) NATLANG({$varOne}) NEXTTRANSID({$varOne}) NQNAME({$varOne}) OPERID({$varOne}) PAGEHT({$varOne}) PAGEWD({$varOne}) PRINTER({$varOne}) REMOTENAME({$varOne}) REMOTESYSNET({$varOne}) REMOTESYSTEM({$varOne}) SCRNHT({$varOne}) SCRNWD({$varOne}) TASKID({$varOne}) TCAMCONTROL({$varOne}) TERMMODEL({$varOne}) TERMPRIORITY({$varOne}) TNADDR({$varOne}) TNPORT({$varOne}) TRANSACTION({$varOne}) USERAREALEN({$varOne}) USERID({$varOne}) USERNAME({$varOne}) ACCESSMETHOD({$varOne}) ACQSTATUS({$varOne}) ALTPRTCOPYST({$varOne}) APLKYBDST({$varOne}) APLTEXTST({$varOne}) ASCII({$varOne}) ATISTATUS({$varOne}) AUDALARMST({$varOne}) AUTOCONNECT({$varOne}) BACKTRANSST({$varOne}) COLORST({$varOne}) COPYST({$varOne}) CREATESESS({$varOne}) DATASTREAM({$varOne}) DEVICE({$varOne}) DISCREQST({$varOne}) DUALCASEST({$varOne}) EXITTRACING({$varOne}) EXTENDEDDSST({$varOne}) FMHPARMST({$varOne}) FORMFEEDST({$varOne}) HFORMST({$varOne}) HILIGHTST({$varOne}) KATAKANAST({$varOne}) LIGHTPENST({$varOne}) MSRCONTROLST({$varOne}) NATURE({$varOne}) OBFORMATST({$varOne}) OBOPERIDST({$varOne}) OUTLINEST({$varOne}) PAGESTATUS({$varOne}) PARTITIONSST({$varOne}) PRINTADAPTST({$varOne}) PROGSYMBOLST({$varOne}) PRTCOPYST({$varOne}) QUERYST({$varOne}) RELREQST({$varOne}) SECURITY({$varOne}) SERVSTATUS({$varOne}) SESSIONTYPE({$varOne}) SIGNONSTATUS({$varOne}) SOSIST({$varOne}) TERMSTATUS({$varOne}) TEXTKYBDST({$varOne}) TEXTPRINTST({$varOne}) TNIPFAMILY({$varOne}) TRACING({$varOne}) TTISTATUS({$varOne}) UCTRANST({$varOne}) VALIDATIONST({$varOne}) VFORMST({$varOne}) ZCPTRACING({$varOne}) USERAREA({$varOne})",
                "TRACEDEST CURAUXDS({$varOne}) TABLESIZE({$varOne}) AUXSTATUS({$varOne}) GTFSTATUS({$varOne}) INTSTATUS({$varOne}) SWITCHSTATUS({$varOne})",
                "TRACEFLAG SINGLESTATUS({$varOne}) SYSTEMSTATUS({$varOne}) TCEXITSTATUS({$varOne}) USERSTATUS({$varOne})",
                "TRACETYPE SPECIAL STANDARD COMPID({$varOne}) FLAGSET({$varOne})",
                "TRANCLASS({$varOne}) ACTIVE({$varOne}) MAXACTIVE({$varOne}) PURGETHRESH({$varOne}) QUEUED({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) PURGEACTION({$varOne})",
                "TRANDUMPCODE({$varOne}) CURRENT({$varOne}) MAXIMUM({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) DUMPSCOPE({$varOne}) SHUTOPTION({$varOne}) SYSDUMPING({$varOne}) TRANDUMPING({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne})",
                "TRANSACTION({$varOne}) BREXIT({$varOne}) DTIMEOUT({$varOne}) FACILITYLIKE({$varOne}) INDOUBTMINS({$varOne}) OTSTIMEOUT({$varOne}) PRIORITY({$varOne}) PROFILE({$varOne}) PROGRAM({$varOne}) REMOTENAME({$varOne}) REMOTESYSTEM({$varOne}) RTIMEOUT({$varOne}) RUNAWAY({$varOne}) TCLASS({$varOne}) TRANCLASS({$varOne}) TRPROF({$varOne}) TWASIZE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) APPLICATION({$varOne}) APPLMAJORVER({$varOne}) APPLMICROVER({$varOne}) APPLMINORVER({$varOne}) OPERATION({$varOne}) PLATFORM({$varOne}) AVAILSTATUS({$varOne}) CMDSEC({$varOne}) DUMPING({$varOne}) INDOUBT({$varOne}) INDOUBTWAIT({$varOne}) ISOLATEST({$varOne}) PURGEABILITY({$varOne}) RESSEC({$varOne}) ROUTING({$varOne}) ROUTESTATUS({$varOne}) RUNAWAYTYPE({$varOne}) SCRNSIZE({$varOne}) SHUTDOWN({$varOne}) STATUS({$varOne}) STORAGECLEAR({$varOne}) TASKDATAKEY({$varOne}) TASKDATALOC({$varOne}) TRACING({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne})",
                "TSMODEL({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) EXPIRYINT({$varOne}) EXPIRYINTMIN({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) POOLNAME({$varOne}) PREFIX({$varOne}) REMOTEPREFIX({$varOne}) REMOTESYSTEM({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) LOCATION({$varOne}) RECOVSTATUS({$varOne}) SECURITYST({$varOne})",
                "TSPOOL({$varOne}) CONNSTATUS({$varOne})",
                "TSQUEUE({$varOne}) EXPIRYINT({$varOne}) EXPIRYINTMIN({$varOne}) FLENGTH({$varOne}) LASTUSEDINT({$varOne}) MAXITEMLEN({$varOne}) MINITEMLEN({$varOne}) NUMITEMS({$varOne}) TRANSID({$varOne}) POOLNAME({$varOne}) TSMODEL({$varOne}) LOCATION({$varOne}) RECOVSTATUS({$varOne})",
                "UOW({$varOne}) AGE({$varOne}) LINK({$varOne}) NETNAME({$varOne}) NETUOWID({$varOne}) OTSTID({$varOne}) SYSID({$varOne}) TASKID({$varOne}) TERMID({$varOne}) TRANSID({$varOne}) USERID({$varOne}) UOWSTATE({$varOne}) WAITCAUSE({$varOne}) WAITSTATE({$varOne})",
                "UOWDSNFAIL NEXT DSNAME({$varOne}) NETNAME({$varOne}) SYSID({$varOne}) UOW({$varOne}) CAUSE({$varOne}) REASON({$varOne}) RLSACCESS({$varOne})",
                "UOWENQ NEXT DURATION({$varOne}) ENQFAILS({$varOne}) NETUOWID({$varOne}) QUALIFIER({$varOne}) QUALLEN({$varOne}) TASKID({$varOne}) TRANSID({$varOne}) RESOURCE({$varOne}) RESLEN({$varOne}) RELATION({$varOne}) STATE({$varOne}) TYPE({$varOne})",
                "UOWLINK({$varOne}) HOST({$varOne}) PORT({$varOne}) BRANCHQUAL({$varOne}) LINK({$varOne}) NETUOWID({$varOne}) RMIQFY({$varOne}) SYSID({$varOne}) UOW({$varOne}) URID({$varOne}) XID({$varOne}) PROTOCOL({$varOne}) RESYNCSTATUS({$varOne}) ROLE({$varOne}) TYPE({$varOne})",
                "URIMAP({$varOne}) ATOMSERVICE({$varOne}) CERTIFICATE({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CHARACTERSET({$varOne}) CIPHERS({$varOne}) CONVERTER({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) HFSFILE({$varOne}) HOST({$varOne}) HOSTCODEPAGE({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) IPRESOLVED({$varOne}) LOCATION({$varOne}) MEDIATYPE({$varOne}) NUMCIPHERS({$varOne}) PATH({$varOne}) PIPELINE({$varOne}) PORT({$varOne}) PROGRAM({$varOne}) SOCKETCLOSE({$varOne}) SOCKPOOLSIZE({$varOne}) TCPIPSERVICE({$varOne}) TEMPLATENAME({$varOne}) TRANSACTION({$varOne}) USERID({$varOne}) WEBSERVICE({$varOne}) APPLICATION({$varOne}) APPLMAJORVER({$varOne}) APPLMINORVER({$varOne}) APPLMICROVER({$varOne}) OPERATION({$varOne}) PLATFORM({$varOne}) ANALYZERSTAT({$varOne}) AUTHENTICATE({$varOne}) AVAILSTATUS({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) HOSTTYPE({$varOne}) INSTALLAGENT({$varOne}) IPFAMILY({$varOne}) REDIRECTTYPE({$varOne}) SCHEME({$varOne}) USAGE({$varOne})",
                "VTAM GRNAME({$varOne}) PSDINTERVAL({$varOne}) PSDINTHRS({$varOne}) PSDINTMINS({$varOne}) PSDINTSECS({$varOne}) GRSTATUS({$varOne}) OPENSTATUS({$varOne}) PSTYPE({$varOne})",
                "WEB GARBAGEINT({$varOne}) TIMEOUTINT({$varOne})",
                "WEBSERVICE({$varOne}) ARCHIVEFILE({$varOne}) BINDING({$varOne}) CCSID({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) CONTAINER({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) ENDPOINT({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) LASTMODTIME({$varOne}) MAPPINGLEVEL({$varOne}) MAPPINGRNUM({$varOne}) MAPPINGVNUM({$varOne}) MINRUNLEVEL({$varOne}) MINRUNRNUM({$varOne}) MINRUNVNUM({$varOne}) PIPELINE({$varOne}) PROGRAM({$varOne}) URIMAP({$varOne}) WSBIND({$varOne}) WSDLFILE({$varOne}) CHANGEAGENT({$varOne}) INSTALLAGENT({$varOne}) PGMINTERFACE({$varOne}) STATE({$varOne}) VALIDATIONST({$varOne}) XOPDIRECTST({$varOne}) XOPSUPPORTST({$varOne})",
                "WLMHEALTH ADJUSTMENT({$varOne}) HEALTH({$varOne}) HEALTHABSTIM({$varOne}) INTERVAL({$varOne}) OPENSTATUS({$varOne})",
                "XMLTRANSFORM({$varOne})BUNDLE({$varOne}) CCSID({$varOne}) MAPPINGLEVEL({$varOne}) MAPPINGRNUM({$varOne}) MAPPINGVNUM({$varOne}) MINRUNLEVEL({$varOne}) MINRUNRNUM({$varOne}) MINRUNVNUM({$varOne}) XMLSCHEMA({$varOne}) XSDBIND({$varOne}) CHANGEAGREL({$varOne}) CHANGETIME({$varOne}) CHANGEUSRID({$varOne}) DEFINESOURCE({$varOne}) DEFINETIME({$varOne}) INSTALLTIME({$varOne}) INSTALLUSRID({$varOne}) VALIDATIONST({$varOne}) CHANGEAGENT({$varOne}) ENABLESTATUS({$varOne}) INSTALLAGENT({$varOne})");
    }

    private static final String INVALID_BROWSE_BRFACILITY =
            "INQUIRE BRFACILITY{(1)|errorOne} START RESP(1) ";

    private static final String VALID_BROWSE_CONNECTION =
            "INQUIRE CONNECTION({$varOne}) ACCESSMETHOD({$varOne}) RESP({$varOne})";

    private static final String INVALID_BROWSE_BRFACILITY_TWO =
            "INQUIRE BRFACILITY START {KEEPTIME|errorOne}(1) RESP(1)";

    private static final String VALID_CAPDATAPRED_START_BROWSE =
            "INQUIRE CAPDATAPRED CAPTURESPEC({$varOne}) EVENTBINDING({$varOne}) START";

    private static final String VALID_CAPDATAPRED_START_BROWSE_TWO =
            "INQUIRE CAPDATAPRED START CAPTURESPEC({$varOne}) EVENTBINDING({$varOne})";

    private static final String INVALID_CAPDATAPRED =
            "INQUIRE {_CAPDATAPRED CAPTURESPEC(1) EVENTBINDING(1)|errorOne_}";

    private static final String INVALID_CAPDATAPRED_START_BROWSE =
            "INQUIRE {_CAPDATAPRED START|errorOne|errorTwo_}";

    private static final String INVALID_CAPDATAPRED_NEXT =
            "INQUIRE CAPDATAPRED NEXT {CAPTURESPEC|errorOne}(1) {EVENTBINDING|errorTwo}(1)";

    private static final String VALID_CAPDATAPRED_NEXT = "INQUIRE CAPDATAPRED NEXT CONTAINER({$varOne})";

    private static final String VALID_CAPDATAPRED_NEXT_TWO = "INQUIRE CAPDATAPRED NEXT";

    private static final String INVALID_CAPDATAPRED_END =
            "INQUIRE CAPDATAPRED {CAPTURESPEC|errorOne}(1) {EVENTBINDING|errorTwo}(1) END";

    private static final String VALID_CAPDATAPRED_END = "INQUIRE CAPDATAPRED END";

    private static final String INVALID_CAPDATAPRED_START =
            "INQUIRE CAPDATAPRED START CAPTURESPEC(1) EVENTBINDING(1) {CONTAINER|errorOne}(1)";

    private static final String VALID_BUNDLEPART_NEXT = "INQUIRE BUNDLEPART({$varOne}) NEXT AVAILSTATUS({$varOne})";

    private static final String VALID_BUNDLEPART_END = "INQUIRE BUNDLEPART END";

    private static final String INVALID_BUNDLEPART_NEXT =
            "INQUIRE {BUNDLEPART|errorOne} NEXT AVAILSTATUS(1)";

    private static final String INVALID_BUNDLEPART_START = "INQUIRE {_BUNDLEPART START|errorOne_}";

    private static final String VALID_CAPTURESPEC_START = "INQUIRE CAPTURESPEC START EVENTBINDING({$varOne})";

    private static final String INVALID_CAPTURESPEC_START =
            "INQUIRE CAPTURESPEC{(1)|errorOne} START EVENTBINDING(1)";

    private static final String INVALID_FEATUREKEY_BROWSE =
            "INQUIRE FEATUREKEY START {VALUE|errorOne}(1) {FILEPATH|errorTwo}(1)";

    private static final String INVALID_BROWSING =
            "INQUIRE REQID {START|errorOne} {NEXT|errorTwo} {END|errorThree}";

    private static final String VALID_PROGRAM = "INQUIRE PROGRAM START AT({$varOne})";

    @Test
    void testValidProgram() {
        CICSTestUtils.noErrorTest(VALID_PROGRAM, "SP");
    }

    @Test
    void testInvalidBrowsing() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: START or END or NEXT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorTwo",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: START or END or NEXT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorThree",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, options are mutually exclusive: START or END or NEXT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_BROWSING, expectedDiagnostics, "SP");
    }

    @Test
    void testInvalidFeaturekeyBrowse() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option or parameter provided: Accessory options not allowed when browsing with START or END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorTwo",
                        new Diagnostic(
                                new Range(),
                                "Invalid option or parameter provided: Accessory options not allowed when browsing with START or END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_FEATUREKEY_BROWSE, expectedDiagnostics, "SP");
    }

    @Test
    void testInvalidCaptureSpecStart() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option or parameter provided: Parameter usage when browsing with START or END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_CAPTURESPEC_START, expectedDiagnostics, "SP");
    }

    @Test
    void testValidCapturespecStart() {
        CICSTestUtils.noErrorTest(VALID_CAPTURESPEC_START, "SP");
    }

    @Test
    void testValidConnection() {
        CICSTestUtils.noErrorTest(VALID_BROWSE_CONNECTION, "SP");
    }

    @Test
    void testInvalidCapdatapredEnd() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: CAPTURESPEC with END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorTwo",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: EVENTBINDING with END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_CAPDATAPRED_END, expectedDiagnostics, "SP");
    }

    @Test
    void tesstInvalidCapdatapredStart() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option or parameter provided: Accessory options not allowed when browsing with START or END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_CAPDATAPRED_START, expectedDiagnostics, "SP");
    }

    @Test
    void testValidCapdatapredEnd() {
        CICSTestUtils.noErrorTest(VALID_CAPDATAPRED_END, "SP");
    }

    @Test
    void testInvalidBundlepartNext() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option or parameter provided: Missing required option parameter",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_BUNDLEPART_NEXT, expectedDiagnostics, "SP");
    }

    @Test
    void testInvalidBundlepartStart() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: BUNDLE with START",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_BUNDLEPART_START, expectedDiagnostics, "SP");
    }

    @Test
    void testValidBundlePartNext() {
        CICSTestUtils.noErrorTest(VALID_BUNDLEPART_NEXT, "SP");
    }

    @Test
    void testValidBundlePartEnd() {
        CICSTestUtils.noErrorTest(VALID_BUNDLEPART_END, "SP");
    }

    @Test
    void testValidCapdatapredNext() {
        CICSTestUtils.noErrorTest(VALID_CAPDATAPRED_NEXT, "SP");
    }

    @Test
    void testValidCapdatapredNextTwo() {
        CICSTestUtils.noErrorTest(VALID_CAPDATAPRED_NEXT_TWO, "SP");
    }

    @Test
    void testInvalidCapdatapredNext() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: CAPTURESPEC with NEXT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorTwo",
                        new Diagnostic(
                                new Range(),
                                "Invalid option provided: EVENTBINDING with NEXT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_CAPDATAPRED_NEXT, expectedDiagnostics, "SP");
    }

    @Test
    void testValidCapdatapredStartBrowse() {
        CICSTestUtils.noErrorTest(VALID_CAPDATAPRED_START_BROWSE, "SP");
    }

    @Test
    void testValidCapdatapredStartBrowseTwo() {
        CICSTestUtils.noErrorTest(VALID_CAPDATAPRED_START_BROWSE_TWO, "SP");
    }

    @Test
    void testInvalidCapdatapred() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Exactly one option required, none provided: START or END or NEXT",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_CAPDATAPRED, expectedDiagnostics, "SP");
    }

    @Test
    void testInvalidCapdatapredStartBrowse() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: CAPTURESPEC with START",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()),
                        "errorTwo",
                        new Diagnostic(
                                new Range(),
                                "Missing required option: EVENTBINDING with START",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_CAPDATAPRED_START_BROWSE, expectedDiagnostics, "SP");
    }

    @Test
    void testInquireAssociationValid() {
        CICSTestUtils.noErrorTest(INQUIRE_ASSOCIATION, "SP", "EXCI");
    }

    @Test
    void testInquireAssociationInValid() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid CICS command without translator option: \"SP\"",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INQUIRE_ASSOCIATION_ERROR, expectedDiagnostics, "EXCI");
    }

    @ParameterizedTest
    @MethodSource("getValidOptions")
    void testOption(String cicsOption) {
        CICSTestUtils.noErrorTest("INQUIRE " + cicsOption, "SP");
    }

    @Test
    void testInquireBrowseInvalidOne() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option or parameter provided: Parameter usage when browsing with START or END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_BROWSE_BRFACILITY, expectedDiagnostics, "SP");
    }

    @Test
    void testInquireBrowseInvalidTwo() {
        Map<String, Diagnostic> expectedDiagnostics =
                ImmutableMap.of(
                        "errorOne",
                        new Diagnostic(
                                new Range(),
                                "Invalid option or parameter provided: Accessory options not allowed when browsing with START or END",
                                DiagnosticSeverity.Error,
                                ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(INVALID_BROWSE_BRFACILITY_TWO, expectedDiagnostics, "SP");
    }

    @Test
    void testTranslatorOptionsWithoutParens() {
        UseCaseEngine.runTest(
                "       CBL CICS(SP)\n"
                        + "       IDENTIFICATION DIVISION.\n"
                        + "       PROGRAM-ID. ABCDEF.\n"
                        + "       DATA DIVISION.\n"
                        + "       WORKING-STORAGE SECTION.\n"
                        + "       PROCEDURE DIVISION.\n"
                        + "            EXEC CICS \n"
                        + "            INQUIRE AUTINSTMODEL START\n"
                        + "            END-EXEC.", ImmutableList.of(), ImmutableMap.of());
    }
}
