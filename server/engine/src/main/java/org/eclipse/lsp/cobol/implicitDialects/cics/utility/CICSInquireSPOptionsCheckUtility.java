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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_inquire_system_programming;

/**
 * Checks CICS Inquire SP (System Programming Translator Option) rules for required and invalid
 * options
 */
public class CICSInquireSPOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
    public static final int RULE_INDEX = RULE_cics_inquire_system_programming;

    private static final Map<Integer, Integer> COMMON_INQUIRE_BROWSE_RULES = new HashMap<Integer, Integer>() {
        {
            put(CICSParser.RULE_cics_inquire_atomservice, CICSParser.ATOMSERVICE);
            put(CICSParser.RULE_cics_inquire_autinstmodel, CICSParser.AUTINSTMODEL);
            put(CICSParser.RULE_cics_inquire_brfacility, CICSParser.BRFACILITY);
            put(CICSParser.RULE_cics_inquire_connection, CICSParser.CONNECTION);
            put(CICSParser.RULE_cics_inquire_cfdtpool, CICSParser.CFDTPOOL);
            put(CICSParser.RULE_cics_inquire_db2entry, CICSParser.DB2ENTRY);
            put(CICSParser.RULE_cics_inquire_db2tran, CICSParser.DB2TRAN);
            put(CICSParser.RULE_cics_inquire_doctemplate, CICSParser.DOCTEMPLATE);
            put(CICSParser.RULE_cics_inquire_dsname, CICSParser.DSNAME);
            put(CICSParser.RULE_cics_inquire_enqmodel, CICSParser.ENQMODEL);
            put(CICSParser.RULE_cics_inquire_epadapter, CICSParser.EPADAPTER);
            put(CICSParser.RULE_cics_inquire_epadapterset, CICSParser.EPADAPTERSET);
            put(CICSParser.RULE_cics_inquire_eventbinding, CICSParser.EVENTBINDING);
            put(CICSParser.RULE_cics_inquire_file, CICSParser.FILE);
            put(CICSParser.RULE_cics_inquire_host, CICSParser.HOST);
            put(CICSParser.RULE_cics_inquire_ipconn, CICSParser.IPCONN);
            put(CICSParser.RULE_cics_inquire_journalmodel, CICSParser.JOURNALMODEL);
            put(CICSParser.RULE_cics_inquire_journalname, CICSParser.JOURNALNAME);
            put(CICSParser.RULE_cics_inquire_jvmserver, CICSParser.JVMSERVER);
            put(CICSParser.RULE_cics_inquire_library, CICSParser.LIBRARY);
            put(CICSParser.RULE_cics_inquire_mqmonitor, CICSParser.MQMONITOR);
            put(CICSParser.RULE_cics_inquire_nodejsapp, CICSParser.NODEJSAPP);
            put(CICSParser.RULE_cics_inquire_partner, CICSParser.PARTNER);
            put(CICSParser.RULE_cics_inquire_pipeline, CICSParser.PIPELINE);
            put(CICSParser.RULE_cics_inquire_policy, CICSParser.POLICY);
            put(CICSParser.RULE_cics_inquire_processtype, CICSParser.PROCESSTYPE);
            put(CICSParser.RULE_cics_inquire_profile, CICSParser.PROFILE);
            put(CICSParser.RULE_cics_inquire_secrecording, CICSParser.SECRECORDING);
            put(CICSParser.RULE_cics_inquire_streamname, CICSParser.STREAMNAME);
            put(CICSParser.RULE_cics_inquire_sysdumpcode, CICSParser.SYSDUMPCODE);
            put(CICSParser.RULE_cics_inquire_tdqueue, CICSParser.TDQUEUE);
            put(CICSParser.RULE_cics_inquire_trandumpcode, CICSParser.TRANDUMPCODE);
            put(CICSParser.RULE_cics_inquire_tsmodel, CICSParser.TSMODEL);
            put(CICSParser.RULE_cics_inquire_tspool, CICSParser.TSPOOL);
            put(CICSParser.RULE_cics_inquire_uow, CICSParser.UOW);
            put(CICSParser.RULE_cics_inquire_uowlink, CICSParser.UOWLINK);
            put(CICSParser.RULE_cics_inquire_urimap, CICSParser.URIMAP);
            put(CICSParser.RULE_cics_inquire_webservice, CICSParser.WEBSERVICE);

        }
    };

    private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.ABENDCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.ACCESSMETHOD, ErrorSeverity.ERROR);
                    put(CICSLexer.ACCOUNTREC, ErrorSeverity.ERROR);
                    put(CICSLexer.ACQSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIONCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIONTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIVE, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTIVITYID, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTOPENTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTSOCKETS, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTSSLTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTTHRDTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.ACTXPTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.ADAPTERTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.ADD, ErrorSeverity.ERROR);
                    put(CICSLexer.ADDRESS, ErrorSeverity.ERROR);
                    put(CICSLexer.ADJUSTMENT, ErrorSeverity.ERROR);
                    put(CICSLexer.ADRESS64, ErrorSeverity.ERROR);
                    put(CICSLexer.AGE, ErrorSeverity.ERROR);
                    put(CICSLexer.AIBRIDGE, ErrorSeverity.ERROR);
                    put(CICSLexer.AIDCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.AKP, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTPAGEHT, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTPAGEWD, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTPRINTER, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTPRTCOPYST, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTSCRNHT, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTSCRNWD, ErrorSeverity.ERROR);
                    put(CICSLexer.ALTSUFFIX, ErrorSeverity.ERROR);
                    put(CICSLexer.ANALYZERSTAT, ErrorSeverity.ERROR);
                    put(CICSLexer.APIST, ErrorSeverity.ERROR);
                    put(CICSLexer.APLKYBDST, ErrorSeverity.ERROR);
                    put(CICSLexer.APLTEXTST, ErrorSeverity.ERROR);
                    put(CICSLexer.APPENDCRLF, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLICATION, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLID, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLMAJORVER, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLMICROVER, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLMINORVER, ErrorSeverity.ERROR);
                    put(CICSLexer.APPLNAMEST, ErrorSeverity.ERROR);
                    put(CICSLexer.ARCHIVEFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.ASCII, ErrorSeverity.ERROR);
                    put(CICSLexer.ATIFACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.ATISTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ATITERMID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATITRANID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATIUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.ATOMSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.ATOMTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTACHSEC, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTACHTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.ATTLS, ErrorSeverity.ERROR);
                    put(CICSLexer.AUDALARMST, ErrorSeverity.ERROR);
                    put(CICSLexer.AUDITLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.AUDITLOG, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTHENTICATE, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTHID, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTHORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTHTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTHUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTINSTMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.AUTOCONNECT, ErrorSeverity.ERROR);
                    put(CICSLexer.AUXSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILABILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILABLE, ErrorSeverity.ERROR);
                    put(CICSLexer.AVAILSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.BACKLOG, ErrorSeverity.ERROR);
                    put(CICSLexer.BACKTRANSST, ErrorSeverity.ERROR);
                    put(CICSLexer.BACKUPTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.BASEDSNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.BASESCOPE, ErrorSeverity.ERROR);
                    put(CICSLexer.BINDFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.BINDING, ErrorSeverity.ERROR);
                    put(CICSLexer.BLOCKFORMAT, ErrorSeverity.ERROR);
                    put(CICSLexer.BLOCKKEYLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.BLOCKSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.BRANCHQUAL, ErrorSeverity.ERROR);
                    put(CICSLexer.BREXIT, ErrorSeverity.ERROR);
                    put(CICSLexer.BRFACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.BRIDGE, ErrorSeverity.ERROR);
                    put(CICSLexer.BROWSE, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLEDIR, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLEID, ErrorSeverity.ERROR);
                    put(CICSLexer.BUNDLEPART, ErrorSeverity.ERROR);
                    put(CICSLexer.CACHESIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.CAPTUREPOINT, ErrorSeverity.ERROR);
                    put(CICSLexer.CAPTUREPTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.CAPTURESPEC, ErrorSeverity.ERROR);
                    put(CICSLexer.CAUSE, ErrorSeverity.ERROR);
                    put(CICSLexer.CCSID, ErrorSeverity.ERROR);
                    put(CICSLexer.CDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.CEDFSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.CERTIFICATE, ErrorSeverity.ERROR);
                    put(CICSLexer.CFDTPOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANGEAGENT, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANGEAGREL, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANGETIME, ErrorSeverity.ERROR);
                    put(CICSLexer.CHANGEUSRID, ErrorSeverity.ERROR);
                    put(CICSLexer.CHARACTERSET, ErrorSeverity.ERROR);
                    put(CICSLexer.CICSSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.CICSSYS, ErrorSeverity.ERROR);
                    put(CICSLexer.CICSTSLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.CIDDOMAIN, ErrorSeverity.ERROR);
                    put(CICSLexer.CIPHERS, ErrorSeverity.ERROR);
                    put(CICSLexer.CLIENTLOC, ErrorSeverity.ERROR);
                    put(CICSLexer.CLOSETIMEOUT, ErrorSeverity.ERROR);
                    put(CICSLexer.CMD, ErrorSeverity.ERROR);
                    put(CICSLexer.CMDPROTECT, ErrorSeverity.ERROR);
                    put(CICSLexer.CMDSEC, ErrorSeverity.ERROR);
                    put(CICSLexer.COBOLTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.COLDSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.COLORST, ErrorSeverity.ERROR);
                    put(CICSLexer.COMAUTHID, ErrorSeverity.ERROR);
                    put(CICSLexer.COMAUTHTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPID, ErrorSeverity.ERROR);
                    put(CICSLexer.COMPRESSST, ErrorSeverity.ERROR);
                    put(CICSLexer.COMTHREADLIM, ErrorSeverity.ERROR);
                    put(CICSLexer.COMTHREADS, ErrorSeverity.ERROR);
                    put(CICSLexer.CONCURRENCY, ErrorSeverity.ERROR);
                    put(CICSLexer.CONCURRENTST, ErrorSeverity.ERROR);
                    put(CICSLexer.CONFIGDATA1, ErrorSeverity.ERROR);
                    put(CICSLexer.CONFIGFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTERROR, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTIONS, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNECTST, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.CONNTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONSOLE, ErrorSeverity.ERROR);
                    put(CICSLexer.CONSOLES, ErrorSeverity.ERROR);
                    put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
                    put(CICSLexer.CONVERSEST, ErrorSeverity.ERROR);
                    put(CICSLexer.CONVERTER, ErrorSeverity.ERROR);
                    put(CICSLexer.COPY, ErrorSeverity.ERROR);
                    put(CICSLexer.COPYST, ErrorSeverity.ERROR);
                    put(CICSLexer.CORRELID, ErrorSeverity.ERROR);
                    put(CICSLexer.CQP, ErrorSeverity.ERROR);
                    put(CICSLexer.CREATESESS, ErrorSeverity.ERROR);
                    put(CICSLexer.CRITICALST, ErrorSeverity.ERROR);
                    put(CICSLexer.CRLPROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.CURAUXDS, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRENT, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRENTDDS, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRENTHEAP, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRENTPROG, ErrorSeverity.ERROR);
                    put(CICSLexer.CURREQS, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRPGM, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRPGMOP, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRTRANID, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRTRANIDOP, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.CURRUSERIDOP, ErrorSeverity.ERROR);
                    put(CICSLexer.DAEOPTION, ErrorSeverity.ERROR);
                    put(CICSLexer.DATABUFFERS, ErrorSeverity.ERROR);
                    put(CICSLexer.DATAFORMAT, ErrorSeverity.ERROR);
                    put(CICSLexer.DATALOCATION, ErrorSeverity.ERROR);
                    put(CICSLexer.DATASTREAM, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2CONN, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2GROUPID, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2ID, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2PLAN, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2RELEASE, ErrorSeverity.ERROR);
                    put(CICSLexer.DB2TRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.DCT, ErrorSeverity.ERROR);
                    put(CICSLexer.DDNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.DEBUGTOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFINESOURCE, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFINETIME, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFPAGEHT, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFPAGEWD, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFSCRNHT, ErrorSeverity.ERROR);
                    put(CICSLexer.DEFSCRNWD, ErrorSeverity.ERROR);
                    put(CICSLexer.DELETE, ErrorSeverity.ERROR);
                    put(CICSLexer.DEVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.DFLTUSER, ErrorSeverity.ERROR);
                    put(CICSLexer.DISABLEDACT, ErrorSeverity.ERROR);
                    put(CICSLexer.DISCREQST, ErrorSeverity.ERROR);
                    put(CICSLexer.DISPOSITION, ErrorSeverity.ERROR);
                    put(CICSLexer.DNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.DNAMELEN, ErrorSeverity.ERROR);
                    put(CICSLexer.DOCTEMPLATE, ErrorSeverity.ERROR);
                    put(CICSLexer.DPLLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.DROLLBACK, ErrorSeverity.ERROR);
                    put(CICSLexer.DSALIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.DSANAME, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME01, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME02, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME03, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME04, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME05, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME06, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME07, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME08, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME09, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME10, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME11, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME12, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME13, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME14, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME15, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAME16, ErrorSeverity.ERROR);
                    put(CICSLexer.DSNAMELIST, ErrorSeverity.ERROR);
                    put(CICSLexer.DSPLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.DSRTPROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.DTIMEOUT, ErrorSeverity.ERROR);
                    put(CICSLexer.DTRPROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.DUALCASEST, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.DUMPSCOPE, ErrorSeverity.ERROR);
                    put(CICSLexer.DURATION, ErrorSeverity.ERROR);
                    put(CICSLexer.DYNAMSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ECDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.EDSALIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.ELEMENT, ErrorSeverity.ERROR);
                    put(CICSLexer.ELEMENT64, ErrorSeverity.ERROR);
                    put(CICSLexer.ELEMENTLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.EMITMODE, ErrorSeverity.ERROR);
                    put(CICSLexer.EMPTYSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENABLEDCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.ENABLESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAY, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAYHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAYMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDOFDAYSECS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENDPOINT, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQFAILS, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.ENQSCOPE, ErrorSeverity.ERROR);
                    put(CICSLexer.ENTRY, ErrorSeverity.ERROR);
                    put(CICSLexer.ENTRYNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.ENTRYPOINT, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTER, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTERNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTERRES, ErrorSeverity.ERROR);
                    put(CICSLexer.EPADAPTERSET, ErrorSeverity.ERROR);
                    put(CICSLexer.EPCDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.EPSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.EPUDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.ERDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.ERROROPTION, ErrorSeverity.ERROR);
                    put(CICSLexer.ESDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.EUDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.EVENTBINDING, ErrorSeverity.ERROR);
                    put(CICSLexer.EVENTNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.EXCEPTCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.EXCI, ErrorSeverity.ERROR);
                    put(CICSLexer.EXCLUSIVE, ErrorSeverity.ERROR);
                    put(CICSLexer.EXECKEY, ErrorSeverity.ERROR);
                    put(CICSLexer.EXECUTIONSET, ErrorSeverity.ERROR);
                    put(CICSLexer.EXIT, ErrorSeverity.ERROR);
                    put(CICSLexer.EXITPGM, ErrorSeverity.ERROR);
                    put(CICSLexer.EXITPROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.EXITTRACING, ErrorSeverity.ERROR);
                    put(CICSLexer.EXPIRYINT, ErrorSeverity.ERROR);
                    put(CICSLexer.EXPIRYINTMIN, ErrorSeverity.ERROR);
                    put(CICSLexer.EXTENDEDDSST, ErrorSeverity.ERROR);
                    put(CICSLexer.FACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.FACILITYLIKE, ErrorSeverity.ERROR);
                    put(CICSLexer.FACILITYTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.FCT, ErrorSeverity.ERROR);
                    put(CICSLexer.FEATUREKEY, ErrorSeverity.ERROR);
                    put(CICSLexer.FIELDLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.FIELDOFFSET, ErrorSeverity.ERROR);
                    put(CICSLexer.FILE, ErrorSeverity.ERROR);
                    put(CICSLexer.FILECOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.FILELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.FILENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.FILEPATH, ErrorSeverity.ERROR);
                    put(CICSLexer.FILTERVALUE, ErrorSeverity.ERROR);
                    put(CICSLexer.FLAGSET, ErrorSeverity.ERROR);
                    put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.FMHPARMST, ErrorSeverity.ERROR);
                    put(CICSLexer.FMHSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.FORCEQR, ErrorSeverity.ERROR);
                    put(CICSLexer.FORMATEDFST, ErrorSeverity.ERROR);
                    put(CICSLexer.FORMFEEDST, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCY, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCYHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCYMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.FREQUENCYSECS, ErrorSeverity.ERROR);
                    put(CICSLexer.FWDRECOVLOG, ErrorSeverity.ERROR);
                    put(CICSLexer.FWDRECOVLSN, ErrorSeverity.ERROR);
                    put(CICSLexer.FWDRECSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.GAENTRYNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.GALENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.GARBAGEINT, ErrorSeverity.ERROR);
                    put(CICSLexer.GAUSECOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.GCDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.GCHARS, ErrorSeverity.ERROR);
                    put(CICSLexer.GCODES, ErrorSeverity.ERROR);
                    put(CICSLexer.GCPOLICY, ErrorSeverity.ERROR);
                    put(CICSLexer.GENERICTCPS, ErrorSeverity.ERROR);
                    put(CICSLexer.GMMLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.GMMTEXT, ErrorSeverity.ERROR);
                    put(CICSLexer.GMMTRANID, ErrorSeverity.ERROR);
                    put(CICSLexer.GRNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.GRSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.GSDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.GTFSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.GUDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.HA, ErrorSeverity.ERROR);
                    put(CICSLexer.HEALTH, ErrorSeverity.ERROR);
                    put(CICSLexer.HEALTHABSTIM, ErrorSeverity.ERROR);
                    put(CICSLexer.HEALTHCHECK, ErrorSeverity.ERROR);
                    put(CICSLexer.HFORMST, ErrorSeverity.ERROR);
                    put(CICSLexer.HFS, ErrorSeverity.ERROR);
                    put(CICSLexer.HFSFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.HILIGHTST, ErrorSeverity.ERROR);
                    put(CICSLexer.HOLDSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.HOST, ErrorSeverity.ERROR);
                    put(CICSLexer.HOSTCODEPAGE, ErrorSeverity.ERROR);
                    put(CICSLexer.HOSTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.HOURS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDENTIFIER, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLEHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLEMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDLESECS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDNTYCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.IDPROP, ErrorSeverity.ERROR);
                    put(CICSLexer.INDIRECTNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.INDOUBT, ErrorSeverity.ERROR);
                    put(CICSLexer.INDOUBTMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.INDOUBTST, ErrorSeverity.ERROR);
                    put(CICSLexer.INDOUBTWAIT, ErrorSeverity.ERROR);
                    put(CICSLexer.INITHEAP, ErrorSeverity.ERROR);
                    put(CICSLexer.INITIALDDS, ErrorSeverity.ERROR);
                    put(CICSLexer.INITQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.INITSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.INSTALLAGENT, ErrorSeverity.ERROR);
                    put(CICSLexer.INSTALLTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.INSTALLUSRID, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVALHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVALMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.INTERVALSECS, ErrorSeverity.ERROR);
                    put(CICSLexer.INTSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.INVOKETYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.IOTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.IPADDRESS, ErrorSeverity.ERROR);
                    put(CICSLexer.IPCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.IPFACILITIES, ErrorSeverity.ERROR);
                    put(CICSLexer.IPFACILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.IPFACILTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.IPFAMILY, ErrorSeverity.ERROR);
                    put(CICSLexer.IPFLISTSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.IPRESOLVED, ErrorSeverity.ERROR);
                    put(CICSLexer.ISOLATEST, ErrorSeverity.ERROR);
                    put(CICSLexer.ITEMNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.JAVAHOME, ErrorSeverity.ERROR);
                    put(CICSLexer.JCT, ErrorSeverity.ERROR);
                    put(CICSLexer.JOBLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.JOBNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.JOURNALNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMENDPOINT, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMPROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.JVMSERVER, ErrorSeverity.ERROR);
                    put(CICSLexer.KATAKANAST, ErrorSeverity.ERROR);
                    put(CICSLexer.KEEPTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.KEYPOSITION, ErrorSeverity.ERROR);
                    put(CICSLexer.LANGDEDUCED, ErrorSeverity.ERROR);
                    put(CICSLexer.LANGUAGE, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTACTTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTCOLDTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTEMERTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTINITTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTMODTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTUSEDINT, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTWARMTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LASTWRITTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LATSECDTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.LENGTHLIST, ErrorSeverity.ERROR);
                    put(CICSLexer.LERUNOPTS, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBRARY, ErrorSeverity.ERROR);
                    put(CICSLexer.LIBRARYDSN, ErrorSeverity.ERROR);
                    put(CICSLexer.LIGHTPENST, ErrorSeverity.ERROR);
                    put(CICSLexer.LINK, ErrorSeverity.ERROR);
                    put(CICSLexer.LINKAUTH, ErrorSeverity.ERROR);
                    put(CICSLexer.LINKSYSNET, ErrorSeverity.ERROR);
                    put(CICSLexer.LINKSYSTEM, ErrorSeverity.ERROR);
                    put(CICSLexer.LISTSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.LOADPOINT, ErrorSeverity.ERROR);
                    put(CICSLexer.LOADTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.LOCATION, ErrorSeverity.ERROR);
                    put(CICSLexer.LOG, ErrorSeverity.ERROR);
                    put(CICSLexer.LOGDEFER, ErrorSeverity.ERROR);
                    put(CICSLexer.LOGREPSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.LOSTLOCKS, ErrorSeverity.ERROR);
                    put(CICSLexer.LPASTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.LSRPOOLNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAJORVERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPPINGLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPPINGRNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPPINGVNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAPSETNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXACTIVE, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXDATALEN, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXHEAP, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXIMUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXITEMLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXNUMRECS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXOPENTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXPERSIST, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXQTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXREQS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXSOCKETS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXSSLTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXTASKS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXTHRDTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXWINNERS, ErrorSeverity.ERROR);
                    put(CICSLexer.MAXXPTCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.MEDIATYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.MEMBER, ErrorSeverity.ERROR);
                    put(CICSLexer.MEMBERNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MEMLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.MESSAGECASE, ErrorSeverity.ERROR);
                    put(CICSLexer.METADATAFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.MGMTPART, ErrorSeverity.ERROR);
                    put(CICSLexer.MICROVERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.MINITEMLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.MINORVERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.MINRUNLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.MINRUNRNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MINRUNVNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.MINUTES, ErrorSeverity.ERROR);
                    put(CICSLexer.MIRRORLIFE, ErrorSeverity.ERROR);
                    put(CICSLexer.MODE, ErrorSeverity.ERROR);
                    put(CICSLexer.MODENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MONDATA, ErrorSeverity.ERROR);
                    put(CICSLexer.MONSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.MONUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.MQCONN, ErrorSeverity.ERROR);
                    put(CICSLexer.MQINI, ErrorSeverity.ERROR);
                    put(CICSLexer.MQMONITOR, ErrorSeverity.ERROR);
                    put(CICSLexer.MQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MQQMGR, ErrorSeverity.ERROR);
                    put(CICSLexer.MQRELEASE, ErrorSeverity.ERROR);
                    put(CICSLexer.MROBATCH, ErrorSeverity.ERROR);
                    put(CICSLexer.MSGFORMAT, ErrorSeverity.ERROR);
                    put(CICSLexer.MSGQUEUE1, ErrorSeverity.ERROR);
                    put(CICSLexer.MSGQUEUE2, ErrorSeverity.ERROR);
                    put(CICSLexer.MSGQUEUE3, ErrorSeverity.ERROR);
                    put(CICSLexer.MSRCONTROLST, ErrorSeverity.ERROR);
                    put(CICSLexer.MTOMNOXOPST, ErrorSeverity.ERROR);
                    put(CICSLexer.MTOMST, ErrorSeverity.ERROR);
                    put(CICSLexer.MVSSMFID, ErrorSeverity.ERROR);
                    put(CICSLexer.MVSSYSNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.MVSTCB, ErrorSeverity.ERROR);
                    put(CICSLexer.NAMESPACE, ErrorSeverity.ERROR);
                    put(CICSLexer.NATLANG, ErrorSeverity.ERROR);
                    put(CICSLexer.NATURE, ErrorSeverity.ERROR);
                    put(CICSLexer.NETNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.NETUOWID, ErrorSeverity.ERROR);
                    put(CICSLexer.NETWORK, ErrorSeverity.ERROR);
                    put(CICSLexer.NETWORKID, ErrorSeverity.ERROR);
                    put(CICSLexer.NEWSECDCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXTTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXTTIMEHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXTTIMEMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXTTIMESECS, ErrorSeverity.ERROR);
                    put(CICSLexer.NEXTTRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.NODEHOME, ErrorSeverity.ERROR);
                    put(CICSLexer.NODEJSAPP, ErrorSeverity.ERROR);
                    put(CICSLexer.NONTERMREL, ErrorSeverity.ERROR);
                    put(CICSLexer.NQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMCIPHERS, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMDATAPRD, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMDSNAMES, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMELEMENTS, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMEXITS, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMINFOSRCE, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMITEMS, ErrorSeverity.ERROR);
                    put(CICSLexer.NUMOPTPRED, ErrorSeverity.ERROR);
                    put(CICSLexer.OBFORMATST, ErrorSeverity.ERROR);
                    put(CICSLexer.OBJECT, ErrorSeverity.ERROR);
                    put(CICSLexer.OBOPERIDST, ErrorSeverity.ERROR);
                    put(CICSLexer.OCCUPANCY, ErrorSeverity.ERROR);
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
                    put(CICSLexer.OPERATOR, ErrorSeverity.ERROR);
                    put(CICSLexer.OPERID, ErrorSeverity.ERROR);
                    put(CICSLexer.OPREL, ErrorSeverity.ERROR);
                    put(CICSLexer.OPSYS, ErrorSeverity.ERROR);
                    put(CICSLexer.OPTIONNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.OPTIONSPGM, ErrorSeverity.ERROR);
                    put(CICSLexer.OSGIBUNDLE, ErrorSeverity.ERROR);
                    put(CICSLexer.OSGIBUNDLEID, ErrorSeverity.ERROR);
                    put(CICSLexer.OSGISERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.OSGISTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.OSGIVERSION, ErrorSeverity.ERROR);
                    put(CICSLexer.OSLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.OTSTID, ErrorSeverity.ERROR);
                    put(CICSLexer.OTSTIMEOUT, ErrorSeverity.ERROR);
                    put(CICSLexer.OUTLINEST, ErrorSeverity.ERROR);
                    put(CICSLexer.PAGEHT, ErrorSeverity.ERROR);
                    put(CICSLexer.PAGESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.PAGEWD, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTITIONSST, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTNER, ErrorSeverity.ERROR);
                    put(CICSLexer.PARTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PATH, ErrorSeverity.ERROR);
                    put(CICSLexer.PCDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.PCT, ErrorSeverity.ERROR);
                    put(CICSLexer.PENDSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.PERFCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.PGMINTERFACE, ErrorSeverity.ERROR);
                    put(CICSLexer.PID, ErrorSeverity.ERROR);
                    put(CICSLexer.PIPELINE, ErrorSeverity.ERROR);
                    put(CICSLexer.PLAN, ErrorSeverity.ERROR);
                    put(CICSLexer.PLANEXITNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.PLATFORM, ErrorSeverity.ERROR);
                    put(CICSLexer.PLTPIUSR, ErrorSeverity.ERROR);
                    put(CICSLexer.POLICY, ErrorSeverity.ERROR);
                    put(CICSLexer.POLICYRULE, ErrorSeverity.ERROR);
                    put(CICSLexer.POOLNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.PORT, ErrorSeverity.ERROR);
                    put(CICSLexer.PPT, ErrorSeverity.ERROR);
                    put(CICSLexer.PREFIX, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIMPRED, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIMPREDOP, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIMPREDTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PRINTADAPTST, ErrorSeverity.ERROR);
                    put(CICSLexer.PRINTCONTROL, ErrorSeverity.ERROR);
                    put(CICSLexer.PRINTER, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.PRIVACY, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.PROCESSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROFILEDIR, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGAUTOCTLG, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGAUTOEXIT, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGAUTOINST, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGSYMBOLST, ErrorSeverity.ERROR);
                    put(CICSLexer.PROGTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PROTECTNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.PROTOCOL, ErrorSeverity.ERROR);
                    put(CICSLexer.PRTCOPYST, ErrorSeverity.ERROR);
                    put(CICSLexer.PRTYAGING, ErrorSeverity.ERROR);
                    put(CICSLexer.PSB, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTERVAL, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTHRS, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTMINS, ErrorSeverity.ERROR);
                    put(CICSLexer.PSDINTSECS, ErrorSeverity.ERROR);
                    put(CICSLexer.PSTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.PTHREADS, ErrorSeverity.ERROR);
                    put(CICSLexer.PUDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGEABILITY, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGEABLEST, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGEACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGECYCLEM, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGECYCLES, ErrorSeverity.ERROR);
                    put(CICSLexer.PURGETHRESH, ErrorSeverity.ERROR);
                    put(CICSLexer.QNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.QUALIFIER, ErrorSeverity.ERROR);
                    put(CICSLexer.QUALLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.QUERYST, ErrorSeverity.ERROR);
                    put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.QUEUED, ErrorSeverity.ERROR);
                    put(CICSLexer.QUEUELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.QUIESCESTATE, ErrorSeverity.ERROR);
                    put(CICSLexer.RANKING, ErrorSeverity.ERROR);
                    put(CICSLexer.RBATYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.READ, ErrorSeverity.ERROR);
                    put(CICSLexer.READINTEG, ErrorSeverity.ERROR);
                    put(CICSLexer.REALM, ErrorSeverity.ERROR);
                    put(CICSLexer.REALMLEN, ErrorSeverity.ERROR);
                    put(CICSLexer.REASON, ErrorSeverity.ERROR);
                    put(CICSLexer.RECEIVECOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDFORMAT, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDING, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDLENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.RECORDSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.RECOVSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.REDIRECTTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.REENTPROTECT, ErrorSeverity.ERROR);
                    put(CICSLexer.REGIONUSERID, ErrorSeverity.ERROR);
                    put(CICSLexer.RELATION, ErrorSeverity.ERROR);
                    put(CICSLexer.RELEASE, ErrorSeverity.ERROR);
                    put(CICSLexer.RELREQST, ErrorSeverity.ERROR);
                    put(CICSLexer.RELTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.REMOTENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.REMOTEPREFIX, ErrorSeverity.ERROR);
                    put(CICSLexer.REMOTESYSNET, ErrorSeverity.ERROR);
                    put(CICSLexer.REMOTESYSTEM, ErrorSeverity.ERROR);
                    put(CICSLexer.REMOTETABLE, ErrorSeverity.ERROR);
                    put(CICSLexer.REPLICATION, ErrorSeverity.ERROR);
                    put(CICSLexer.REQID, ErrorSeverity.ERROR);
                    put(CICSLexer.REQTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RES, ErrorSeverity.ERROR);
                    put(CICSLexer.RESCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.RESIDENCY, ErrorSeverity.ERROR);
                    put(CICSLexer.RESNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.RESOURCENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.RESOURCETYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RESPWAIT, ErrorSeverity.ERROR);
                    put(CICSLexer.RESRCECLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.RESSEC, ErrorSeverity.ERROR);
                    put(CICSLexer.RESYNCMEMBER, ErrorSeverity.ERROR);
                    put(CICSLexer.RESYNCNUMBER, ErrorSeverity.ERROR);
                    put(CICSLexer.RESYNCSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.RETLOCKS, ErrorSeverity.ERROR);
                    put(CICSLexer.REUSELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.REWIND, ErrorSeverity.ERROR);
                    put(CICSLexer.RLSACCESS, ErrorSeverity.ERROR);
                    put(CICSLexer.RLSSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.RMIQFY, ErrorSeverity.ERROR);
                    put(CICSLexer.RMIST, ErrorSeverity.ERROR);
                    put(CICSLexer.ROLE, ErrorSeverity.ERROR);
                    put(CICSLexer.ROUTESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.ROUTING, ErrorSeverity.ERROR);
                    put(CICSLexer.RTERMID, ErrorSeverity.ERROR);
                    put(CICSLexer.RTIMEOUT, ErrorSeverity.ERROR);
                    put(CICSLexer.RTRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.RULEGROUP, ErrorSeverity.ERROR);
                    put(CICSLexer.RULEITEM, ErrorSeverity.ERROR);
                    put(CICSLexer.RULETYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNAWAY, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNAWAYTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.RUNTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.SCANDELAY, ErrorSeverity.ERROR);
                    put(CICSLexer.SCHEMALEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.SCHEME, ErrorSeverity.ERROR);
                    put(CICSLexer.SCRNHT, ErrorSeverity.ERROR);
                    put(CICSLexer.SCRNSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.SCRNWD, ErrorSeverity.ERROR);
                    put(CICSLexer.SDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.SDTMEMLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.SDTRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.SEARCHPOS, ErrorSeverity.ERROR);
                    put(CICSLexer.SECDCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.SECONDS, ErrorSeverity.ERROR);
                    put(CICSLexer.SECPORT, ErrorSeverity.ERROR);
                    put(CICSLexer.SECRECORDING, ErrorSeverity.ERROR);
                    put(CICSLexer.SECURITY, ErrorSeverity.ERROR);
                    put(CICSLexer.SECURITYMGR, ErrorSeverity.ERROR);
                    put(CICSLexer.SECURITYNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.SECURITYST, ErrorSeverity.ERROR);
                    put(CICSLexer.SENDCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.SENDMTOMST, ErrorSeverity.ERROR);
                    put(CICSLexer.SERVSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SESSIONTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.SET, ErrorSeverity.ERROR);
                    put(CICSLexer.SETTRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.SHARELOCKS, ErrorSeverity.ERROR);
                    put(CICSLexer.SHARESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SHELF, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTDOWN, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTDOWNST, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTOPTION, ErrorSeverity.ERROR);
                    put(CICSLexer.SHUTSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SIGNID, ErrorSeverity.ERROR);
                    put(CICSLexer.SIGNONSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SINGLESTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SOAPLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.SOAPRNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.SOAPVNUM, ErrorSeverity.ERROR);
                    put(CICSLexer.SOCKETCLOSE, ErrorSeverity.ERROR);
                    put(CICSLexer.SOCKPOOLSIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.SOSABOVEBAR, ErrorSeverity.ERROR);
                    put(CICSLexer.SOSABOVELINE, ErrorSeverity.ERROR);
                    put(CICSLexer.SOSBELOWLINE, ErrorSeverity.ERROR);
                    put(CICSLexer.SOSIST, ErrorSeverity.ERROR);
                    put(CICSLexer.SOSSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SPECIFTCPS, ErrorSeverity.ERROR);
                    put(CICSLexer.SPIST, ErrorSeverity.ERROR);
                    put(CICSLexer.SRRSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SRRTASKS, ErrorSeverity.ERROR);
                    put(CICSLexer.SRVCNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.SRVCSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SSLCACHE, ErrorSeverity.ERROR);
                    put(CICSLexer.SSLTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.STANDBYMODE, ErrorSeverity.ERROR);
                    put(CICSLexer.STARTCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.STARTSCRIPT, ErrorSeverity.ERROR);
                    put(CICSLexer.STARTSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.STARTUP, ErrorSeverity.ERROR);
                    put(CICSLexer.STARTUPDATE, ErrorSeverity.ERROR);
                    put(CICSLexer.STATE, ErrorSeverity.ERROR);
                    put(CICSLexer.STATSQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.STATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.STDERR, ErrorSeverity.ERROR);
                    put(CICSLexer.STDOUT, ErrorSeverity.ERROR);
                    put(CICSLexer.STORAGECLEAR, ErrorSeverity.ERROR);
                    put(CICSLexer.STOREPROTECT, ErrorSeverity.ERROR);
                    put(CICSLexer.STREAMNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.STRINGS, ErrorSeverity.ERROR);
                    put(CICSLexer.STRUCTNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.SUBPOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.SUBTASKS, ErrorSeverity.ERROR);
                    put(CICSLexer.SUSPENDTIME, ErrorSeverity.ERROR);
                    put(CICSLexer.SUSPENDTYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.SUSPENDVALUE, ErrorSeverity.ERROR);
                    put(CICSLexer.SWITCHSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.SYNCPOINTST, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSDUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSDUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSID, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSOUTCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSTEMLOG, ErrorSeverity.ERROR);
                    put(CICSLexer.SYSTEMSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLE, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.TABLESIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.TALENGTH, ErrorSeverity.ERROR);
                    put(CICSLexer.TARGETCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.TASK, ErrorSeverity.ERROR);
                    put(CICSLexer.TASKDATAKEY, ErrorSeverity.ERROR);
                    put(CICSLexer.TASKDATALOC, ErrorSeverity.ERROR);
                    put(CICSLexer.TASKID, ErrorSeverity.ERROR);
                    put(CICSLexer.TASKS, ErrorSeverity.ERROR);
                    put(CICSLexer.TASKSTARTST, ErrorSeverity.ERROR);
                    put(CICSLexer.TCAMCONTROL, ErrorSeverity.ERROR);
                    put(CICSLexer.TCB, ErrorSeverity.ERROR);
                    put(CICSLexer.TCBLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TCBS, ErrorSeverity.ERROR);
                    put(CICSLexer.TCEXITSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.TCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TEMPLATENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.TEMPLATETYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMID, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMPRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TERMSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.TEXTKYBDST, ErrorSeverity.ERROR);
                    put(CICSLexer.TEXTPRINTST, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADCOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADERROR, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADS, ErrorSeverity.ERROR);
                    put(CICSLexer.THREADWAIT, ErrorSeverity.ERROR);
                    put(CICSLexer.THRESHOLD, ErrorSeverity.ERROR);
                    put(CICSLexer.TIME, ErrorSeverity.ERROR);
                    put(CICSLexer.TIMEOUTINT, ErrorSeverity.ERROR);
                    put(CICSLexer.TNADDR, ErrorSeverity.ERROR);
                    put(CICSLexer.TNIPFAMILY, ErrorSeverity.ERROR);
                    put(CICSLexer.TNPORT, ErrorSeverity.ERROR);
                    put(CICSLexer.TPNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.TPNAMELEN, ErrorSeverity.ERROR);
                    put(CICSLexer.TRACE, ErrorSeverity.ERROR);
                    put(CICSLexer.TRACING, ErrorSeverity.ERROR);
                    put(CICSLexer.TRAN, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANCLASS, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANDUMPCODE, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANDUMPING, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANISOLATE, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANPRIORITY, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
                    put(CICSLexer.TRANSMODE, ErrorSeverity.ERROR);
                    put(CICSLexer.TRIGGERLEVEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TRIGMONTASKS, ErrorSeverity.ERROR);
                    put(CICSLexer.TRPROF, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMAININUSE, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMAINLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TSMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.TSPOOL, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQUEUE, ErrorSeverity.ERROR);
                    put(CICSLexer.TSQUEUELIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.TST, ErrorSeverity.ERROR);
                    put(CICSLexer.TTISTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.TWASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.TYPE, ErrorSeverity.ERROR);
                    put(CICSLexer.UCTRANST, ErrorSeverity.ERROR);
                    put(CICSLexer.UDSASIZE, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWLINK, ErrorSeverity.ERROR);
                    put(CICSLexer.UOWSTATE, ErrorSeverity.ERROR);
                    put(CICSLexer.UPDATE, ErrorSeverity.ERROR);
                    put(CICSLexer.UPDATEMODEL, ErrorSeverity.ERROR);
                    put(CICSLexer.URID, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
                    put(CICSLexer.URIMAPLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.URM, ErrorSeverity.ERROR);
                    put(CICSLexer.USAGE, ErrorSeverity.ERROR);
                    put(CICSLexer.USECOUNT, ErrorSeverity.ERROR);
                    put(CICSLexer.USER, ErrorSeverity.ERROR);
                    put(CICSLexer.USERAREA, ErrorSeverity.ERROR);
                    put(CICSLexer.USERAREALEN, ErrorSeverity.ERROR);
                    put(CICSLexer.USERAUTH, ErrorSeverity.ERROR);
                    put(CICSLexer.USERCORRDATA, ErrorSeverity.ERROR);
                    put(CICSLexer.USERID, ErrorSeverity.ERROR);
                    put(CICSLexer.USERNAME, ErrorSeverity.ERROR);
                    put(CICSLexer.USERSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.USERTAG, ErrorSeverity.ERROR);
                    put(CICSLexer.UTIL, ErrorSeverity.ERROR);
                    put(CICSLexer.VALIDATIONST, ErrorSeverity.ERROR);
                    put(CICSLexer.VALIDITY, ErrorSeverity.ERROR);
                    put(CICSLexer.VALUE, ErrorSeverity.ERROR);
                    put(CICSLexer.VARIABLENAME, ErrorSeverity.ERROR);
                    put(CICSLexer.VFORMST, ErrorSeverity.ERROR);
                    put(CICSLexer.WAITCAUSE, ErrorSeverity.ERROR);
                    put(CICSLexer.WAITSTATE, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
                    put(CICSLexer.WEBSERVLIMIT, ErrorSeverity.ERROR);
                    put(CICSLexer.WLMOPENST, ErrorSeverity.ERROR);
                    put(CICSLexer.WORKDIR, ErrorSeverity.ERROR);
                    put(CICSLexer.WSBIND, ErrorSeverity.ERROR);
                    put(CICSLexer.WSDIR, ErrorSeverity.ERROR);
                    put(CICSLexer.WSDLFILE, ErrorSeverity.ERROR);
                    put(CICSLexer.XCFGROUP, ErrorSeverity.ERROR);
                    put(CICSLexer.XID, ErrorSeverity.ERROR);
                    put(CICSLexer.XLNSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.XMLSCHEMA, ErrorSeverity.ERROR);
                    put(CICSLexer.XMLTRANSFORM, ErrorSeverity.ERROR);
                    put(CICSLexer.XOPDIRECTST, ErrorSeverity.ERROR);
                    put(CICSLexer.XOPSUPPORTST, ErrorSeverity.ERROR);
                    put(CICSLexer.XRFSTATUS, ErrorSeverity.ERROR);
                    put(CICSLexer.XSDBIND, ErrorSeverity.ERROR);
                    put(CICSLexer.ZCPTRACING, ErrorSeverity.ERROR);
                    put(CICSLexer.AFTER, ErrorSeverity.WARNING);
                    put(CICSLexer.ASSOCIATION, ErrorSeverity.WARNING);
                    put(CICSLexer.AT, ErrorSeverity.WARNING);
                    put(CICSLexer.AUTOINSTALL, ErrorSeverity.WARNING);
                    put(CICSLexer.CAPDATAPRED, ErrorSeverity.WARNING);
                    put(CICSLexer.CAPINFOSRCE, ErrorSeverity.WARNING);
                    put(CICSLexer.CAPOPTPRED, ErrorSeverity.WARNING);
                    put(CICSLexer.DELETSHIPPED, ErrorSeverity.WARNING);
                    put(CICSLexer.DISPATCHABLE, ErrorSeverity.WARNING);
                    put(CICSLexer.DISPATCHER, ErrorSeverity.WARNING);
                    put(CICSLexer.DUMPDS, ErrorSeverity.WARNING);
                    put(CICSLexer.END, ErrorSeverity.WARNING);
                    put(CICSLexer.ENQ, ErrorSeverity.WARNING);
                    put(CICSLexer.EPADAPTINSET, ErrorSeverity.WARNING);
                    put(CICSLexer.EVENTPROCESS, ErrorSeverity.WARNING);
                    put(CICSLexer.INQUIRE, ErrorSeverity.WARNING);
                    put(CICSLexer.IRC, ErrorSeverity.WARNING);
                    put(CICSLexer.LIST, ErrorSeverity.WARNING);
                    put(CICSLexer.MONITOR, ErrorSeverity.WARNING);
                    put(CICSLexer.NEXT, ErrorSeverity.WARNING);
                    put(CICSLexer.RRMS, ErrorSeverity.WARNING);
                    put(CICSLexer.RUNNING, ErrorSeverity.WARNING);
                    put(CICSLexer.SECDISCOVERY, ErrorSeverity.WARNING);
                    put(CICSLexer.SPECIAL, ErrorSeverity.WARNING);
                    put(CICSLexer.STANDARD, ErrorSeverity.WARNING);
                    put(CICSLexer.START, ErrorSeverity.WARNING);
                    put(CICSLexer.STATISTICS, ErrorSeverity.WARNING);
                    put(CICSLexer.STORAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.STORAGE64, ErrorSeverity.WARNING);
                    put(CICSLexer.SUSPENDED, ErrorSeverity.WARNING);
                    put(CICSLexer.SYSTEM, ErrorSeverity.WARNING);
                    put(CICSLexer.TAG, ErrorSeverity.WARNING);
                    put(CICSLexer.TCPIP, ErrorSeverity.WARNING);
                    put(CICSLexer.TEMPSTORAGE, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACEDEST, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACEFLAG, ErrorSeverity.WARNING);
                    put(CICSLexer.TRACETYPE, ErrorSeverity.WARNING);
                    put(CICSLexer.UOWDSNFAIL, ErrorSeverity.WARNING);
                    put(CICSLexer.UOWENQ, ErrorSeverity.WARNING);
                    put(CICSLexer.VTAM, ErrorSeverity.WARNING);
                    put(CICSLexer.WEB, ErrorSeverity.WARNING);
                    put(CICSLexer.WLMHEALTH, ErrorSeverity.WARNING);
                }
            };

    public CICSInquireSPOptionsCheckUtility(
            DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS SP Inquire rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        switch (ctx.getRuleIndex()) {
            case CICSParser.RULE_cics_inquire_association_list:
                CICSParser.Cics_inquire_association_listContext listContext =
                        (CICSParser.Cics_inquire_association_listContext) ctx;
                checkHasMandatoryOptions(listContext.LIST(), ctx, "LIST");
                checkHasMandatoryOptions(listContext.LISTSIZE(), ctx, "LISTSIZE");
                break;

            case CICSParser.RULE_cics_inquire_bundle:
                CICSParser.Cics_inquire_bundleContext bundleContext =
                        (CICSParser.Cics_inquire_bundleContext) ctx;
                checkBrowseMutuallyExclusive(bundleContext);
                if (!bundleContext.START().isEmpty() || !bundleContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(bundleContext, CICSParser.BUNDLE);
                } else checkStatementHasParameter(bundleContext, CICSParser.BUNDLE);
                break;

            case CICSParser.RULE_cics_inquire_bundlepart:
                CICSParser.Cics_inquire_bundlepartContext bundlepartContext =
                        (CICSParser.Cics_inquire_bundlepartContext) ctx;
                checkBrowseMutuallyExclusive(bundlepartContext);
                if (!bundlepartContext.START().isEmpty() || !bundlepartContext.END().isEmpty()) {
                    if (bundlepartContext.END().isEmpty())
                        checkHasMandatoryOptions(
                                bundlepartContext.BUNDLE(), bundlepartContext, "BUNDLE with START");
                    else checkHasIllegalOptions(bundlepartContext.BUNDLE(), "BUNDLE with END");
                    checkBrowsingInvalidOptions(bundlepartContext, CICSParser.BUNDLEPART, CICSParser.BUNDLE);
                } else checkStatementHasParameter(bundlepartContext, CICSParser.BUNDLEPART);
                break;

            case CICSParser.RULE_cics_inquire_capdatapred:
                CICSParser.Cics_inquire_capdatapredContext capdatapredContext =
                        (CICSParser.Cics_inquire_capdatapredContext) ctx;
                checkHasExactlyOneOption(
                        "START or END or NEXT",
                        capdatapredContext,
                        capdatapredContext.START(),
                        capdatapredContext.END(),
                        capdatapredContext.NEXT());
                if (!capdatapredContext.START().isEmpty() || !capdatapredContext.END().isEmpty()) {
                    if (!capdatapredContext.START().isEmpty()) {
                        checkHasMandatoryOptions(
                                capdatapredContext.CAPTURESPEC(), capdatapredContext, "CAPTURESPEC with START");
                        checkHasMandatoryOptions(
                                capdatapredContext.EVENTBINDING(), capdatapredContext, "EVENTBINDING with START");
                    } else {
                        checkHasIllegalOptions(capdatapredContext.CAPTURESPEC(), "CAPTURESPEC with END");
                        checkHasIllegalOptions(capdatapredContext.EVENTBINDING(), "EVENTBINDING with END");
                    }
                    checkBrowsingInvalidOptions(
                            capdatapredContext,
                            CICSParser.CAPDATAPRED,
                            CICSParser.CAPTURESPEC,
                            CICSParser.EVENTBINDING);
                } else if (!capdatapredContext.NEXT().isEmpty()) {
                    checkHasIllegalOptions(capdatapredContext.CAPTURESPEC(), "CAPTURESPEC with NEXT");
                    checkHasIllegalOptions(capdatapredContext.EVENTBINDING(), "EVENTBINDING with NEXT");
                }
                break;

            case CICSParser.RULE_cics_inquire_capinfosrce:
                CICSParser.Cics_inquire_capinfosrceContext capinfosrceContext =
                        (CICSParser.Cics_inquire_capinfosrceContext) ctx;
                checkHasExactlyOneOption(
                        "START or END or NEXT",
                        capinfosrceContext,
                        capinfosrceContext.START(),
                        capinfosrceContext.END(),
                        capinfosrceContext.NEXT());
                if (!capinfosrceContext.START().isEmpty() || !capinfosrceContext.END().isEmpty()) {
                    if (!capinfosrceContext.START().isEmpty()) {
                        checkHasMandatoryOptions(
                                capinfosrceContext.CAPTURESPEC(), capinfosrceContext, "CAPTURESPEC with START");
                        checkHasMandatoryOptions(
                                capinfosrceContext.EVENTBINDING(), capinfosrceContext, "EVENTBINDING with START");
                    } else {
                        checkHasIllegalOptions(capinfosrceContext.CAPTURESPEC(), "CAPTURESPEC with END");
                        checkHasIllegalOptions(capinfosrceContext.EVENTBINDING(), "EVENTBINDING with END");
                    }
                    checkBrowsingInvalidOptions(
                            capinfosrceContext,
                            CICSParser.CAPINFOSRCE,
                            CICSParser.CAPTURESPEC,
                            CICSParser.EVENTBINDING);
                } else if (!capinfosrceContext.NEXT().isEmpty()) {
                    checkHasIllegalOptions(capinfosrceContext.CAPTURESPEC(), "CAPTURESPEC with NEXT");
                    checkHasIllegalOptions(capinfosrceContext.EVENTBINDING(), "EVENTBINDING with NEXT");
                }
                break;

            case CICSParser.RULE_cics_inquire_capoptpred:
                CICSParser.Cics_inquire_capoptpredContext capoptpredContext =
                        (CICSParser.Cics_inquire_capoptpredContext) ctx;
                checkHasExactlyOneOption(
                        "START or END or NEXT",
                        capoptpredContext,
                        capoptpredContext.START(),
                        capoptpredContext.END(),
                        capoptpredContext.NEXT());
                if (!capoptpredContext.START().isEmpty() || !capoptpredContext.END().isEmpty()) {
                    if (!capoptpredContext.START().isEmpty()) {
                        checkHasMandatoryOptions(
                                capoptpredContext.CAPTURESPEC(), capoptpredContext, "CAPTURESPEC with START");
                        checkHasMandatoryOptions(
                                capoptpredContext.EVENTBINDING(), capoptpredContext, "EVENTBINDING with START");
                    } else {
                        checkHasIllegalOptions(capoptpredContext.CAPTURESPEC(), "CAPTURESPEC with END");
                        checkHasIllegalOptions(capoptpredContext.EVENTBINDING(), "EVENTBINDING with END");
                    }
                    checkBrowsingInvalidOptions(
                            capoptpredContext,
                            CICSParser.CAPOPTPRED,
                            CICSParser.CAPTURESPEC,
                            CICSParser.EVENTBINDING);
                } else if (!capoptpredContext.NEXT().isEmpty()) {
                    checkHasIllegalOptions(capoptpredContext.CAPTURESPEC(), "CAPTURESPEC with NEXT");
                    checkHasIllegalOptions(capoptpredContext.EVENTBINDING(), "EVENTBINDING with NEXT");
                }
                break;

            case CICSParser.RULE_cics_inquire_capturespec:
                CICSParser.Cics_inquire_capturespecContext capturespecContext =
                        (CICSParser.Cics_inquire_capturespecContext) ctx;
                checkBrowseMutuallyExclusive(capturespecContext);
                if (!capturespecContext.START().isEmpty() || !capturespecContext.END().isEmpty()) {
                    if (capturespecContext.END().isEmpty())
                        checkHasMandatoryOptions(
                                capturespecContext.EVENTBINDING(), capturespecContext, "EVENTBINDING with START");
                    else checkHasIllegalOptions(capturespecContext.EVENTBINDING(), "EVENTBINDING with END");
                    checkBrowsingInvalidOptions(
                            capturespecContext, CICSParser.CAPTURESPEC, CICSParser.EVENTBINDING);
                    checkBrowsingHasNotParameter(capturespecContext, CICSParser.CAPTURESPEC);
                } else checkStatementHasParameter(capturespecContext, CICSParser.CAPTURESPEC);
                break;

            case CICSParser.RULE_cics_inquire_deletshipped:
                CICSParser.Cics_inquire_deletshippedContext deletshippedContext =
                        (CICSParser.Cics_inquire_deletshippedContext) ctx;
                checkHasMutuallyExclusiveOptions(
                        "IDLEHRS with IDLE", deletshippedContext.IDLE(), deletshippedContext.IDLEHRS());
                checkHasMutuallyExclusiveOptions(
                        "IDLEMINS with IDLE", deletshippedContext.IDLE(), deletshippedContext.IDLEMINS());
                checkHasMutuallyExclusiveOptions(
                        "IDLESECS with IDLE", deletshippedContext.IDLE(), deletshippedContext.IDLESECS());
                if (!deletshippedContext.IDLEHRS().isEmpty()) {
                    checkHasMandatoryOptions(
                            deletshippedContext.IDLEMINS(), deletshippedContext, "IDLEMINS with IDLEHRS");
                    checkHasMandatoryOptions(
                            deletshippedContext.IDLESECS(),
                            deletshippedContext,
                            "IDLESECS with IDLEHRS and IDLEMINS");
                }
                checkHasMutuallyExclusiveOptions(
                        "INTERVAL with INTERVALHRS",
                        deletshippedContext.INTERVAL(),
                        deletshippedContext.INTERVALHRS());
                checkHasMutuallyExclusiveOptions(
                        "INTERVAL with INTERVALMINS",
                        deletshippedContext.INTERVAL(),
                        deletshippedContext.INTERVALMINS());
                checkHasMutuallyExclusiveOptions(
                        "INTERVAL with INTERVALSECS",
                        deletshippedContext.INTERVAL(),
                        deletshippedContext.INTERVALSECS());
                if (!deletshippedContext.INTERVALHRS().isEmpty()) {
                    checkHasMandatoryOptions(
                            deletshippedContext.INTERVALMINS(),
                            deletshippedContext,
                            "INTERVALMINS with INTERVALHRS");
                    checkHasMandatoryOptions(
                            deletshippedContext.INTERVALSECS(),
                            deletshippedContext,
                            "INTERVALSECS with INTERVALMINS and INTERVALHRS");
                }
                break;

            case CICSParser.RULE_cics_inquire_enq:
                CICSParser.Cics_inquire_enqContext enqContext = (CICSParser.Cics_inquire_enqContext) ctx;
                checkHasExactlyOneOption(
                        "START or END or NEXT",
                        enqContext,
                        enqContext.START(),
                        enqContext.END(),
                        enqContext.NEXT());
                checkHasMutuallyExclusiveOptions(
                        "ENQSCOPE or RESOURCE or UOW or END",
                        enqContext.ENQSCOPE(),
                        enqContext.RESOURCE(),
                        enqContext.UOW(),
                        enqContext.END());
                if (!enqContext.START().isEmpty() || !enqContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(
                            enqContext,
                            CICSParser.ENQ,
                            CICSParser.ENQSCOPE,
                            CICSParser.RESOURCE,
                            CICSParser.RESLEN,
                            CICSParser.UOW);
                }

                if (!enqContext.RESOURCE().isEmpty())
                    checkHasMandatoryOptions(enqContext.RESLEN(), ctx, "RESLEN with RESOURCE");
                else checkHasIllegalOptions(enqContext.RESLEN(), "RESLEN without RESOURCE");

                break;

            case CICSParser.RULE_cics_inquire_epadaptinset:
                CICSParser.Cics_inquire_epadaptinsetContext epadaptinsetContext =
                        (CICSParser.Cics_inquire_epadaptinsetContext) ctx;
                checkBrowseMutuallyExclusive(epadaptinsetContext);
                if (!epadaptinsetContext.START().isEmpty() || !epadaptinsetContext.END().isEmpty()) {
                    checkHasIllegalOptions(epadaptinsetContext.EPADAPTER(), "EPADAPTER with START or END");
                    if (!epadaptinsetContext.END().isEmpty())
                        checkHasIllegalOptions(
                                epadaptinsetContext.EPADAPTERSET(), "EPADAPTERSET with START or END");
                } else if (!epadaptinsetContext.NEXT().isEmpty())
                    checkHasIllegalOptions(epadaptinsetContext.EPADAPTERSET(), "EPADAPTERSET with NEXT");
                else {
                    checkHasMandatoryOptions(
                            epadaptinsetContext.EPADAPTERSET(),
                            epadaptinsetContext,
                            "EPADAPTERSET without Browsing");
                    checkHasMandatoryOptions(
                            epadaptinsetContext.EPADAPTER(), epadaptinsetContext, "EPADAPTER without Browsing");
                }
                break;

            case CICSParser.RULE_cics_inquire_exitprogram:
                CICSParser.Cics_inquire_exitprogramContext exitprogramContext =
                        (CICSParser.Cics_inquire_exitprogramContext) ctx;
                checkBrowseMutuallyExclusive(exitprogramContext);
                if (!exitprogramContext.START().isEmpty() || !exitprogramContext.END().isEmpty()) {
                    if (!exitprogramContext.END().isEmpty())
                        checkHasIllegalOptions(exitprogramContext.EXIT(), "EXIT with END");
                    checkBrowsingInvalidOptions(exitprogramContext, CICSParser.EXITPROGRAM, CICSParser.EXIT);
                    checkBrowsingHasNotParameter(exitprogramContext, CICSParser.EXITPROGRAM);
                } else if (!exitprogramContext.NEXT().isEmpty())
                    checkBrowsingHasNotParameter(exitprogramContext, CICSParser.EXITPROGRAM);
                else checkStatementHasParameter(exitprogramContext, CICSParser.EXITPROGRAM);
                break;

            case CICSParser.RULE_cics_inquire_featurekey:
                CICSParser.Cics_inquire_featurekeyContext featurekeyContext =
                        (CICSParser.Cics_inquire_featurekeyContext) ctx;
                checkBrowseMutuallyExclusive(featurekeyContext);
                if (!featurekeyContext.START().isEmpty() || !featurekeyContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(featurekeyContext, CICSParser.FEATUREKEY);
                    checkBrowsingHasNotParameter(featurekeyContext, CICSParser.FEATUREKEY);
                } else {
                    checkStatementHasParameter(featurekeyContext, CICSParser.FEATUREKEY);
                    checkHasMandatoryOptions(
                            featurekeyContext.VALUE(), featurekeyContext, "VALUE without START or END");
                }
                break;

            case CICSParser.RULE_cics_inquire_jvmendpoint:
                CICSParser.Cics_inquire_jvmendpointContext jvmendpointContext =
                        (CICSParser.Cics_inquire_jvmendpointContext) ctx;
                checkBrowseMutuallyExclusive(jvmendpointContext);
                if (!jvmendpointContext.START().isEmpty() || !jvmendpointContext.END().isEmpty()) {
                    if (jvmendpointContext.END().isEmpty())
                        checkHasMandatoryOptions(
                                jvmendpointContext.JVMSERVER(), jvmendpointContext, "JVMSERVER with START");
                    else checkHasIllegalOptions(jvmendpointContext.JVMSERVER(), "JVMSERVER with END");
                    checkBrowsingInvalidOptions(
                            jvmendpointContext, CICSParser.JVMENDPOINT, CICSParser.JVMSERVER);
                    checkBrowsingHasNotParameter(jvmendpointContext, CICSParser.JVMENDPOINT);
                } else checkStatementHasParameter(jvmendpointContext, CICSParser.JVMENDPOINT);
                break;

            case CICSParser.RULE_cics_inquire_modename:
                CICSParser.Cics_inquire_modenameContext modenameContext =
                        (CICSParser.Cics_inquire_modenameContext) ctx;
                checkBrowseMutuallyExclusive(modenameContext);
                if (!modenameContext.START().isEmpty() || !modenameContext.END().isEmpty()) {
                    checkHasIllegalOptions(modenameContext.CONNECTION(), "CONNECTION with START or END");
                    checkBrowsingInvalidOptions(modenameContext, CICSParser.MODENAME, CICSParser.CONNECTION);
                    checkBrowsingHasNotParameter(modenameContext, CICSParser.MODENAME);
                } else checkStatementHasParameter(modenameContext, CICSParser.MODENAME);
                break;

            case CICSParser.RULE_cics_inquire_mvstcb:
                CICSParser.Cics_inquire_mvstcbContext mvstcbContext =
                        (CICSParser.Cics_inquire_mvstcbContext) ctx;
                checkHasExactlyOneOption(
                        "START or END or NEXT",
                        mvstcbContext,
                        mvstcbContext.START(),
                        mvstcbContext.END(),
                        mvstcbContext.NEXT());
                if (!mvstcbContext.START().isEmpty() || !mvstcbContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(mvstcbContext, CICSParser.MVSTCB);
                    checkBrowsingHasNotParameter(mvstcbContext, CICSParser.MVSTCB);
                } else if (!mvstcbContext.NEXT().isEmpty()) {
                    checkStatementHasParameter(mvstcbContext, CICSParser.MVSTCB);
                }
                break;

            case CICSParser.RULE_cics_inquire_netname:
                CICSParser.Cics_inquire_netnameContext netnameContext =
                        (CICSParser.Cics_inquire_netnameContext) ctx;
                checkBrowseMutuallyExclusive(netnameContext);
                if (!netnameContext.START().isEmpty() || !netnameContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(netnameContext, CICSParser.NETNAME, CICSParser.TERMINAL);
                    checkBrowsingHasNotParameter(netnameContext, CICSParser.NETNAME);
                    checkStatementHasParameter(netnameContext, CICSParser.TERMINAL);
                } else checkStatementHasParameter(netnameContext, CICSParser.NETNAME);
                break;

            case CICSParser.RULE_cics_inquire_osgibundle:
                CICSParser.Cics_inquire_osgibundleContext osgibundleContext =
                        (CICSParser.Cics_inquire_osgibundleContext) ctx;
                checkBrowseMutuallyExclusive(osgibundleContext);
                if (!osgibundleContext.START().isEmpty() || !osgibundleContext.END().isEmpty()) {
                    if (osgibundleContext.END().isEmpty())
                        checkHasMandatoryOptions(
                                osgibundleContext.JVMSERVER(), osgibundleContext, "JVMSERVER with START");
                    else {
                        checkHasIllegalOptions(osgibundleContext.JVMSERVER(), "JVMSERVER with END");
                    }
                    checkHasIllegalOptions(osgibundleContext.OSGIVERSION(), "OSGIVERSION with START or END");
                    checkBrowsingInvalidOptions(
                            osgibundleContext,
                            CICSParser.OSGIBUNDLE,
                            CICSParser.OSGIVERSION,
                            CICSParser.JVMSERVER);
                    checkBrowsingHasNotParameter(osgibundleContext, CICSParser.OSGIBUNDLE);
                } else checkStatementHasParameter(osgibundleContext, CICSParser.OSGIBUNDLE);
                break;

            case CICSParser.RULE_cics_inquire_osgiservice:
                CICSParser.Cics_inquire_osgiserviceContext osgiserviceContext =
                        (CICSParser.Cics_inquire_osgiserviceContext) ctx;
                checkBrowseMutuallyExclusive(osgiserviceContext);
                if (!osgiserviceContext.START().isEmpty() || !osgiserviceContext.END().isEmpty()) {
                    if (osgiserviceContext.END().isEmpty())
                        checkHasMandatoryOptions(
                                osgiserviceContext.JVMSERVER(), osgiserviceContext, "JVMSERVER with START");
                    else {
                        checkHasIllegalOptions(osgiserviceContext.JVMSERVER(), "JVMSERVER with END");
                    }
                    checkBrowsingInvalidOptions(
                            osgiserviceContext, CICSParser.OSGISERVICE, CICSParser.JVMSERVER);
                    checkBrowsingHasNotParameter(osgiserviceContext, CICSParser.OSGISERVICE);
                } else checkStatementHasParameter(osgiserviceContext, CICSParser.OSGISERVICE);
                break;

            case CICSParser.RULE_cics_inquire_policyrule:
                CICSParser.Cics_inquire_policyruleContext policyruleContext =
                        (CICSParser.Cics_inquire_policyruleContext) ctx;
                checkBrowseMutuallyExclusive(policyruleContext);
                if (!policyruleContext.START().isEmpty() || !policyruleContext.END().isEmpty()) {
                    if (policyruleContext.END().isEmpty())
                        checkHasMandatoryOptions(
                                policyruleContext.POLICY(), policyruleContext, "POLICY with START");
                    else {
                        checkHasIllegalOptions(policyruleContext.POLICY(), "POLICY with END");
                    }
                    checkBrowsingInvalidOptions(policyruleContext, CICSParser.POLICYRULE, CICSParser.POLICY);
                    checkBrowsingHasNotParameter(policyruleContext, CICSParser.POLICYRULE);
                } else checkStatementHasParameter(policyruleContext, CICSParser.POLICYRULE);
                break;

            case CICSParser.RULE_cics_inquire_program:
                CICSParser.Cics_inquire_programContext programContext =
                        (CICSParser.Cics_inquire_programContext) ctx;
                checkBrowseMutuallyExclusive(programContext);
                if (programContext.START().isEmpty())
                    checkHasIllegalOptions(programContext.AT(), "AT without START");
                if (!programContext.START().isEmpty() || !programContext.END().isEmpty()) {
                    if (programContext.END().isEmpty())
                        checkBrowsingInvalidOptions(
                                programContext,
                                CICSParser.PROGRAM,
                                CICSParser.APPLICATION,
                                CICSParser.APPLMAJORVER,
                                CICSParser.APPLMINORVER,
                                CICSParser.APPLMICROVER,
                                CICSParser.PLATFORM);
                    else checkBrowsingInvalidOptions(programContext, CICSParser.PROGRAM);
                    checkBrowsingHasNotParameter(programContext, CICSParser.PROGRAM);
                } else checkStatementHasParameter(programContext, CICSParser.PROGRAM, CICSParser.AT);

                if (!programContext.NEXT().isEmpty())
                    checkHasIllegalOptions(programContext.AT(), "AT with NEXT");

                if (programContext.APPLICATION().isEmpty()) {
                    checkHasIllegalOptions(programContext.APPLMAJORVER(), "APPLMAJORVER without APPLICATION");
                    checkHasIllegalOptions(programContext.APPLMINORVER(), "APPLMINORVER without APPLICATION");
                    checkHasIllegalOptions(programContext.APPLMICROVER(), "APPLMICROVER without APPLICATION");
                } else {
                    checkHasMandatoryOptions(
                            programContext.APPLMAJORVER(), programContext, "APPLMAJORVER with APPLICATION");
                    checkHasMandatoryOptions(
                            programContext.APPLMINORVER(), programContext, "APPLMINORVER with APPLICATION");
                    checkHasMandatoryOptions(
                            programContext.APPLMICROVER(), programContext, "APPLMICROVER with APPLICATION");
                }
                break;

            case CICSParser.RULE_cics_inquire_reqid:
                CICSParser.Cics_inquire_reqidContext reqidContext =
                        (CICSParser.Cics_inquire_reqidContext) ctx;
                checkBrowseMutuallyExclusive(reqidContext);
                if (!reqidContext.START().isEmpty() || !reqidContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(reqidContext, CICSParser.REQID);
                    checkBrowsingHasNotParameter(reqidContext, CICSParser.REQID);
                } else {
                    checkStatementHasParameter(reqidContext, CICSParser.REQID);
                    if (reqidContext.SET().isEmpty()) {
                        checkHasIllegalOptions(reqidContext.LENGTH(), "LENGTH without SET");
                        checkHasIllegalOptions(reqidContext.FMHSTATUS(), "FMHSTATUS without SET");
                    } else if (reqidContext.LENGTH().isEmpty()) {
                        checkHasIllegalOptions(reqidContext.FMHSTATUS(), "FMHSTATUS without LENGTH");
                    }
                    checkHasMutuallyExclusiveOptions(
                            "INTERVAL with AT or AFTER",
                            reqidContext.INTERVAL(),
                            reqidContext.AT(),
                            reqidContext.AFTER());
                    if (!reqidContext.INTERVAL().isEmpty()) {
                        checkHasIllegalOptions(reqidContext.HOURS(), "HOURS with INTERVAL");
                        checkHasIllegalOptions(reqidContext.MINUTES(), "MINUTES with INTERVAL");
                        checkHasIllegalOptions(reqidContext.SECONDS(), "SECONDS with INTERVAL");
                    } else if (!reqidContext.AT().isEmpty() || !reqidContext.AFTER().isEmpty()) {
                        checkHasMandatoryOptions(reqidContext.HOURS(), reqidContext, "HOURS with AT or AFTER");
                        checkHasMandatoryOptions(
                                reqidContext.MINUTES(), reqidContext, "MINUTES with AT or AFTER");
                        checkHasMandatoryOptions(
                                reqidContext.SECONDS(), reqidContext, "SECONDS with AT or AFTER");
                    }
                }
                break;

            case CICSParser.RULE_cics_inquire_terminal:
                CICSParser.Cics_inquire_terminalContext terminalContext =
                        (CICSParser.Cics_inquire_terminalContext) ctx;
                checkBrowseMutuallyExclusive(terminalContext);
                if (!terminalContext.START().isEmpty() || !terminalContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(terminalContext, CICSParser.TERMINAL, CICSParser.NETNAME);
                    checkBrowsingHasNotParameter(terminalContext, CICSParser.TERMINAL);
                    checkStatementHasParameter(terminalContext, CICSParser.NETNAME);
                } else checkStatementHasParameter(terminalContext, CICSParser.TERMINAL);
                break;

            case CICSParser.RULE_cics_inquire_tranclass:
                CICSParser.Cics_inquire_tranclassContext tranclassContext =
                        (CICSParser.Cics_inquire_tranclassContext) ctx;
                checkBrowseMutuallyExclusive(tranclassContext);
                if (!tranclassContext.START().isEmpty() || !tranclassContext.END().isEmpty()) {
                    if (!tranclassContext.END().isEmpty())
                        checkHasIllegalOptions(tranclassContext.AT(), "AT with END");
                    checkBrowsingInvalidOptions(tranclassContext, CICSParser.TRANCLASS);
                    checkBrowsingHasNotParameter(tranclassContext, CICSParser.TRANCLASS);
                } else checkStatementHasParameter(tranclassContext, CICSParser.TRANCLASS);

                if (!tranclassContext.NEXT().isEmpty())
                    checkHasIllegalOptions(tranclassContext.AT(), "AT with NEXT");

                break;

            case CICSParser.RULE_cics_inquire_transaction: //TODO: COMMON
                CICSParser.Cics_inquire_transactionContext transactionContext =
                        (CICSParser.Cics_inquire_transactionContext) ctx;
                checkBrowsingCommon(transactionContext, CICSParser.TRANSACTION);
                if (!transactionContext.NEXT().isEmpty())
                    checkHasIllegalOptions(transactionContext.AT(), "AT with NEXT");
                break;

            case CICSParser.RULE_cics_inquire_tsqueue:
                CICSParser.Cics_inquire_tsqueueContext tsqueueContext =
                        (CICSParser.Cics_inquire_tsqueueContext) ctx;
                checkBrowseMutuallyExclusive(tsqueueContext);
                checkHasMutuallyExclusiveOptions(
                        "POOLNAME or SYSID", tsqueueContext.POOLNAME(), tsqueueContext.SYSID());
                if (!tsqueueContext.START().isEmpty() || !tsqueueContext.END().isEmpty()) {
                    if (!tsqueueContext.END().isEmpty())
                        checkHasIllegalOptions(tsqueueContext.AT(), "AT with END");
                    checkBrowsingInvalidOptions(
                            tsqueueContext,
                            CICSParser.TSQUEUE,
                            CICSParser.TSQNAME,
                            CICSParser.POOLNAME,
                            CICSParser.SYSID);
                    checkBrowsingHasNotParameter(tsqueueContext, CICSParser.TSQUEUE, CICSParser.TSQNAME);
                } else checkStatementHasParameter(tsqueueContext, CICSParser.TSQUEUE, CICSParser.TSQNAME);

                if (!tsqueueContext.NEXT().isEmpty())
                    checkHasIllegalOptions(tsqueueContext.AT(), "AT with NEXT");
                break;

            case CICSParser.RULE_cics_inquire_uowdsnfail:
                CICSParser.Cics_inquire_uowdsnfailContext uowdsnfailContext =
                        (CICSParser.Cics_inquire_uowdsnfailContext) ctx;
                checkHasExactlyOneOption(
                        "START or END or NEXT",
                        uowdsnfailContext,
                        uowdsnfailContext.START(),
                        uowdsnfailContext.END(),
                        uowdsnfailContext.NEXT());
                if (!uowdsnfailContext.START().isEmpty() || !uowdsnfailContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(uowdsnfailContext, CICSParser.UOW);
                }
                break;

            case CICSParser.RULE_cics_inquire_uowenq:
                CICSParser.Cics_inquire_uowenqContext uowenqContext =
                        (CICSParser.Cics_inquire_uowenqContext) ctx;
                checkHasExactlyOneOption(
                        "START or END or NEXT",
                        uowenqContext,
                        uowenqContext.START(),
                        uowenqContext.END(),
                        uowenqContext.NEXT());
                checkHasMutuallyExclusiveOptions(
                        "ENQSCOPE or RESOURCE or UOW or END",
                        uowenqContext.ENQSCOPE(),
                        uowenqContext.RESOURCE(),
                        uowenqContext.UOW(),
                        uowenqContext.END());
                if (!uowenqContext.START().isEmpty() || !uowenqContext.END().isEmpty()) {
                    checkBrowsingInvalidOptions(
                            uowenqContext,
                            CICSParser.ENQ,
                            CICSParser.ENQSCOPE,
                            CICSParser.RESOURCE,
                            CICSParser.RESLEN,
                            CICSParser.UOW);
                }
                if (!uowenqContext.RESOURCE().isEmpty())
                    checkHasMandatoryOptions(uowenqContext.RESLEN(), ctx, "RESLEN with RESOURCE");
                else checkHasIllegalOptions(uowenqContext.RESLEN(), "RESLEN without RESOURCE");

                break;

            default:
                Integer ruleToken = COMMON_INQUIRE_BROWSE_RULES.get(ctx.getRuleIndex());
                if (ruleToken != null) checkBrowsingCommon(ctx, ruleToken);
                break;
        }
        checkDuplicates(ctx);
    }
}
