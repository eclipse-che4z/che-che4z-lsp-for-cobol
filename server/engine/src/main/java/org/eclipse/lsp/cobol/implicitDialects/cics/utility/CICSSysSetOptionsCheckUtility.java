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
                    put(CICSLexer.ASSOCIATION, ErrorSeverity.ERROR);
                    put(CICSLexer.USERCORRDATA, ErrorSeverity.ERROR);
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.ENABLESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.AIRBRIDGE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONSOLES, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXREQS, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.BRFACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.COPY, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.AFFINITY, ErrorSeverity.ERROR);
                    put(CICSLexer.EXITTRACING, ErrorSeverity.ERROR);
                    put(CICSLexer.PENDSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGETYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RECOVSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SERVSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.ZCPTRACING, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2CONN, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2TRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.QUESCESTATE, ErrorSeverity.ERROR);
                    put(CICSLexer.BUSY, ErrorSeverity.ERROR);
                    put(CICSLexer.INITIALDDS, ErrorSeverity.ERROR);
                    put(CICSLexer.OPENSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SWITCHSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.STATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTER, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTERSET, ErrorSeverity.ERROR);
                    put(CICSLexer.EVENTBINDING, ErrorSeverity.ERROR);
                    put(CICSLexer.EVENTPROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.EPSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ADD, ErrorSeverity.ERROR);
                    put(CICSLexer.BROWSE, ErrorSeverity.ERROR);
                    put(CICSLexer.CFDTPOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.DELETE, ErrorSeverity.ERROR);
                    put(CICSLexer.DISPOSITION, ErrorSeverity.ERROR);
                    put(CICSLexer.OBJECTNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.EMPTYSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.EXCLUSIVE, ErrorSeverity.ERROR);
                    put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.LOADTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.LSRPOOLNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXNUMRECS, ErrorSeverity.ERROR);
                    put(CICSLexer.READ, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.READINTEG, ErrorSeverity.ERROR);
                    put(CICSLexer.RLSACCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.STRINGS, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLE, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.UPDATE, ErrorSeverity.ERROR);
                    put(CICSLexer.UPDATEMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.HOST, ErrorSeverity.ERROR);
                    put(CICSLexer.IPCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMENDPOINT, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMSERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBRARY, ErrorSeverity.ERROR);
                    put(CICSLexer.CRITICALST, ErrorSeverity.ERROR);
                    put(CICSLexer.RANKING, ErrorSeverity.ERROR);
                    put(CICSLexer.MODENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILABLE, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPRESSST, ErrorSeverity.ERROR);
                    put(CICSLexer.CONVERSET, ErrorSeverity.ERROR);
                    put(CICSLexer.DPLLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.EXCEPTCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.FILELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCY, ErrorSeverity.ERROR);
                    put(CICSLexer.IDNTYCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.PERFCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.RESRCECLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.SYNCPOINTST, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQUEUELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAPLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.MQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.RESYNCMEMBER, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTST, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTOSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.MONSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.NETNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
                    put(CICSLexer.RESPWAIT, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.AUDITLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.CEDFSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.EXECUTIONSET, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMPROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.OPERATION, ErrorSeverity.ERROR);
                    put(CICSLexer.REPLICATION, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.SHARESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.VERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRID, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRDATA1, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRDATA2, ErrorSeverity.ERROR);
                    put(CICSLexer.ODADPTRDATA3, ErrorSeverity.ERROR);
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
                    put(CICSLexer.ENDOFDAY, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDING, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSDUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.DAEOPTION, ErrorSeverity.ERROR);
                    put(CICSLexer.DPLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPSCOPE, ErrorSeverity.ERROR);
                    put(CICSLexer.JOBLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXIMUM, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTOPTION, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSDUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.TASK, ErrorSeverity.ERROR);
                    put(CICSLexer.SRRSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXSOCKETS, ErrorSeverity.ERROR);
                    put(CICSLexer.NEWMAXSOCKET, ErrorSeverity.ERROR);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.BACKLOG, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXDATALEN, ErrorSeverity.ERROR);
                    put(CICSLexer.URM, ErrorSeverity.ERROR);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.ATIFACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ATITERMID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATITRANID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATIUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.TRIGGERLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMAINLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
                    put(CICSLexer.SINGLESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSTEMSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.TCEXITSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.USERSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.FLAGSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXACTIVE, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGEACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGETHRESH, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANDUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANDUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNAWAY, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNAWAYTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTDOWN, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSID, ErrorSeverity.ERROR);
                    put(CICSLexer.POOLNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTUSEDINT, ErrorSeverity.ERROR);
                    put(CICSLexer.UOW, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWSTATE, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWLINK, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
                    put(CICSLexer.REDIRECTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.LOCATION, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTERVAL, ErrorSeverity.ERROR);
                    put(CICSLexer.GARBAGEINT, ErrorSeverity.ERROR);
                    put(CICSLexer.TIMEOUTINT, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.VALIDATIONST, ErrorSeverity.ERROR);
                    put(CICSLexer.ADJUSTMENT, ErrorSeverity.ERROR);
                    put(CICSLexer.XMLTRANSFORM, ErrorSeverity.ERROR);

                    put(CICSLexer.ENABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.DISABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.RELEASED, ErrorSeverity.WARNING);
                    put(CICSLexer.UNAVAILABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.PHASEIN, ErrorSeverity.WARNING);
                    put(CICSLexer.ACQUIRED, ErrorSeverity.WARNING);
                    put(CICSLexer.ENDAFFINITY, ErrorSeverity.WARNING);
                    put(CICSLexer.EXITTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEXITTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTPENDING, ErrorSeverity.WARNING);
                    put(CICSLexer.CANCEL, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCECANCEL, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCEPURGE, ErrorSeverity.WARNING);
                    put(CICSLexer.KILL, ErrorSeverity.WARNING);
                    put(CICSLexer.PURGE, ErrorSeverity.WARNING);
                    put(CICSLexer.NORECOVDATA, ErrorSeverity.WARNING);
                    put(CICSLexer.INSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.OUTSERVICE, ErrorSeverity.WARNING);
                    put(CICSLexer.BACKOUT, ErrorSeverity.WARNING);
                    put(CICSLexer.COMMIT, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCEUOW, ErrorSeverity.WARNING);
                    put(CICSLexer.RESYNC, ErrorSeverity.WARNING);
                    put(CICSLexer.NOZCPTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.ZCPTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.DELETSHIPPED, ErrorSeverity.WARNING);
                    put(CICSLexer.DISPATCHER, ErrorSeverity.WARNING);
                    put(CICSLexer.NEWCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.RECOVERED, ErrorSeverity.WARNING);
                    put(CICSLexer.RESETLOCKS, ErrorSeverity.WARNING);
                    put(CICSLexer.RETRY, ErrorSeverity.WARNING);
                    put(CICSLexer.AVAILABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.RREPL, ErrorSeverity.WARNING);
                    put(CICSLexer.QUIESCED, ErrorSeverity.WARNING);
                    put(CICSLexer.IMMQUIESCED, ErrorSeverity.WARNING);
                    put(CICSLexer.UNQUIESCED, ErrorSeverity.WARNING);
                    put(CICSLexer.WAIT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOWAIT, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCE, ErrorSeverity.WARNING);
                    put(CICSLexer.DUMPDS, ErrorSeverity.WARNING);
                    put(CICSLexer.CLOSED, ErrorSeverity.WARNING);
                    put(CICSLexer.OPEN, ErrorSeverity.WARNING);
                    put(CICSLexer.SWITCH, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSWITCH, ErrorSeverity.WARNING);
                    put(CICSLexer.SWITCHNEXT, ErrorSeverity.WARNING);
                    put(CICSLexer.SWITCHALL, ErrorSeverity.WARNING);
                    put(CICSLexer.STARTED, ErrorSeverity.WARNING);
                    put(CICSLexer.STOPPED, ErrorSeverity.WARNING);
                    put(CICSLexer.DRAIN, ErrorSeverity.WARNING);
                    put(CICSLexer.ADDABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTADDABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.BROWSABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTBROWSABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.DELETABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTDELETABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.OLD, ErrorSeverity.WARNING);
                    put(CICSLexer.SHARE, ErrorSeverity.WARNING);
                    put(CICSLexer.EMPTY, ErrorSeverity.WARNING);
                    put(CICSLexer.EMPTYREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEMPTYREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.EXCTL, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEXCTL, ErrorSeverity.WARNING);
                    put(CICSLexer.LOAD, ErrorSeverity.WARNING);
                    put(CICSLexer.NOLOAD, ErrorSeverity.WARNING);
                    put(CICSLexer.READABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTREADABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.UNCOMMITTED, ErrorSeverity.WARNING);
                    put(CICSLexer.CONSISTENT, ErrorSeverity.WARNING);
                    put(CICSLexer.REPEATABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.RLS, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTRLS, ErrorSeverity.WARNING);
                    put(CICSLexer.CFTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.CICSTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.USERTABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.UPDATABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTUPDATABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.CONTENTION, ErrorSeverity.WARNING);
                    put(CICSLexer.LOCKING, ErrorSeverity.WARNING);
                    put(CICSLexer.IRC, ErrorSeverity.WARNING);
                    put(CICSLexer.IMMCLOSE, ErrorSeverity.WARNING);
                    put(CICSLexer.JOURNALSTATUS, ErrorSeverity.WARNING);
                    put(CICSLexer.FLUSH, ErrorSeverity.WARNING);
                    put(CICSLexer.RESET, ErrorSeverity.WARNING);
                    put(CICSLexer.CRITICAL, ErrorSeverity.WARNING);
                    put(CICSLexer.NONCRITICAL, ErrorSeverity.WARNING);
                    put(CICSLexer.COMPRESS, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCOMPRESS, ErrorSeverity.WARNING);
                    put(CICSLexer.CONVERSE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCONVERSE, ErrorSeverity.WARNING);
                    put(CICSLexer.EXCEPT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOEXCEPT, ErrorSeverity.WARNING);
                    put(CICSLexer.FREQUENCYMIN, ErrorSeverity.WARNING);
                    put(CICSLexer.IDNTY, ErrorSeverity.WARNING);
                    put(CICSLexer.NOIDNTY, ErrorSeverity.WARNING);
                    put(CICSLexer.PERF, ErrorSeverity.WARNING);
                    put(CICSLexer.NOPERF, ErrorSeverity.WARNING);
                    put(CICSLexer.RESRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.NORESRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.ON, ErrorSeverity.WARNING);
                    put(CICSLexer.OFF, ErrorSeverity.WARNING);
                    put(CICSLexer.SYNCPOINT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSYNCPOINT, ErrorSeverity.WARNING);
                    put(CICSLexer.MONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.MQCONN, ErrorSeverity.WARNING);
                    put(CICSLexer.NORESYNC, ErrorSeverity.WARNING);
                    put(CICSLexer.GROUPRESYNC, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.NOAUTOSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.MQMONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.ACTIVITY, ErrorSeverity.WARNING);
                    put(CICSLexer.FULL, ErrorSeverity.WARNING);
                    put(CICSLexer.PROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.CEDF, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCEDF, ErrorSeverity.WARNING);
                    put(CICSLexer.DPLSUBSET, ErrorSeverity.WARNING);
                    put(CICSLexer.FULLAPI, ErrorSeverity.WARNING);
                    put(CICSLexer.REPLICATOR, ErrorSeverity.WARNING);
                    put(CICSLexer.NOREPLICATOR, ErrorSeverity.WARNING);
                    put(CICSLexer.JVM, ErrorSeverity.WARNING);
                    put(CICSLexer.NOJVM, ErrorSeverity.WARNING);
                    put(CICSLexer.PRIVATE, ErrorSeverity.WARNING);
                    put(CICSLexer.SHARED, ErrorSeverity.WARNING);
                    put(CICSLexer.RECORDNOW, ErrorSeverity.WARNING);
                    put(CICSLexer.RESETNOW, ErrorSeverity.WARNING);
                    put(CICSLexer.DISCOVERALL, ErrorSeverity.WARNING);
                    put(CICSLexer.MODIFY, ErrorSeverity.WARNING);
                    put(CICSLexer.REMOVE, ErrorSeverity.WARNING);
                    put(CICSLexer.STATISTICS, ErrorSeverity.WARNING);
                    put(CICSLexer.SECDISCOVERY, ErrorSeverity.WARNING);
                    put(CICSLexer.SECRECORDING, ErrorSeverity.WARNING);
                    put(CICSLexer.DAE, ErrorSeverity.WARNING);
                    put(CICSLexer.NODAE, ErrorSeverity.WARNING);
                    put(CICSLexer.LOCAL, ErrorSeverity.WARNING);
                    put(CICSLexer.RELATED, ErrorSeverity.WARNING);
                    put(CICSLexer.SHUTDOWN, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSHUTDOWN, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.NOSYSDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSTEM, ErrorSeverity.WARNING);
                    put(CICSLexer.TAGS, ErrorSeverity.WARNING);
                    put(CICSLexer.REFRESH, ErrorSeverity.WARNING);
                    put(CICSLexer.SRRACTIVE, ErrorSeverity.WARNING);
                    put(CICSLexer.SRRINACTIVE, ErrorSeverity.WARNING);
                    put(CICSLexer.TCPIP, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTERMINAL, ErrorSeverity.WARNING);
                    put(CICSLexer.TEMPSTORAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.COLDACQ, ErrorSeverity.WARNING);
                    put(CICSLexer.ALTPRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.NOALTPRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.ATI, ErrorSeverity.WARNING);
                    put(CICSLexer.NOATI, ErrorSeverity.WARNING);
                    put(CICSLexer.CREATE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOCREATE, ErrorSeverity.WARNING);
                    put(CICSLexer.DISCREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.NODISCREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.OBFORMAT, ErrorSeverity.WARNING);
                    put(CICSLexer.NOOBFORMAT, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOPAGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.PAGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.PRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.NOPRTCOPY, ErrorSeverity.WARNING);
                    put(CICSLexer.RELREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.NORELREQ, ErrorSeverity.WARNING);
                    put(CICSLexer.SPECTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.STANTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTTI, ErrorSeverity.WARNING);
                    put(CICSLexer.TTI, ErrorSeverity.WARNING);
                    put(CICSLexer.UCTRAN, ErrorSeverity.WARNING);
                    put(CICSLexer.NOUCTRAN, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANIDONLY, ErrorSeverity.WARNING);
                    put(CICSLexer.AUXPAUSE, ErrorSeverity.WARNING);
                    put(CICSLexer.AUXSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.AUXSTOP, ErrorSeverity.WARNING);
                    put(CICSLexer.GTFSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.GTFSTOP, ErrorSeverity.WARNING);
                    put(CICSLexer.INTSTART, ErrorSeverity.WARNING);
                    put(CICSLexer.INTSTOP, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACEDEST, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACEFLAG, ErrorSeverity.WARNING);
                    put(CICSLexer.SINGLEOFF, ErrorSeverity.WARNING);
                    put(CICSLexer.SINGLEON, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSTEMOFF, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSTEMON, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITALL, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITALLOFF, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITNONE, ErrorSeverity.WARNING);
                    put(CICSLexer.TCEXITSYSTEM, ErrorSeverity.WARNING);
                    put(CICSLexer.USEROFF, ErrorSeverity.WARNING);
                    put(CICSLexer.USERON, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACETYPE, ErrorSeverity.WARNING);
                    put(CICSLexer.SPECIAL, ErrorSeverity.WARNING);
                    put(CICSLexer.STANDARD, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANSCLASS, ErrorSeverity.WARNING);
                    put(CICSLexer.ABEND, ErrorSeverity.WARNING);
                    put(CICSLexer.DISCARD, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTRANDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.TRANDUMP, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTPURGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.PURGEABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.USER, ErrorSeverity.WARNING);
                    put(CICSLexer.SHUTDISABLED, ErrorSeverity.WARNING);
                    put(CICSLexer.SHUTENABLED, ErrorSeverity.WARNING);
                    put(CICSLexer.DISABLED, ErrorSeverity.WARNING);
                    put(CICSLexer.ENABLED, ErrorSeverity.WARNING);
                    put(CICSLexer.SPRSTRACE, ErrorSeverity.WARNING);
                    put(CICSLexer.NONE, ErrorSeverity.WARNING);
                    put(CICSLexer.PERMANENT, ErrorSeverity.WARNING);
                    put(CICSLexer.TEMPORARY, ErrorSeverity.WARNING);
                    put(CICSLexer.VTAM, ErrorSeverity.WARNING);
                    put(CICSLexer.FORCECLOSE, ErrorSeverity.WARNING);
                    put(CICSLexer.DEREGISTERED, ErrorSeverity.WARNING);
                    put(CICSLexer.WEB, ErrorSeverity.WARNING);
                    put(CICSLexer.VALIDATION, ErrorSeverity.WARNING);
                    put(CICSLexer.NOVALIDATION, ErrorSeverity.WARNING);
                    put(CICSLexer.WLMHEALTH, ErrorSeverity.WARNING);
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
                checkAssociation_usercorrdata((CICSParser.Cics_set_association_usercorrdataContext) ctx);
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
                checkTags_refresh((CICSParser.Cics_set_tags_refreshContext) ctx);
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
            case RULE_cics_set_tsqname:
                checkTsqname((CICSParser.Cics_set_tsqnameContext) ctx);
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
    private void checkAssociation_usercorrdata(CICSParser.Cics_set_association_usercorrdataContext ctx) {
        checkPrerequisiteIsMet(ctx.ASSOCIATION(), ctx.USERCORRDATA(), ctx, "ASSOCIATION");
    }

    private void checkAtomservice(CICSParser.Cics_set_atomserviceContext ctx) {
        checkHasMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkAutoinstall(CICSParser.Cics_set_autoinstallContext ctx) {
        // No checks needed
    }

    private void checkBrfacility(CICSParser.Cics_set_brfacilityContext ctx) {
        checkHasMutuallyExclusiveOptions("TERMSTATUS or RELEASED", ctx.TERMSTATUS(), ctx.RELEASED());
    }

    private void checkBundle(CICSParser.Cics_set_bundleContext ctx) {
        checkHasMutuallyExclusiveOptions("AVAILSTATUS, AVAILABLE, UNAVAILABLE, ENABLESTATUS, ENABLED, DISABLED, COPY or PHASEIN", ctx.AVAILSTATUS(), ctx.AVAILABLE(), ctx.UNAVAILABLE(), ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED(), ctx.COPY(), ctx.PHASEIN());
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
        // No checks needed due to the repeat nature of the keywords
    }

    private void checkDb2entry(CICSParser.Cics_set_db2entryContext ctx) {}

    private void checkDb2tran(CICSParser.Cics_set_db2tranContext ctx) {}

    private void checkDeletshipped(CICSParser.Cics_set_deletshippedContext ctx) {
        checkHasMutuallyExclusiveOptions("IDLE or IDLEHRS", ctx.IDLE(), ctx.IDLEHRS());
        checkHasMutuallyExclusiveOptions("IDLE or IDLEMINS", ctx.IDLE(), ctx.IDLEMINS());
        checkHasMutuallyExclusiveOptions("IDLE or IDLESECS", ctx.IDLE(), ctx.IDLESECS());

        checkHasMutuallyExclusiveOptions("INTERVAL or INTERVALHRS", ctx.INTERVAL(), ctx.INTERVALHRS());
        checkHasMutuallyExclusiveOptions("INTERVAL or INTERVALMINS", ctx.INTERVAL(), ctx.INTERVALMINS());
        checkHasMutuallyExclusiveOptions("INTERVAL or INTERVALSECS", ctx.INTERVAL(), ctx.INTERVALSECS());
    }

    private void checkDispatcher(CICSParser.Cics_set_dispatcherContext ctx) {}

    private void checkDoctemplate(CICSParser.Cics_set_doctemplateContext ctx) {
        checkHasExactlyOneOption("COPY or NEWCOPY", ctx, ctx.COPY(), ctx.NEWCOPY());
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
        checkHasExactlyOneOption("STATUS, ENABLED or DISABLED", ctx, ctx.STATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkEpadapter(CICSParser.Cics_set_epadapterContext ctx) {
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkEpadapterset(CICSParser.Cics_set_epadaptersetContext ctx) {}

    private void checkEventbinding(CICSParser.Cics_set_eventbindingContext ctx) {
        checkMutuallyExclusiveOptions("ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    }

    private void checkEventprocess(CICSParser.Cics_set_eventprocessContext ctx) {
        checkHasExactlyOneOption("EPSTATUS, STARTED, DRAIN or STOPPED", ctx, ctx.EPSTATUS(), ctx.STARTED(), ctx.DRAIN(), ctx.STOPPED());
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
        checkHasExactlyOneOption("ACTION, FLUSH or RESET", ctx, ctx.ACTION(), ctx.FLUSH(), ctx.RESET());
        checkHasExactlyOneOption("STATUS, DISABLED or ENABLED", ctx, ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
    }

    private void checkJournalnum(CICSParser.Cics_set_journalnumContext ctx) {
        // Outdated, replaced with SET JOURNALNAME
    }

    private void checkJvmendpoint(CICSParser.Cics_set_jvmendpointContext ctx) {}

    private void checkJvmserver(CICSParser.Cics_set_jvmserverContext ctx) {}

    private void checkLibrary(CICSParser.Cics_set_libraryContext ctx) {}

    private void checkModename(CICSParser.Cics_set_modenameContext ctx) {}

    private void checkMonitor(CICSParser.Cics_set_monitorContext ctx) {}

    private void checkMqconn(CICSParser.Cics_set_mqconnContext ctx) {}

    private void checkMqmonitor(CICSParser.Cics_set_mqmonitorContext ctx) {}

    private void checkNetname(CICSParser.Cics_set_netnameContext ctx) {}

    private void checkPipeline(CICSParser.Cics_set_pipelineContext ctx) {}

    private void checkProcesstype(CICSParser.Cics_set_processtypeContext ctx) {}

    private void checkProgram(CICSParser.Cics_set_programContext ctx) {}

    private void checkSecdiscovery(CICSParser.Cics_set_secdiscoveryContext ctx) {}

    private void checkSecrecording(CICSParser.Cics_set_secrecordingContext ctx) {}

    private void checkStatistics(CICSParser.Cics_set_statisticsContext ctx) {}

    private void checkSysdumpcode(CICSParser.Cics_set_sysdumpcodeContext ctx) {}

    private void checkSystem(CICSParser.Cics_set_systemContext ctx) {}

    private void checkTags_refresh(CICSParser.Cics_set_tags_refreshContext ctx) {}

    private void checkTask(CICSParser.Cics_set_taskContext ctx) {}

    private void checkTclass(CICSParser.Cics_set_tclassContext ctx) {}

    private void checkTcpip(CICSParser.Cics_set_tcpipContext ctx) {}

    private void checkTcpipservice(CICSParser.Cics_set_tcpipserviceContext ctx) {}

    private void checkTdqueue(CICSParser.Cics_set_tdqueueContext ctx) {}

    private void checkTempstorage(CICSParser.Cics_set_tempstorageContext ctx) {}

    private void checkTerminal(CICSParser.Cics_set_terminalContext ctx) {}

    private void checkTracedest(CICSParser.Cics_set_tracedestContext ctx) {}

    private void checkTraceflag(CICSParser.Cics_set_traceflagContext ctx) {}

    private void checkTracetype(CICSParser.Cics_set_tracetypeContext ctx) {}

    private void checkTranclass(CICSParser.Cics_set_tranclassContext ctx) {}

    private void checkTrandumpcode(CICSParser.Cics_set_trandumpcodeContext ctx) {}

    private void checkTransaction(CICSParser.Cics_set_transactionContext ctx) {}

    private void checkTsqueue(CICSParser.Cics_set_tsqueueContext ctx) {}

    private void checkTsqname(CICSParser.Cics_set_tsqnameContext ctx) {}

    private void checkUow(CICSParser.Cics_set_uowContext ctx) {}

    private void checkUowlink(CICSParser.Cics_set_uowlinkContext ctx) {}

    private void checkUrimap(CICSParser.Cics_set_urimapContext ctx) {}

    private void checkVolume(CICSParser.Cics_set_volumeContext ctx) {}

    private void checkVtam(CICSParser.Cics_set_vtamContext ctx) {}

    private void checkWeb(CICSParser.Cics_set_webContext ctx) {}

    private void checkWebservice(CICSParser.Cics_set_webserviceContext ctx) {}

    private void checkWlmhealth(CICSParser.Cics_set_wlmhealthContext ctx) {}

    private void checkXmltransform(CICSParser.Cics_set_xmltransformContext ctx) {}


}
