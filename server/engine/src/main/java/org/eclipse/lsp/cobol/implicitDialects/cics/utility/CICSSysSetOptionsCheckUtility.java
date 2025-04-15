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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

import java.util.*;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS SET ASSOCIATION USERCORRDATA rules for required and invalid options */
public class CICSSysSetOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_set;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ABEND, ErrorSeverity.ERROR);
          put(CICSLexer.ACCOUNTREC, ErrorSeverity.ERROR);
          put(CICSLexer.ACQSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.ACQUIRED, ErrorSeverity.ERROR);
          put(CICSLexer.ACTION, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
          put(CICSLexer.ADD, ErrorSeverity.ERROR);
          put(CICSLexer.ADDABLE, ErrorSeverity.ERROR);
          put(CICSLexer.ADJUSTMENT, ErrorSeverity.ERROR);
          put(CICSLexer.ADVANCE, ErrorSeverity.ERROR);
          put(CICSLexer.AFFINITY, ErrorSeverity.ERROR);
          put(CICSLexer.AIBRIDGE, ErrorSeverity.ERROR);
          put(CICSLexer.AKP, ErrorSeverity.ERROR);
          put(CICSLexer.ALTPRINTER, ErrorSeverity.ERROR);
          put(CICSLexer.ALTPRTCOPY, ErrorSeverity.ERROR);
          put(CICSLexer.ALTPRTCOPYST, ErrorSeverity.ERROR);
          put(CICSLexer.AP, ErrorSeverity.ERROR);
          put(CICSLexer.ASSOCIATION, ErrorSeverity.ERROR);
          put(CICSLexer.ASYNCSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.ATI, ErrorSeverity.ERROR);
          put(CICSLexer.ATIFACILITY, ErrorSeverity.ERROR);
          put(CICSLexer.ATISTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.ATITERMID, ErrorSeverity.ERROR);
          put(CICSLexer.ATITRANID, ErrorSeverity.ERROR);
          put(CICSLexer.ATIUSERID, ErrorSeverity.ERROR);
          put(CICSLexer.ATOMSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.AUDITLEVEL, ErrorSeverity.ERROR);
          put(CICSLexer.AUTHID, ErrorSeverity.ERROR);
          put(CICSLexer.AUTHTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.AUTOACTIVE, ErrorSeverity.ERROR);
          put(CICSLexer.AUTOINACTIVE, ErrorSeverity.ERROR);
          put(CICSLexer.AUTOINSTALL, ErrorSeverity.ERROR);
          put(CICSLexer.AUTOPAGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.AUTOSTART, ErrorSeverity.ERROR);
          put(CICSLexer.AUTOSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.AUXPAUSE, ErrorSeverity.ERROR);
          put(CICSLexer.AUXSTART, ErrorSeverity.ERROR);
          put(CICSLexer.AUXSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.AUXSTOP, ErrorSeverity.ERROR);
          put(CICSLexer.AVAILABILITY, ErrorSeverity.ERROR);
          put(CICSLexer.AVAILABLE, ErrorSeverity.ERROR);
          put(CICSLexer.AVAILSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.BA, ErrorSeverity.ERROR);
          put(CICSLexer.BACKLOG, ErrorSeverity.ERROR);
          put(CICSLexer.BACKOUT, ErrorSeverity.ERROR);
          put(CICSLexer.BM, ErrorSeverity.ERROR);
          put(CICSLexer.BR, ErrorSeverity.ERROR);
          put(CICSLexer.BRFACILITY, ErrorSeverity.ERROR);
          put(CICSLexer.BROWSABLE, ErrorSeverity.ERROR);
          put(CICSLexer.BROWSE, ErrorSeverity.ERROR);
          put(CICSLexer.BUNDLE, ErrorSeverity.ERROR);
          put(CICSLexer.BUSAPPMGR, ErrorSeverity.ERROR);
          put(CICSLexer.BUSY, ErrorSeverity.ERROR);
          put(CICSLexer.CANCEL, ErrorSeverity.ERROR);
          put(CICSLexer.CEDF, ErrorSeverity.ERROR);
          put(CICSLexer.CEDFSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.CFDTPOOL, ErrorSeverity.ERROR);
          put(CICSLexer.CFTABLE, ErrorSeverity.ERROR);
          put(CICSLexer.CGROUP, ErrorSeverity.ERROR);
          put(CICSLexer.CICSTABLE, ErrorSeverity.ERROR);
          put(CICSLexer.CLOSED, ErrorSeverity.ERROR);
          put(CICSLexer.CLOSELEAVE, ErrorSeverity.ERROR);
          put(CICSLexer.CMD, ErrorSeverity.ERROR);
          put(CICSLexer.COLDACQ, ErrorSeverity.ERROR);
          put(CICSLexer.COMAUTHID, ErrorSeverity.ERROR);
          put(CICSLexer.COMAUTHTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.COMMIT, ErrorSeverity.ERROR);
          put(CICSLexer.COMPID, ErrorSeverity.ERROR);
          put(CICSLexer.COMPRESS, ErrorSeverity.ERROR);
          put(CICSLexer.COMPRESSST, ErrorSeverity.ERROR);
          put(CICSLexer.COMTHREADLIM, ErrorSeverity.ERROR);
          put(CICSLexer.CONNECT, ErrorSeverity.ERROR);
          put(CICSLexer.CONNECTED, ErrorSeverity.ERROR);
          put(CICSLexer.CONNECTERROR, ErrorSeverity.ERROR);
          put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
          put(CICSLexer.CONNECTST, ErrorSeverity.ERROR);
          put(CICSLexer.CONNSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.CONSISTENT, ErrorSeverity.ERROR);
          put(CICSLexer.CONSOLES, ErrorSeverity.ERROR);
          put(CICSLexer.CONTENTION, ErrorSeverity.ERROR);
          put(CICSLexer.CONVERSE, ErrorSeverity.ERROR);
          put(CICSLexer.CONVERSEST, ErrorSeverity.ERROR);
          put(CICSLexer.COPID, ErrorSeverity.ERROR);
          put(CICSLexer.COPY, ErrorSeverity.ERROR);
          put(CICSLexer.CP, ErrorSeverity.ERROR);
          put(CICSLexer.CPI, ErrorSeverity.ERROR);
          put(CICSLexer.CREATE, ErrorSeverity.ERROR);
          put(CICSLexer.CREATESESS, ErrorSeverity.ERROR);
          put(CICSLexer.CRITICAL, ErrorSeverity.ERROR);
          put(CICSLexer.CRITICALST, ErrorSeverity.ERROR);
          put(CICSLexer.CSIGN, ErrorSeverity.ERROR);
          put(CICSLexer.CTERM, ErrorSeverity.ERROR);
          put(CICSLexer.CTLGALL, ErrorSeverity.ERROR);
          put(CICSLexer.CTLGMODIFY, ErrorSeverity.ERROR);
          put(CICSLexer.CTLGNONE, ErrorSeverity.ERROR);
          put(CICSLexer.CTX, ErrorSeverity.ERROR);
          put(CICSLexer.CUSERID, ErrorSeverity.ERROR);
          put(CICSLexer.DAE, ErrorSeverity.ERROR);
          put(CICSLexer.DAEOPTION, ErrorSeverity.ERROR);
          put(CICSLexer.DATASET, ErrorSeverity.ERROR);
          put(CICSLexer.DB2, ErrorSeverity.ERROR);
          put(CICSLexer.DB2CONN, ErrorSeverity.ERROR);
          put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
          put(CICSLexer.DB2GROUPID, ErrorSeverity.ERROR);
          put(CICSLexer.DB2ID, ErrorSeverity.ERROR);
          put(CICSLexer.DB2TRAN, ErrorSeverity.ERROR);
          put(CICSLexer.DC, ErrorSeverity.ERROR);
          put(CICSLexer.DCT, ErrorSeverity.ERROR);
          put(CICSLexer.DD, ErrorSeverity.ERROR);
          put(CICSLexer.DEBUG, ErrorSeverity.ERROR);
          put(CICSLexer.DEBUGTOOL, ErrorSeverity.ERROR);
          put(CICSLexer.DELETABLE, ErrorSeverity.ERROR);
          put(CICSLexer.DELETE, ErrorSeverity.ERROR);
          put(CICSLexer.DELETSHIPPED, ErrorSeverity.ERROR);
          put(CICSLexer.DH, ErrorSeverity.ERROR);
          put(CICSLexer.DIRMGR, ErrorSeverity.ERROR);
          put(CICSLexer.DISABLED, ErrorSeverity.ERROR);
          put(CICSLexer.DISABLEDACT, ErrorSeverity.ERROR);
          put(CICSLexer.DISCARD, ErrorSeverity.ERROR);
          put(CICSLexer.DISCOVERALL, ErrorSeverity.ERROR);
          put(CICSLexer.DISCREQ, ErrorSeverity.ERROR);
          put(CICSLexer.DISCREQST, ErrorSeverity.ERROR);
          put(CICSLexer.DISPATCHER, ErrorSeverity.ERROR);
          put(CICSLexer.DISPOSITION, ErrorSeverity.ERROR);
          put(CICSLexer.DM, ErrorSeverity.ERROR);
          put(CICSLexer.DOCTEMPLATE, ErrorSeverity.ERROR);
          put(CICSLexer.DOMAINMGR, ErrorSeverity.ERROR);
          put(CICSLexer.DP, ErrorSeverity.ERROR);
          put(CICSLexer.DPLLIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.DPLSUBSET, ErrorSeverity.ERROR);
          put(CICSLexer.DRAIN, ErrorSeverity.ERROR);
          put(CICSLexer.DS, ErrorSeverity.ERROR);
          put(CICSLexer.DSALIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.DSNAME, ErrorSeverity.ERROR);
          put(CICSLexer.DSPLIST, ErrorSeverity.ERROR);
          put(CICSLexer.DSRTPROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.DTRPROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.DU, ErrorSeverity.ERROR);
          put(CICSLexer.DUMPDS, ErrorSeverity.ERROR);
          put(CICSLexer.DUMPING, ErrorSeverity.ERROR);
          put(CICSLexer.DUMPSCOPE, ErrorSeverity.ERROR);
          put(CICSLexer.EC, ErrorSeverity.ERROR);
          put(CICSLexer.EDSALIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.EI, ErrorSeverity.ERROR);
          put(CICSLexer.EJ, ErrorSeverity.ERROR);
          put(CICSLexer.EM, ErrorSeverity.ERROR);
          put(CICSLexer.EMPTY, ErrorSeverity.ERROR);
          put(CICSLexer.EMPTYREQ, ErrorSeverity.ERROR);
          put(CICSLexer.EMPTYSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.ENABLED, ErrorSeverity.ERROR);
          put(CICSLexer.ENABLESTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.ENDAFFINITY, ErrorSeverity.ERROR);
          put(CICSLexer.ENDOFDAY, ErrorSeverity.ERROR);
          put(CICSLexer.ENDOFDAYHRS, ErrorSeverity.ERROR);
          put(CICSLexer.ENDOFDAYMINS, ErrorSeverity.ERROR);
          put(CICSLexer.ENDOFDAYSECS, ErrorSeverity.ERROR);
          put(CICSLexer.ENQMODEL, ErrorSeverity.ERROR);
          put(CICSLexer.ENQUEUE, ErrorSeverity.ERROR);
          put(CICSLexer.ENTJAVA, ErrorSeverity.ERROR);
          put(CICSLexer.EP, ErrorSeverity.ERROR);
          put(CICSLexer.EPADAPTER, ErrorSeverity.ERROR);
          put(CICSLexer.EPADAPTERSET, ErrorSeverity.ERROR);
          put(CICSLexer.EPSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.EQUAL, ErrorSeverity.ERROR);
          put(CICSLexer.EVENTBINDING, ErrorSeverity.ERROR);
          put(CICSLexer.EVENTCAPTURE, ErrorSeverity.ERROR);
          put(CICSLexer.EVENTMGR, ErrorSeverity.ERROR);
          put(CICSLexer.EVENTPROC, ErrorSeverity.ERROR);
          put(CICSLexer.EVENTPROCESS, ErrorSeverity.ERROR);
          put(CICSLexer.EXCEPT, ErrorSeverity.ERROR);
          put(CICSLexer.EXCEPTCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.EXCLUSIVE, ErrorSeverity.ERROR);
          put(CICSLexer.EXCTL, ErrorSeverity.ERROR);
          put(CICSLexer.EXECUTIONSET, ErrorSeverity.ERROR);
          put(CICSLexer.EXITTRACE, ErrorSeverity.ERROR);
          put(CICSLexer.EXITTRACING, ErrorSeverity.ERROR);
          put(CICSLexer.FC, ErrorSeverity.ERROR);
          put(CICSLexer.FCT, ErrorSeverity.ERROR);
          put(CICSLexer.FILE, ErrorSeverity.ERROR);
          put(CICSLexer.FILELIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.FLAGSET, ErrorSeverity.ERROR);
          put(CICSLexer.FLUSH, ErrorSeverity.ERROR);
          put(CICSLexer.FORCE, ErrorSeverity.ERROR);
          put(CICSLexer.FORCECANCEL, ErrorSeverity.ERROR);
          put(CICSLexer.FORCECLOSE, ErrorSeverity.ERROR);
          put(CICSLexer.FORCEPURGE, ErrorSeverity.ERROR);
          put(CICSLexer.FORCEQR, ErrorSeverity.ERROR);
          put(CICSLexer.FORCEUOW, ErrorSeverity.ERROR);
          put(CICSLexer.FREQUENCY, ErrorSeverity.ERROR);
          put(CICSLexer.FREQUENCYHRS, ErrorSeverity.ERROR);
          put(CICSLexer.FREQUENCYMIN, ErrorSeverity.ERROR);
          put(CICSLexer.FREQUENCYSEC, ErrorSeverity.ERROR);
          put(CICSLexer.FULL, ErrorSeverity.ERROR);
          put(CICSLexer.FULLAPI, ErrorSeverity.ERROR);
          put(CICSLexer.GARBAGEINT, ErrorSeverity.ERROR);
          put(CICSLexer.GC, ErrorSeverity.ERROR);
          put(CICSLexer.GLOBALCATLG, ErrorSeverity.ERROR);
          put(CICSLexer.GMMLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.GMMTEXT, ErrorSeverity.ERROR);
          put(CICSLexer.GROUP, ErrorSeverity.ERROR);
          put(CICSLexer.GROUPRESYNC, ErrorSeverity.ERROR);
          put(CICSLexer.GTFSTART, ErrorSeverity.ERROR);
          put(CICSLexer.GTFSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.GTFSTOP, ErrorSeverity.ERROR);
          put(CICSLexer.HFS, ErrorSeverity.ERROR);
          put(CICSLexer.HIGH, ErrorSeverity.ERROR);
          put(CICSLexer.HOST, ErrorSeverity.ERROR);
          put(CICSLexer.IC, ErrorSeverity.ERROR);
          put(CICSLexer.IDLE, ErrorSeverity.ERROR);
          put(CICSLexer.IDLEHRS, ErrorSeverity.ERROR);
          put(CICSLexer.IDLEMINS, ErrorSeverity.ERROR);
          put(CICSLexer.IDLESECS, ErrorSeverity.ERROR);
          put(CICSLexer.IDNTY, ErrorSeverity.ERROR);
          put(CICSLexer.IDNTYCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.IE, ErrorSeverity.ERROR);
          put(CICSLexer.IMMCLOSE, ErrorSeverity.ERROR);
          put(CICSLexer.IMMQUIESCED, ErrorSeverity.ERROR);
          put(CICSLexer.INITIALDDS, ErrorSeverity.ERROR);
          put(CICSLexer.INSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
          put(CICSLexer.INTERVALHRS, ErrorSeverity.ERROR);
          put(CICSLexer.INTERVALMINS, ErrorSeverity.ERROR);
          put(CICSLexer.INTERVALSECS, ErrorSeverity.ERROR);
          put(CICSLexer.INTSTART, ErrorSeverity.ERROR);
          put(CICSLexer.INTSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.INTSTOP, ErrorSeverity.ERROR);
          put(CICSLexer.IPCONN, ErrorSeverity.ERROR);
          put(CICSLexer.IPECI, ErrorSeverity.ERROR);
          put(CICSLexer.IRC, ErrorSeverity.ERROR);
          put(CICSLexer.IS, ErrorSeverity.ERROR);
          put(CICSLexer.JCT, ErrorSeverity.ERROR);
          put(CICSLexer.JOBLIST, ErrorSeverity.ERROR);
          put(CICSLexer.JOURNALNAME, ErrorSeverity.ERROR);
          put(CICSLexer.JOURNALNUM, ErrorSeverity.ERROR);
          put(CICSLexer.JVM, ErrorSeverity.ERROR);
          put(CICSLexer.JVMCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.JVMENDPOINT, ErrorSeverity.ERROR);
          put(CICSLexer.JVMPROFILE, ErrorSeverity.ERROR);
          put(CICSLexer.JVMSERVER, ErrorSeverity.ERROR);
          put(CICSLexer.KC, ErrorSeverity.ERROR);
          put(CICSLexer.KE, ErrorSeverity.ERROR);
          put(CICSLexer.KERNEL, ErrorSeverity.ERROR);
          put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.KILL, ErrorSeverity.ERROR);
          put(CICSLexer.LASTUSEDINT, ErrorSeverity.ERROR);
          put(CICSLexer.LD, ErrorSeverity.ERROR);
          put(CICSLexer.LG, ErrorSeverity.ERROR);
          put(CICSLexer.LIBRARY, ErrorSeverity.ERROR);
          put(CICSLexer.LM, ErrorSeverity.ERROR);
          put(CICSLexer.LOAD, ErrorSeverity.ERROR);
          put(CICSLexer.LOADER, ErrorSeverity.ERROR);
          put(CICSLexer.LOADTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.LOCAL, ErrorSeverity.ERROR);
          put(CICSLexer.LOCALCATLG, ErrorSeverity.ERROR);
          put(CICSLexer.LOCATION, ErrorSeverity.ERROR);
          put(CICSLexer.LOCKING, ErrorSeverity.ERROR);
          put(CICSLexer.LOCKMGR, ErrorSeverity.ERROR);
          put(CICSLexer.LOGDEFER, ErrorSeverity.ERROR);
          put(CICSLexer.LOGGER, ErrorSeverity.ERROR);
          put(CICSLexer.LOW, ErrorSeverity.ERROR);
          put(CICSLexer.LSRPOOLNUM, ErrorSeverity.ERROR);
          put(CICSLexer.MANAGEDPLAT, ErrorSeverity.ERROR);
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
          put(CICSLexer.ME, ErrorSeverity.ERROR);
          put(CICSLexer.ML, ErrorSeverity.ERROR);
          put(CICSLexer.MN, ErrorSeverity.ERROR);
          put(CICSLexer.MODENAME, ErrorSeverity.ERROR);
          put(CICSLexer.MODIFY, ErrorSeverity.ERROR);
          put(CICSLexer.MONITOR, ErrorSeverity.ERROR);
          put(CICSLexer.MONSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.MP, ErrorSeverity.ERROR);
          put(CICSLexer.MQCONN, ErrorSeverity.ERROR);
          put(CICSLexer.MQMONITOR, ErrorSeverity.ERROR);
          put(CICSLexer.MQNAME, ErrorSeverity.ERROR);
          put(CICSLexer.MROBATCH, ErrorSeverity.ERROR);
          put(CICSLexer.MSGQUEUE1, ErrorSeverity.ERROR);
          put(CICSLexer.MSGQUEUE2, ErrorSeverity.ERROR);
          put(CICSLexer.MSGQUEUE3, ErrorSeverity.ERROR);
          put(CICSLexer.NETNAME, ErrorSeverity.ERROR);
          put(CICSLexer.NEWCOPY, ErrorSeverity.ERROR);
          put(CICSLexer.NEWMAXSOCKET, ErrorSeverity.ERROR);
          put(CICSLexer.NEWMAXTASKS, ErrorSeverity.ERROR);
          put(CICSLexer.NEXTTRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.NO, ErrorSeverity.ERROR);
          put(CICSLexer.NOALTPRTCOPY, ErrorSeverity.ERROR);
          put(CICSLexer.NOATI, ErrorSeverity.ERROR);
          put(CICSLexer.NOAUTOSTART, ErrorSeverity.ERROR);
          put(CICSLexer.NOCEDF, ErrorSeverity.ERROR);
          put(CICSLexer.NOCOMPRESS, ErrorSeverity.ERROR);
          put(CICSLexer.NOCONNECT, ErrorSeverity.ERROR);
          put(CICSLexer.NOCONVERSE, ErrorSeverity.ERROR);
          put(CICSLexer.NOCREATE, ErrorSeverity.ERROR);
          put(CICSLexer.NODAE, ErrorSeverity.ERROR);
          put(CICSLexer.NODEBUG, ErrorSeverity.ERROR);
          put(CICSLexer.NODISCREQ, ErrorSeverity.ERROR);
          put(CICSLexer.NOEMPTYREQ, ErrorSeverity.ERROR);
          put(CICSLexer.NOEXCEPT, ErrorSeverity.ERROR);
          put(CICSLexer.NOEXCTL, ErrorSeverity.ERROR);
          put(CICSLexer.NOEXITTRACE, ErrorSeverity.ERROR);
          put(CICSLexer.NOFORCE, ErrorSeverity.ERROR);
          put(CICSLexer.NOIDNTY, ErrorSeverity.ERROR);
          put(CICSLexer.NOJVM, ErrorSeverity.ERROR);
          put(CICSLexer.NOLOAD, ErrorSeverity.ERROR);
          put(CICSLexer.NONCRITICAL, ErrorSeverity.ERROR);
          put(CICSLexer.NONE, ErrorSeverity.ERROR);
          put(CICSLexer.NONTERMREL, ErrorSeverity.ERROR);
          put(CICSLexer.NOOBFORMAT, ErrorSeverity.ERROR);
          put(CICSLexer.NOPERF, ErrorSeverity.ERROR);
          put(CICSLexer.NOPRTCOPY, ErrorSeverity.ERROR);
          put(CICSLexer.NORECOVDATA, ErrorSeverity.ERROR);
          put(CICSLexer.NORELEASE, ErrorSeverity.ERROR);
          put(CICSLexer.NORELREQ, ErrorSeverity.ERROR);
          put(CICSLexer.NOREPLICATOR, ErrorSeverity.ERROR);
          put(CICSLexer.NORESRCE, ErrorSeverity.ERROR);
          put(CICSLexer.NORESYNC, ErrorSeverity.ERROR);
          put(CICSLexer.NOSHUTDOWN, ErrorSeverity.ERROR);
          put(CICSLexer.NOSWITCH, ErrorSeverity.ERROR);
          put(CICSLexer.NOSYNCPOINT, ErrorSeverity.ERROR);
          put(CICSLexer.NOSYSDUMP, ErrorSeverity.ERROR);
          put(CICSLexer.NOTADDBALE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTBROWSABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTCONNECTED, ErrorSeverity.ERROR);
          put(CICSLexer.NOTDELETABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTERMINAL, ErrorSeverity.ERROR);
          put(CICSLexer.NOTPENDING, ErrorSeverity.ERROR);
          put(CICSLexer.NOTPURGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTRANDUMP, ErrorSeverity.ERROR);
          put(CICSLexer.NOTREADABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTRLS, ErrorSeverity.ERROR);
          put(CICSLexer.NOTTABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTTI, ErrorSeverity.ERROR);
          put(CICSLexer.NOTUPDATABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTWAIT, ErrorSeverity.ERROR);
          put(CICSLexer.NOUCTRAN, ErrorSeverity.ERROR);
          put(CICSLexer.NOVALIDATION, ErrorSeverity.ERROR);
          put(CICSLexer.NOWAIT, ErrorSeverity.ERROR);
          put(CICSLexer.NOZCPTRACE, ErrorSeverity.ERROR);
          put(CICSLexer.NQ, ErrorSeverity.ERROR);
          put(CICSLexer.OBFORMAT, ErrorSeverity.ERROR);
          put(CICSLexer.OBFORMATST, ErrorSeverity.ERROR);
          put(CICSLexer.OBJECTNAME, ErrorSeverity.ERROR);
          put(CICSLexer.OBJECTTRAN, ErrorSeverity.ERROR);
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
          put(CICSLexer.OFF, ErrorSeverity.ERROR);
          put(CICSLexer.OLD, ErrorSeverity.ERROR);
          put(CICSLexer.ON, ErrorSeverity.ERROR);
          put(CICSLexer.OPEN, ErrorSeverity.ERROR);
          put(CICSLexer.OPENOUTPUT, ErrorSeverity.ERROR);
          put(CICSLexer.OPENSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.OPERATION, ErrorSeverity.ERROR);
          put(CICSLexer.OPERID, ErrorSeverity.ERROR);
          put(CICSLexer.OPID, ErrorSeverity.ERROR);
          put(CICSLexer.OT, ErrorSeverity.ERROR);
          put(CICSLexer.OTEL, ErrorSeverity.ERROR);
          put(CICSLexer.OUTSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.PA, ErrorSeverity.ERROR);
          put(CICSLexer.PAGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.PAGESTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.PARAMGR, ErrorSeverity.ERROR);
          put(CICSLexer.PC, ErrorSeverity.ERROR);
          put(CICSLexer.PCT, ErrorSeverity.ERROR);
          put(CICSLexer.PENDSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.PERF, ErrorSeverity.ERROR);
          put(CICSLexer.PERFCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.PERMANENT, ErrorSeverity.ERROR);
          put(CICSLexer.PG, ErrorSeverity.ERROR);
          put(CICSLexer.PHASEIN, ErrorSeverity.ERROR);
          put(CICSLexer.PHASEOUT, ErrorSeverity.ERROR);
          put(CICSLexer.PI, ErrorSeverity.ERROR);
          put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
          put(CICSLexer.PIPEMGR, ErrorSeverity.ERROR);
          put(CICSLexer.PLAN, ErrorSeverity.ERROR);
          put(CICSLexer.PLANEXITNAME, ErrorSeverity.ERROR);
          put(CICSLexer.POOL, ErrorSeverity.ERROR);
          put(CICSLexer.POOLNAME, ErrorSeverity.ERROR);
          put(CICSLexer.PPT, ErrorSeverity.ERROR);
          put(CICSLexer.PRINTER, ErrorSeverity.ERROR);
          put(CICSLexer.PRIORITY, ErrorSeverity.ERROR);
          put(CICSLexer.PRIVATE, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.PROGAUTOCTLG, ErrorSeverity.ERROR);
          put(CICSLexer.PROGAUTOEXIT, ErrorSeverity.ERROR);
          put(CICSLexer.PROGAUTOINST, ErrorSeverity.ERROR);
          put(CICSLexer.PROGMGR, ErrorSeverity.ERROR);
          put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.PROTECTNUM, ErrorSeverity.ERROR);
          put(CICSLexer.PRTCOPY, ErrorSeverity.ERROR);
          put(CICSLexer.PRTCOPYST, ErrorSeverity.ERROR);
          put(CICSLexer.PRTYAGING, ErrorSeverity.ERROR);
          put(CICSLexer.PSB, ErrorSeverity.ERROR);
          put(CICSLexer.PSDINTERVAL, ErrorSeverity.ERROR);
          put(CICSLexer.PSDINTHRS, ErrorSeverity.ERROR);
          put(CICSLexer.PSDINTMINS, ErrorSeverity.ERROR);
          put(CICSLexer.PSDINTSECS, ErrorSeverity.ERROR);
          put(CICSLexer.PT, ErrorSeverity.ERROR);
          put(CICSLexer.PURGE, ErrorSeverity.ERROR);
          put(CICSLexer.PURGEABILITY, ErrorSeverity.ERROR);
          put(CICSLexer.PURGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.PURGEACTION, ErrorSeverity.ERROR);
          put(CICSLexer.PURGECYCLEM, ErrorSeverity.ERROR);
          put(CICSLexer.PURGECYCLES, ErrorSeverity.ERROR);
          put(CICSLexer.PURGETHRESH, ErrorSeverity.ERROR);
          put(CICSLexer.PURGETYPE, ErrorSeverity.ERROR);
          put(CICSLexer.QUESCESTATE, ErrorSeverity.ERROR);
          put(CICSLexer.QUIESCED, ErrorSeverity.ERROR);
          put(CICSLexer.RA, ErrorSeverity.ERROR);
          put(CICSLexer.RANKING, ErrorSeverity.ERROR);
          put(CICSLexer.READ, ErrorSeverity.ERROR);
          put(CICSLexer.READABLE, ErrorSeverity.ERROR);
          put(CICSLexer.READINTEG, ErrorSeverity.ERROR);
          put(CICSLexer.RECONNECT, ErrorSeverity.ERROR);
          put(CICSLexer.RECORDING, ErrorSeverity.ERROR);
          put(CICSLexer.RECORDSIZE, ErrorSeverity.ERROR);
          put(CICSLexer.RECOVERED, ErrorSeverity.ERROR);
          put(CICSLexer.RECOVERY, ErrorSeverity.ERROR);
          put(CICSLexer.RECOVSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.REDIRECTTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.REGIONSTAT, ErrorSeverity.ERROR);
          put(CICSLexer.RELATED, ErrorSeverity.ERROR);
          put(CICSLexer.RELEASE, ErrorSeverity.ERROR);
          put(CICSLexer.RELEASED, ErrorSeverity.ERROR);
          put(CICSLexer.RELREQ, ErrorSeverity.ERROR);
          put(CICSLexer.RELREQST, ErrorSeverity.ERROR);
          put(CICSLexer.REMOVE, ErrorSeverity.ERROR);
          put(CICSLexer.REPEATABLE, ErrorSeverity.ERROR);
          put(CICSLexer.REPLICATION, ErrorSeverity.ERROR);
          put(CICSLexer.REPLICATOR, ErrorSeverity.ERROR);
          put(CICSLexer.REQUESTSTRM, ErrorSeverity.ERROR);
          put(CICSLexer.RES, ErrorSeverity.ERROR);
          put(CICSLexer.RESET, ErrorSeverity.ERROR);
          put(CICSLexer.RESETLOCKS, ErrorSeverity.ERROR);
          put(CICSLexer.RESLIFEMGR, ErrorSeverity.ERROR);
          put(CICSLexer.RESPWAIT, ErrorSeverity.ERROR);
          put(CICSLexer.RESRCE, ErrorSeverity.ERROR);
          put(CICSLexer.RESRCECLASS, ErrorSeverity.ERROR);
          put(CICSLexer.RESYNC, ErrorSeverity.ERROR);
          put(CICSLexer.RESYNCMEMBER, ErrorSeverity.ERROR);
          put(CICSLexer.RETRY, ErrorSeverity.ERROR);
          put(CICSLexer.REUSELIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.RI, ErrorSeverity.ERROR);
          put(CICSLexer.RL, ErrorSeverity.ERROR);
          put(CICSLexer.RLS, ErrorSeverity.ERROR);
          put(CICSLexer.RLSACCESS, ErrorSeverity.ERROR);
          put(CICSLexer.RM, ErrorSeverity.ERROR);
          put(CICSLexer.RMI, ErrorSeverity.ERROR);
          put(CICSLexer.RMIADAPTERS, ErrorSeverity.ERROR);
          put(CICSLexer.RREPL, ErrorSeverity.ERROR);
          put(CICSLexer.RRS, ErrorSeverity.ERROR);
          put(CICSLexer.RS, ErrorSeverity.ERROR);
          put(CICSLexer.RUNAWAY, ErrorSeverity.ERROR);
          put(CICSLexer.RUNAWAYTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.RUNTIME, ErrorSeverity.ERROR);
          put(CICSLexer.RX, ErrorSeverity.ERROR);
          put(CICSLexer.RZ, ErrorSeverity.ERROR);
          put(CICSLexer.SC, ErrorSeverity.ERROR);
          put(CICSLexer.SCANDELAY, ErrorSeverity.ERROR);
          put(CICSLexer.SCHEDULER, ErrorSeverity.ERROR);
          put(CICSLexer.SDTMEMLIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.SECDISCOVERY, ErrorSeverity.ERROR);
          put(CICSLexer.SECRECORDING, ErrorSeverity.ERROR);
          put(CICSLexer.SECURITY, ErrorSeverity.ERROR);
          put(CICSLexer.SERVSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.SH, ErrorSeverity.ERROR);
          put(CICSLexer.SHARE, ErrorSeverity.ERROR);
          put(CICSLexer.SHARED, ErrorSeverity.ERROR);
          put(CICSLexer.SHARELOCKS, ErrorSeverity.ERROR);
          put(CICSLexer.SHARESTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.SHUTDISABLED, ErrorSeverity.ERROR);
          put(CICSLexer.SHUTDOWN, ErrorSeverity.ERROR);
          put(CICSLexer.SHUTENABLED, ErrorSeverity.ERROR);
          put(CICSLexer.SHUTOPTION, ErrorSeverity.ERROR);
          put(CICSLexer.SIGN, ErrorSeverity.ERROR);
          put(CICSLexer.SIGNID, ErrorSeverity.ERROR);
          put(CICSLexer.SINGLEOFF, ErrorSeverity.ERROR);
          put(CICSLexer.SINGLEON, ErrorSeverity.ERROR);
          put(CICSLexer.SINGLESTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.SJ, ErrorSeverity.ERROR);
          put(CICSLexer.SJVM, ErrorSeverity.ERROR);
          put(CICSLexer.SM, ErrorSeverity.ERROR);
          put(CICSLexer.SO, ErrorSeverity.ERROR);
          put(CICSLexer.SPECIAL, ErrorSeverity.ERROR);
          put(CICSLexer.SPECTRACE, ErrorSeverity.ERROR);
          put(CICSLexer.SPRSTRACE, ErrorSeverity.ERROR);
          put(CICSLexer.SQLCODE, ErrorSeverity.ERROR);
          put(CICSLexer.SRRACTIVE, ErrorSeverity.ERROR);
          put(CICSLexer.SRRINACTIVE, ErrorSeverity.ERROR);
          put(CICSLexer.SRRSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.ST, ErrorSeverity.ERROR);
          put(CICSLexer.STANDARD, ErrorSeverity.ERROR);
          put(CICSLexer.STANDBYMODE, ErrorSeverity.ERROR);
          put(CICSLexer.STANTRACE, ErrorSeverity.ERROR);
          put(CICSLexer.STARTED, ErrorSeverity.ERROR);
          put(CICSLexer.STATISTICS, ErrorSeverity.ERROR);
          put(CICSLexer.STATSQUEUE, ErrorSeverity.ERROR);
          put(CICSLexer.STATUS, ErrorSeverity.ERROR);
          put(CICSLexer.STOPPED, ErrorSeverity.ERROR);
          put(CICSLexer.STRINGS, ErrorSeverity.ERROR);
          put(CICSLexer.SWITCH, ErrorSeverity.ERROR);
          put(CICSLexer.SWITCHACTION, ErrorSeverity.ERROR);
          put(CICSLexer.SWITCHALL, ErrorSeverity.ERROR);
          put(CICSLexer.SWITCHNEXT, ErrorSeverity.ERROR);
          put(CICSLexer.SWITCHSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.SYNCPOINT, ErrorSeverity.ERROR);
          put(CICSLexer.SYNCPOINTST, ErrorSeverity.ERROR);
          put(CICSLexer.SYSDUMP, ErrorSeverity.ERROR);
          put(CICSLexer.SYSDUMPCODE, ErrorSeverity.ERROR);
          put(CICSLexer.SYSDUMPING, ErrorSeverity.ERROR);
          put(CICSLexer.SYSID, ErrorSeverity.ERROR);
          put(CICSLexer.SYSTEM, ErrorSeverity.ERROR);
          put(CICSLexer.SYSTEMOFF, ErrorSeverity.ERROR);
          put(CICSLexer.SYSTEMON, ErrorSeverity.ERROR);
          put(CICSLexer.SYSTEMSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.SZ, ErrorSeverity.ERROR);
          put(CICSLexer.TABLE, ErrorSeverity.ERROR);
          put(CICSLexer.TABLENAME, ErrorSeverity.ERROR);
          put(CICSLexer.TABLEONLY, ErrorSeverity.ERROR);
          put(CICSLexer.TABLESIZE, ErrorSeverity.ERROR);
          put(CICSLexer.TAGS, ErrorSeverity.ERROR);
          put(CICSLexer.TASK, ErrorSeverity.ERROR);
          put(CICSLexer.TC, ErrorSeverity.ERROR);
          put(CICSLexer.TCAMCONTROL, ErrorSeverity.ERROR);
          put(CICSLexer.TCBLIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.TCEXITALL, ErrorSeverity.ERROR);
          put(CICSLexer.TCEXITALLOFF, ErrorSeverity.ERROR);
          put(CICSLexer.TCEXITNONE, ErrorSeverity.ERROR);
          put(CICSLexer.TCEXITSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.TCEXITSYSTEM, ErrorSeverity.ERROR);
          put(CICSLexer.TCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.TCPIP, ErrorSeverity.ERROR);
          put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.TD, ErrorSeverity.ERROR);
          put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
          put(CICSLexer.TEMPORARY, ErrorSeverity.ERROR);
          put(CICSLexer.TEMPSTORAGE, ErrorSeverity.ERROR);
          put(CICSLexer.TERM, ErrorSeverity.ERROR);
          put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
          put(CICSLexer.TERMPRIORITY, ErrorSeverity.ERROR);
          put(CICSLexer.TERMSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.THREADLIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.THREADWAIT, ErrorSeverity.ERROR);
          put(CICSLexer.TI, ErrorSeverity.ERROR);
          put(CICSLexer.TIME, ErrorSeverity.ERROR);
          put(CICSLexer.TIMEOUTINT, ErrorSeverity.ERROR);
          put(CICSLexer.TPOOL, ErrorSeverity.ERROR);
          put(CICSLexer.TR, ErrorSeverity.ERROR);
          put(CICSLexer.TRACEDEST, ErrorSeverity.ERROR);
          put(CICSLexer.TRACEFLAG, ErrorSeverity.ERROR);
          put(CICSLexer.TRACETYPE, ErrorSeverity.ERROR);
          put(CICSLexer.TRACING, ErrorSeverity.ERROR);
          put(CICSLexer.TRANCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.TRANDUMP, ErrorSeverity.ERROR);
          put(CICSLexer.TRANDUMPCODE, ErrorSeverity.ERROR);
          put(CICSLexer.TRANDUMPING, ErrorSeverity.ERROR);
          put(CICSLexer.TRANIDONLY, ErrorSeverity.ERROR);
          put(CICSLexer.TRANMGR, ErrorSeverity.ERROR);
          put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
          put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.TRIGGERLEVEL, ErrorSeverity.ERROR);
          put(CICSLexer.TSMAINLIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.TSQNAME, ErrorSeverity.ERROR);
          put(CICSLexer.TSQUEUE, ErrorSeverity.ERROR);
          put(CICSLexer.TSQUEUELIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.TST, ErrorSeverity.ERROR);
          put(CICSLexer.TTI, ErrorSeverity.ERROR);
          put(CICSLexer.TTISTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.TWAIT, ErrorSeverity.ERROR);
          put(CICSLexer.TX, ErrorSeverity.ERROR);
          put(CICSLexer.TXID, ErrorSeverity.ERROR);
          put(CICSLexer.UCTRAN, ErrorSeverity.ERROR);
          put(CICSLexer.UCTRANST, ErrorSeverity.ERROR);
          put(CICSLexer.UE, ErrorSeverity.ERROR);
          put(CICSLexer.UNAVAILABLE, ErrorSeverity.ERROR);
          put(CICSLexer.UNCOMMITTED, ErrorSeverity.ERROR);
          put(CICSLexer.UNQUIESCED, ErrorSeverity.ERROR);
          put(CICSLexer.UOW, ErrorSeverity.ERROR);
          put(CICSLexer.UOWACTION, ErrorSeverity.ERROR);
          put(CICSLexer.UOWLINK, ErrorSeverity.ERROR);
          put(CICSLexer.UOWSTATE, ErrorSeverity.ERROR);
          put(CICSLexer.UPDATABLE, ErrorSeverity.ERROR);
          put(CICSLexer.UPDATE, ErrorSeverity.ERROR);
          put(CICSLexer.UPDATEMODEL, ErrorSeverity.ERROR);
          put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
          put(CICSLexer.URIMAPLIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.URM, ErrorSeverity.ERROR);
          put(CICSLexer.US, ErrorSeverity.ERROR);
          put(CICSLexer.USER, ErrorSeverity.ERROR);
          put(CICSLexer.USERCORRDATA, ErrorSeverity.ERROR);
          put(CICSLexer.USERID, ErrorSeverity.ERROR);
          put(CICSLexer.USEROFF, ErrorSeverity.ERROR);
          put(CICSLexer.USERON, ErrorSeverity.ERROR);
          put(CICSLexer.USERSTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.USERTABLE, ErrorSeverity.ERROR);
          put(CICSLexer.VALIDATION, ErrorSeverity.ERROR);
          put(CICSLexer.VALIDATIONST, ErrorSeverity.ERROR);
          put(CICSLexer.VERSION, ErrorSeverity.ERROR);
          put(CICSLexer.VOLUME, ErrorSeverity.ERROR);
          put(CICSLexer.VTAM, ErrorSeverity.ERROR);
          put(CICSLexer.W2, ErrorSeverity.ERROR);
          put(CICSLexer.WAIT, ErrorSeverity.ERROR);
          put(CICSLexer.WB, ErrorSeverity.ERROR);
          put(CICSLexer.WEB, ErrorSeverity.ERROR);
          put(CICSLexer.WEB2, ErrorSeverity.ERROR);
          put(CICSLexer.WEBRESTMGR, ErrorSeverity.ERROR);
          put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.WEBSERVLIMIT, ErrorSeverity.ERROR);
          put(CICSLexer.WLMHEALTH, ErrorSeverity.ERROR);
          put(CICSLexer.WU, ErrorSeverity.ERROR);
          put(CICSLexer.XM, ErrorSeverity.ERROR);
          put(CICSLexer.XMLTRANSFORM, ErrorSeverity.ERROR);
          put(CICSLexer.XS, ErrorSeverity.ERROR);
          put(CICSLexer.YES, ErrorSeverity.ERROR);
          put(CICSLexer.ZCPTRACE, ErrorSeverity.ERROR);
          put(CICSLexer.ZCPTRACING, ErrorSeverity.ERROR);

          put(CICSLexer.DEREGISTERED, ErrorSeverity.WARNING);
          put(CICSLexer.RECORDNOW, ErrorSeverity.WARNING);
          put(CICSLexer.REFRESH, ErrorSeverity.WARNING);
          put(CICSLexer.RESETNOW, ErrorSeverity.WARNING);
        }
      };

  public CICSSysSetOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS SET ASSOCIATION USERCORRDATA rules for required and invalid options
   *
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
      case RULE_cics_set_otel:
        checkOtel((CICSParser.Cics_set_otelContext) ctx);
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
  private void checkAssociationUsercorrdata(
      CICSParser.Cics_set_association_usercorrdataContext ctx) {
    checkHasMandatoryOptions(ctx.ASSOCIATION(), ctx, "ASSOCIATION");
    checkHasMandatoryOptions(ctx.USERCORRDATA(), ctx, "USERCORRDATA");
  }

  private void checkAtomservice(CICSParser.Cics_set_atomserviceContext ctx) {
    checkHasMandatoryOptions(ctx.ATOMSERVICE(), ctx, "ATOMSERVICE");

    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkAutoinstall(CICSParser.Cics_set_autoinstallContext ctx) {
    checkHasMandatoryOptions(ctx.AUTOINSTALL(), ctx, "AUTOINSTALL");
  }

  private void checkBrfacility(CICSParser.Cics_set_brfacilityContext ctx) {
    checkHasMandatoryOptions(ctx.BRFACILITY(), ctx, "BRFACILITY");

    checkMutuallyExclusiveOptions("TERMSTATUS or RELEASED", ctx.TERMSTATUS(), ctx.RELEASED());
  }

  private void checkBundle(CICSParser.Cics_set_bundleContext ctx) {
    checkHasMandatoryOptions(ctx.BUNDLE(), ctx, "BUNDLE");

    checkMutuallyExclusiveOptions(
        "AVAILSTATUS, AVAILABLE, UNAVAILABLE, ENABLESTATUS, ENABLED, DISABLED, COPY or PHASEIN",
        ctx.AVAILSTATUS(),
        ctx.AVAILABLE(),
        ctx.UNAVAILABLE(),
        ctx.ENABLESTATUS(),
        ctx.ENABLED(),
        ctx.DISABLED(),
        ctx.COPY(),
        ctx.PHASEIN());
  }

  private void checkConnection(CICSParser.Cics_set_connectionContext ctx) {
    checkHasMandatoryOptions(ctx.CONNECTION(), ctx, "CONNECTION");

    checkMutuallyExclusiveOptions(
        "ACQSTATUS, CONNSTATUS, ACQUIRED or RELEASED",
        ctx.ACQSTATUS(),
        ctx.CONNSTATUS(),
        ctx.ACQUIRED(),
        ctx.RELEASED());
    checkMutuallyExclusiveOptions("AFFINITY or ENDAFFINITY", ctx.AFFINITY(), ctx.ENDAFFINITY());
    checkMutuallyExclusiveOptions(
        "EXITTRACING, EXITTRACE or NOEXITTRACE",
        ctx.EXITTRACING(),
        ctx.EXITTRACE(),
        ctx.NOEXITTRACE());
    checkMutuallyExclusiveOptions("PENDSTATUS or NOTPENDING", ctx.PENDSTATUS(), ctx.NOTPENDING());
    checkMutuallyExclusiveOptions(
        "PURGETYPE, CANCEL, FORCECANCEL, FORCEPURGE, KILL or PURGE",
        ctx.PURGETYPE(),
        ctx.CANCEL(),
        ctx.FORCECANCEL(),
        ctx.FORCEPURGE(),
        ctx.KILL(),
        ctx.PURGE());
    checkMutuallyExclusiveOptions(
        "RECOVSTATUS or NORECOVDATA", ctx.RECOVSTATUS(), ctx.NORECOVDATA());
    checkMutuallyExclusiveOptions(
        "SERVSTATUS, INSERVICE or OUTSERVICE", ctx.SERVSTATUS(), ctx.INSERVICE(), ctx.OUTSERVICE());
    checkMutuallyExclusiveOptions(
        "UOWACTION, BACKOUT, COMMIT, FORCEUOW or RESYNC",
        ctx.UOWACTION(),
        ctx.BACKOUT(),
        ctx.COMMIT(),
        ctx.FORCEUOW(),
        ctx.RESYNC());
    checkMutuallyExclusiveOptions(
        "ZCPTRACING, NOZCPTRACE or ZCPTRACE", ctx.ZCPTRACING(), ctx.NOZCPTRACE(), ctx.ZCPTRACE());
  }

  private void checkDb2conn(CICSParser.Cics_set_db2connContext ctx) {
    checkHasMandatoryOptions(ctx.DB2CONN(), ctx, "DB2CONN");

    checkMutuallyExclusiveOptions(
        "ACCOUNTREC, UOW, TASK, TXID or NONE",
        ctx.ACCOUNTREC(),
        ctx.UOW(),
        ctx.TASK(),
        ctx.TXID(),
        ctx.NONE());
    checkMutuallyExclusiveOptions(
        "AUTHTYPE, GROUP, SIGN, TERM, TX, OPID or USERID",
        ctx.AUTHTYPE(),
        ctx.GROUP(),
        ctx.SIGN(),
        ctx.TERM(),
        ctx.TX(),
        ctx.OPID(),
        ctx.USERID());
    checkMutuallyExclusiveOptions(
        "BUSY, WAIT, NOWAIT or FORCE", ctx.BUSY(), ctx.WAIT(), ctx.NOWAIT(), ctx.FORCE());
    checkMutuallyExclusiveOptions(
        "COMAUTHTYPE, CGROUP, CSIGN, CTERM, CTX, COPID or CUSERID",
        ctx.COMAUTHTYPE(),
        ctx.CGROUP(),
        ctx.CSIGN(),
        ctx.CTERM(),
        ctx.CTX(),
        ctx.COPID(),
        ctx.CUSERID());
    checkMutuallyExclusiveOptions(
        "CONNECTERROR, ABEND or SQLCODE", ctx.CONNECTERROR(), ctx.ABEND(), ctx.SQLCODE());
    checkMutuallyExclusiveOptions(
        "CONNECTST, CONNECTED or NOTCONNECTED",
        ctx.CONNECTST(),
        ctx.CONNECTED(),
        ctx.NOTCONNECTED());
    checkMutuallyExclusiveOptions(
        "NONTERMREL, RELEASE or NORELEASE", ctx.NONTERMREL(), ctx.RELEASE(), ctx.NORELEASE());
    checkMutuallyExclusiveOptions(
        "PRIORITY, HIGH, EQUAL or LOW", ctx.PRIORITY(), ctx.HIGH(), ctx.EQUAL(), ctx.LOW());
    checkMutuallyExclusiveOptions(
        "RESYNCMEMBER, RESYNC or NORESYNC", ctx.RESYNCMEMBER(), ctx.RESYNC(), ctx.NORESYNC());
    checkMutuallyExclusiveOptions(
        "STANDBYMODE, NOCONNECT, CONNECT or RECONNECT",
        ctx.STANDBYMODE(),
        ctx.NOCONNECT(),
        ctx.CONNECT(),
        ctx.RECONNECT());
    checkMutuallyExclusiveOptions(
        "THREADWAIT, TWAIT or NOTWAIT", ctx.THREADWAIT(), ctx.TWAIT(), ctx.NOTWAIT());
  }

  private void checkDb2entry(CICSParser.Cics_set_db2entryContext ctx) {
    checkHasMandatoryOptions(ctx.DB2ENTRY(), ctx, "DB2ENTRY");

    checkMutuallyExclusiveOptions(
        "ACCOUNTREC, UOW, TASK, TXID or NONE",
        ctx.ACCOUNTREC(),
        ctx.UOW(),
        ctx.TASK(),
        ctx.TXID(),
        ctx.NONE());
    checkMutuallyExclusiveOptions(
        "AUTHTYPE, GROUP, SIGN, TERM, TX, OPID or USERID",
        ctx.AUTHTYPE(),
        ctx.GROUP(),
        ctx.SIGN(),
        ctx.TERM(),
        ctx.TX(),
        ctx.OPID(),
        ctx.USERID());
    checkMutuallyExclusiveOptions(
        "BUSY, WAIT, NOWAIT or FORCE", ctx.BUSY(), ctx.WAIT(), ctx.NOWAIT(), ctx.FORCE());
    checkMutuallyExclusiveOptions(
        "DISABLEDACT, ABEND, SQLCODE or POOL",
        ctx.DISABLEDACT(),
        ctx.ABEND(),
        ctx.SQLCODE(),
        ctx.POOL());
    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    checkMutuallyExclusiveOptions(
        "PRIORITY, HIGH, EQUAL or LOW", ctx.PRIORITY(), ctx.HIGH(), ctx.EQUAL(), ctx.LOW());
    checkMutuallyExclusiveOptions("SHARELOCKS, YES or NO", ctx.SHARELOCKS(), ctx.YES(), ctx.NO());
    checkMutuallyExclusiveOptions(
        "THREADWAIT, TWAIT, NOTWAIT or TPOOL",
        ctx.THREADWAIT(),
        ctx.TWAIT(),
        ctx.NOTWAIT(),
        ctx.TPOOL());
  }

  private void checkDb2tran(CICSParser.Cics_set_db2tranContext ctx) {
    checkHasMandatoryOptions(ctx.DB2TRAN(), ctx, "DB2TRAN");
  }

  private void checkDeletshipped(CICSParser.Cics_set_deletshippedContext ctx) {
    checkHasMandatoryOptions(ctx.DELETSHIPPED(), ctx, "DELETSHIPPED");

    checkMutuallyExclusiveOptions("IDLE or IDLEHRS", ctx.IDLE(), ctx.IDLEHRS());
    checkMutuallyExclusiveOptions("IDLE or IDLEMINS", ctx.IDLE(), ctx.IDLEMINS());
    checkMutuallyExclusiveOptions("IDLE or IDLESECS", ctx.IDLE(), ctx.IDLESECS());

    checkMutuallyExclusiveOptions("INTERVAL or INTERVALHRS", ctx.INTERVAL(), ctx.INTERVALHRS());
    checkMutuallyExclusiveOptions("INTERVAL or INTERVALMINS", ctx.INTERVAL(), ctx.INTERVALMINS());
    checkMutuallyExclusiveOptions("INTERVAL or INTERVALSECS", ctx.INTERVAL(), ctx.INTERVALSECS());
  }

  private void checkDispatcher(CICSParser.Cics_set_dispatcherContext ctx) {
    checkHasMandatoryOptions(ctx.DISPATCHER(), ctx, "DISPATCHER");
  }

  private void checkDoctemplate(CICSParser.Cics_set_doctemplateContext ctx) {
    checkHasMandatoryOptions(ctx.DOCTEMPLATE(), ctx, "DOCTEMPLATE");

    checkHasExactlyOneOption("COPY or NEWCOPY", ctx, ctx.COPY(), ctx.NEWCOPY());
  }

  private void checkDsname(CICSParser.Cics_set_dsnameContext ctx) {
    checkHasMandatoryOptions(ctx.DSNAME(), ctx, "DSNAME");

    checkMutuallyExclusiveOptions(
        "ACTION, REMOVE, RECOVERED, RESETLOCKS or RETRY",
        ctx.ACTION(),
        ctx.REMOVE(),
        ctx.RECOVERED(),
        ctx.RESETLOCKS(),
        ctx.RETRY());
    checkMutuallyExclusiveOptions(
        "AVAILABILITY, AVAILABLE, RREPL or UNAVAILABLE",
        ctx.AVAILABILITY(),
        ctx.AVAILABLE(),
        ctx.RREPL(),
        ctx.UNAVAILABLE());
    checkMutuallyExclusiveOptions(
        "QUESCESTATE, QUIESCED, IMMQUIESCED or UNQUIESCED",
        ctx.QUESCESTATE(),
        ctx.QUIESCED(),
        ctx.IMMQUIESCED(),
        ctx.UNQUIESCED());
    checkMutuallyExclusiveOptions("WAIT, BUSY or NOWAIT", ctx.WAIT(), ctx.BUSY(), ctx.NOWAIT());
    checkMutuallyExclusiveOptions(
        "UOWACTION, BACKOUT, COMMIT or FORCE",
        ctx.UOWACTION(),
        ctx.BACKOUT(),
        ctx.COMMIT(),
        ctx.FORCE());
  }

  private void checkDumpds(CICSParser.Cics_set_dumpdsContext ctx) {
    checkHasMandatoryOptions(ctx.DUMPDS(), ctx, "DUMPDS");

    checkMutuallyExclusiveOptions(
        "OPENSTATUS, CLOSED, OPEN or SWITCH",
        ctx.OPENSTATUS(),
        ctx.CLOSED(),
        ctx.OPEN(),
        ctx.SWITCH());
    checkMutuallyExclusiveOptions(
        "SWITCHSTATUS, NOSWITCH, SWITCHNEXT or SWITCHALL",
        ctx.SWITCHSTATUS(),
        ctx.NOSWITCH(),
        ctx.SWITCHNEXT(),
        ctx.SWITCHALL());
  }

  private void checkEnqmodel(CICSParser.Cics_set_enqmodelContext ctx) {
    checkHasMandatoryOptions(ctx.ENQMODEL(), ctx, "ENQMODEL");

    checkMutuallyExclusiveOptions(
        "STATUS, ENABLED or DISABLED", ctx.STATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkEpadapter(CICSParser.Cics_set_epadapterContext ctx) {
    checkHasMandatoryOptions(ctx.EPADAPTER(), ctx, "EPADAPTER");

    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkEpadapterset(CICSParser.Cics_set_epadaptersetContext ctx) {
    checkHasMandatoryOptions(ctx.EPADAPTERSET(), ctx, "EPADAPTERSET");

    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkEventbinding(CICSParser.Cics_set_eventbindingContext ctx) {
    checkHasMandatoryOptions(ctx.EVENTBINDING(), ctx, "EVENTBINDING");

    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkEventprocess(CICSParser.Cics_set_eventprocessContext ctx) {
    checkHasMandatoryOptions(ctx.EVENTPROCESS(), ctx, "EVENTPROCESS");

    checkMutuallyExclusiveOptions(
        "EPSTATUS, STARTED, DRAIN or STOPPED",
        ctx.EPSTATUS(),
        ctx.STARTED(),
        ctx.DRAIN(),
        ctx.STOPPED());
  }

  private void checkFile(CICSParser.Cics_set_fileContext ctx) {
    checkHasExactlyOneOption("FILE or DATASET", ctx, ctx.FILE(), ctx.DATASET());

    checkMutuallyExclusiveOptions(
        "ADD, ADDABLE or NOTADDABLE", ctx.ADD(), ctx.ADDABLE(), ctx.NOTADDABLE());
    checkMutuallyExclusiveOptions(
        "BROWSE, BROWSABLE or NOTBROWSABLE", ctx.BROWSE(), ctx.BROWSABLE(), ctx.NOTBROWSABLE());
    checkMutuallyExclusiveOptions(
        "BUSY, WAIT, FORCE or NOWAIT", ctx.BUSY(), ctx.WAIT(), ctx.FORCE(), ctx.NOWAIT());
    checkMutuallyExclusiveOptions(
        "DELETE, DELETABLE or NOTDELETABLE", ctx.DELETE(), ctx.DELETABLE(), ctx.NOTDELETABLE());
    checkMutuallyExclusiveOptions(
        "DISPOSITION, OLD or SHARE", ctx.DISPOSITION(), ctx.OLD(), ctx.SHARE());
    checkMutuallyExclusiveOptions("DSNAME or OBJECTNAME", ctx.DSNAME(), ctx.OBJECTNAME());
    checkMutuallyExclusiveOptions(
        "EMPTYSTATUS, EMPTY, EMPTYREQ or NOEMPTYREQ",
        ctx.EMPTYSTATUS(),
        ctx.EMPTY(),
        ctx.EMPTYREQ(),
        ctx.NOEMPTYREQ());
    checkMutuallyExclusiveOptions(
        "EXCLUSIVE, EXCTL or NOEXCTL", ctx.EXCLUSIVE(), ctx.EXCTL(), ctx.NOEXCTL());
    checkMutuallyExclusiveOptions(
        "LOADTYPE, LOAD or NOLOAD", ctx.LOADTYPE(), ctx.LOAD(), ctx.NOLOAD());
    checkMutuallyExclusiveOptions(
        "READ, READABLE or NOTREADABLE", ctx.READ(), ctx.READABLE(), ctx.NOTREADABLE());
    checkMutuallyExclusiveOptions(
        "READINTEG, UNCOMMITTED, CONSISTENT or REPEATABLE",
        ctx.READINTEG(),
        ctx.UNCOMMITTED(),
        ctx.CONSISTENT(),
        ctx.REPEATABLE());
    checkMutuallyExclusiveOptions(
        "RLSACCESS, RLS or NOTRLS", ctx.RLSACCESS(), ctx.RLS(), ctx.NOTRLS());
    checkMutuallyExclusiveOptions(
        "TABLE, CFTABLE, CICSTABLE, NOTTABLE or USERTABLE",
        ctx.TABLE(),
        ctx.CFTABLE(),
        ctx.CICSTABLE(),
        ctx.NOTTABLE(),
        ctx.USERTABLE());
    checkMutuallyExclusiveOptions(
        "UPDATE, UPDATABLE or NOTUPDATABLE", ctx.UPDATE(), ctx.UPDATABLE(), ctx.NOTUPDATABLE());
    checkMutuallyExclusiveOptions(
        "UPDATEMODEL, CONTENTION or LOCKING", ctx.UPDATEMODEL(), ctx.CONTENTION(), ctx.LOCKING());
    checkMutuallyExclusiveOptions("OPEN or CLOSED", ctx.OPEN(), ctx.CLOSED());
    checkMutuallyExclusiveOptions("ENABLED or DISABLED", ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkHost(CICSParser.Cics_set_hostContext ctx) {
    checkHasMandatoryOptions(ctx.HOST(), ctx, "HOST");
  }

  private void checkIpconn(CICSParser.Cics_set_ipconnContext ctx) {
    checkHasMandatoryOptions(ctx.IPCONN(), ctx, "IPCONN");

    checkMutuallyExclusiveOptions(
        "CONNSTATUS, ACQUIRED or RELEASED", ctx.CONNSTATUS(), ctx.ACQUIRED(), ctx.RELEASED());
    checkMutuallyExclusiveOptions("PENDSTATUS or NOTPENDING", ctx.PENDSTATUS(), ctx.NOTPENDING());
    checkMutuallyExclusiveOptions(
        "PURGETYPE, CANCEL, FORCECANCEL, FORCEPURGE, KILL or PURGE",
        ctx.PURGETYPE(),
        ctx.CANCEL(),
        ctx.FORCECANCEL(),
        ctx.FORCEPURGE(),
        ctx.KILL(),
        ctx.PURGE());
    checkMutuallyExclusiveOptions(
        "RECOVSTATUS or NORECOVDATA", ctx.RECOVSTATUS(), ctx.NORECOVDATA());
    checkMutuallyExclusiveOptions(
        "SERVSTATUS, INSERVICE or OUTSERVICE", ctx.SERVSTATUS(), ctx.INSERVICE(), ctx.OUTSERVICE());
    checkMutuallyExclusiveOptions(
        "UOWACTION, BACKOUT, COMMIT, FORCEUOW or RESYNC",
        ctx.UOWACTION(),
        ctx.BACKOUT(),
        ctx.COMMIT(),
        ctx.FORCEUOW(),
        ctx.RESYNC());
  }

  private void checkIrc(CICSParser.Cics_set_ircContext ctx) {
    checkHasMandatoryOptions(ctx.IRC(), ctx, "IRC");

    checkMutuallyExclusiveOptions(
        "OPENSTATUS, CLOSED, IMMCLOSE or OPEN",
        ctx.OPENSTATUS(),
        ctx.CLOSED(),
        ctx.IMMCLOSE(),
        ctx.OPEN());
  }

  private void checkJournalname(CICSParser.Cics_set_journalnameContext ctx) {
    checkHasMandatoryOptions(ctx.JOURNALNAME(), ctx, "JOURNALNAME");

    checkMutuallyExclusiveOptions(
        "ACTION, FLUSH, RESET, STATUS, DISABLED or ENABLED",
        ctx.ACTION(),
        ctx.FLUSH(),
        ctx.RESET(),
        ctx.STATUS(),
        ctx.DISABLED(),
        ctx.ENABLED());
  }

  private void checkJournalnum(CICSParser.Cics_set_journalnumContext ctx) {
    checkHasMandatoryOptions(ctx.JOURNALNUM(), ctx, "JOURNALNUM");

    checkHasObsoleteOptions(ctx.JOURNALNUM(), ctx, "JOURNALNUM. Replace with JOURNALNAME.");

    checkMutuallyExclusiveOptions(
        "OPENSTATUS, ADVANCE, CLOSED, CLOSELEAVE or OPENOUTPUT",
        ctx.OPENSTATUS(),
        ctx.ADVANCE(),
        ctx.CLOSED(),
        ctx.CLOSELEAVE(),
        ctx.OPENOUTPUT());

    checkHasObsoleteOptions(ctx.OPENSTATUS(), ctx, "OPENSTATUS");
    checkHasObsoleteOptions(ctx.ADVANCE(), ctx, "ADVANCE");
    checkHasObsoleteOptions(ctx.CLOSED(), ctx, "CLOSED");
    checkHasObsoleteOptions(ctx.CLOSELEAVE(), ctx, "CLOSELEAVE");
    checkHasObsoleteOptions(ctx.OPENOUTPUT(), ctx, "OPENOUTPUT");
  }

  private void checkJvmendpoint(CICSParser.Cics_set_jvmendpointContext ctx) {
    checkHasMandatoryOptions(ctx.JVMENDPOINT(), ctx, "JVMENDPOINT");
    checkHasMandatoryOptions(ctx.JVMSERVER(), ctx, "JVMSERVER");
    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.DISABLED(), ctx.ENABLED());
  }

  private void checkJvmserver(CICSParser.Cics_set_jvmserverContext ctx) {
    checkHasMandatoryOptions(ctx.JVMSERVER(), ctx, "JVMSERVER");

    checkMutuallyExclusiveOptions(
        "PHASEOUT, PURGETYPE, PURGE, FORCEPURGE or KILL",
        ctx.PHASEOUT(),
        ctx.PURGETYPE(),
        ctx.PURGE(),
        ctx.FORCEPURGE(),
        ctx.KILL());
    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkLibrary(CICSParser.Cics_set_libraryContext ctx) {
    checkHasMandatoryOptions(ctx.LIBRARY(), ctx, "LIBRARY");

    checkMutuallyExclusiveOptions(
        "CRITICALST, CRITICAL or NONCRITICAL", ctx.CRITICALST(), ctx.CRITICAL(), ctx.NONCRITICAL());
    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkModename(CICSParser.Cics_set_modenameContext ctx) {
    checkHasMandatoryOptions(ctx.MODENAME(), ctx, "MODENAME");

    checkHasMandatoryOptions(ctx.CONNECTION(), ctx, "CONNECTION");
    checkPrerequisiteIsMet(ctx.AVAILABLE(), ctx.ACQUIRED(), ctx, "ACQUIRED without AVAILABLE");
    checkMutuallyExclusiveOptions("ACQSTATUS or ACQUIRED", ctx.ACQSTATUS(), ctx.ACQUIRED());
    checkMutuallyExclusiveOptions("ACQSTATUS or CLOSED", ctx.ACQSTATUS(), ctx.CLOSED());
  }

  private void checkMonitor(CICSParser.Cics_set_monitorContext ctx) {
    checkHasMandatoryOptions(ctx.MONITOR(), ctx, "MONITOR");

    checkMutuallyExclusiveOptions(
        "COMPRESSST, COMPRESS or NOCOMPRESS", ctx.COMPRESSST(), ctx.COMPRESS(), ctx.NOCOMPRESS());
    checkMutuallyExclusiveOptions(
        "CONVERSEST, CONVERSE or NOCONVERSE", ctx.CONVERSEST(), ctx.CONVERSE(), ctx.NOCONVERSE());
    checkMutuallyExclusiveOptions(
        "EXCEPTCLASS, EXCEPT or NOEXCEPT", ctx.EXCEPTCLASS(), ctx.EXCEPT(), ctx.NOEXCEPT());
    checkMutuallyExclusiveOptions("FREQUENCY or FREQUENCYHRS", ctx.FREQUENCY(), ctx.FREQUENCYHRS());
    checkMutuallyExclusiveOptions("FREQUENCY or FREQUENCYMIN", ctx.FREQUENCY(), ctx.FREQUENCYMIN());
    checkMutuallyExclusiveOptions("FREQUENCY or FREQUENCYSEC", ctx.FREQUENCY(), ctx.FREQUENCYSEC());
    checkMutuallyExclusiveOptions(
        "IDNTYCLASS, IDNTY or NOIDNTY", ctx.IDNTYCLASS(), ctx.IDNTY(), ctx.NOIDNTY());
    checkMutuallyExclusiveOptions(
        "PERFCLASS, PERF or NOPERF", ctx.PERFCLASS(), ctx.PERF(), ctx.NOPERF());
    checkMutuallyExclusiveOptions(
        "RESRCECLASS, RESRCE or NORESRCE", ctx.RESRCECLASS(), ctx.RESRCE(), ctx.NORESRCE());
    checkMutuallyExclusiveOptions("STATUS, ON or OFF", ctx.STATUS(), ctx.ON(), ctx.OFF());
    checkMutuallyExclusiveOptions(
        "SYNCPOINTST, SYNCPOINT or NOSYNCPOINT",
        ctx.SYNCPOINTST(),
        ctx.SYNCPOINT(),
        ctx.NOSYNCPOINT());
  }

  private void checkMqconn(CICSParser.Cics_set_mqconnContext ctx) {
    checkHasMandatoryOptions(ctx.MQCONN(), ctx, "MQCONN");

    if (!ctx.WAIT().isEmpty()
        || !ctx.BUSY().isEmpty()
        || !ctx.NOWAIT().isEmpty()
        || !ctx.FORCE().isEmpty())
      checkMutuallyExclusiveOptions(
          "CONNECTST, CONNECTED or NOTCONNECTED",
          ctx.CONNECTST(),
          ctx.CONNECTED(),
          ctx.NOTCONNECTED());

    checkMutuallyExclusiveOptions(
        "WAIT, BUSY, NOWAIT or FORCE", ctx.WAIT(), ctx.BUSY(), ctx.NOWAIT(), ctx.FORCE());
    checkMutuallyExclusiveOptions(
        "CONNECTST, CONNECTED or NOTCONNECTED",
        ctx.CONNECTST(),
        ctx.CONNECTED(),
        ctx.NOTCONNECTED());
    checkMutuallyExclusiveOptions(
        "RESYNCMEMBER, RESYNC, NORESYNC or GROUPRESYNC",
        ctx.RESYNCMEMBER(),
        ctx.RESYNC(),
        ctx.NORESYNC(),
        ctx.GROUPRESYNC());
  }

  private void checkMqmonitor(CICSParser.Cics_set_mqmonitorContext ctx) {
    checkHasMandatoryOptions(ctx.MQMONITOR(), ctx, "MQMONITOR");

    checkMutuallyExclusiveOptions(
        "AUTOSTATUS, AUTOSTART or NOAUTOSTART",
        ctx.AUTOSTATUS(),
        ctx.AUTOSTART(),
        ctx.NOAUTOSTART());
    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    checkMutuallyExclusiveOptions(
        "MONSTATUS, STARTED or STOPPED", ctx.MONSTATUS(), ctx.STARTED(), ctx.STOPPED());
  }

  private void checkNetname(CICSParser.Cics_set_netnameContext ctx) {
    checkHasMandatoryOptions(ctx.NETNAME(), ctx, "NETNAME");

    checkMutuallyExclusiveOptions(
        "EXITTRACING, EXITTRACE or NOEXITTRACE",
        ctx.EXITTRACING(),
        ctx.EXITTRACE(),
        ctx.NOEXITTRACE());
  }

  private void checkOtel(CICSParser.Cics_set_otelContext ctx) {
    checkHasMandatoryOptions(ctx.OTEL(), ctx, "OTEL");
  }

  private void checkPipeline(CICSParser.Cics_set_pipelineContext ctx) {
    checkHasMandatoryOptions(ctx.PIPELINE(), ctx, "PIPELINE");

    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
  }

  private void checkProcesstype(CICSParser.Cics_set_processtypeContext ctx) {
    checkHasMandatoryOptions(ctx.PROCESSTYPE(), ctx, "PROCESSTYPE");

    checkMutuallyExclusiveOptions(
        "STATUS, DISABLED or ENABLED", ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
    checkMutuallyExclusiveOptions(
        "AUDITLEVEL, ACTIVITY, FULL, OFF or PROCESS",
        ctx.AUDITLEVEL(),
        ctx.ACTIVITY(),
        ctx.FULL(),
        ctx.OFF(),
        ctx.PROCESS());
  }

  private void checkProgram(CICSParser.Cics_set_programContext ctx) {
    checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");

    checkMutuallyExclusiveOptions(
        "CEDFSTATUS, CEDF or NOCEDF", ctx.CEDFSTATUS(), ctx.CEDF(), ctx.NOCEDF());
    checkMutuallyExclusiveOptions(
        "COPY, NEWCOPY or PHASEIN", ctx.COPY(), ctx.NEWCOPY(), ctx.PHASEIN());
    checkMutuallyExclusiveOptions(
        "EXECUTIONSET, DPLSUBSET or FULLAPI", ctx.EXECUTIONSET(), ctx.DPLSUBSET(), ctx.FULLAPI());
    checkMutuallyExclusiveOptions(
        "REPLICATION, REPLICATOR or NOREPLICATOR",
        ctx.REPLICATION(),
        ctx.REPLICATOR(),
        ctx.NOREPLICATOR());
    checkMutuallyExclusiveOptions("RUNTIME, JVM or NOJVM", ctx.RUNTIME(), ctx.JVM(), ctx.NOJVM());
    checkMutuallyExclusiveOptions(
        "SHARESTATUS, PRIVATE or SHARED", ctx.SHARESTATUS(), ctx.PRIVATE(), ctx.SHARED());
    checkMutuallyExclusiveOptions(
        "STATUS, DISABLED or ENABLED", ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
  }

  private void checkSecdiscovery(CICSParser.Cics_set_secdiscoveryContext ctx) {
    checkHasMandatoryOptions(ctx.SECDISCOVERY(), ctx, "SECDISCOVERY");

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
    checkHasMandatoryOptions(ctx.SECRECORDING(), ctx, "SECRECORDING");

    checkAllOptionsArePresentOrAbsent("ADD and MAXIMUM", ctx, ctx.ADD(), ctx.MAXIMUM());

    checkHasExactlyOneOption(
        "ACTION, ADD MAXIMUM, MODIFY or REMOVE",
        ctx,
        ctx.ACTION(),
        ctx.ADD(),
        ctx.MODIFY(),
        ctx.REMOVE());
  }

  private void checkStatistics(CICSParser.Cics_set_statisticsContext ctx) {
    checkHasMandatoryOptions(ctx.STATISTICS(), ctx, "STATISTICS");

    checkMutuallyExclusiveOptions("ENDOFDAY or ENDOFDAYHRS", ctx.ENDOFDAY(), ctx.ENDOFDAYHRS());
    checkMutuallyExclusiveOptions("ENDOFDAY or ENDOFDAYMINS", ctx.ENDOFDAY(), ctx.ENDOFDAYMINS());
    checkMutuallyExclusiveOptions("ENDOFDAY or ENDOFDAYSECS", ctx.ENDOFDAY(), ctx.ENDOFDAYSECS());

    checkMutuallyExclusiveOptions("INTERVAL or INTERVALHRS", ctx.INTERVAL(), ctx.INTERVALHRS());
    checkMutuallyExclusiveOptions("INTERVAL or INTERVALMINS", ctx.INTERVAL(), ctx.INTERVALMINS());
    checkMutuallyExclusiveOptions("INTERVAL or INTERVALSECS", ctx.INTERVAL(), ctx.INTERVALSECS());

    checkMutuallyExclusiveOptions("RECORDING, ON or OFF", ctx.RECORDING(), ctx.ON(), ctx.OFF());
    if (!ctx.RECORDNOW().isEmpty() || !ctx.RESETNOW().isEmpty()) {
      checkHasExactlyOneOption("RECORDING, ON or OFF", ctx, ctx.RECORDING(), ctx.ON(), ctx.OFF());
    }
  }

  private void checkSysdumpcode(CICSParser.Cics_set_sysdumpcodeContext ctx) {
    checkHasMandatoryOptions(ctx.SYSDUMPCODE(), ctx, "SYSDUMPCODE");

    checkMutuallyExclusiveOptions(
        "ACTION, ADD, REMOVE or RESET", ctx.ACTION(), ctx.ADD(), ctx.REMOVE(), ctx.RESET());
    checkMutuallyExclusiveOptions(
        "DAEOPTION, DAE or NODAE", ctx.DAEOPTION(), ctx.DAE(), ctx.NODAE());
    checkMutuallyExclusiveOptions(
        "DUMPSCOPE, LOCAL or RELATED", ctx.DUMPSCOPE(), ctx.LOCAL(), ctx.RELATED());
    checkMutuallyExclusiveOptions(
        "SHUTOPTION, NOSHUTDOWN or SHUTDOWN", ctx.SHUTOPTION(), ctx.NOSHUTDOWN(), ctx.SHUTDOWN());
    checkMutuallyExclusiveOptions(
        "SYSDUMPING, NOSYSDUMP or SYSDUMP", ctx.SYSDUMPING(), ctx.NOSYSDUMP(), ctx.SYSDUMP());
  }

  private void checkSystem(CICSParser.Cics_set_systemContext ctx) {
    checkHasMandatoryOptions(ctx.SYSTEM(), ctx, "SYSTEM");

    checkMutuallyExclusiveOptions(
        "DEBUGTOOL, DEBUG or NODEBUG", ctx.DEBUGTOOL(), ctx.DEBUG(), ctx.NODEBUG());
    checkMutuallyExclusiveOptions(
        "DUMPING, NOSYSDUMP, TABLEONLY or SYSDUMP",
        ctx.DUMPING(),
        ctx.NOSYSDUMP(),
        ctx.TABLEONLY(),
        ctx.SYSDUMP());
    checkMutuallyExclusiveOptions(
        "FORCEQR, FORCE or NOFORCE", ctx.FORCEQR(), ctx.FORCE(), ctx.NOFORCE());
    checkMutuallyExclusiveOptions(
        "PROGAUTOCTLG, CTLGALL, CTLGMODIFY or CTLGNONE",
        ctx.PROGAUTOCTLG(),
        ctx.CTLGALL(),
        ctx.CTLGMODIFY(),
        ctx.CTLGNONE());
    checkMutuallyExclusiveOptions(
        "PROGAUTOINST, AUTOACTIVE or AUTOINACTIVE",
        ctx.PROGAUTOINST(),
        ctx.AUTOACTIVE(),
        ctx.AUTOINACTIVE());

    checkPrerequisiteIsMet(ctx.GMMTEXT(), ctx.GMMLENGTH(), ctx, "GMMLENGTH without GMMTEXT");
    checkPrerequisiteIsMet(ctx.MAXTASKS(), ctx.NEWMAXTASKS(), ctx, "NEWMAXTASKS without MAXTASKS");
  }

  private void checkTagsRefresh(CICSParser.Cics_set_tags_refreshContext ctx) {
    checkHasMandatoryOptions(ctx.TAGS(), ctx, "TAGS");
    checkHasMandatoryOptions(ctx.REFRESH(), ctx, "REFRESH");
  }

  private void checkTask(CICSParser.Cics_set_taskContext ctx) {
    checkHasMandatoryOptions(ctx.TASK(), ctx, "TASK");

    checkMutuallyExclusiveOptions(
        "PURGETYPE, FORCEPURGE, KILL or PURGE",
        ctx.PURGETYPE(),
        ctx.FORCEPURGE(),
        ctx.KILL(),
        ctx.PURGE());
    checkMutuallyExclusiveOptions(
        "SRRSTATUS, SRRACTIVE or SRRINACTIVE", ctx.SRRSTATUS(), ctx.SRRACTIVE(), ctx.SRRINACTIVE());
  }

  private void checkTclass(CICSParser.Cics_set_tclassContext ctx) {
    checkHasMandatoryOptions(ctx.TCLASS(), ctx, "TCLASS");
  }

  private void checkTcpip(CICSParser.Cics_set_tcpipContext ctx) {
    checkHasMandatoryOptions(ctx.TCPIP(), ctx, "TCPIP");

    checkMutuallyExclusiveOptions(
        "OPENSTATUS, CLOSED, IMMCLOSE or OPEN",
        ctx.OPENSTATUS(),
        ctx.CLOSED(),
        ctx.IMMCLOSE(),
        ctx.OPEN());
  }

  private void checkTcpipservice(CICSParser.Cics_set_tcpipserviceContext ctx) {
    checkHasMandatoryOptions(ctx.TCPIPSERVICE(), ctx, "TCPIPSERVICE");

    checkMutuallyExclusiveOptions(
        "OPENSTATUS, CLOSED, IMMCLOSE or OPEN",
        ctx.OPENSTATUS(),
        ctx.CLOSED(),
        ctx.IMMCLOSE(),
        ctx.OPEN());
  }

  private void checkTdqueue(CICSParser.Cics_set_tdqueueContext ctx) {
    checkHasMandatoryOptions(ctx.TDQUEUE(), ctx, "TDQUEUE");

    checkMutuallyExclusiveOptions(
        "ATIFACILITY, TERMINAL or NOTERMINAL", ctx.ATIFACILITY(), ctx.TERMINAL(), ctx.NOTERMINAL());
    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, ENABLED or DISABLED", ctx.ENABLESTATUS(), ctx.ENABLED(), ctx.DISABLED());
    checkMutuallyExclusiveOptions(
        "OPENSTATUS, CLOSED or OPEN", ctx.OPENSTATUS(), ctx.CLOSED(), ctx.OPEN());
  }

  private void checkTempstorage(CICSParser.Cics_set_tempstorageContext ctx) {
    checkHasMandatoryOptions(ctx.TEMPSTORAGE(), ctx, "TEMPSTORAGE");
  }

  private void checkTerminal(CICSParser.Cics_set_terminalContext ctx) {
    checkHasMandatoryOptions(ctx.TERMINAL(), ctx, "TERMINAL");

    checkMutuallyExclusiveOptions(
        "ACQSTATUS, TERMSTATUS, ACQUIRED, COLDACQ or RELEASED",
        ctx.ACQSTATUS(),
        ctx.TERMSTATUS(),
        ctx.ACQUIRED(),
        ctx.COLDACQ(),
        ctx.RELEASED());
    checkMutuallyExclusiveOptions(
        "ALTPRTCOPYST, ALTPRTCOPY or NOALTPRTCOPY",
        ctx.ALTPRTCOPYST(),
        ctx.ALTPRTCOPY(),
        ctx.NOALTPRTCOPY());
    checkMutuallyExclusiveOptions(
        "ATISTATUS, ATI or NOATI", ctx.ATISTATUS(), ctx.ATI(), ctx.NOATI());
    checkMutuallyExclusiveOptions(
        "CREATESESS, CREATE or NOCREATE", ctx.CREATESESS(), ctx.CREATE(), ctx.NOCREATE());
    checkMutuallyExclusiveOptions(
        "DISCREQST, DISCREQ or NODISCREQ", ctx.DISCREQST(), ctx.DISCREQ(), ctx.NODISCREQ());
    checkMutuallyExclusiveOptions(
        "EXITTRACING, EXITTRACE or NOEXITTRACE",
        ctx.EXITTRACING(),
        ctx.EXITTRACE(),
        ctx.NOEXITTRACE());
    checkMutuallyExclusiveOptions(
        "OBFORMATST, OBFORMAT or NOOBFORMAT", ctx.OBFORMATST(), ctx.OBFORMAT(), ctx.NOOBFORMAT());
    checkMutuallyExclusiveOptions(
        "PAGESTATUS, AUTOPAGEABLE or PAGEABLE",
        ctx.PAGESTATUS(),
        ctx.AUTOPAGEABLE(),
        ctx.PAGEABLE());
    checkMutuallyExclusiveOptions(
        "PRTCOPYST, PRTCOPY or NOPRTCOPY", ctx.PRTCOPYST(), ctx.PRTCOPY(), ctx.NOPRTCOPY());
    checkMutuallyExclusiveOptions(
        "PURGETYPE, FORCEPURGE, KILL, PURGE or CANCEL",
        ctx.PURGETYPE(),
        ctx.FORCEPURGE(),
        ctx.KILL(),
        ctx.PURGE(),
        ctx.CANCEL());
    checkPrerequisiteIsMet(ctx.PURGE(), ctx.FORCE(), ctx, "FORCE without PURGE");
    checkMutuallyExclusiveOptions(
        "RELREQST, RELREQ or NORELREQ", ctx.RELREQST(), ctx.RELREQ(), ctx.NORELREQ());
    checkMutuallyExclusiveOptions(
        "SERVSTATUS, INSERVICE or OUTSERVICE", ctx.SERVSTATUS(), ctx.INSERVICE(), ctx.OUTSERVICE());
    checkMutuallyExclusiveOptions(
        "TRACING, SPECTRACE or STANTRACE", ctx.TRACING(), ctx.SPECTRACE(), ctx.STANTRACE());
    checkMutuallyExclusiveOptions(
        "TTISTATUS, NOTTI or TTI", ctx.TTISTATUS(), ctx.NOTTI(), ctx.TTI());
    checkMutuallyExclusiveOptions(
        "UCTRANST, UCTRAN, NOUCTRAN or TRANIDONLY",
        ctx.UCTRANST(),
        ctx.UCTRAN(),
        ctx.NOUCTRAN(),
        ctx.TRANIDONLY());
    checkMutuallyExclusiveOptions(
        "ZCPTRACING, NOZCPTRACE or ZCPTRACE", ctx.ZCPTRACING(), ctx.NOZCPTRACE(), ctx.ZCPTRACE());
  }

  private void checkTracedest(CICSParser.Cics_set_tracedestContext ctx) {
    checkHasMandatoryOptions(ctx.TRACEDEST(), ctx, "TRACEDEST");

    checkMutuallyExclusiveOptions(
        "AUXSTATUS, AUXPAUSE, AUXSTART or AUXSTOP",
        ctx.AUXSTATUS(),
        ctx.AUXPAUSE(),
        ctx.AUXSTART(),
        ctx.AUXSTOP());
    checkMutuallyExclusiveOptions(
        "GTFSTATUS, GTFSTART or GTFSTOP", ctx.GTFSTATUS(), ctx.GTFSTART(), ctx.GTFSTOP());
    checkMutuallyExclusiveOptions(
        "INTSTATUS, INTSTART or INTSTOP", ctx.INTSTATUS(), ctx.INTSTART(), ctx.INTSTOP());
    checkMutuallyExclusiveOptions("SWITCHACTION or SWITCH", ctx.SWITCHACTION(), ctx.SWITCH());
    checkMutuallyExclusiveOptions(
        "SWITCHSTATUS, NOSWITCH, SWITCHNEXT or SWITCHALL",
        ctx.SWITCHSTATUS(),
        ctx.NOSWITCH(),
        ctx.SWITCHNEXT(),
        ctx.SWITCHALL());
  }

  private void checkTraceflag(CICSParser.Cics_set_traceflagContext ctx) {
    checkHasMandatoryOptions(ctx.TRACEFLAG(), ctx, "TRACEFLAG");

    checkMutuallyExclusiveOptions(
        "SINGLESTATUS, SINGLEOFF or SINGLEON", ctx.SINGLESTATUS(), ctx.SINGLEOFF(), ctx.SINGLEON());
    checkMutuallyExclusiveOptions(
        "SYSTEMSTATUS, SYSTEMOFF or SYSTEMON", ctx.SYSTEMSTATUS(), ctx.SYSTEMOFF(), ctx.SYSTEMON());
    checkMutuallyExclusiveOptions(
        "TCEXITSTATUS, TCEXITALL, TCEXITALLOFF, TCEXITNONE or TCEXITSYSTEM",
        ctx.TCEXITSTATUS(),
        ctx.TCEXITALL(),
        ctx.TCEXITALLOFF(),
        ctx.TCEXITNONE(),
        ctx.TCEXITSYSTEM());
    checkMutuallyExclusiveOptions(
        "USERSTATUS, USEROFF or USERON", ctx.USERSTATUS(), ctx.USEROFF(), ctx.USERON());
  }

  private void checkTracetype(CICSParser.Cics_set_tracetypeContext ctx) {
    checkHasMandatoryOptions(ctx.TRACETYPE(), ctx, "TRACETYPE");

    checkHasExactlyOneOption(
        "FLAGSET, SPECIAL or STANDARD", ctx, ctx.FLAGSET(), ctx.SPECIAL(), ctx.STANDARD());

    checkMutuallyExclusiveOptions("AP or APPLICATION", ctx.AP(), ctx.APPLICATION());
    checkMutuallyExclusiveOptions("AS or ASYNCSERVICE", ctx.AS(), ctx.ASYNCSERVICE());
    checkMutuallyExclusiveOptions("BA or BUSAPPMGR", ctx.BA(), ctx.BUSAPPMGR());
    checkMutuallyExclusiveOptions("BR or BRIDGE", ctx.BR(), ctx.BRIDGE());
    checkMutuallyExclusiveOptions("CP or CPI", ctx.CP(), ctx.CPI());
    checkMutuallyExclusiveOptions("DD or DIRMGR", ctx.DD(), ctx.DIRMGR());
    checkMutuallyExclusiveOptions("DH or DOCUMENT", ctx.DH(), ctx.DOCUMENT());
    checkMutuallyExclusiveOptions("DM or DOMAINMGR", ctx.DM(), ctx.DOMAINMGR());
    checkMutuallyExclusiveOptions("DP or DEBUGTOOL", ctx.DP(), ctx.DEBUGTOOL());
    checkMutuallyExclusiveOptions("DS or DISPATCHER", ctx.DS(), ctx.DISPATCHER());
    checkMutuallyExclusiveOptions("DU or DUMP", ctx.DU(), ctx.DUMP());
    checkMutuallyExclusiveOptions("EC or EVENTCAPTURE", ctx.EC(), ctx.EVENTCAPTURE());
    checkMutuallyExclusiveOptions("EJ or ENTJAVA", ctx.EJ(), ctx.ENTJAVA());
    checkMutuallyExclusiveOptions("EM or EVENTMGR", ctx.EM(), ctx.EVENTMGR());
    checkMutuallyExclusiveOptions("EP or EVENTPROC", ctx.EP(), ctx.EVENTPROC());
    checkMutuallyExclusiveOptions("GC or GLOBALCATLG", ctx.GC(), ctx.GLOBALCATLG());
    checkMutuallyExclusiveOptions("IE or IPECI", ctx.IE(), ctx.IPECI());
    checkMutuallyExclusiveOptions("KE or KERNEL", ctx.KE(), ctx.KERNEL());
    checkMutuallyExclusiveOptions("LC or LOCALCATLG", ctx.LC(), ctx.LOCALCATLG());
    checkMutuallyExclusiveOptions("LD or LOADER", ctx.LD(), ctx.LOADER());
    checkMutuallyExclusiveOptions("LG or LOGGER", ctx.LG(), ctx.LOGGER());
    checkMutuallyExclusiveOptions("LM or LOCKMGR", ctx.LM(), ctx.LOCKMGR());
    checkMutuallyExclusiveOptions("ME or MESSAGE", ctx.ME(), ctx.MESSAGE());
    checkMutuallyExclusiveOptions("MN or MONITOR", ctx.MN(), ctx.MONITOR());
    checkMutuallyExclusiveOptions("MP or MANAGEDPLAT", ctx.MP(), ctx.MANAGEDPLAT());
    checkMutuallyExclusiveOptions("NQ or ENQUEUE", ctx.NQ(), ctx.ENQUEUE());
    checkMutuallyExclusiveOptions("OT or OBJECTTRAN", ctx.OT(), ctx.OBJECTTRAN());
    checkMutuallyExclusiveOptions("PA or PARAMGR", ctx.PA(), ctx.PARAMGR());
    checkMutuallyExclusiveOptions("PG or PROGMGR", ctx.PG(), ctx.PROGMGR());
    checkMutuallyExclusiveOptions("PI or PIPEMGR", ctx.PI(), ctx.PIPEMGR());
    checkMutuallyExclusiveOptions("PT or PARTNER", ctx.PT(), ctx.PARTNER());
    checkMutuallyExclusiveOptions("RA or RMIADAPTERS", ctx.RA(), ctx.RMIADAPTERS());
    checkMutuallyExclusiveOptions("RI or RMI", ctx.RI(), ctx.RMI());
    checkMutuallyExclusiveOptions("RL or RESLIFEMGR", ctx.RL(), ctx.RESLIFEMGR());
    checkMutuallyExclusiveOptions("RM or RECOVERY", ctx.RM(), ctx.RECOVERY());
    checkMutuallyExclusiveOptions("RS or REGIONSTAT", ctx.RS(), ctx.REGIONSTAT());
    checkMutuallyExclusiveOptions("RX or RRS", ctx.RX(), ctx.RRS());
    checkMutuallyExclusiveOptions("RZ or REQUESTSTRM", ctx.RZ(), ctx.REQUESTSTRM());
    checkMutuallyExclusiveOptions("SH or SCHEDULER", ctx.SH(), ctx.SCHEDULER());
    checkMutuallyExclusiveOptions("SJ or SJVM", ctx.SJ(), ctx.SJVM());
    checkMutuallyExclusiveOptions("SM or STORAGE", ctx.SM(), ctx.STORAGE());
    checkMutuallyExclusiveOptions("SO or SOCKETS", ctx.SO(), ctx.SOCKETS());
    checkMutuallyExclusiveOptions("ST or STATISTICS", ctx.ST(), ctx.STATISTICS());
    checkMutuallyExclusiveOptions("TI or TIMER", ctx.TI(), ctx.TIMER());
    checkMutuallyExclusiveOptions("TR or TRACE", ctx.TR(), ctx.TRACE());
    checkMutuallyExclusiveOptions("TS or TEMPSTORAGE", ctx.TS(), ctx.TEMPSTORAGE());
    checkMutuallyExclusiveOptions("US or USER", ctx.US(), ctx.USER());
    checkMutuallyExclusiveOptions("WB or WEB", ctx.WB(), ctx.WEB());
    checkMutuallyExclusiveOptions("WU or WEBRESTMGR", ctx.WU(), ctx.WEBRESTMGR());
    checkMutuallyExclusiveOptions("W2 or WEB2", ctx.W2(), ctx.WEB2());
    checkMutuallyExclusiveOptions("XM or TRANMGR", ctx.XM(), ctx.TRANMGR());
    checkMutuallyExclusiveOptions("XS or SECURITY", ctx.XS(), ctx.SECURITY());
  }

  private void checkTranclass(CICSParser.Cics_set_tranclassContext ctx) {
    checkHasMandatoryOptions(ctx.TRANCLASS(), ctx, "TRANCLASS");

    checkMutuallyExclusiveOptions(
        "PURGEACTION, ABEND or DISCARD", ctx.PURGEACTION(), ctx.ABEND(), ctx.DISCARD());
  }

  private void checkTrandumpcode(CICSParser.Cics_set_trandumpcodeContext ctx) {
    checkHasMandatoryOptions(ctx.TRANDUMPCODE(), ctx, "TRANDUMPCODE");

    checkMutuallyExclusiveOptions(
        "ACTION, ADD, REMOVE or RESET", ctx.ACTION(), ctx.ADD(), ctx.REMOVE(), ctx.RESET());
    checkMutuallyExclusiveOptions(
        "DUMPSCOPE, LOCAL or RELATED", ctx.DUMPSCOPE(), ctx.LOCAL(), ctx.RELATED());
    checkMutuallyExclusiveOptions(
        "SHUTOPTION, NOSHUTDOWN or SHUTDOWN", ctx.SHUTOPTION(), ctx.NOSHUTDOWN(), ctx.SHUTDOWN());
    checkMutuallyExclusiveOptions(
        "SYSDUMPING, NOSYSDUMP or SYSDUMP", ctx.SYSDUMPING(), ctx.NOSYSDUMP(), ctx.SYSDUMP());
    checkMutuallyExclusiveOptions(
        "TRANDUMPING, NOTRANDUMP or TRANDUMP", ctx.TRANDUMPING(), ctx.NOTRANDUMP(), ctx.TRANDUMP());
  }

  private void checkTransaction(CICSParser.Cics_set_transactionContext ctx) {
    checkHasMandatoryOptions(ctx.TRANSACTION(), ctx, "TRANSACTION");

    checkMutuallyExclusiveOptions(
        "DUMPING, TRANDUMP or NOTRANDUMP", ctx.DUMPING(), ctx.TRANDUMP(), ctx.NOTRANDUMP());
    checkMutuallyExclusiveOptions(
        "OTELTRACE, PROPEMIT, PROP, PROPINIT, PROPINITEMIT or NOOTELTRACE",
        ctx.OTELTRACE(),
        ctx.PROPEMIT(),
        ctx.PROP(),
        ctx.PROPINIT(),
        ctx.PROPINITEMIT(),
        ctx.NOOTELTRACE());
    checkMutuallyExclusiveOptions(
        "PURGEABILITY, NOTPURGEABLE or PURGEABLE",
        ctx.PURGEABILITY(),
        ctx.NOTPURGEABLE(),
        ctx.PURGEABLE());
    checkMutuallyExclusiveOptions(
        "RUNAWAYTYPE, SYSTEM or USER", ctx.RUNAWAYTYPE(), ctx.SYSTEM(), ctx.USER());
    checkMutuallyExclusiveOptions(
        "SHUTDOWN, SHUTDISABLED or SHUTENABLED",
        ctx.SHUTDOWN(),
        ctx.SHUTDISABLED(),
        ctx.SHUTENABLED());
    checkMutuallyExclusiveOptions(
        "STATUS, DISABLED or ENABLED", ctx.STATUS(), ctx.DISABLED(), ctx.ENABLED());
    checkMutuallyExclusiveOptions("TCLASS or TRANCLASS", ctx.TCLASS(), ctx.TRANCLASS());
    checkMutuallyExclusiveOptions(
        "TRACING, SPECTRACE, SPRSTRACE or STANTRACE",
        ctx.TRACING(),
        ctx.SPECTRACE(),
        ctx.SPRSTRACE(),
        ctx.STANTRACE());
  }

  private void checkTsqueue(CICSParser.Cics_set_tsqueueContext ctx) {
    checkHasExactlyOneOption("TSQUEUE or TSQNAME", ctx, ctx.TSQUEUE(), ctx.TSQNAME());

    checkMutuallyExclusiveOptions("SYSID or POOLNAME", ctx.SYSID(), ctx.POOLNAME());
    checkPrerequisiteIsMet(ctx.ACTION(), ctx.LASTUSEDINT(), ctx, "LASTUSEDINT without ACTION");
  }

  private void checkUow(CICSParser.Cics_set_uowContext ctx) {
    checkHasMandatoryOptions(ctx.UOW(), ctx, "UOW");

    checkMutuallyExclusiveOptions(
        "UOWSTATE, COMMIT, BACKOUT or FORCE",
        ctx.UOWSTATE(),
        ctx.COMMIT(),
        ctx.BACKOUT(),
        ctx.FORCE());
  }

  private void checkUowlink(CICSParser.Cics_set_uowlinkContext ctx) {
    checkHasMandatoryOptions(ctx.UOWLINK(), ctx, "UOWLINK");

    checkMutuallyExclusiveOptions("ACTION or DELETE", ctx.ACTION(), ctx.DELETE());
  }

  private void checkUrimap(CICSParser.Cics_set_urimapContext ctx) {
    checkHasMandatoryOptions(ctx.URIMAP(), ctx, "URIMAP");

    checkMutuallyExclusiveOptions(
        "ENABLESTATUS, DISABLED or ENABLED", ctx.ENABLESTATUS(), ctx.DISABLED(), ctx.ENABLED());
    checkMutuallyExclusiveOptions(
        "REDIRECTTYPE, NONE, PERMANENT or TEMPORARY",
        ctx.REDIRECTTYPE(),
        ctx.NONE(),
        ctx.PERMANENT(),
        ctx.TEMPORARY());
  }

  private void checkVolume(CICSParser.Cics_set_volumeContext ctx) {
    checkHasMandatoryOptions(ctx.VOLUME(), ctx, "VOLUME");

    checkHasObsoleteOptions(ctx.VOLUME(), ctx, "VOLUME");
    if (!ctx.JRNL().isEmpty()) {
      checkHasExactlyOneOption("ACTION or ADD", ctx, ctx.ACTION(), ctx.ADD());
    }

    checkMutuallyExclusiveOptions("ACTION, ADD or REMOVE", ctx.ACTION(), ctx.ADD(), ctx.REMOVE());
    checkMutuallyExclusiveOptions("AVAIL, OK or NOWRITE", ctx.AVAIL(), ctx.OK(), ctx.NOWRITE());
    if (!ctx.REMOVE().isEmpty()) {
      checkHasIllegalOptions(ctx.JRNL(), "JRNL");
      checkHasIllegalOptions(ctx.AVAIL(), "AVAIL");
      checkHasIllegalOptions(ctx.OK(), "OK");
      checkHasIllegalOptions(ctx.NOWRITE(), "NOWRITE");
    }
  }

  private void checkVtam(CICSParser.Cics_set_vtamContext ctx) {
    checkHasMandatoryOptions(ctx.VTAM(), ctx, "VTAM");

    checkMutuallyExclusiveOptions(
        "OPENSTATUS, CLOSED, FORCECLOSE, IMMCLOSE or OPEN",
        ctx.OPENSTATUS(),
        ctx.CLOSED(),
        ctx.FORCECLOSE(),
        ctx.IMMCLOSE(),
        ctx.OPEN());
    checkMutuallyExclusiveOptions("PSDINTERVAL or PSDINTHRS", ctx.PSDINTERVAL(), ctx.PSDINTHRS());
    checkMutuallyExclusiveOptions("PSDINTERVAL or PSDINTMINS", ctx.PSDINTERVAL(), ctx.PSDINTMINS());
    checkMutuallyExclusiveOptions("PSDINTERVAL or PSDINTSECS", ctx.PSDINTERVAL(), ctx.PSDINTSECS());
  }

  private void checkWeb(CICSParser.Cics_set_webContext ctx) {
    checkHasMandatoryOptions(ctx.WEB(), ctx, "WEB");
  }

  private void checkWebservice(CICSParser.Cics_set_webserviceContext ctx) {
    checkHasMandatoryOptions(ctx.WEBSERVICE(), ctx, "WEBSERVICE");

    checkMutuallyExclusiveOptions(
        "VALIDATIONST, VALIDATION or NOVALIDATION",
        ctx.VALIDATIONST(),
        ctx.VALIDATION(),
        ctx.NOVALIDATION());
  }

  private void checkWlmhealth(CICSParser.Cics_set_wlmhealthContext ctx) {
    checkHasMandatoryOptions(ctx.WLMHEALTH(), ctx, "WLMHEALTH");

    checkMutuallyExclusiveOptions(
        "ADJUSTMENT, INTERVAL or OPENSTATUS", ctx.ADJUSTMENT(), ctx.INTERVAL(), ctx.OPENSTATUS());
  }

  private void checkXmltransform(CICSParser.Cics_set_xmltransformContext ctx) {
    checkHasMandatoryOptions(ctx.XMLTRANSFORM(), ctx, "XMLTRANSFORM");

    checkMutuallyExclusiveOptions(
        "VALIDATIONST, VALIDATION or NOVALIDATION",
        ctx.VALIDATIONST(),
        ctx.VALIDATION(),
        ctx.NOVALIDATION());
  }
}
