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
package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.*;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

/** Checks CICS SET ASSOCIATION USERCORRDATA rules for required and invalid options */
public class CICSSysSetOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_set;

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.ACCOUNTREC, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.ADD, ErrorSeverity.ERROR);
                    put(CICSLexer.ADJUSTMENT, ErrorSeverity.ERROR);
                    put(CICSLexer.AFFINITY, ErrorSeverity.ERROR);
                    put(CICSLexer.AIBRIDGE, ErrorSeverity.ERROR);
                    put(CICSLexer.AKP, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTPRINTER, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTPRTCOPYST, ErrorSeverity.ERROR);
                    put(CICSLexer.ATIFACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ATISTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ATITERMID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATITRANID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATIUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.AUDITLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTHID, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTHTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTOSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.AUXSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILABILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILABLE, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.BACKLOG, ErrorSeverity.ERROR);
                    put(CICSLexer.BRFACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.BROWSE, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.BUSY, ErrorSeverity.ERROR);
                    put(CICSLexer.CEDFSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.CFDTPOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.CMD, ErrorSeverity.ERROR);
                    put(CICSLexer.COMAUTHID, ErrorSeverity.ERROR);
                    put(CICSLexer.COMAUTHTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPID, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPRESSST, ErrorSeverity.ERROR);
                    put(CICSLexer.COMTHREADLIM, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTERROR, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTST, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.CONSOLES, ErrorSeverity.ERROR);
                    put(CICSLexer.CONVERSEST, ErrorSeverity.ERROR);
                    put(CICSLexer.COPY, ErrorSeverity.ERROR);
                    put(CICSLexer.CREATESESS, ErrorSeverity.ERROR);
                    put(CICSLexer.CRITICALST, ErrorSeverity.ERROR);
                    put(CICSLexer.DAEOPTION, ErrorSeverity.ERROR);
                    put(CICSLexer.DATASET, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2GROUPID, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ID, ErrorSeverity.ERROR);
                    put(CICSLexer.DCT, ErrorSeverity.ERROR);
                    put(CICSLexer.DEBUGTOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.DELETE, ErrorSeverity.ERROR);
                    put(CICSLexer.DISABLED, ErrorSeverity.ERROR);
                    put(CICSLexer.DISABLEDACT, ErrorSeverity.ERROR);
                    put(CICSLexer.DISCREQST, ErrorSeverity.ERROR);
                    put(CICSLexer.DISPOSITION, ErrorSeverity.ERROR);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.ERROR);
                    put(CICSLexer.DPLLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.DSALIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.DSPLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.DSRTPROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.DTRPROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPSCOPE, ErrorSeverity.ERROR);
                    put(CICSLexer.EDSALIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.EMPTYSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENABLED, ErrorSeverity.ERROR);
                    put(CICSLexer.ENABLESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAY, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAYHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAYMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAYSECS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTER, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTERSET, ErrorSeverity.ERROR);
                    put(CICSLexer.EPSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.EVENTBINDING, ErrorSeverity.ERROR);
                    put(CICSLexer.EXCEPTCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.EXCLUSIVE, ErrorSeverity.ERROR);
                    put(CICSLexer.EXECUTIONSET, ErrorSeverity.ERROR);
                    put(CICSLexer.EXITTRACING, ErrorSeverity.ERROR);
                    put(CICSLexer.FCT, ErrorSeverity.ERROR);
                    put(CICSLexer.FILE, ErrorSeverity.ERROR);
                    put(CICSLexer.FILELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.FLAGSET, ErrorSeverity.ERROR);
                    put(CICSLexer.FORCEQR, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCY, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCYHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCYMIN, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCYSEC, ErrorSeverity.ERROR);
                    put(CICSLexer.GARBAGEINT, ErrorSeverity.ERROR);
                    put(CICSLexer.GMMLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.GMMTEXT, ErrorSeverity.ERROR);
                    put(CICSLexer.GTFSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.HFS, ErrorSeverity.ERROR);
                    put(CICSLexer.HOST, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLEHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLEMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLESECS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDNTYCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.INITIALDDS, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVALHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVALMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVALSECS, ErrorSeverity.ERROR);
                    put(CICSLexer.INTSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.IPCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.JCT, ErrorSeverity.ERROR);
                    put(CICSLexer.JOBLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMENDPOINT, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMPROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMSERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTUSEDINT, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBRARY, ErrorSeverity.ERROR);
                    put(CICSLexer.LOADTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.LOCATION, ErrorSeverity.ERROR);
                    put(CICSLexer.LOGDEFER, ErrorSeverity.ERROR);
                    put(CICSLexer.LSRPOOLNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPSETNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXACTIVE, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXDATALEN, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXIMUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXNUMRECS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXOPENTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXREQS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXSOCKETS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXSSLTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXTASKS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXXPTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.MODENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MONSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.MQMONITOR, ErrorSeverity.ERROR);
                    put(CICSLexer.MQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MROBATCH, ErrorSeverity.ERROR);
                    put(CICSLexer.MSGQUEUE1, ErrorSeverity.ERROR);
                    put(CICSLexer.MSGQUEUE2, ErrorSeverity.ERROR);
                    put(CICSLexer.MSGQUEUE3, ErrorSeverity.ERROR);
                    put(CICSLexer.NETNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.NEWMAXSOCKET, ErrorSeverity.ERROR);
                    put(CICSLexer.NEWMAXTASKS, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXTTRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.NONTERMREL, ErrorSeverity.ERROR);
                    put(CICSLexer.OBFORMATST, ErrorSeverity.ERROR);
                    put(CICSLexer.OBJECTNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRDATA1, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRDATA2, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRDATA3, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRID, ErrorSeverity.ERROR);
                    put(CICSLexer.ODAPPLID, ErrorSeverity.ERROR);
                    put(CICSLexer.ODCLNTIPADDR, ErrorSeverity.ERROR);
                    put(CICSLexer.ODCLNTPORT, ErrorSeverity.ERROR);
                    put(CICSLexer.ODFACILNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.ODFACILTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.ODIPFAMILY, ErrorSeverity.ERROR);
                    put(CICSLexer.ODLUNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.ODNETID, ErrorSeverity.ERROR);
                    put(CICSLexer.ODNETWORKID, ErrorSeverity.ERROR);
                    put(CICSLexer.ODSERVERPORT, ErrorSeverity.ERROR);
                    put(CICSLexer.ODTCPIPS, ErrorSeverity.ERROR);
                    put(CICSLexer.ODTRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.ODUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.OPENSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.OPERATION, ErrorSeverity.ERROR);
                    put(CICSLexer.OPERID, ErrorSeverity.ERROR);
                    put(CICSLexer.PAGESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.PCT, ErrorSeverity.ERROR);
                    put(CICSLexer.PENDSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.PERFCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
                    put(CICSLexer.PLAN, ErrorSeverity.ERROR);
                    put(CICSLexer.PLANEXITNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.POOLNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.PPT, ErrorSeverity.ERROR);
                    put(CICSLexer.PRINTER, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGAUTOCTLG, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGAUTOEXIT, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGAUTOINST, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.PROTECTNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.PRTCOPYST, ErrorSeverity.ERROR);
                    put(CICSLexer.PRTYAGING, ErrorSeverity.ERROR);
                    put(CICSLexer.PSB, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTERVAL, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTSECS, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGEABILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGEACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGECYCLEM, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGECYCLES, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGETHRESH, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGETYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.QUESCESTATE, ErrorSeverity.ERROR);
                    put(CICSLexer.RANKING, ErrorSeverity.ERROR);
                    put(CICSLexer.READ, ErrorSeverity.ERROR);
                    put(CICSLexer.READINTEG, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDING, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.RECOVSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.REDIRECTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RELREQST, ErrorSeverity.ERROR);
                    put(CICSLexer.REPLICATION, ErrorSeverity.ERROR);
                    put(CICSLexer.RES, ErrorSeverity.ERROR);
                    put(CICSLexer.RESPWAIT, ErrorSeverity.ERROR);
                    put(CICSLexer.RESRCECLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.RESYNCMEMBER, ErrorSeverity.ERROR);
                    put(CICSLexer.REUSELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.RLSACCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNAWAY, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNAWAYTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.SCANDELAY, ErrorSeverity.ERROR);
                    put(CICSLexer.SDTMEMLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.SECRECORDING, ErrorSeverity.ERROR);
                    put(CICSLexer.SERVSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SHARELOCKS, ErrorSeverity.ERROR);
                    put(CICSLexer.SHARESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTDOWN, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTOPTION, ErrorSeverity.ERROR);
                    put(CICSLexer.SIGNID, ErrorSeverity.ERROR);
                    put(CICSLexer.SINGLESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SRRSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.STANDBYMODE, ErrorSeverity.ERROR);
                    put(CICSLexer.STATSQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.STATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.STRINGS, ErrorSeverity.ERROR);
                    put(CICSLexer.SWITCHACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.SWITCHSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SYNCPOINTST, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSDUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSDUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSID, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSTEMSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLE, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLESIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.TASK, ErrorSeverity.ERROR);
                    put(CICSLexer.TCAMCONTROL, ErrorSeverity.ERROR);
                    put(CICSLexer.TCBLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TCEXITSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.TCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMPRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADWAIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TIME, ErrorSeverity.ERROR);
                    put(CICSLexer.TIMEOUTINT, ErrorSeverity.ERROR);
                    put(CICSLexer.TRACING, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANDUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANDUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.TRIGGERLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMAINLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQUEUELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TST, ErrorSeverity.ERROR);
                    put(CICSLexer.TTISTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.UCTRANST, ErrorSeverity.ERROR);
                    put(CICSLexer.UOW, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWLINK, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWSTATE, ErrorSeverity.ERROR);
                    put(CICSLexer.UPDATE, ErrorSeverity.ERROR);
                    put(CICSLexer.UPDATEMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAPLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.URM, ErrorSeverity.ERROR);
                    put(CICSLexer.USER, ErrorSeverity.ERROR);
                    put(CICSLexer.USERCORRDATA, ErrorSeverity.ERROR);
                    put(CICSLexer.USERSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.VALIDATIONST, ErrorSeverity.ERROR);
                    put(CICSLexer.VERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.ZCPTRACING, ErrorSeverity.ERROR);

                    put(CICSLexer.ABEND, ErrorSeverity.WARNING);
                    put(CICSLexer.ACQUIRED, ErrorSeverity.WARNING);
                    put(CICSLexer.ACTIVITY, ErrorSeverity.WARNING);
                    put(CICSLexer.ADDABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.ALTPRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.ASSOCIATION, ErrorSeverity.WARNING);
                    put(CICSLexer.ATI, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOACTIVE, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOINACTIVE, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOINSTALL, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOPAGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.AUXPAUSE, ErrorSeverity.WARNING);
                    put(CICSLexer.AUXSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.AUXSTOP, ErrorSeverity.WARNING);
                    put(CICSLexer.BACKOUT, ErrorSeverity.WARNING);
                    put(CICSLexer.BROWSABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.CANCEL, ErrorSeverity.WARNING);
                    put(CICSLexer.CEDF, ErrorSeverity.WARNING);
                    put(CICSLexer.CFTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.CGROUP, ErrorSeverity.WARNING);
                    put(CICSLexer.CICSTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.CLOSED, ErrorSeverity.WARNING);
                    put(CICSLexer.COLDACQ, ErrorSeverity.WARNING);
                    put(CICSLexer.COMMIT, ErrorSeverity.WARNING);
                    put(CICSLexer.COMPRESS, ErrorSeverity.WARNING);
                    put(CICSLexer.CONNECT, ErrorSeverity.WARNING);
                    put(CICSLexer.CONNECTED, ErrorSeverity.WARNING);
                    put(CICSLexer.CONSISTENT, ErrorSeverity.WARNING);
                    put(CICSLexer.CONTENTION, ErrorSeverity.WARNING);
                    put(CICSLexer.CONVERSE, ErrorSeverity.WARNING);
                    put(CICSLexer.COPID, ErrorSeverity.WARNING);
                    put(CICSLexer.CREATE, ErrorSeverity.WARNING);
                    put(CICSLexer.CRITICAL, ErrorSeverity.WARNING);
                    put(CICSLexer.CSIGN, ErrorSeverity.WARNING);
                    put(CICSLexer.CTERM, ErrorSeverity.WARNING);
                    put(CICSLexer.CTLGALL, ErrorSeverity.WARNING);
                    put(CICSLexer.CTLGMODIFY, ErrorSeverity.WARNING);
                    put(CICSLexer.CTLGNONE, ErrorSeverity.WARNING);
                    put(CICSLexer.CTX, ErrorSeverity.WARNING);
                    put(CICSLexer.CUSERID, ErrorSeverity.WARNING);
                    put(CICSLexer.DAE, ErrorSeverity.WARNING);
                    put(CICSLexer.DB2CONN, ErrorSeverity.WARNING);
                    put(CICSLexer.DB2TRAN, ErrorSeverity.WARNING);
                    put(CICSLexer.DEBUG, ErrorSeverity.WARNING);
                    put(CICSLexer.DELETABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.DELETSHIPPED, ErrorSeverity.WARNING);
                    put(CICSLexer.DEREGISTERED, ErrorSeverity.WARNING);
                    put(CICSLexer.DISCARD, ErrorSeverity.WARNING);
                    put(CICSLexer.DISCOVERALL, ErrorSeverity.WARNING);
                    put(CICSLexer.DISCREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.DISPATCHER, ErrorSeverity.WARNING);
                    put(CICSLexer.DPLSUBSET, ErrorSeverity.WARNING);
                    put(CICSLexer.DRAIN, ErrorSeverity.WARNING);
                    put(CICSLexer.DUMPDS, ErrorSeverity.WARNING);
                    put(CICSLexer.EMPTY, ErrorSeverity.WARNING);
                    put(CICSLexer.EMPTYREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.ENDAFFINITY, ErrorSeverity.WARNING);
                    put(CICSLexer.EQUAL, ErrorSeverity.WARNING);
                    put(CICSLexer.EVENTPROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.EXCEPT, ErrorSeverity.WARNING);
                    put(CICSLexer.EXCTL, ErrorSeverity.WARNING);
                    put(CICSLexer.EXITTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.FLUSH, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCE, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCECANCEL, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCECLOSE, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCEPURGE, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCEUOW, ErrorSeverity.WARNING);
                    put(CICSLexer.FULL, ErrorSeverity.WARNING);
                    put(CICSLexer.FULLAPI, ErrorSeverity.WARNING);
                    put(CICSLexer.GROUP, ErrorSeverity.WARNING);
                    put(CICSLexer.GROUPRESYNC, ErrorSeverity.WARNING);
                    put(CICSLexer.GTFSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.GTFSTOP, ErrorSeverity.WARNING);
                    put(CICSLexer.HIGH, ErrorSeverity.WARNING);
                    put(CICSLexer.IDNTY, ErrorSeverity.WARNING);
                    put(CICSLexer.IMMCLOSE, ErrorSeverity.WARNING);
                    put(CICSLexer.IMMQUIESCED, ErrorSeverity.WARNING);
                    put(CICSLexer.INSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.INTSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.INTSTOP, ErrorSeverity.WARNING);
                    put(CICSLexer.IRC, ErrorSeverity.WARNING);
                    put(CICSLexer.JVM, ErrorSeverity.WARNING);
                    put(CICSLexer.KILL, ErrorSeverity.WARNING);
                    put(CICSLexer.LOAD, ErrorSeverity.WARNING);
                    put(CICSLexer.LOCAL, ErrorSeverity.WARNING);
                    put(CICSLexer.LOCKING, ErrorSeverity.WARNING);
                    put(CICSLexer.LOW, ErrorSeverity.WARNING);
                    put(CICSLexer.MODIFY, ErrorSeverity.WARNING);
                    put(CICSLexer.MONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.MQCONN, ErrorSeverity.WARNING);
                    put(CICSLexer.NEWCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.NO, ErrorSeverity.WARNING);
                    put(CICSLexer.NOALTPRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.NOATI, ErrorSeverity.WARNING);
                    put(CICSLexer.NOAUTOSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCEDF, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCOMPRESS, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCONNECT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCONVERSE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCREATE, ErrorSeverity.WARNING);
                    put(CICSLexer.NODAE, ErrorSeverity.WARNING);
                    put(CICSLexer.NODEBUG, ErrorSeverity.WARNING);
                    put(CICSLexer.NODISCREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEMPTYREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEXCEPT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEXCTL, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEXITTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOFORCE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOIDNTY, ErrorSeverity.WARNING);
                    put(CICSLexer.NOJVM, ErrorSeverity.WARNING);
                    put(CICSLexer.NOLOAD, ErrorSeverity.WARNING);
                    put(CICSLexer.NONCRITICAL, ErrorSeverity.WARNING);
                    put(CICSLexer.NONE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOOBFORMAT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOPERF, ErrorSeverity.WARNING);
                    put(CICSLexer.NOPRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.NORECOVDATA, ErrorSeverity.WARNING);
                    put(CICSLexer.NORELEASE, ErrorSeverity.WARNING);
                    put(CICSLexer.NORELREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.NOREPLICATOR, ErrorSeverity.WARNING);
                    put(CICSLexer.NORESRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.NORESYNC, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSHUTDOWN, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSWITCH, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSYNCPOINT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSYSDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTADDBALE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTBROWSABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTCONNECTED, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTDELETABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTERMINAL, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTPENDING, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTPURGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTRANDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTREADABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTRLS, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTTI, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTUPDATABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTWAIT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOUCTRAN, ErrorSeverity.WARNING);
                    put(CICSLexer.NOVALIDATION, ErrorSeverity.WARNING);
                    put(CICSLexer.NOWAIT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOZCPTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.OBFORMAT, ErrorSeverity.WARNING);
                    put(CICSLexer.OFF, ErrorSeverity.WARNING);
                    put(CICSLexer.OLD, ErrorSeverity.WARNING);
                    put(CICSLexer.ON, ErrorSeverity.WARNING);
                    put(CICSLexer.OPEN, ErrorSeverity.WARNING);
                    put(CICSLexer.OPID, ErrorSeverity.WARNING);
                    put(CICSLexer.OUTSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.PAGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.PERF, ErrorSeverity.WARNING);
                    put(CICSLexer.PERMANENT, ErrorSeverity.WARNING);
                    put(CICSLexer.PHASEIN, ErrorSeverity.WARNING);
                    put(CICSLexer.PHASEOUT, ErrorSeverity.WARNING);
                    put(CICSLexer.POOL, ErrorSeverity.WARNING);
                    put(CICSLexer.PRIVATE, ErrorSeverity.WARNING);
                    put(CICSLexer.PROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.PRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.PURGE, ErrorSeverity.WARNING);
                    put(CICSLexer.PURGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.PURGEFORCE, ErrorSeverity.WARNING);
                    put(CICSLexer.QUIESCED, ErrorSeverity.WARNING);
                    put(CICSLexer.READABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.RECONNECT, ErrorSeverity.WARNING);
                    put(CICSLexer.RECORDNOW, ErrorSeverity.WARNING);
                    put(CICSLexer.RECOVERED, ErrorSeverity.WARNING);
                    put(CICSLexer.REFRESH, ErrorSeverity.WARNING);
                    put(CICSLexer.RELATED, ErrorSeverity.WARNING);
                    put(CICSLexer.RELEASE, ErrorSeverity.WARNING);
                    put(CICSLexer.RELEASED, ErrorSeverity.WARNING);
                    put(CICSLexer.RELREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.REMOVE, ErrorSeverity.WARNING);
                    put(CICSLexer.REPEATABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.REPLICATOR, ErrorSeverity.WARNING);
                    put(CICSLexer.RESET, ErrorSeverity.WARNING);
                    put(CICSLexer.RESETLOCKS, ErrorSeverity.WARNING);
                    put(CICSLexer.RESETNOW, ErrorSeverity.WARNING);
                    put(CICSLexer.RESRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.RESYNC, ErrorSeverity.WARNING);
                    put(CICSLexer.RETRY, ErrorSeverity.WARNING);
                    put(CICSLexer.RLS, ErrorSeverity.WARNING);
                    put(CICSLexer.RREPL, ErrorSeverity.WARNING);
                    put(CICSLexer.SECDISCOVERY, ErrorSeverity.WARNING);
                    put(CICSLexer.SECURITY, ErrorSeverity.WARNING);
                    put(CICSLexer.SET, ErrorSeverity.WARNING);
                    put(CICSLexer.SHARE, ErrorSeverity.WARNING);
                    put(CICSLexer.SHARED, ErrorSeverity.WARNING);
                    put(CICSLexer.SHUTDISABLED, ErrorSeverity.WARNING);
                    put(CICSLexer.SHUTENABLED, ErrorSeverity.WARNING);
                    put(CICSLexer.SIGN, ErrorSeverity.WARNING);
                    put(CICSLexer.SINGLEOFF, ErrorSeverity.WARNING);
                    put(CICSLexer.SINGLEON, ErrorSeverity.WARNING);
                    put(CICSLexer.SPECIAL, ErrorSeverity.WARNING);
                    put(CICSLexer.SPECTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.SPRSTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.SQLCODE, ErrorSeverity.WARNING);
                    put(CICSLexer.SRRACTIVE, ErrorSeverity.WARNING);
                    put(CICSLexer.SRRINACTIVE, ErrorSeverity.WARNING);
                    put(CICSLexer.STANDARD, ErrorSeverity.WARNING);
                    put(CICSLexer.STANTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.STARTED, ErrorSeverity.WARNING);
                    put(CICSLexer.STATISTICS, ErrorSeverity.WARNING);
                    put(CICSLexer.STOPPED, ErrorSeverity.WARNING);
                    put(CICSLexer.SWITCH, ErrorSeverity.WARNING);
                    put(CICSLexer.SWITCHALL, ErrorSeverity.WARNING);
                    put(CICSLexer.SWITCHNEXT, ErrorSeverity.WARNING);
                    put(CICSLexer.SYNCPOINT, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSTEM, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSTEMOFF, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSTEMON, ErrorSeverity.WARNING);
                    put(CICSLexer.TABLEONLY, ErrorSeverity.WARNING);
                    put(CICSLexer.TAGS, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITALL, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITALLOFF, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITNONE, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITSYSTEM, ErrorSeverity.WARNING);
                    put(CICSLexer.TCPIP, ErrorSeverity.WARNING);
                    put(CICSLexer.TEMPORARY, ErrorSeverity.WARNING);
                    put(CICSLexer.TEMPSTORAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.TERM, ErrorSeverity.WARNING);
                    put(CICSLexer.TPOOL, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACEDEST, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACEFLAG, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACETYPE, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANIDONLY, ErrorSeverity.WARNING);
                    put(CICSLexer.TTI, ErrorSeverity.WARNING);
                    put(CICSLexer.TWAIT, ErrorSeverity.WARNING);
                    put(CICSLexer.TX, ErrorSeverity.WARNING);
                    put(CICSLexer.TXID, ErrorSeverity.WARNING);
                    put(CICSLexer.UCTRAN, ErrorSeverity.WARNING);
                    put(CICSLexer.UNAVAILABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.UNCOMMITTED, ErrorSeverity.WARNING);
                    put(CICSLexer.UNQUIESCED, ErrorSeverity.WARNING);
                    put(CICSLexer.UPDATABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.USERID, ErrorSeverity.WARNING);
                    put(CICSLexer.USEROFF, ErrorSeverity.WARNING);
                    put(CICSLexer.USERON, ErrorSeverity.WARNING);
                    put(CICSLexer.USERTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.VALIDATION, ErrorSeverity.WARNING);
                    put(CICSLexer.VOLUME, ErrorSeverity.WARNING);
                    put(CICSLexer.VTAM, ErrorSeverity.WARNING);
                    put(CICSLexer.WAIT, ErrorSeverity.WARNING);
                    put(CICSLexer.WEB, ErrorSeverity.WARNING);
                    put(CICSLexer.WLMHEALTH, ErrorSeverity.WARNING);
                    put(CICSLexer.XMLTRANSFORM, ErrorSeverity.WARNING);
                    put(CICSLexer.YES, ErrorSeverity.WARNING);
                    put(CICSLexer.ZCPTRACE, ErrorSeverity.WARNING);
                }
            };

    public CICSSysSetOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS SET ASSOCIATION USERCORRDATA rules for required and invalid options
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case RULE_cics_set_association_usercorrdata:
                checkAssociationUsercorrdata((CICSParser.Cics_set_association_usercorrdataContext) ctx);
                break;
            case RULE_cics_set_atomservice:
                checkAtomservice((CICSParser.Cics_set_atomserviceContext) ctx);
                break;
            case RULE_cics_set_autoinstall:
                checkAutoinstall((CICSParser.Cics_set_autoinstallContext) ctx);
                break;
            case RULE_cics_set_brfacility:
                checkBrfacility((CICSParser.Cics_set_brfacilityContext) ctx);
                break;
            case RULE_cics_set_bundle:
                checkBundle((CICSParser.Cics_set_bundleContext) ctx);
                break;
            case RULE_cics_set_connection:
                checkConnection((CICSParser.Cics_set_connectionContext) ctx);
                break;
            case RULE_cics_set_db2conn:
                checkDb2conn((CICSParser.Cics_set_db2connContext) ctx);
                break;
            case RULE_cics_set_db2entry:
                checkDb2entry((CICSParser.Cics_set_db2entryContext) ctx);
                break;
            case RULE_cics_set_db2tran:
                checkDb2tran((CICSParser.Cics_set_db2tranContext) ctx);
                break;
            case RULE_cics_set_deletshipped:
                checkDeletshipped((CICSParser.Cics_set_deletshippedContext) ctx);
                break;
            case RULE_cics_set_dispatcher:
                checkDispatcher((CICSParser.Cics_set_dispatcherContext) ctx);
                break;
            case RULE_cics_set_doctemplate:
                checkDoctemplate((CICSParser.Cics_set_doctemplateContext) ctx);
                break;
            case RULE_cics_set_dsname:
                checkDsname((CICSParser.Cics_set_dsnameContext) ctx);
                break;
            case RULE_cics_set_dumpds:
                checkDumpds((CICSParser.Cics_set_dumpdsContext) ctx);
                break;
            case RULE_cics_set_enqmodel:
                checkEnqmodel((CICSParser.Cics_set_enqmodelContext) ctx);
                break;
            case RULE_cics_set_epadapter:
                checkEpadapter((CICSParser.Cics_set_epadapterContext) ctx);
                break;
            case RULE_cics_set_epadapterset:
                checkEpadapterset((CICSParser.Cics_set_epadaptersetContext) ctx);
                break;
            case RULE_cics_set_eventbinding:
                checkEventbinding((CICSParser.Cics_set_eventbindingContext) ctx);
                break;
            case RULE_cics_set_eventprocess:
                checkEventprocess((CICSParser.Cics_set_eventprocessContext) ctx);
                break;
            case RULE_cics_set_file:
                checkFile((CICSParser.Cics_set_fileContext) ctx);
                break;
            case RULE_cics_set_host:
                checkHost((CICSParser.Cics_set_hostContext) ctx);
                break;
            case RULE_cics_set_ipconn:
                checkIpconn((CICSParser.Cics_set_ipconnContext) ctx);
                break;
            case RULE_cics_set_irc:
                checkIrc((CICSParser.Cics_set_ircContext) ctx);
                break;
            case RULE_cics_set_journalname:
                checkJournalname((CICSParser.Cics_set_journalnameContext) ctx);
                break;
            case RULE_cics_set_journalnum:
                checkJournalnum((CICSParser.Cics_set_journalnumContext) ctx);
                break;
            case RULE_cics_set_jvmendpoint:
                checkJvmendpoint((CICSParser.Cics_set_jvmendpointContext) ctx);
                break;
            case RULE_cics_set_jvmserver:
                checkJvmserver((CICSParser.Cics_set_jvmserverContext) ctx);
                break;
            case RULE_cics_set_library:
                checkLibrary((CICSParser.Cics_set_libraryContext) ctx);
                break;
            case RULE_cics_set_modename:
                checkModename((CICSParser.Cics_set_modenameContext) ctx);
                break;
            case RULE_cics_set_monitor:
                checkMonitor((CICSParser.Cics_set_monitorContext) ctx);
                break;
            case RULE_cics_set_mqconn:
                checkMqconn((CICSParser.Cics_set_mqconnContext) ctx);
                break;
            case RULE_cics_set_mqmonitor:
                checkMqmonitor((CICSParser.Cics_set_mqmonitorContext) ctx);
                break;
            case RULE_cics_set_netname:
                checkNetname((CICSParser.Cics_set_netnameContext) ctx);
                break;
            case RULE_cics_set_pipeline:
                checkPipeline((CICSParser.Cics_set_pipelineContext) ctx);
                break;
            case RULE_cics_set_processtype:
                checkProcesstype((CICSParser.Cics_set_processtypeContext) ctx);
                break;
            case RULE_cics_set_program:
                checkProgram((CICSParser.Cics_set_programContext) ctx);
                break;
            case RULE_cics_set_secdiscovery:
                checkSecdiscovery((CICSParser.Cics_set_secdiscoveryContext) ctx);
                break;
            case RULE_cics_set_secrecording:
                checkSecrecording((CICSParser.Cics_set_secrecordingContext) ctx);
                break;
            case RULE_cics_set_statistics:
                checkStatistics((CICSParser.Cics_set_statisticsContext) ctx);
                break;
            case RULE_cics_set_sysdumpcode:
                checkSysdumpcode((CICSParser.Cics_set_sysdumpcodeContext) ctx);
                break;
            case RULE_cics_set_system:
                checkSystem((CICSParser.Cics_set_systemContext) ctx);
                break;
            case RULE_cics_set_tags_refresh:
                checkTagsRefresh((CICSParser.Cics_set_tags_refreshContext) ctx);
                break;
            case RULE_cics_set_task:
                checkTask((CICSParser.Cics_set_taskContext) ctx);
                break;
            case RULE_cics_set_tclass:
                checkTclass((CICSParser.Cics_set_tclassContext) ctx);
                break;
            case RULE_cics_set_tcpip:
                checkTcpip((CICSParser.Cics_set_tcpipContext) ctx);
                break;
            case RULE_cics_set_tcpipservice:
                checkTcpipservice((CICSParser.Cics_set_tcpipserviceContext) ctx);
                break;
            case RULE_cics_set_tdqueue:
                checkTdqueue((CICSParser.Cics_set_tdqueueContext) ctx);
                break;
            case RULE_cics_set_tempstorage:
                checkTempstorage((CICSParser.Cics_set_tempstorageContext) ctx);
                break;
            case RULE_cics_set_terminal:
                checkTerminal((CICSParser.Cics_set_terminalContext) ctx);
                break;
            case RULE_cics_set_tracedest:
                checkTracedest((CICSParser.Cics_set_tracedestContext) ctx);
                break;
            case RULE_cics_set_traceflag:
                checkTraceflag((CICSParser.Cics_set_traceflagContext) ctx);
                break;
            case RULE_cics_set_tracetype:
                checkTracetype((CICSParser.Cics_set_tracetypeContext) ctx);
                break;
            case RULE_cics_set_tranclass:
                checkTranclass((CICSParser.Cics_set_tranclassContext) ctx);
                break;
            case RULE_cics_set_trandumpcode:
                checkTrandumpcode((CICSParser.Cics_set_trandumpcodeContext) ctx);
                break;
            case RULE_cics_set_transaction:
                checkTransaction((CICSParser.Cics_set_transactionContext) ctx);
                break;
            case RULE_cics_set_tsqueue:
                checkTsqueue((CICSParser.Cics_set_tsqueueContext) ctx);
                break;
            case RULE_cics_set_uow:
                checkUow((CICSParser.Cics_set_uowContext) ctx);
                break;
            case RULE_cics_set_uowlink:
                checkUowlink((CICSParser.Cics_set_uowlinkContext) ctx);
                break;
            case RULE_cics_set_urimap:
                checkUrimap((CICSParser.Cics_set_urimapContext) ctx);
                break;
            case RULE_cics_set_volume:
                checkVolume((CICSParser.Cics_set_volumeContext) ctx);
                break;
            case RULE_cics_set_vtam:
                checkVtam((CICSParser.Cics_set_vtamContext) ctx);
                break;
            case RULE_cics_set_web:
                checkWeb((CICSParser.Cics_set_webContext) ctx);
                break;
            case RULE_cics_set_webservice:
                checkWebservice((CICSParser.Cics_set_webserviceContext) ctx);
                break;
            case RULE_cics_set_wlmhealth:
                checkWlmhealth((CICSParser.Cics_set_wlmhealthContext) ctx);
                break;
            case RULE_cics_set_xmltransform:
                checkXmltransform((CICSParser.Cics_set_xmltransformContext) ctx);
                break;
            default:
                break;
        }
        checkDuplicates(ctx);
    }

    // Helper Functions
    private void checkAssociationUsercorrdata(CICSParser.Cics_set_association_usercorrdataContext ctx) {
        checkPrerequisiteIsMet(ctx.ASSOCIATION(), ctx.USERCORRDATA(), ctx, "ASSOCIATION");
    }

    private void checkAtomservice(CICSParser.Cics_set_atomserviceContext ctx) {
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkAutoinstall(CICSParser.Cics_set_autoinstallContext ctx) {
        // No checks needed
    }

    private void checkBrfacility(CICSParser.Cics_set_brfacilityContext ctx) {
        checkMutuallyExclusiveOptions("TERMSTATUS or RELEASED", ctx.TERMSTATUS(), ctx.RELEASED());
    }

    private void checkBundle(CICSParser.Cics_set_bundleContext ctx) {
        checkMutuallyExclusiveOptions("AVAILSTATUS, AVAILABLE, UNAVAILABLE, ENABLESTATUS, ENABLED, DISABLED, COPY or PHASEIN", ctx.AVAILSTATUS(), ctx.AVAILABLE(), ctx.UNAVAILABLE(), ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED(), ctx.COPY(), ctx.PHASEIN());
    }

    private void checkConnection(CICSParser.Cics_set_connectionContext ctx) {
        checkMutuallyExclusiveOptions("ACQSTATUS, CONNSTATUS, ACQUIRED or RELEASED", ctx.ACQSTATUS(), ctx.CONNSTATUS(), ctx.ACQUIRED(), ctx.RELEASED());
        checkMutuallyExclusiveOptions("AFFINITY or ENDAFFINITY", ctx.AFFINITY(), ctx.ENDAFFINITY());
        checkMutuallyExclusiveOptions("EXITTRACING, EXITTRACE or NOEXITTRACE", ctx.EXITTRACING(), ctx.EXITTRACE(), ctx.NOEXITTRACE());
        checkMutuallyExclusiveOptions("PENDSTATUS or NOTPENDING", ctx.PENDSTATUS(), ctx.NOTPENDING());
        checkMutuallyExclusiveOptions("PURGETYPE, CANCEL, FORCECANCEL, FORCEPURGE, KILL or PURGE", ctx.PURGETYPE(), ctx.CANCEL(), ctx.FORCECANCEL(), ctx.FORCEPURGE(), ctx.KILL(), ctx.PURGE());
        checkMutuallyExclusiveOptions("RECOVSTATUS or NORECOVDATA", ctx.RECOVSTATUS(), ctx.NORECOVDATA());
        checkMutuallyExclusiveOptions("SERVSTATUS, INSERVICE or OUTSERVICE", ctx.SERVSTATUS(), ctx.INSERVICE(), ctx.OUTSERVICE());
        checkMutuallyExclusiveOptions("UOWACTION, BACKOUT, COMMIT, FORCEUOW or RESYNC", ctx.UOWACTION(), ctx.BACKOUT(), ctx.COMMIT(), ctx.FORCEUOW(), ctx.RESYNC());
        checkMutuallyExclusiveOptions("ZCPTRACING, NOZCPTRACE or ZCPTRACE", ctx.ZCPTRACING(), ctx.NOZCPTRACE(), ctx.ZCPTRACE());
    }

    private void checkDb2conn(CICSParser.Cics_set_db2connContext ctx) {
        checkMutuallyExclusiveOptions("ACCOUNTREC, UOW, TASK, TXID or NONE", ctx.ACCOUNTREC(), ctx.UOW(), ctx.TASK(), ctx.TXID(), ctx.NONE());
        checkMutuallyExclusiveOptions("AUTHTYPE, GROUP, SIGN, TERM, TX, OPID or USERID", ctx.AUTHTYPE(), ctx.GROUP(), ctx.SIGN(), ctx.TERM(), ctx.TX(), ctx.OPID(), ctx.USERID());
        checkMutuallyExclusiveOptions("BUSY, WAIT, NOWAIT or FORCE", ctx.BUSY(), ctx.WAIT(), ctx.NOWAIT(), ctx.FORCE());
        checkMutuallyExclusiveOptions("COMAUTHTYPE, CGROUP, CSIGN, CTERM, CTX, COPID or CUSERID", ctx.COMAUTHTYPE(), ctx.CGROUP(), ctx.CSIGN(), ctx.CTERM(), ctx.CTX(), ctx.COPID(), ctx.CUSERID());
        checkMutuallyExclusiveOptions("CONNECTERROR, ABEND or SQLCODE", ctx.CONNECTERROR(), ctx.ABEND(), ctx.SQLCODE());
        checkMutuallyExclusiveOptions("CONNECTST, CONNECTED or NOTCONNECTED", ctx.CONNECTST(), ctx.CONNECTED(), ctx.NOTCONNECTED());
        checkMutuallyExclusiveOptions("NONTERMREL, RELEASE or NORELEASE", ctx.NONTERMREL(), ctx.RELEASE(), ctx.NORELEASE());
        checkMutuallyExclusiveOptions("PRIORITY, HIGH, EQUAL or LOW", ctx.PRIORITY(), ctx.HIGH(), ctx.EQUAL(), ctx.LOW());
        checkMutuallyExclusiveOptions("RESYNCMEMBER, RESYNC or NORESYNC", ctx.RESYNCMEMBER(), ctx.RESYNC(), ctx.NORESYNC());
        checkMutuallyExclusiveOptions("STANDBYMODE, NOCONNECT, CONNECT or RECONNECT", ctx.STANDBYMODE(), ctx.NOCONNECT(), ctx.CONNECT(), ctx.RECONNECT());
        checkMutuallyExclusiveOptions("THREADWAIT, TWAIT or NOTWAIT", ctx.THREADWAIT(), ctx.TWAIT(), ctx.NOTWAIT());
    }

    private void checkDb2entry(CICSParser.Cics_set_db2entryContext ctx) {
        checkMutuallyExclusiveOptions("ACCOUNTREC, UOW, TASK, TXID or NONE", ctx.ACCOUNTREC(), ctx.UOW(), ctx.TASK(), ctx.TXID(), ctx.NONE());
        checkMutuallyExclusiveOptions("AUTHTYPE, GROUP, SIGN, TERM, TX, OPID or USERID", ctx.AUTHTYPE(), ctx.GROUP(), ctx.SIGN(), ctx.TERM(), ctx.TX(), ctx.OPID(), ctx.USERID());
        checkMutuallyExclusiveOptions("BUSY, WAIT, NOWAIT or FORCE", ctx.BUSY(), ctx.WAIT(), ctx.NOWAIT(), ctx.FORCE());
        checkMutuallyExclusiveOptions("DISABLEDACT, ABEND, SQLCODE or POOL", ctx.DISABLEDACT(), ctx.ABEND(), ctx.SQLCODE(), ctx.POOL());
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
        checkMutuallyExclusiveOptions("PRIORITY, HIGH, EQUAL or LOW", ctx.PRIORITY(), ctx.HIGH(), ctx.EQUAL(), ctx.LOW());
        checkMutuallyExclusiveOptions("SHARELOCKS, YES or NO", ctx.SHARELOCKS(), ctx.YES(), ctx.NO());
        checkMutuallyExclusiveOptions("THREADWAIT, TWAIT, NOTWAIT or TPOOL", ctx.THREADWAIT(), ctx.TWAIT(), ctx.NOTWAIT(), ctx.TPOOL());
    }

    private void checkDb2tran(CICSParser.Cics_set_db2tranContext ctx) {}

    private void checkDeletshipped(CICSParser.Cics_set_deletshippedContext ctx) {
        checkMutuallyExclusiveOptions("IDLE or IDLEHRS", ctx.IDLE(), ctx.IDLEHRS());
        checkMutuallyExclusiveOptions("IDLE or IDLEMINS", ctx.IDLE(), ctx.IDLEMINS());
        checkMutuallyExclusiveOptions("IDLE or IDLESECS", ctx.IDLE(), ctx.IDLESECS());

        checkMutuallyExclusiveOptions("INTERVAL or INTERVALHRS", ctx.INTERVAL(), ctx.INTERVALHRS());
        checkMutuallyExclusiveOptions("INTERVAL or INTERVALMINS", ctx.INTERVAL(), ctx.INTERVALMINS());
        checkMutuallyExclusiveOptions("INTERVAL or INTERVALSECS", ctx.INTERVAL(), ctx.INTERVALSECS());
    }

    private void checkDispatcher(CICSParser.Cics_set_dispatcherContext ctx) {}

    private void checkDoctemplate(CICSParser.Cics_set_doctemplateContext ctx) {
        checkForExactlyOne("COPY or NEWCOPY", ctx, ctx.COPY(), ctx.NEWCOPY());
    }

    private void checkDsname(CICSParser.Cics_set_dsnameContext ctx) {
        checkMutuallyExclusiveOptions("ACTION, REMOVE, RECOVERED, RESETLOCKS or RETRY", ctx.ACTION(), ctx.REMOVE(), ctx.RECOVERED(), ctx.RESETLOCKS(), ctx.RETRY());
        checkMutuallyExclusiveOptions("AVAILABILITY, AVAILABLE, RREPL or UNAVAILABLE", ctx.AVAILABILITY(), ctx.AVAILABLE(), ctx.RREPL(), ctx.UNAVAILABLE());
        checkMutuallyExclusiveOptions("QUESCESTATE, QUIESCED, IMMQUIESCED or UNQUIESCED", ctx.QUESCESTATE(), ctx.QUIESCED(), ctx.IMMQUIESCED(), ctx.UNQUIESCED());
        checkMutuallyExclusiveOptions("WAIT, BUSY or NOWAIT", ctx.WAIT(), ctx.BUSY(), ctx.NOWAIT());
        checkMutuallyExclusiveOptions("UOWACTION, BACKOUT, COMMIT or FORCE", ctx.UOWACTION(), ctx.BACKOUT(), ctx.COMMIT(), ctx.FORCE());
    }

    private void checkDumpds(CICSParser.Cics_set_dumpdsContext ctx) {
        checkMutuallyExclusiveOptions("OPENSTATUS, CLOSED, OPEN or SWITCH", ctx.OPENSTATUS(), ctx.CLOSED(), ctx.OPEN(), ctx.SWITCH());
        checkMutuallyExclusiveOptions("SWITCHSTATUS, NOSWITCH, SWITCHNEXT or SWITCHALL", ctx.SWITCHSTATUS(), ctx.NOSWITCH(), ctx.SWITCHNEXT(), ctx.SWITCHALL());
    }

    private void checkEnqmodel(CICSParser.Cics_set_enqmodelContext ctx) {
        checkForExactlyOne("STATUS, ENABLED or DISABLED", ctx, ctx.STATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkEpadapter(CICSParser.Cics_set_epadapterContext ctx) {
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkEpadapterset(CICSParser.Cics_set_epadaptersetContext ctx) {}

    private void checkEventbinding(CICSParser.Cics_set_eventbindingContext ctx) {
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkEventprocess(CICSParser.Cics_set_eventprocessContext ctx) {
        checkForExactlyOne("EPSTATUS, STARTED, DRAIN or STOPPED", ctx, ctx.EPSTATUS(), ctx.STARTED(), ctx.DRAIN(), ctx.STOPPED());
    }

    private void checkFile(CICSParser.Cics_set_fileContext ctx) {
        checkMutuallyExclusiveOptions("ADD, ADDABLE or NOTADDABLE", ctx.ADD(), ctx.ADDABLE(), ctx.NOTADDBALE());
        checkMutuallyExclusiveOptions("BROWSE, BROWSABLE or NOTBROWSABLE", ctx.BROWSE(), ctx.BROWSABLE(), ctx.NOTBROWSABLE());
        checkMutuallyExclusiveOptions("BUSY, WAIT, FORCE or NOWAIT", ctx.BUSY(), ctx.WAIT(), ctx.FORCE(), ctx.NOWAIT());
        checkMutuallyExclusiveOptions("DELETE, DELETABLE or NOTDELETABLE", ctx.DELETE(), ctx.DELETABLE(), ctx.NOTDELETABLE());
        checkMutuallyExclusiveOptions("DISPOSITION, OLD or SHARE", ctx.DISPOSITION(), ctx.OLD(), ctx.SHARE());
        checkMutuallyExclusiveOptions("DSNAME or OBJECTNAME", ctx.DSNAME(), ctx.OBJECTNAME());
        checkMutuallyExclusiveOptions("EMPTYSTATUS, EMPTY, EMPTYREQ or NOEMPTYREQ", ctx.EMPTYSTATUS(), ctx.EMPTY(), ctx.EMPTYREQ(), ctx.NOEMPTYREQ());
        checkMutuallyExclusiveOptions("EXCLUSIVE, EXCTL or NOEXCTL", ctx.EXCLUSIVE(), ctx.EXCTL(), ctx.NOEXCTL());
        checkMutuallyExclusiveOptions("LOADTYPE, LOAD or NOLOAD", ctx.LOADTYPE(), ctx.LOAD(), ctx.NOLOAD());
        checkMutuallyExclusiveOptions("READ, READABLE or NOTREADABLE", ctx.READ(), ctx.READABLE(), ctx.NOTREADABLE());
        checkMutuallyExclusiveOptions("READINTEG, UNCOMMITTED, CONSISTENT or REPEATABLE", ctx.READINTEG(), ctx.UNCOMMITTED(), ctx.CONSISTENT(), ctx.REPEATABLE());
        checkMutuallyExclusiveOptions("RLSACCESS, RLS or NOTRLS", ctx.RLSACCESS(), ctx.RLS(), ctx.NOTRLS());
        checkMutuallyExclusiveOptions("TABLE, CFTABLE, CICSTABLE, NOTTABLE or USERTABLE", ctx.TABLE(), ctx.CFTABLE(), ctx.CICSTABLE(), ctx.NOTTABLE(), ctx.USERTABLE());
        checkMutuallyExclusiveOptions("UPDATE, UPDATABLE or NOTUPDATABLE", ctx.UPDATE(), ctx.UPDATABLE(), ctx.NOTUPDATABLE());
        checkMutuallyExclusiveOptions("UPDATEMODEL, CONTENTION or LOCKING", ctx.UPDATEMODEL(), ctx.CONTENTION(), ctx.LOCKING());
    }

    private void checkHost(CICSParser.Cics_set_hostContext ctx) {}

    private void checkIpconn(CICSParser.Cics_set_ipconnContext ctx) {
        checkMutuallyExclusiveOptions("CONNSTATUS, ACQUIRED or RELEASED", ctx.CONNSTATUS(), ctx.ACQUIRED(), ctx.RELEASED());
        checkMutuallyExclusiveOptions("PENDSTATUS or NOTPENDING", ctx.PENDSTATUS(), ctx.NOTPENDING());
        checkMutuallyExclusiveOptions("PURGETYPE, CANCEL, FORCECANCEL, FORCEPURGE, KILL or PURGE", ctx.PURGETYPE(), ctx.CANCEL(), ctx.FORCECANCEL(), ctx.FORCEPURGE(), ctx.KILL(), ctx.PURGE());
        checkMutuallyExclusiveOptions("RECOVSTATUS or NORECOVDATA", ctx.RECOVSTATUS(), ctx.NORECOVDATA());
        checkMutuallyExclusiveOptions("SERVSTATUS, INSERVICE or OUTSERVICE", ctx.SERVSTATUS(), ctx.INSERVICE(), ctx.OUTSERVICE());
        checkMutuallyExclusiveOptions("UOWACTION, BACKOUT, COMMIT, FORCEUOW or RESYNC", ctx.UOWACTION(), ctx.BACKOUT(), ctx.COMMIT(), ctx.FORCEUOW(), ctx.RESYNC());
    }

    private void checkIrc(CICSParser.Cics_set_ircContext ctx) {
        checkMutuallyExclusiveOptions("OPENSTATUS, CLOSED, IMMCLOSE or OPEN", ctx.OPENSTATUS(), ctx.CLOSED(), ctx.IMMCLOSE(), ctx.OPEN());
    }

    private void checkJournalname(CICSParser.Cics_set_journalnameContext ctx) {
        checkForExactlyOne("ACTION, FLUSH or RESET", ctx, ctx.ACTION(), ctx.FLUSH(), ctx.RESET());
        checkForExactlyOne("STATUS, DISABLED or ENABLED", ctx, ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
    }

    private void checkJournalnum(CICSParser.Cics_set_journalnumContext ctx) {
        checkHasObsoleteOptions(ctx.JOURNALNUM(), "JOURNALNUM. Replace with JOURNALNAME.");
        checkForExactlyOne("ACTION, FLUSH or RESET", ctx, ctx.ACTION(), ctx.FLUSH(), ctx.RESET());
        checkForExactlyOne("STATUS, DISABLED or ENABLED", ctx, ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
    }

    private void checkJvmendpoint(CICSParser.Cics_set_jvmendpointContext ctx) {
        checkHasMandatoryOptions(ctx.JVMSERVER(), ctx, "JVMSERVER");
        checkForExactlyOne("ENABLESTATUS, ENABLED or DISABLED", ctx, ctx.ENABLESTATUS(), ctx.DISABLED(), ctx.ENABLED());
    }

    private void checkJvmserver(CICSParser.Cics_set_jvmserverContext ctx) {
        checkMutuallyExclusiveOptions("PHASEOUT, PURGETYPE, PURGE, FORCEPURGE or KILL", ctx.PHASEOUT(), ctx.PURGETYPE(), ctx.PURGE(), ctx.FORCEPURGE(), ctx.KILL());
        checkForExactlyOne("ENABLESTATUS, ENABLED or DISABLED", ctx, ctx.ENABLESTATUS(), ctx.DISABLED(), ctx.ENABLED());
    }

    private void checkLibrary(CICSParser.Cics_set_libraryContext ctx) {
        checkMutuallyExclusiveOptions("CRITICALST, CRITICAL or NONCRITICAL", ctx.CRITICALST(), ctx.CRITICAL(), ctx.NONCRITICAL());
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkModename(CICSParser.Cics_set_modenameContext ctx) {
        checkHasMandatoryOptions(ctx.CONNECTION(), ctx, "CONNECTION");
        checkPrerequisiteIsMet(ctx.AVAILABLE(), ctx.ACQUIRED(), ctx, "ACQUIRED without AVAILABLE");
        checkMutuallyExclusiveOptions("ACQSTATUS or ACQUIRED", ctx.ACQSTATUS(), ctx.ACQUIRED());
        checkMutuallyExclusiveOptions("ACQSTATUS or CLOSED", ctx.ACQSTATUS(), ctx.CLOSED());
    }

    private void checkMonitor(CICSParser.Cics_set_monitorContext ctx) {
        checkMutuallyExclusiveOptions("COMPRESSST, COMPRESS or NOCOMPRESS", ctx.COMPRESSST(), ctx.COMPRESS(), ctx.NOCOMPRESS());
        checkMutuallyExclusiveOptions("CONVERSEST, CONVERSE or NOCONVERSE", ctx.CONVERSEST(), ctx.CONVERSE(), ctx.NOCONVERSE());
        checkMutuallyExclusiveOptions("EXCEPTCLASS, EXCEPT or NOEXCEPT", ctx.EXCEPTCLASS(), ctx.EXCEPT(), ctx.NOEXCEPT());
        checkMutuallyExclusiveOptions("FREQUENCY or FREQUENCYHRS", ctx.FREQUENCY(), ctx.FREQUENCYHRS());
        checkMutuallyExclusiveOptions("FREQUENCY or FREQUENCYMIN", ctx.FREQUENCY(), ctx.FREQUENCYMIN());
        checkMutuallyExclusiveOptions("FREQUENCY or FREQUENCYSEC", ctx.FREQUENCY(), ctx.FREQUENCYSEC());
        checkMutuallyExclusiveOptions("IDNTYCLASS, IDNTY or NOIDNTY", ctx.IDNTYCLASS(), ctx.IDNTY(), ctx.NOIDNTY());
        checkMutuallyExclusiveOptions("PERFCLASS, PERF or NOPERF", ctx.PERFCLASS(), ctx.PERF(), ctx.NOPERF());
        checkMutuallyExclusiveOptions("RESRCECLASS, RESRCE or NORESRCE", ctx.RESRCECLASS(), ctx.RESRCE(), ctx.NORESRCE());
        checkMutuallyExclusiveOptions("STATUS, ON or OFF", ctx.STATUS(), ctx.ON(), ctx.OFF());
        checkMutuallyExclusiveOptions("SYNCPOINTST, SYNCPOINT or NOSYNCPOINT", ctx.SYNCPOINTST(), ctx.SYNCPOINT(), ctx.NOSYNCPOINT());
    }

    private void checkMqconn(CICSParser.Cics_set_mqconnContext ctx) {
        if (ctx.WAIT() != null || ctx.BUSY() != null || ctx.NOWAIT() != null || ctx.FORCE() != null)
            checkForExactlyOne("CONNECTST, CONNECTED or NOTCONNECTED", ctx, ctx.CONNECTST(), ctx.CONNECTED(), ctx.NOTCONNECTED());

        checkMutuallyExclusiveOptions("WAIT, BUSY, NOWAIT or FORCE", ctx.WAIT(), ctx.BUSY(), ctx.NOWAIT(), ctx.FORCE());
        checkMutuallyExclusiveOptions("CONNECTST, CONNECTED or NOTCONNECTED", ctx.CONNECTST(), ctx.CONNECTED(), ctx.NOTCONNECTED());
        checkMutuallyExclusiveOptions("RESYNCMEMBER, RESYNC, NORESYNC or GROUPRESYNC", ctx.RESYNCMEMBER(), ctx.RESYNC(), ctx.NORESYNC(), ctx.GROUPRESYNC());
    }

    private void checkMqmonitor(CICSParser.Cics_set_mqmonitorContext ctx) {
        checkMutuallyExclusiveOptions("AUTOSTATUS, AUTOSTART or NOAUTOSTART", ctx.AUTOSTATUS(), ctx.AUTOSTART(), ctx.NOAUTOSTART());

        if (ctx.AUTOSTATUS() != null || ctx.AUTOSTART() != null ||  ctx.NOAUTOSTART() != null) {
            checkForExactlyOne("ENABLESTATUS, ENABLED or DISABLED", ctx, ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
            checkForExactlyOne("MONSTATUS, STARTED or STOPPED", ctx, ctx.MONSTATUS(), ctx.STARTED(), ctx.STOPPED());
        }
    }

    private void checkNetname(CICSParser.Cics_set_netnameContext ctx) {
        checkMutuallyExclusiveOptions("EXITTRACING, EXITTRACE or NOEXITTRACE", ctx.EXITTRACING(), ctx.EXITTRACE(), ctx.NOEXITTRACE());
    }

    private void checkPipeline(CICSParser.Cics_set_pipelineContext ctx) {
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkProcesstype(CICSParser.Cics_set_processtypeContext ctx) {
        checkMutuallyExclusiveOptions("STATUS, DISABLED or ENABLED", ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
        checkMutuallyExclusiveOptions("AUDITLEVEL, ACTIVITY, FULL, OFF or PROCESS", ctx.AUDITLEVEL(), ctx.ACTIVITY(), ctx.FULL(), ctx.OFF(), ctx.PROCESS());
    }

    private void checkProgram(CICSParser.Cics_set_programContext ctx) {
        checkMutuallyExclusiveOptions("CEDFSTATUS, CEDF or NOCEDF", ctx.CEDFSTATUS(), ctx.CEDF(), ctx.NOCEDF());
        checkMutuallyExclusiveOptions("COPY, NEWCOPY or PHASEIN", ctx.COPY(), ctx.NEWCOPY(), ctx.PHASEIN());
        checkMutuallyExclusiveOptions("EXECUTIONSET, DPLSUBSET or FULLAPI", ctx.EXECUTIONSET(), ctx.DPLSUBSET(), ctx.FULLAPI());
        checkMutuallyExclusiveOptions("REPLICATION, REPLICATOR or NOREPLICATOR", ctx.REPLICATION(), ctx.REPLICATOR(), ctx.NOREPLICATOR());
        checkMutuallyExclusiveOptions("RUNTIME, JVM or NOJVM", ctx.RUNTIME(), ctx.JVM(), ctx.NOJVM());
        checkMutuallyExclusiveOptions("SHARESTATUS, PRIVATE or SHARED", ctx.SHARESTATUS(), ctx.PRIVATE(), ctx.SHARED());
        checkMutuallyExclusiveOptions("STATUS, DISABLED or ENABLED", ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
    }

    private void checkSecdiscovery(CICSParser.Cics_set_secdiscoveryContext ctx) {
        checkMutuallyExclusiveOptions("ON, OFF or STATUS", ctx.ON(), ctx.OFF(), ctx.STATUS());

        checkMutuallyExclusiveOptions("CMD or DISCOVERALL", ctx.CMD(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("DB2 or DISCOVERALL", ctx.DB2(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("DCT or DISCOVERALL", ctx.DCT(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("FCT or DISCOVERALL", ctx.FCT(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("HFS or DISCOVERALL", ctx.HFS(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("JCT or DISCOVERALL", ctx.JCT(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("PCT or DISCOVERALL", ctx.PCT(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("PPT or DISCOVERALL", ctx.PPT(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("PSB or DISCOVERALL", ctx.PSB(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("RES or DISCOVERALL", ctx.RES(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("TST or DISCOVERALL", ctx.TST(), ctx.DISCOVERALL());
        checkMutuallyExclusiveOptions("USER or DISCOVERALL", ctx.USER(), ctx.DISCOVERALL());
    }

    private void checkSecrecording(CICSParser.Cics_set_secrecordingContext ctx) {
        checkPrerequisiteIsMet(ctx.ADD(), ctx.MAXIMUM(), ctx, "MAXIMUM without ADD");

        checkMutuallyExclusiveOptions("ACTION, ADD MAXIMUM, MODIFY or REMOVE", ctx.ACTION(), ctx.ADD(), ctx.MODIFY(), ctx.REMOVE());
        checkMutuallyExclusiveOptions("ODADPTRID, ODADPTRDATA1, ODADPTRDATA2, ODADPTRDATA3, ODAPPLID, ODCLNTIPADDR, ODCLNTPORT, ODFACILNAME, ODFACILTYPE, ODIPFAMILY, ODLUNAME, ODNETID, ODNETWORKID, ODSERVERPORT, ODTCPIPS, ODTRANSID or ODUSERID",
                ctx.ODADPTRID(), ctx.ODADPTRDATA1(), ctx.ODADPTRDATA2(), ctx.ODADPTRDATA3(), ctx.ODAPPLID(), ctx.ODCLNTIPADDR(), ctx.ODCLNTPORT(), ctx.ODFACILNAME(), ctx.ODFACILTYPE(), ctx.ODIPFAMILY(), ctx.ODLUNAME(), ctx.ODNETID(),
                ctx.ODNETWORKID(), ctx.ODSERVERPORT(), ctx.ODTCPIPS(), ctx.ODTRANSID(), ctx.ODUSERID());
    }

    private void checkStatistics(CICSParser.Cics_set_statisticsContext ctx) {
        checkMutuallyExclusiveOptions("ENDOFDAY or ENDOFDAYHRS", ctx.ENDOFDAY(), ctx.ENDOFDAYHRS());
        checkMutuallyExclusiveOptions("ENDOFDAY or ENDOFDAYMINS", ctx.ENDOFDAY(), ctx.ENDOFDAYMINS());
        checkMutuallyExclusiveOptions("ENDOFDAY or ENDOFDAYSECS", ctx.ENDOFDAY(), ctx.ENDOFDAYSECS());

        checkMutuallyExclusiveOptions("INTERVAL or INTERVALHRS", ctx.INTERVAL(), ctx.INTERVALHRS());
        checkMutuallyExclusiveOptions("INTERVAL or INTERVALMINS", ctx.INTERVAL(), ctx.INTERVALMINS());
        checkMutuallyExclusiveOptions("INTERVAL or INTERVALSECS", ctx.INTERVAL(), ctx.INTERVALSECS());

        checkMutuallyExclusiveOptions("RECORDING, ON or OFF", ctx.RECORDING(), ctx.ON(), ctx.OFF());
        if (ctx.RECORDNOW() != null || ctx.RESETNOW() != null) {
            checkForExactlyOne("RECORDING, ON or OFF", ctx, ctx.RECORDING(), ctx.ON(), ctx.OFF());
        }
    }

    private void checkSysdumpcode(CICSParser.Cics_set_sysdumpcodeContext ctx) {
        checkMutuallyExclusiveOptions("ACTION, ADD, REMOVE or RESET", ctx.ACTION(), ctx.ADD(), ctx.REMOVE(), ctx.RESET());
        checkMutuallyExclusiveOptions("DAEOPTION, DAE or NODAE", ctx.DAEOPTION(), ctx.DAE(), ctx.NODAE());
        checkMutuallyExclusiveOptions("DUMPSCOPE, LOCAL or RELATED", ctx.DUMPSCOPE(), ctx.LOCAL(), ctx.RELATED());
        checkMutuallyExclusiveOptions("SHUTOPTION, NOSHUTDOWN or SHUTDOWN", ctx.SHUTOPTION(), ctx.NOSHUTDOWN(), ctx.SHUTDOWN());
        checkMutuallyExclusiveOptions("SYSDUMPING, NOSYSDUMP or SYSDUMP", ctx.SYSDUMPING(), ctx.NOSYSDUMP(), ctx.SYSDUMP());
    }

    private void checkSystem(CICSParser.Cics_set_systemContext ctx) {
        // No checks due to repeat nature.
    }

    private void checkTagsRefresh(CICSParser.Cics_set_tags_refreshContext ctx) {
        checkHasMandatoryOptions(ctx.REFRESH(), ctx, "REFRESH");
    }

    private void checkTask(CICSParser.Cics_set_taskContext ctx) {
        checkMutuallyExclusiveOptions("PURGETYPE, FORCEPURGE, KILL or PURGE", ctx.PURGETYPE(), ctx.FORCEPURGE(), ctx.KILL(), ctx.PURGE());
        checkMutuallyExclusiveOptions("SRRSTATUS, SRRACTIVE or SRRINACTIVE", ctx.SRRSTATUS(), ctx.SRRACTIVE(), ctx.SRRINACTIVE());
    }

    private void checkTclass(CICSParser.Cics_set_tclassContext ctx) {
        // No checks needed
    }

    private void checkTcpip(CICSParser.Cics_set_tcpipContext ctx) {
        checkHasMandatoryOptions(ctx.MAXSOCKETS(), ctx, "MAXSOCKETS");
        checkHasMandatoryOptions(ctx.NEWMAXSOCKET(), ctx, "NEWMAXSOCKET");
        checkMutuallyExclusiveOptions("OPENSTATUS, CLOSED, IMMCLOSE or OPEN", ctx.OPENSTATUS(), ctx.CLOSED(), ctx.IMMCLOSE(), ctx.OPEN());
    }

    private void checkTcpipservice(CICSParser.Cics_set_tcpipserviceContext ctx) {
        checkHasMandatoryOptions(ctx.BACKLOG(), ctx, "BACKLOG");
        checkHasMandatoryOptions(ctx.MAXDATALEN(), ctx, "MAXDATALEN");
        checkMutuallyExclusiveOptions("OPENSTATUS, CLOSED, IMMCLOSE or OPEN", ctx.OPENSTATUS(), ctx.CLOSED(), ctx.IMMCLOSE(), ctx.OPEN());
    }

    private void checkTdqueue(CICSParser.Cics_set_tdqueueContext ctx) {
        checkMutuallyExclusiveOptions("ATIFACILITY, NOTERMINAL or TERMINAL", ctx.ATIFACILITY(), ctx.NOTERMINAL(), ctx.TERMINAL());
        checkMutuallyExclusiveOptions("ENABLESTATUS, DISABLED or ENABLED", ctx.ENABLESTATUS(), ctx.DISABLED(), ctx.ENABLED());
        checkMutuallyExclusiveOptions("OPENSTATUS, CLOSED or OPEN", ctx.OPENSTATUS(), ctx.CLOSED(), ctx.OPEN());
    }

    private void checkTempstorage(CICSParser.Cics_set_tempstorageContext ctx) {
        checkHasMandatoryOptions(ctx.TSMAINLIMIT(), ctx, "TSMAINLIMIT");
    }

    private void checkTerminal(CICSParser.Cics_set_terminalContext ctx) {
        checkMutuallyExclusiveOptions("ACQSTATUS, TERMSTATUS, ACQUIRED, COLDACQ or RELEASED", ctx.ACQSTATUS(), ctx.TERMSTATUS(), ctx.ACQUIRED(), ctx.COLDACQ(), ctx.RELEASED());
        checkMutuallyExclusiveOptions("ALTPRTCOPYST, ALTPRTCOPY or NOALTPRTCOPY", ctx.ALTPRTCOPYST(), ctx.ALTPRTCOPY(), ctx.NOALTPRTCOPY());
        checkMutuallyExclusiveOptions("ATISTATUS, ATI or NOATI", ctx.ATISTATUS(), ctx.ATI(), ctx.NOATI());
        checkMutuallyExclusiveOptions("CREATESESS, CREATE or NOCREATE", ctx.CREATESESS(), ctx.CREATE(), ctx.NOCREATE());
        checkMutuallyExclusiveOptions("DISCREQST, DISCREQ or NODISCREQ", ctx.DISCREQST(), ctx.DISCREQ(), ctx.NODISCREQ());
        checkMutuallyExclusiveOptions("EXITTRACING, EXITTRACE or NOEXITTRACE", ctx.EXITTRACING(), ctx.EXITTRACE(), ctx.NOEXITTRACE());
        checkMutuallyExclusiveOptions("OBFORMATST, OBFORMAT or NOOBFORMAT", ctx.OBFORMATST(), ctx.OBFORMAT(), ctx.NOOBFORMAT());
        checkMutuallyExclusiveOptions("PAGESTATUS, AUTOPAGEABLE or PAGEABLE", ctx.PAGESTATUS(), ctx.AUTOPAGEABLE(), ctx.PAGEABLE());
        checkMutuallyExclusiveOptions("PRTCOPYST, PRTCOPY or NOPRTCOPY", ctx.PRTCOPYST(), ctx.PRTCOPY(), ctx.NOPRTCOPY());
        checkMutuallyExclusiveOptions("PURGETYPE, FORCEPURGE, KILL, PURGEFORCE or CANCEL", ctx.PURGETYPE(), ctx.FORCEPURGE(), ctx.KILL(), ctx.PURGEFORCE(), ctx.CANCEL());
        checkPrerequisiteIsMet(ctx.PURGE(), ctx.FORCE(), ctx, "FORCE without PURGE");
        checkMutuallyExclusiveOptions("RELREQST, RELREQ or NORELREQ", ctx.RELREQST(), ctx.RELREQ(), ctx.NORELREQ());
        checkMutuallyExclusiveOptions("SERVSTATUS, INSERVICE or OUTSERVICE", ctx.SERVSTATUS(), ctx.INSERVICE(), ctx.OUTSERVICE());
        checkMutuallyExclusiveOptions("TRACING, SPECTRACE or STANTRACE", ctx.TRACING(), ctx.SPECTRACE(), ctx.STANTRACE());
        checkMutuallyExclusiveOptions("TTISTATUS, NOTTI or TTI", ctx.TTISTATUS(), ctx.NOTTI(), ctx.TTI());
        checkMutuallyExclusiveOptions("UCTRANST, UCTRAN, NOUCTRAN or TRANIDONLY", ctx.UCTRANST(), ctx.UCTRAN(), ctx.NOUCTRAN(), ctx.TRANIDONLY());
        checkMutuallyExclusiveOptions("ZCPTRACING, NOZCPTRACE or ZCPTRACE", ctx.ZCPTRACING(), ctx.NOZCPTRACE(), ctx.ZCPTRACE());
    }

    private void checkTracedest(CICSParser.Cics_set_tracedestContext ctx) {
        checkMutuallyExclusiveOptions("AUXSTATUS, AUXPAUSE, AUXSTART or AUXSTOP", ctx.AUXSTATUS(), ctx.AUXPAUSE(), ctx.AUXSTART(), ctx.AUXSTOP());
        checkMutuallyExclusiveOptions("GTFSTATUS, GTFSTART or GTFSTOP", ctx.GTFSTATUS(), ctx.GTFSTART(), ctx.GTFSTOP());
        checkMutuallyExclusiveOptions("INTSTATUS, INTSTART or INTSTOP", ctx.INTSTATUS(), ctx.INTSTART(), ctx.INTSTOP());
        checkMutuallyExclusiveOptions("SWITCHACTION or SWITCH", ctx.SWITCHACTION(), ctx.SWITCH());
        checkMutuallyExclusiveOptions("SWITCHSTATUS, NOSWITCH, SWITCHNEXT or SWITCHALL", ctx.SWITCHSTATUS(), ctx.NOSWITCH(), ctx.SWITCHNEXT(), ctx.SWITCHALL());
    }

    private void checkTraceflag(CICSParser.Cics_set_traceflagContext ctx) {
        checkMutuallyExclusiveOptions("SINGLESTATUS, SINGLEOFF or SINGLEON", ctx.SINGLESTATUS(), ctx.SINGLEOFF(), ctx.SINGLEON());
        checkMutuallyExclusiveOptions("SYSTEMSTATUS, SYSTEMOFF or SYSTEMON", ctx.SYSTEMSTATUS(), ctx.SYSTEMOFF(), ctx.SYSTEMON());
        checkMutuallyExclusiveOptions("TCEXITSTATUS, TCEXITALL, TCEXITALLOFF, TCEXITNONE or TCEXITSYSTEM", ctx.TCEXITSTATUS(), ctx.TCEXITALL(), ctx.TCEXITALLOFF(), ctx.TCEXITNONE(), ctx.TCEXITSYSTEM());
        checkMutuallyExclusiveOptions("USERSTATUS, USEROFF or USERON", ctx.USERSTATUS(), ctx.USEROFF(), ctx.USERON());
    }

    private void checkTracetype(CICSParser.Cics_set_tracetypeContext ctx) {
        checkForExactlyOne("FLAGSET, SPECIAL or STANDARD", ctx, ctx.FLAGSET(), ctx.SPECIAL(), ctx.STANDARD());
    }

    private void checkTranclass(CICSParser.Cics_set_tranclassContext ctx) {
        checkMutuallyExclusiveOptions("PURGEACTION, ABEND or DISCARD", ctx.PURGEACTION(), ctx.ABEND(), ctx.DISCARD());
    }

    private void checkTrandumpcode(CICSParser.Cics_set_trandumpcodeContext ctx) {
        checkMutuallyExclusiveOptions("ACTION, ADD, REMOVE or RESET", ctx.ACTION(), ctx.ADD(), ctx.REMOVE(), ctx.RESET());
        checkMutuallyExclusiveOptions("DUMPSCOPE, LOCAL or RELATED", ctx.DUMPSCOPE(), ctx.LOCAL(), ctx.RELATED());
        checkMutuallyExclusiveOptions("SHUTOPTION, NOSHUTDOWN or SHUTDOWN", ctx.SHUTOPTION(), ctx.NOSHUTDOWN(), ctx.SHUTDOWN());
        checkMutuallyExclusiveOptions("SYSDUMPING, NOSYSDUMP or SYSDUMP", ctx.SYSDUMPING(), ctx.NOSYSDUMP(), ctx.SYSDUMP());
        checkMutuallyExclusiveOptions("TRANDUMPING, NOTRANDUMP or TRANDUMP", ctx.TRANDUMPING(), ctx.NOTRANDUMP(), ctx.TRANDUMP());
    }

    private void checkTransaction(CICSParser.Cics_set_transactionContext ctx) {
        checkMutuallyExclusiveOptions("DUMPING, TRANDUMP or NOTRANDUMP", ctx.DUMPING(), ctx.TRANDUMP(), ctx.NOTRANDUMP());
        checkMutuallyExclusiveOptions("PURGEABILITY, NOTPURGEABLE or PURGEABLE", ctx.PURGEABILITY(), ctx.NOTPURGEABLE(), ctx.PURGEABLE());
        checkMutuallyExclusiveOptions("RUNAWAYTYPE, SYSTEM or USER", ctx.RUNAWAYTYPE(), ctx.SYSTEM(), ctx.USER());
        checkMutuallyExclusiveOptions("SHUTDOWN, SHUTDISABLED or SHUTENABLED", ctx.SHUTDOWN(), ctx.SHUTDISABLED(), ctx.SHUTENABLED());
        checkMutuallyExclusiveOptions("STATUS, DISABLED or ENABLED", ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
        checkMutuallyExclusiveOptions("TCLASS or TRANCLASS", ctx.TCLASS(), ctx.TRANCLASS());
        checkMutuallyExclusiveOptions("TRACING, SPECTRACE, SPRSTRACE or STANTRACE", ctx.TRACING(), ctx.SPECTRACE(), ctx.SPRSTRACE(), ctx.STANTRACE());
    }

    private void checkTsqueue(CICSParser.Cics_set_tsqueueContext ctx) {
        checkForExactlyOne("TSQUEUE or TSQNAME", ctx, ctx.TSQUEUE(), ctx.TSQNAME());
        checkMutuallyExclusiveOptions("SYSID or POOLNAME", ctx.TSQUEUE(), ctx.TSQNAME());
        checkPrerequisiteIsMet(ctx.ACTION(), ctx.LASTUSEDINT(), ctx, "LASTUSEDINT without ACTION");
    }

    private void checkUow(CICSParser.Cics_set_uowContext ctx) {
        checkForExactlyOne("UOWSTATE, COMMIT, BACKOUT or FORCE", ctx, ctx.UOWSTATE(), ctx.COMMIT(), ctx.BACKOUT(), ctx.FORCE());
    }

    private void checkUowlink(CICSParser.Cics_set_uowlinkContext ctx) {
        checkMutuallyExclusiveOptions("ACTION or DELETE", ctx.ACTION(), ctx.DELETE());
    }

    private void checkUrimap(CICSParser.Cics_set_urimapContext ctx) {
        checkMutuallyExclusiveOptions("ENABLESTATUS, DISABLED or ENABLED", ctx.ENABLESTATUS(), ctx.DISABLED(), ctx.ENABLED());
        checkMutuallyExclusiveOptions("REDIRECTTYPE, NONE, PERMANENT or TEMPORARY", ctx.REDIRECTTYPE(), ctx.NONE(), ctx.PERMANENT(), ctx.TEMPORARY());
    }

    private void checkVolume(CICSParser.Cics_set_volumeContext ctx) {
        checkHasObsoleteOptions(ctx.VOLUME(), "VOLUME");
        checkPrerequisiteIsMet(ctx.ACTION(), ctx.JRNL(), ctx, "JRNL without ACTION");
        checkMutuallyExclusiveOptions("ACTION, ADD or REMOVE", ctx.ACTION(), ctx.ADD(), ctx.REMOVE());
        checkMutuallyExclusiveOptions("AVAIL, OK or NOWRITE", ctx.AVAIL(), ctx.OK(), ctx.NOWRITE());
        if (ctx.REMOVE() != null) {
            checkHasIllegalOptions(ctx.JRNL(), "JRNL");
            checkHasIllegalOptions(ctx.AVAIL(), "AVAIL");
            checkHasIllegalOptions(ctx.OK(), "OK");
            checkHasIllegalOptions(ctx.NOWRITE(), "NOWRITE");
        }
    }

    private void checkVtam(CICSParser.Cics_set_vtamContext ctx) {
        checkMutuallyExclusiveOptions("OPENSTATUS, CLOSED, FORCECLOSE, IMMCLOSE or OPEN", ctx.OPENSTATUS(), ctx.CLOSED(), ctx.FORCECLOSE(), ctx.IMMCLOSE(), ctx.OPEN());
        checkMutuallyExclusiveOptions("PSDINTERVAL or PSDINTHRS", ctx.PSDINTERVAL(), ctx.PSDINTHRS());
        checkMutuallyExclusiveOptions("PSDINTERVAL or PSDINTMINS", ctx.PSDINTERVAL(), ctx.PSDINTMINS());
        checkMutuallyExclusiveOptions("PSDINTERVAL or PSDINTSECS", ctx.PSDINTERVAL(), ctx.PSDINTSECS());
    }

    private void checkWeb(CICSParser.Cics_set_webContext ctx) {
        // No checks needed
    }

    private void checkWebservice(CICSParser.Cics_set_webserviceContext ctx) {
        checkMutuallyExclusiveOptions("VALIDATIONST, VALIDATION or NOVALIDATION", ctx.VALIDATIONST(), ctx.VALIDATION(), ctx.NOVALIDATION());
    }

    private void checkWlmhealth(CICSParser.Cics_set_wlmhealthContext ctx) {
        checkMutuallyExclusiveOptions("ADJUSTMENT, INTERVAL or OPENSTATUS", ctx.ADJUSTMENT(), ctx.INTERVAL(), ctx.OPENSTATUS());
    }

    private void checkXmltransform(CICSParser.Cics_set_xmltransformContext ctx) {
        checkMutuallyExclusiveOptions("VALIDATIONST, VALIDATION or NOVALIDATION", ctx.VALIDATIONST(), ctx.VALIDATION(), ctx.NOVALIDATION());
    }


}
