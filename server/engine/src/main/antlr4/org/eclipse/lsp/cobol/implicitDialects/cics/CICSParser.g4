/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
parser grammar CICSParser;
options {tokenVocab = CICSLexer; superClass = MessageServiceParser;}

startRule: (cicsExecBlock | cicsDfhValue | cicsDfhResp | ~(EXEC_CICS|DFHRESP|DFHVALUE))* EOF;
compilerDirective: (.*? compilerOpts)* .*? EOF;
cicsExecBlock: EXEC_CICS (allCicsRule)* END_EXEC ;

allCicsRule: cics_send | cics_receive | cics_add | cics_address | cics_allocate | cics_asktime | cics_assign | cics_bif |
                       cics_build | cics_cancel | cics_change | cics_check | cics_connect | cics_converttime |
                       cics_define | cics_delay | cics_delete | cics_deleteq | cics_deq | cics_document | cics_dump | cics_endbr |
                       cics_endbrowse | cics_enq | cics_enter | cics_extract | cics_fetch | cics_force | cics_formattime | cics_free |
                       cics_freemain | cics_gds | cics_get | cics_getmain | cics_getmain64 | cics_getnext | cics_handle | cics_ignore |
                       cics_inquire | cics_invoke | cics_issue | cics_link | cics_load | cics_monitor | cics_move | cics_point | cics_pop |
                       cics_post | cics_purge | cics_push | cics_put_container | cics_query | cics_read | cics_readnext_readprev |
                       cics_readq | cics_release | cics_remove | cics_request | cics_reset | cics_resetbr | cics_resume | cics_retrieve |
                       cics_return | cics_rewind | cics_rewrite | cics_route | cics_run | cics_set | cics_signal | cics_signoff | cics_signon |
                       cics_soapfault | cics_spoolclose | cics_spoolopen | cics_spoolread | cics_spoolwrite | cics_start |
                       cics_startbr | cics_startbrowse | cics_suspend | cics_syncpoint | cics_test | cics_transform | cics_unlock |
                       cics_update | cics_verify | cics_wait | cics_waitcics | cics_web | cics_write | cics_writeq | cics_wsacontext |
                       cics_wsaepr | cics_xctl | cics_converse | cics_abend | cics_acquire | allExciRules | allSPRules
                      ;

// exci rules
allExciRules: cics_exci_link | cics_exci_delete | cics_exci_delete_container | cics_exci_endbrowse_container |
              cics_exci_get_container | cics_exci_get_next_container | cics_exci_move_container |
              cics_exci_put_container | cics_exci_query_channel | cics_exci_startbrowse_container ;

allSPRules: cics_acquire_terminal | cics_disable | cics_discard | cics_enable | cics_extract_system_programming | cics_inquire_system_programming | cics_create | cics_perform | cics_resync_entryname | cics_collect_statistics | cics_csd;

// compiler options
compilerOpts
   : (XOPTS LPARENCHAR compilerXOptsOption (commaClause? compilerXOptsOption)* RPARENCHAR) | cicsOptions;

cicsOptions:  CICS LPARENCHAR (cicsTranslatorCompileDirectivedKeywords | NONNUMERICLITERAL)  RPARENCHAR;

compilerXOptsOption
    : APOST |
      CBLCARD |
      CICS |
      COBOL2 |
      COBOL3 |
      CPSM |
      DBCS |
      DEBUG |
      DLI |
      EDF |
      EXCI |
      FEPI |
      ((FLAG | F_CHAR) LPARENCHAR (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR) (commaClause (E_CHAR | I_CHAR | S_CHAR | U_CHAR | W_CHAR))? RPARENCHAR) |
      LENGTH |
      ((LINECOUNT | LC) LPARENCHAR integerLiteral RPARENCHAR) |
      LINKAGE |
      NATLANG |
      NOCBLCARD |
      NOCPSM |
      NODEBUG |
      NOEDF |
      NOFEPI |
      NOLENGTH |
      NOLINKAGE |
      NONUM |
      NOOPTIONS |
      NOSEQ |
      NOSPIE |
      NOVBREF |
      NUM |
      OPTIONS |
      QUOTE |
      SEQ |
      SP |
      SPACE LPARENCHAR integerLiteral RPARENCHAR |
      SPIE |
      SYSEIB |
      VBREF
    ;

cicsTranslatorCompileDirectivedKeywords
   : CBLCARD | COBOL2 | COBOL3 | CPSM | DLI | EDF | EXCI | FEPI | NATLANG | NOCBLCARD | NOCPSM | NODEBUG | NOEDF
   | NOFEPI | NOLENGTH | NOLINKAGE | NOOPTIONS | NOSPIE | OPTIONS | SP | SPIE | SYSEIB
   ;

/** RECEIVE: */

// Receive all
cics_receive:                   RECEIVE (cics_receive_group_one | cics_receive_partn | cics_receive_map | cics_receive_map_mappingdev);

// CICS Group 1 (zOS DEFAULT, LUTYPE (2,3,4), 2260, 3270-logical, 3790 / 3270-display, 3600 pipeline, 3600-3601, 3600-3614, 3650, 3767, 3770, 3790 FF, 2980, Non z Default, APPC, LUTYPE 6.1, MRO)
cics_receive_group_one:         ((INTO | LENGTH | FLENGTH) cics_data_area | SET cics_ref | (MAXLENGTH | MAXFLENGTH) cics_data_value | (CONVID | SESSION) cics_name | STATE cics_cvda | ASIS | BUFFER | NOTRUNCATE | LEAVEKB | NOTRUNCATE | PASSBK | cics_handle_response)*;

cics_receive_partn:             (PARTN cics_data_area | SET cics_ref | (INTO | LENGTH | INTO) cics_data_area | ASIS | cics_handle_response)*;

// RECEIVE MAPS
cics_receive_map: ((MAP | MAPSET | INPARTN) cics_name | SET cics_ref | (FROM | LENGTH | INTO) cics_data_area | TERMINAL | ASIS | cics_handle_response)*;
cics_receive_map_mappingdev:    ((MAP | MAPSET) cics_name | (MAPPINGDEV | FROM | LENGTH | INTO) cics_data_area  | SET cics_ref | cics_handle_response)*;


/** SEND: */
cics_send: SEND (cics_send_group1 | cics_send_control_map | cics_send_mappingdev | cics_send_page | cics_send_partnset | cics_send_text | cics_send_text_mapped | cics_send_text_noedit);

// CICS SEND Group1 (zOS DEFAULT, APPC, LUTYPE2/LUTYPE3, LUTYPE4, LUTYPE6.1, SCS, 3270, 3600, 3601, 3614, 3650, 3270, 3653, 3680, 3767, 3770, 3790, 3790 SCS,
//                      3270-display, 3270-printer, Server default, MRO, 2260, 2280)
cics_send_group1 : ((FROM | LENGTH | FLENGTH) cics_data_area | (CONVID | SESSION | ATTACHID | LDC ) cics_name | WAIT | INVITE | LAST | CONFIRM | ERASE | DEFAULT | ALTERNATE
                | (CTLCHAR | LINEADDR) cics_data_value | STRFIELD | STATE cics_cvda | CNOTCOMPL | DEFRESP | FMH | LEAVEKB | PASSBK | CBUFF | cics_handle_response)*;

cics_send_control_map : (CONTROL | CURSOR cics_data_value? | FORMFEED | ERASE | DEFAULT | ALTERNATE | ERASEAUP | PRINT | FREEKB | ALARM | FRSET | (MSR | LENGTH) cics_data_value
                | (MAP | OUTPARTN | ACTPARTN | LDC | REQID | MAPSET | FMHPARM) cics_name | ACCUM | TERMINAL | SET cics_ref | PAGING | WAIT | LAST | HONEOM | L40 | L64 | L80
                | FROM cics_data_area | NLEOM | NOFLUSH | DATAONLY | MAPONLY | cics_handle_response)*;

cics_send_mappingdev : ((MAP | MAPSET) cics_name | (MAPPINGDEV | LENGTH | FROM) cics_data_area | SET cics_ref | DATAONLY | MAPONLY | CURSOR cics_data_value?
                | FORMFEED | ERASE | ERASEAUP| PRINT | FREEKB | ALARM | FRSET | cics_handle_response)*;

cics_send_page : (PAGE | RELEASE | RETAIN | TRANSID cics_name | TRAILER cics_data_area | SET cics_ref | AUTOPAGE | CURRENT | ALL | NOAUTOPAGE | OPERPURGE | FMHPARM cics_name | LAST | cics_handle_response)*;

cics_send_partnset : (PARTNSET cics_name? | cics_handle_response)*;

cics_send_text : (TEXT | (FROM | LENGTH | CURSOR | HEADER | TRAILER) cics_data_area | FORMFEED | ERASE | DEFAULT | ALTERNATE | PRINT | FREEKB | ALARM | NLEOM
                | (FMHPARM | OUTPARTN | ACTPARTN | LDC | REQID) cics_name | (MSR | JUSTIFY) cics_data_value | TERMINAL | SET cics_ref | PAGING | WAIT | LAST
                | JUSFIRST | JUSLAST | ACCUM | HONEOM | L40 | L64 | L80 | cics_handle_response)*;

cics_send_text_mapped: (TEXT | MAPPED | (FROM | LENGTH) cics_data_area | PAGING | TERMINAL | WAIT | LAST | REQID cics_name | cics_handle_response)*;

cics_send_text_noedit: (TEXT | NOEDIT | (FROM | LENGTH) cics_data_area | ERASE | DEFAULT | ALTERNATE | PRINT | FREEKB | ALARM | (OUTPARTN | REQID) cics_name | PAGING
                | TERMINAL | WAIT | LAST | HONEOM | L40 | L64 | L80 | cics_handle_response)*;

/** CONVERSE: */
cics_converse: CONVERSE cics_converse_group?;
cics_converse_group:  (FROM cics_data_area | cics_converse_fromlength | cics_into | cics_converse_tolength | cics_maxlength | NOTRUNCATE | DEFRESP | STRFIELD | FMH | ((CTLCHAR | LINEADDR) cics_data_value) | STATE cics_cvda | (CONVID | SESSION | ATTACHID | LDC) cics_name | LEAVEKB | cics_converse_erase | ASIS | cics_handle_response)+ ;


cics_converse_erase: (ERASE | DEFAULT | ALTERNATE)+;
cics_converse_fromlength: (FROMLENGTH | FROMFLENGTH) cics_data_value;
cics_into: (INTO cics_data_area | SET cics_ref);
cics_converse_tolength: (TOLENGTH | TOFLENGTH) cics_data_area;
cics_maxlength: ((MAXLENGTH | MAXFLENGTH) cics_data_value);


/** ABEND: */
cics_abend: ABEND cics_abend_opts;
cics_abend_opts:(ABCODE cics_name | CANCEL | NODUMP| cics_handle_response)*;
/** ACQUIRE */
cics_acquire:ACQUIRE (cics_acquire_process | cics_acquire_activityId ) ;

cics_acquire_process: ((PROCESS | PROCESSTYPE) cics_data_value | cics_handle_response)+;

cics_acquire_activityId: (ACTIVITYID cics_data_value | cics_handle_response)+;

/** ACQUIRE TERMINAL System command */
cics_acquire_terminal: ACQUIRE cics_acquire_terminal_body;
cics_acquire_terminal_body: ((TERMINAL | USERDATA | USERDATALEN) cics_data_value | NOQUEUE | QALL  | QNOTENAB | QSESSLIM | RELREQ |cics_handle_response)+;

/** ADD SUBEVENT */
cics_add: ADD ( ciss_add_event_subevent | cics_handle_response)+;
ciss_add_event_subevent: ((SUBEVENT  | EVENT) cics_data_value)+;

/** ADDRESS / ADDRESS SET */
cics_address: ADDRESS (cics_address_standard | cics_address_set);
cics_address_standard: ((ACEE | COMMAREA | CWA | EIB | TCTUA | TWA) cics_ref | cics_handle_response)*;
cics_address_set: (SET (cics_data_area | cics_ref) | USING (cics_ref | cics_data_area) | cics_handle_response)*;

/** ALLOCATE (all of them) */
cics_allocate: ALLOCATE (cics_allocate_appc_partner | cics_allocate_appc_mro_lut61_sysid | cics_allocate_lut61_session);
cics_allocate_appc_mro_lut61_sysid:  (SYSID cics_data_area | PROFILE cics_name | NOQUEUE | STATE cics_cvda | cics_handle_response)+;
cics_allocate_lut61_session: (SESSION  cics_name | PROFILE cics_name | NOQUEUE | cics_handle_response)+;
cics_allocate_appc_partner: (PARTNER cics_name | NOQUEUE | STATE cics_cvda | cics_handle_response)+;

/** ASKTIME */
cics_asktime:ASKTIME cics_asktime_abstime;
cics_asktime_abstime: (ABSTIME cics_data_area | cics_handle_response)*;

/** ASSIGN */
cics_assign: ASSIGN (cics_assign_parameter1 | cics_assign_parameter2) *;

cics_assign_parameter1: ABCODE cics_data_area | ABDUMP cics_data_area | ABOFFSET cics_data_area | ABPROGRAM cics_data_area | ACTIVITY cics_data_area |
             ACTIVITYID cics_data_area | ALTSCRNHT cics_data_area | ALTSCRNWD cics_data_area | APLKYBD cics_data_area |
             APLTEXT cics_data_area | APPLICATION cics_data_area | APPLID cics_data_area | ASRAINTRPT cics_data_area | ASRAKEY cics_cvda |
             ASRAPSW cics_data_area | ASRAPSW16 cics_data_area | ASRAREGS cics_data_area | ASRAREGS64 cics_data_area |ASRASPC cics_cvda | ASRASTG cics_cvda |
             BRIDGE cics_data_area | BTRANS cics_data_area | CHANNEL cics_data_area | CMDSEC cics_data_area |
             COLOR cics_data_area | CWALENG cics_data_area | DEFSCRNHT cics_data_area | DEFSCRNWD cics_data_area |
             DELIMITER cics_data_area | DESTCOUNT cics_data_area | DESTID cics_data_area | DESTIDLENG cics_data_area |
             DSSCS cics_data_area | DS3270 cics_data_area | ERRORMSG cics_data_area | ERRORMSGLEN cics_data_area | EWASUPP cics_data_area | EXTDS cics_data_area |
             FACILITY cics_data_area | FCI cics_data_area | GCHARS cics_data_area | GCODES cics_data_area |
             GMMI cics_data_area | GMEXITOPT cics_cvda | HILIGHT cics_data_area | INITPARM cics_data_area | INITPARMLEN cics_data_area |
             INPARTN cics_data_area | INPUTMSGLEN cics_data_area | INVOKINGPROG cics_data_area |
             KATAKANA cics_data_area | LANGINUSE cics_data_area | LDCMNEM cics_data_area | LDCNUM cics_data_area |
             LINKLEVEL cics_data_area | LOCALCCSID cics_data_area | MAJORVERSION cics_data_area |
             MAPCOLUMN cics_data_area | MAPHEIGHT cics_data_area;

cics_assign_parameter2: MAPLINE cics_data_area | MAPWIDTH cics_data_area | MICROVERSION cics_data_area | MINORVERSION cics_data_area |
             MSRCONTROL cics_data_area | NATLANGINUSE cics_data_area |NETNAME cics_data_area | NEXTTRANSID cics_data_area |
             NUMTAB cics_data_area | OPCLASS cics_data_area | OPERATION cics_data_area | OPERKEYS cics_data_area | OPID cics_data_area | OPSECURITY cics_data_area | ORGABCODE cics_data_area |
             OUTLINE cics_data_area | PAGENUM cics_data_area | PARTNPAGE cics_data_area | PARTNS cics_data_area |
             PARTNSET cics_data_area | PLATFORM cics_data_area | PRINSYSID cics_data_area | PROCESS cics_data_area | PROCESSTYPE cics_data_area |
             PROGRAM cics_data_area | PS cics_data_area | QNAME cics_data_area | RESSEC cics_data_area |
             RESTART cics_data_area | RETURNPROG cics_data_area | SCRNHT cics_data_area | SCRNWD cics_data_area |
             SIGDATA cics_data_area | SOSI cics_data_area | STARTCODE cics_data_area | STATIONID cics_data_area |
             SYSID cics_data_area | TASKPRIORITY cics_data_area | TCTUALENG cics_data_area | TELLERID cics_data_area |
             TERMCODE cics_data_area | TERMPRIORITY cics_data_area | TEXTKYBD cics_data_area | TEXTPRINT cics_data_area |
             TNADDR cics_data_area | TNIPFAMILY cics_cvda | TNPORT cics_data_area |  TRANPRIORITY cics_data_area |
             TWALENG cics_data_area | UNATTEND cics_data_area | USERID cics_data_area |
             USERNAME cics_data_area | USERPRIORITY cics_data_area | VALIDATION cics_data_area | cics_handle_response;

/** CSD System Commands */
cics_csd: CSD (cics_csd_add | cics_csd_alter | cics_csd_append | cics_csd_copy | cics_csd_define | cics_csd_remove | cics_csd_delete | cics_csd_disconnect | cics_csd_endbrgroup |
               cics_csd_endbrlist | cics_csd_endbrrsrce | cics_csd_getnextgroup | cics_csd_getnextlist | cics_csd_getnextrsrce | cics_csd_inquiregroup | cics_csd_inquirelist |
               cics_csd_inquirersrce | cics_csd_install | cics_csd_lock | cics_csd_rename | cics_csd_startbrgroup | cics_csd_startbrlist | cics_csd_startbrrsrce |
               cics_csd_unlock | cics_csd_userdefine);
cics_csd_add:           (ADD | (GROUP | LIST | BEFORE | AFTER) cics_data_value | cics_handle_response)+;
cics_csd_alter:         (ALTER | cics_csd_cvda | NOCOMPAT | COMPAT | COMPATMODE cics_cvda | (RESID | GROUP | ATTRIBUTES | ATTRLEN) cics_data_value | cics_handle_response)+;
cics_csd_append:        (APPEND | (LIST | TO) cics_data_value | cics_handle_response)+;
cics_csd_copy:          (COPY | cics_csd_cvda | ( RESID | AS | TO | GROUP ) cics_data_value | DUPERROR | DUPNOREPLACE | DUPREPLACE | DUPACTION cics_cvda | cics_handle_response)+;
cics_csd_define:        (DEFINE | cics_csd_cvda | NOCOMPAT | COMPAT | COMPATMODE cics_cvda | (RESID | GROUP | ATTRIBUTES | ATTRLEN) cics_data_value | cics_handle_response)+;
cics_csd_delete:        (DELETE | cics_csd_cvda | (RESID | GROUP) cics_data_value | LISTACTION cics_cvda | REMOVE | cics_handle_response)+;
cics_csd_disconnect:    (DISCONNECT | cics_handle_response)+;
cics_csd_endbrgroup:    (ENDBRGROUP | LIST | cics_handle_response)+;
cics_csd_endbrlist:     (ENDBRLIST | cics_handle_response)+;
cics_csd_endbrrsrce:    (ENDBRRSRCE | cics_handle_response)+;
cics_csd_getnextgroup:  (GETNEXTGROUP | GROUP cics_data_area | LIST cics_data_value | cics_handle_response)+;
cics_csd_getnextlist:   (GETNEXTLIST | LIST cics_data_area | cics_handle_response)+;
cics_csd_getnextrsrce:  (GETNEXTRSRCE | RESTYPE cics_cvda | RESID cics_data_area | SET cics_ref | (GROUP | ATTRIBUTES | ATTRLEN) cics_data_area | cics_handle_response)+;
cics_csd_inquiregroup:  (INQUIREGROUP | GROUP cics_data_value | LIST cics_data_value | cics_handle_response)+;
cics_csd_inquirelist:   (INQUIRELIST | LIST cics_cvda | cics_handle_response)+;
cics_csd_inquirersrce:  (INQUIRERSRCE | cics_csd_cvda | (RESID | GROUP ) cics_data_value | SET cics_ref | (GROUP | ATTRIBUTES | ATTRLEN) cics_data_area | cics_handle_response)+;
cics_csd_install:       (INSTALL | cics_csd_cvda | RESID cics_data_area | (GROUP | LIST) cics_data_value | cics_handle_response)+;
cics_csd_lock:          (LOCK | (LIST | GROUP) cics_data_value | cics_handle_response)+;
cics_csd_remove:        (REMOVE | (LIST | GROUP) cics_data_value | cics_handle_response)+;
cics_csd_rename:        (RENAME | cics_csd_cvda | (RESID | GROUP | AS) cics_data_value | cics_handle_response)+;
cics_csd_startbrgroup:  (STARTBRGROUP | LIST cics_data_value | cics_handle_response)+;
cics_csd_startbrlist:   (STARTBRLIST | cics_handle_response)+;
cics_csd_startbrrsrce:  (STARTBRRSRCE | GROUP cics_data_value | cics_handle_response)+;
cics_csd_unlock:        (UNLOCK | (LIST | GROUP) cics_data_value | cics_handle_response)+;
cics_csd_userdefine:    (USERDEFINE | cics_csd_cvda | (RESID | GROUP | ATTRIBUTES | ATTRLEN) cics_data_value | NOCOMPAT | COMPAT | COMPATMODE cics_cvda | cics_handle_response)+;
cics_csd_cvda:           RESTYPE cics_cvda | ATOMSERVICE | BUNDLE | CONNECTION | CORBASERVER | DB2CONN | DB2ENTRY | DB2TRAN | DJAR | DOCTEMPLATE | DUMPCODE |
                         ENQMODEL | FILE | IPCONN | JOURNALMODEL | JVMSERVER | LIBRARY | LSRPOOL | MAPSET | MQCONN | MQMONITOR | PARTITIONSET | PARTNER | PIPELINE |
                         PROCESSTYPE | PROFILE | PROGRAM | REQUESTMODEL | SESSIONS | TCPIPSERVICE | TDQUEUE | TERMINAL | TRANCLASS | TRANSACTION | TSMODEL | TYPETERM | URIMAP | WEBSERVICE;

/** BIF DEEDIT / BIF DIGEST */
cics_bif: BIF (cics_bif_deedit | cics_bif_digest);
cics_bif_deedit: (DEEDIT | FIELD cics_data_area | LENGTH cics_data_value | cics_handle_response)+;
cics_bif_digest: (DIGEST | RECORD cics_data_value | RECORDLEN cics_data_value | HEX | BINARY | BASE64 | DIGESTTYPE cics_cvda |
                 RESULT cics_data_area | cics_handle_response)+;

/** BUILD ATTACH (both of them) */
cics_build: BUILD cics_build_attach;
cics_build_attach: (ATTACH | (ATTACHID  | PROCESS  | RESOURCE  | RPROCESS  |
            RRESOURCE | QUEUE) cics_name | (IUTYPE | DATASTR |
            RECFM) cics_data_value | cics_handle_response)+;

/** CANCEL (both of them) */
cics_cancel: CANCEL (cics_cancel_reqid | cics_cancel_bts)?;
cics_cancel_bts: (ACTIVITY cics_data_value | ACQACTIVITY | ACQPROCESS | cics_handle_response)+;
cics_cancel_reqid: ((REQID | TRANSID) cics_name | SYSID cics_data_area | cics_handle_response)+;

/** CHANGE PHRASE / PASSWORD / TASK */
cics_change: CHANGE (cics_change_phrase | cics_change_password | cics_change_task );
cics_change_phrase: (PHRASE cics_data_area | cics_password_phrase |  (NEWPHRASE |  NEWPHRASELEN | PHRASELEN  | USERID) cics_data_value | cics_handle_response)*;
cics_change_password: ((PASSWORD | NEWPASSWORD | USERID ) cics_data_value | cics_password_phrase | cics_handle_response)*;
cics_change_task: (TASK | PRIORITY cics_data_value | cics_handle_response)*;

cics_password_phrase:((CHANGETIME | DAYSLEFT | ESMREASON | ESMRESP | EXPIRYTIME | INVALIDCOUNT | LASTUSETIME ) cics_data_area | cics_handle_response);

/** CHECK ACQPROCESS / ACTIVITY / TIMER */
cics_check: CHECK (cics_check_activity | cics_check_timer);
cics_check_activity: (ACQPROCESS | ACTIVITY cics_data_value | ACQACTIVITY | (ABCODE | ABPROGRAM) cics_data_area |
                     (MODE | SUSPSTATUS | COMPSTATUS) cics_cvda | cics_handle_response)+;
cics_check_timer: (TIMER cics_data_value | STATUS cics_cvda | cics_handle_response)*;

cics_collect_statistics: COLLECT cics_collect_statistics_opts;
cics_collect_statistics_opts: ((LASTRESET | LASTRESETHRS | LASTRESETMIN | LASTRESETSEC) cics_data_area | SET cics_ref |
                              (CONNECTION | DB2ENTRY | FILE | JOURNALNAME | JOURNALNUM | JVMPROGRAM | LSRPOOL | POOL | TARGET | SUBPOOL | NODE | TCLASS | TCPIPSERVICE | TERMINAL | TRANCLASS) cics_data_value |
                               MONITOR cics_data_value? | MVSTCB cics_data_value? | PROGRAM cics_data_value? | STORAGE  cics_data_value? | STREAMNAME cics_data_value? | SYSDUMPCODE cics_data_value? | TDQUEUE cics_data_value? | TRANDUMPCODE cics_data_value? | TRANSACTION cics_data_value? |
                               STATISTICS | AUTOINSTALL | DB2CONN | DISPATCHER | ENQUEUE | PROGAUTO | RECOVERY | STATS | TABLEMGR | TASKSUBPOOL | TCPIP | TSQUEUE | VTAM |
                               cics_handle_response)+;

cics_conditions: NORMAL | ERROR | RDATT | WRBRK | EOF_TOKEN | EODS | EOC | INBFMH | ENDINPT | NONVAL | NOSTART | TERMIDERR | FILENOTFOUND | NOTFND | DUPREC | DUPKEY |
                INVREQ | IOERR | NOSPACE | NOTOPEN | ENDFILE | ILLOGIC | LENGERR | QZERO | SIGNAL | QBUSY | ITEMERR | PGMIDERR | TRANSIDERR | ENDDATA | INVTSREQ |
                EXPIRED | RETPAGE | RTEFAIL | RTESOME | TSIOERR | MAPFAIL | INVERRTERM | INVMPSZ | IGREQID | OVERFLOW | INVLDC | NOSTG | JIDERR | QIDERR | NOJBUFSP |
                DSSTAT | SELNERR | FUNCERR | UNEXPIN | NOPASSBKRD | NOPASSBKWR | SEGIDERR | SYSIDERR | ISCINVREQ | ENQBUSY | ENVDEFERR | IGREQCD | SESSIONERR | SYSBUSY |
                SESSBUSY | NOTALLOC | CBIDERR | INVEXITREQ | INVPARTNSET | INVPARTN | PARTNFAIL | USERIDERR | NOTAUTH | VOLIDERR | SUPPRESSED | RESIDERR | NOSPOOL |
                TERMERR | ROLLEDBACK | END | DISABLED | ALLOCERR | STRELERR | OPENERR | SPOLBUSY | SPOLERR | NODEIDERR | TASKIDERR | TCIDERR | DSNNOTFOUND | LOADING |
                MODELIDERR | OUTDESCRERR | PARTNERIDERR | PROFILEIDERR | NETNAMEIDERR | LOCKED | RECORDBUSY | UOWNOTFOUND | UOWLNOTFOUND | LINKABEND | CHANGED | PROCESSBUSY |
                ACTIVITYBUSY | PROCESSERR | ACTIVITYERR | CONTAINERERR | EVENTERR | TOKENERR | NOTFINISHED | POOLERR | TIMERERR | SYMBOLERR | TEMPLATERR | NOTSUPERUSER | CSDERR |
                DUPRES | RESUNAVAIL | CHANNELERR | CCSIDERR | TIMEDOUT | CODEPAGEERR | INCOMPLETE | APPNOTFOUND | BUSY;

/** CONNECT PROCESS */
cics_connect: CONNECT cics_connect_process;
cics_connect_process: (PROCESS | (CONVID | SESSION | PARTNER) cics_name | PROCNAME cics_data_area |
                      (PROCLENGTH | PIPLENGTH) cics_data_value | (SYNCLEVEL | PIPLIST) cics_data_area |
                       STATE cics_cvda | cics_handle_response)+;

/** CONVERTTIME */
cics_converttime: CONVERTTIME cics_converttime_opts;
cics_converttime_opts:(DATESTRING cics_data_area | ABSTIME cics_data_area | cics_handle_response)+;

/** CREATE System Commands */
cics_create: CREATE cics_create_opts;
cics_create_opts:((ATOMSERVICE | BUNDLE | DB2CONN | DB2ENTRY | DB2TRAN | DOCTEMPLATE | DUMPCODE | ENQMODEL | FILE |
                   IPCONN | JOURNALMODEL | JVMSERVER | LIBRARY | LSRPOOL | MAPSET | MQCONN | MQMONITOR | PARTITIONSET |
                   PARTNER |  PIPELINE | PROCESSTYPE | PROFILE | PROGRAM | TCPIPSERVICE | TDQUEUE | TRANCLASS |
                   TRANSACTION | TSMODEL | TYPETERM | URIMAP | WEBSERVICE | SESSIONS) cics_data_value | (TERMINAL | CONNECTION) cics_data_value? |
                   ATTRIBUTES cics_data_area | COMPLETE | DISCARD | ATTRLEN cics_data_value | LOG | NOLOG |
                   LOGMESSAGE cics_cvda | cics_handle_response)+;

/** DEFINE (all of them) */
cics_define: DEFINE (cics_define_activity | cics_define_composite_event | cics_define_counter_dcounter | cics_define_input_event | cics_define_process | cics_define_timer);
cics_define_activity: ACTIVITY cics_data_value ((EVENT | TRANSID | PROGRAM | USERID) cics_data_value | ACTIVITYID cics_data_area | cics_handle_response)+;
cics_define_composite_event: (COMPOSITE | AND | OR  | (EVENT | SUBEVENT1 | SUBEVENT2 | SUBEVENT3 | SUBEVENT4 | SUBEVENT5 | SUBEVENT6 | SUBEVENT7 | SUBEVENT8) cics_data_value | cics_handle_response)+;
cics_define_counter_dcounter: ((COUNTER | DCOUNTER) cics_name | POOL cics_name  | (VALUE | MINIMUM | MAXIMUM) cics_data_value | NOSUSPEND | cics_handle_response)+;
cics_define_input_event: (INPUT | EVENT cics_data_value | cics_handle_response)+;
cics_define_process: (PROCESS cics_data_value | (PROCESSTYPE | TRANSID | PROGRAM | USERID) cics_data_value | NOCHECK | cics_handle_response)+;
cics_define_timer: TIMER cics_data_value ((EVENT | DAYS | HOURS | MINUTES | SECONDS | YEAR | MONTH | DAYOFMONTH | DAYOFYEAR) cics_data_value | AFTER  | AT | ON | cics_handle_response)+;

/** DELAY */
cics_delay: DELAY cics_delay_opts;
cics_delay_opts: (INTERVAL cics_zero_digit | (INTERVAL | TIME) cics_hhmmss
 | FOR | (HOURS | MINUTES | SECONDS | MILLISECS) cics_data_value | UNTIL | REQID cics_name | cics_handle_response)+;

/** DELETE (all of them) */
cics_delete: DELETE (cics_delete_group_one | cics_delete_group_two | cics_delete_group_three | cics_delete_group_four);

cics_keylength: KEYLENGTH cics_data_value;
cics_counter_dcounter: (COUNTER | DCOUNTER) cics_name;

// CICS Delete Group 1
cics_delete_group_one:  (cics_file_name | TOKEN cics_data_area  | cics_keylength | GENERIC |
                         ((SYSID | RIDFLD | NUMREC) cics_data_area) | NOSUSPEND | RBA | RRN | cics_handle_response)+;

// CICS Delete Group 2 (Activity, Channel, Event, Timer)
cics_delete_group_two:  ((ACTIVITY | CHANNEL | EVENT | TIMER) cics_data_value | cics_handle_response)+;

// CICS Delete Group 3 (Container (BTS), Container (Channel))
cics_delete_group_three:  ((CONTAINER | ACTIVITY | CHANNEL) cics_data_value | ACQACTIVITY | PROCESS | ACQPROCESS | cics_handle_response)+;

// CICS Delete Group 4 (Counter, Dcounter)
cics_delete_group_four:  (cics_counter_dcounter | POOL cics_name | NOSUSPEND | cics_handle_response)+;

/** DELETEQ TD/TS */
cics_deleteq: DELETEQ (cics_deleteq_td | cics_deleteq_ts);
cics_deleteq_td: (TD | QUEUE cics_name | SYSID cics_data_area | cics_handle_response)+;
cics_deleteq_ts: (TS | cics_queue_qname | SYSID cics_data_area | cics_handle_response)+;
cics_queue_qname: (QUEUE | QNAME) cics_name;

/** DEQ */
cics_deq: DEQ (cics_deq_cmds | cics_handle_response);
cics_deq_cmds : (RESOURCE cics_data_area | LENGTH cics_data_value | MAXLIFETIME cics_cvda | TASK | UOW)+;

/** DISABLE PROGRAM */
cics_disable: DISABLE cics_disable_program;
cics_disable_program: ((PROGRAM | ENTRYNAME | EXIT) cics_data_value | EXITALL | FORMATEDF | PURGEABLE |
              SHUTDOWN | SPI | STOP | TASKSTART | cics_handle_response)+;

/** DISCARD System Commands **/
cics_discard: DISCARD cics_discard_body;
cics_discard_body: cics_handle_response* ((ATOMSERVICE | AUTINSTMODEL | BUNDLE | CONNECTION | DB2ENTRY | DB2TRAN | DOCTEMPLATE |
                   ENQMODEL | FILE | IPCONN | JOURNALMODEL | JOURNALNAME | JVMSERVER | LIBRARY | MQMONITOR | PARTNER | PIPELINE |
                   PROCESSTYPE | PROFILE | PROGRAM | TCPIPSERVICE | TDQUEUE | TERMINAL | TRANCLASS | TRANSACTION | TSMODEL | URIMAP | WEBSERVICE) cics_data_value |
                   DB2CONN | MQCONN) cics_handle_response*;

/** DOCUMENT CREATE / DELETE / INSERT / RETRIEVE / SET */
cics_document: DOCUMENT (cics_document_create | cics_document_delete | cics_document_insert | cics_document_retrieve | cics_document_set);
cics_document_create: (CREATE | (DOCTOKEN | FROM | TEXT | BINARY | LENGTH | FROMDOC | SYMBOLLIST | DOCSIZE) cics_data_area |
                        (LISTLENGTH | DELIMITER) cics_data_value | (TEMPLATE | HOSTCODEPAGE) cics_name | UNESCAPED | cics_handle_response)+;
cics_document_delete: (DELETE | DOCTOKEN | cics_data_area)+;
cics_document_insert: (INSERT | (DOCTOKEN | TEXT | BINARY | FROM | FROMDOC) cics_data_area | (LENGTH | DOCSIZE) cics_data_value |
                       (SYMBOL | TEMPLATE |  BOOKMARK | HOSTCODEPAGE | AT | TO) cics_name |  cics_handle_response)+;
cics_document_retrieve: (RETRIEVE | (DOCTOKEN | INTO) cics_data_area | (LENGTH | MAXLENGTH) cics_data_value | CHARACTERSET cics_name | DATAONLY | cics_handle_response)+;
cics_document_set: (SET | (DOCTOKEN | VALUE | SYMBOLLIST) cics_data_area | SYMBOL cics_name | (DELIMITER | LENGTH) cics_data_value | UNESCAPED | cics_handle_response)+;


/** DUMP TRANSACTION */
cics_length_flength:            (LENGTH | FLENGTH) cics_data_area;
cics_dump: DUMP TRANSACTION? /* undocumented variant */ (DUMPCODE cics_name | cics_dump_transaction_from  | cics_dump_transaction_segmentlist | cics_dump_code_opts)+;
cics_dump_transaction_from: (FROM cics_data_area | cics_length_flength | cics_handle_response)+;
cics_dump_code_opts: (COMPLETE | TRT | TASK | STORAGE | PROGRAM | TERMINAL | TABLES | FCT | PCT | PPT | SIT | TCT | DUMPID cics_data_area | cics_handle_response)+;
cics_dump_transaction_segmentlist: ((SEGMENTLIST | LENGTHLIST | NUMSEGMENTS) cics_data_area | cics_handle_response)+;

/** ENABLE PROGRAM */
cics_enable: ENABLE cics_enable_program;
cics_enable_program: ((PROGRAM | ENTRYNAME | EXIT | GALENGTH | GAENTRYNAME | TALENGTH) cics_data_value |
                     ENTRY cics_ref | FORMATEDF | GALOCATION cics_cvda | GAEXECUTABLE | INDOUBTWAIT | LINKEDITMODE |
                     QUASIRENT | THREADSAFE | OPENAPI | REQUIRED | PURGEABLE | SHUTDOWN | SPI | START | TAEXECUTABLE |
                     TASKSTART | cics_handle_response)+;

/** ENDBR / ENDBROWSE */
cics_endbr: ENDBR cics_endbr_opts;
cics_endbr_opts: ((FILE | DATASET) cics_name | REQID cics_data_value | SYSID cics_data_area | cics_handle_response)+;
cics_endbrowse: ENDBROWSE cics_endbrowse_opts;
cics_endbrowse_opts: (ACTIVITY | CONTAINER | EVENT | PROCESS | TIMER | (BROWSETOKEN | RETCODE) cics_data_value | cics_handle_response)+;

/** ENQ */
cics_enq: ENQ cics_enq_opts;
cics_enq_opts:(RESOURCE cics_data_area | LENGTH cics_data_value | UOW | TASK | MAXLIFETIME cics_cvda | NOSUSPEND | cics_handle_response)+;

/** ENTER TRACENUM */
cics_enter: ENTER cics_enter_opts;
cics_enter_opts:(TRACENUM cics_data_value | FROM cics_data_area | FROMLENGTH cics_data_area | RESOURCE cics_name | EXCEPTION | cics_handle_response)+;

/** EXTRACT (all of them) */
cics_extract: EXTRACT (cics_extract_attach | cics_extract_attributes | cics_extract_certificate | cics_extract_logonmessage | cics_extract_process | cics_extract_tcpip | cics_extract_tct | cics_extract_web_server | cics_extract_web_client);
cics_extract_attach: (ATTACH | (ATTACHID | CONVID | SESSION) cics_name | (PROCESS | RESOURCE | RPROCESS | RRESOURCE | QUEUE | IUTYPE | DATASTR | RECFM) cics_data_area | cics_handle_response)+;
cics_extract_attributes: (ATTRIBUTES | (CONVID | SESSION) cics_name | STATE cics_cvda | cics_handle_response)+;
cics_extract_certificate: (CERTIFICATE cics_ref | (LENGTH | SERIALNUMLEN | USERID | COMMONNAMLEN | COUNTRYLEN | STATELEN | LOCALITYLEN | ORGANIZATLEN | ORGUNITLEN) cics_data_area | (SERIALNUM | COMMONNAME | COUNTRY | STATE | LOCALITY | ORGANIZATION | ORGUNIT) cics_ref | OWNER | ISSUER | cics_handle_response)+;
cics_extract_logonmessage: (LOGONMSG | (INTO | LENGTH) cics_data_area | SET cics_ref | cics_handle_response)+;
cics_extract_process: (PROCESS | (PROCNAME | PROCLENGTH | MAXPROCLEN | SYNCLEVEL | PIPLENGTH) cics_data_area | CONVID cics_name | PIPLIST cics_ref | cics_handle_response)+;
cics_extract_tcpip: (TCPIP | (AUTHENTICATE | CLNTIPFAMILY | SRVRIPFAMILY | SSLTYPE | PRIVACY)  cics_cvda | (CLIENTNAME | CNAMELENGTH | SERVERNAME | SNAMELENGTH | CLIENTADDR | CADDRLENGTH | CLIENTADDRNU | CLNTADDR6NU | SERVERADDR | SADDRLENGTH | SERVERADDRNU | SRVRADDR6NU | TCPIPSERVICE | PORTNUMBER | PORTNUMNU | MAXDATALEN) cics_data_area | cics_handle_response)+;
cics_extract_tct: (TCT | NETNAME cics_name | (SYSID | TERMID) cics_data_area | cics_handle_response)+;
cics_extract_web_server: (WEB | (REQUESTTYPE | HOSTTYPE | SCHEME) cics_cvda | HOSTLENGTH cics_data_value | (HOST | HTTPVERSION | VERSIONLEN | PATH | PATHLENGTH | HTTPMETHOD | METHODLENGTH | PORTNUMBER | QUERYSTRING | QUERYSTRLEN | URIMAP) cics_data_area | cics_handle_response)+;
cics_extract_web_client: (WEB | (SESSTOKEN | PORTNUMBER | URIMAP | REALM | REALMLEN | HOST | HTTPVERSION | VERSIONLEN | PATH | PATHLENGTH) cics_data_area | HOSTLENGTH cics_data_value | (HOSTTYPE | SCHEME) cics_cvda | cics_handle_response)+;

/** EXTRACT (System Commands) */
cics_extract_system_programming: EXTRACT (cics_extract_exit | cics_extract_statistics);
cics_extract_exit: (EXIT | (PROGRAM | ENTRYNAME) cics_data_value | GALENGTH cics_data_area | GASET cics_ref | cics_handle_response)+;
cics_extract_statistics: (STATISTICS | cics_restype | cics_subrestype | (RESID | SUBRESID | LASTRESET | LASTRESETABS | LASTRESETHRS | LASTRESETMIN | LASTRESETSEC) cics_data_area |
                          SET cics_ref | (RESIDLEN | SUBRESIDLEN | APPLICATION | APPLMAJORVER | APPLMINORVER | APPLMICROVER | PLATFORM) cics_data_value | cics_handle_response)+;

/** FETCH / ANY / CHILD */
cics_fetch: FETCH cics_fetch_any_child;
cics_fetch_any_child: ((ANY | CHANNEL | ABCODE) cics_data_area  | (CHILD | TIMEOUT) cics_data_value | COMPSTATUS cics_cvda | NOSUSPEND | cics_handle_response)+;

/** FORCE TIMER */
cics_force: FORCE cics_force_opts;
cics_force_opts: (TIMER cics_data_value | ACQACTIVITY | ACQPROCESS | cics_handle_response)+;

/** FORMATTIME */
cics_formattime: FORMATTIME cics_formattime_opts;
cics_formattime_opts: ((ABSTIME  | DATE  | FULLDATE  | DATEFORM | DAYCOUNT | DAYOFMONTH | DAYOFWEEK | DDMMYY | DDMMYYYY
                    | MILLISECONDS | MMDDYY | MMDDYYYY | MONTHOFYEAR | YYDDMM | YYDDD | YYMMDD | YYYYDDD | YYYYDDMM
                    | YYYYMMDD | DATESTRING | TIME | YEAR) cics_data_area | DATESEP (cics_data_area)?
                    | (STRINGFORMAT | STRINGZONE) cics_cvda | TIMESEP cics_data_area?
                    | cics_handle_response)+;

/** FREE (all of them) */
cics_free: FREE cics_free_body?;
cics_free_body: ((CONVID | SESSION) cics_name | STATE cics_cvda | CHILD cics_data_value | cics_handle_response)+;

/** FREEMAIN */
cics_freemain: (FREEMAIN | FREEMAIN64) cics_freemain_opts;
cics_freemain_opts:(DATA cics_data_area | DATAPOINTER cics_value | cics_handle_response)+;

/** GDS */
cics_gds: GDS cics_gds_opts;
cics_gds_opts: ~(END_EXEC|EOF|DOT)*;

/** GET CONTAINER / GET COUNTER / GET DCOUNTER */
cics_get: (GET (cics_get_container_bts | cics_get_counter_dcounter)) | (GET|GET64) cics_get_container_channel;
cics_get_container_bts: ((CONTAINER | ACTIVITY) cics_data_value | ACQACTIVITY | PROCESS | ACQPROCESS | (INTO | FLENGTH) cics_data_area |
                    SET cics_ref | NODATA  | cics_handle_response)*;
cics_get_container_channel: ((CONTAINER | CHANNEL | BYTEOFFSET | INTOCCSID | INTOCODEPAGE) cics_data_value | (INTO | FLENGTH | CCSID) cics_data_area |
                    SET cics_ref | NODATA | CONVERTST cics_cvda | cics_handle_response)*;
cics_get_counter_dcounter: ((COUNTER | DCOUNTER | POOL) cics_name | VALUE cics_data_area | (INCREMENT | COMPAREMIN | COMPAREMAX) cics_data_value |
                  WRAP | NOSUSPEND | REDUCE | cics_handle_response)*;

/** GETMAIN */
cics_getmain: GETMAIN cics_getmain_body;
cics_getmain_body: (SET cics_ref | FLENGTH cics_data_value | BELOW | LENGTH cics_data_value | INITIMG cics_data_value |
              EXECUTABLE | SHARED | NOSUSPEND | USERDATAKEY | CICSDATAKEY | cics_handle_response)+;
cics_getmain64: GETMAIN64 cics_getmain64_body;
cics_getmain64_body: (SET cics_ref | FLENGTH cics_data_value | LOCATION cics_cvda |
                  EXECUTABLE | SHARED | NOSUSPEND | USERDATAKEY | CICSDATAKEY | cics_handle_response)+;


/** GETNEXT ACTIVITY / CONTAINER / EVENT / PROCESS */
cics_getnext: GETNEXT (cics_getnext_activity | cics_getnext_container | cics_getnext_event | cics_getnext_process | cics_getnext_timer);
cics_getnext_activity: (BROWSETOKEN cics_data_value | (ACTIVITY | ACTIVITYID | LEVEL) cics_data_area | cics_handle_response)+;
cics_getnext_container: (CONTAINER cics_data_area | BROWSETOKEN cics_data_value | cics_handle_response)+;
cics_getnext_event: (BROWSETOKEN cics_data_value | (EVENT | COMPOSITE | TIMER) cics_data_area | (EVENTTYPE | FIRESTATUS | PREDICATE) cics_cvda | cics_handle_response)+;
cics_getnext_process: (BROWSETOKEN cics_data_value | (PROCESS | ACTIVITYID) cics_data_area | cics_handle_response)+;
cics_getnext_timer: ((TIMER | ACTIVITYID) cics_data_value | (EVENT | ABSTIME | BROWSETOKEN) cics_data_area | STATUS cics_cvda | cics_handle_response)+;

/** HANDLE CONDITION / HANDLE AID / HANDLE ABEND: */
cics_handle: HANDLE (cics_handle_abend | cics_handle_aid | cics_handle_condition);
cics_handle_abend: (ABEND | CANCEL | PROGRAM cics_name | LABEL cics_label | RESET | cics_handle_response)*;
cics_handle_aid: (AID | (ANYKEY | CLEAR | CLRPARTN | ENTER | LIGHTPEN | OPERID | PA1 | PA2 | PA3 | PF1 | PF2 | PF3 | PF4 | PF5 |
                PF6 | PF7 | PF8 | PF9 | PF10 | PF11 | PF12 | PF13 | PF14 | PF15 | PF16 | PF17 | PF18 | PF19 | PF20 | PF21 | PF22 |
                PF23 | PF24 | TRIGGER)  (cics_label)? | cics_handle_response)+;
cics_handle_condition: (CONDITION | cics_conditions (cics_label)? | cics_handle_response)*;

/** IGNORE CONDITION */
cics_ignore: IGNORE cics_ignore_options;
cics_ignore_options :  (CONDITION | cics_conditions | cics_handle_response)+;

/** INQUIRE, Application Commands ACTIVITYID / CONTAINER / EVENT / PROCESS / TIMER */
cics_inquire: INQUIRE (cics_inquire_process | cics_inquire_activityid | cics_inquire_container | cics_inquire_event | cics_inquire_timer);
cics_inquire_activityid: ((COMPSTATUS | MODE | SUSPSTATUS) cics_cvda | (ABCODE | ABPROGRAM | ACTIVITY | EVENT | PROCESS | PROCESSTYPE | PROGRAM | TRANSID | USERID) cics_data_area | cics_handle_response)* ACTIVITYID cics_data_value ((COMPSTATUS | MODE | SUSPSTATUS) cics_cvda | (ABCODE | ABPROGRAM | ACTIVITY | EVENT | PROCESS | PROCESSTYPE | PROGRAM | TRANSID | USERID) cics_data_area | cics_handle_response)*;
cics_inquire_container: CONTAINER cics_data_value ((ACTIVITYID | PROCESS | PROCESSTYPE) cics_data_value | (DATALENGTH | SET) cics_data_area | cics_handle_response)*;
cics_inquire_event: EVENT cics_data_value (ACTIVITYID cics_data_value | (EVENTTYPE | FIRESTATUS | PREDICATE) cics_cvda | (COMPOSITE | TIMER) cics_data_area | cics_handle_response)*;
cics_inquire_process: PROCESS cics_data_value (PROCESSTYPE cics_data_value | ACTIVITYID cics_data_area | cics_handle_response)*;
cics_inquire_timer: TIMER cics_data_value (ACTIVITYID cics_data_value | (EVENT | ABSTIME) cics_data_area| STATUS cics_cvda | cics_handle_response)*;

cics_browse_start_end: (START | END);
/** INQUIRE, System Commands */
cics_inquire_system_programming: INQUIRE (cics_inquire_profile | cics_inquire_association | cics_inquire_association_list | cics_inquire_atomservice | cics_inquire_autinstmodel | cics_inquire_autoinstall | cics_inquire_brfacility | cics_inquire_bundle | cics_inquire_bundlepart | cics_inquire_capdatapred | cics_inquire_capinfosrce | cics_inquire_capoptpred | cics_inquire_capturespec | cics_inquire_connection | cics_inquire_cfdtpool | cics_inquire_db2conn | cics_inquire_db2entry | cics_inquire_db2tran | cics_inquire_deletshipped | cics_inquire_dispatcher | cics_inquire_doctemplate | cics_inquire_dsname | cics_inquire_dumpds | cics_inquire_enq | cics_inquire_enqmodel | cics_inquire_epadapter | cics_inquire_epadapterset | cics_inquire_epadaptinset | cics_inquire_eventbinding | cics_inquire_eventprocess | cics_inquire_exci | cics_inquire_exitprogram | cics_inquire_featurekey | cics_inquire_file | cics_inquire_host | cics_inquire_ipconn | cics_inquire_ipfacility | cics_inquire_irc | cics_inquire_journalmodel | cics_inquire_journalname | cics_inquire_jvmendpoint | cics_inquire_jvmserver | cics_inquire_library | cics_inquire_modename | cics_inquire_monitor | cics_inquire_mqconn | cics_inquire_mqini | cics_inquire_mqmonitor | cics_inquire_mvstcb | cics_inquire_netname | cics_inquire_nodejsapp | cics_inquire_osgibundle | cics_inquire_osgiservice | cics_inquire_partner | cics_inquire_pipeline | cics_inquire_policy | cics_inquire_policyrule | cics_inquire_processtype | cics_inquire_program | cics_inquire_reqid | cics_inquire_rrms | cics_inquire_secdiscovery | cics_inquire_secrecording | cics_inquire_statistics | cics_inquire_storage | cics_inquire_storage64 | cics_inquire_streamname | cics_inquire_subpool | cics_inquire_sysdumpcode | cics_inquire_system | cics_inquire_tag | cics_inquire_task | cics_inquire_task_list | cics_inquire_tclass | cics_inquire_tcpip | cics_inquire_tcpipservice | cics_inquire_tdqueue | cics_inquire_tempstorage | cics_inquire_terminal | cics_inquire_tracedest | cics_inquire_traceflag | cics_inquire_tracetype | cics_inquire_tranclass | cics_inquire_trandumpcode | cics_inquire_transaction | cics_inquire_tsmodel | cics_inquire_tspool | cics_inquire_tsqueue | cics_inquire_uow | cics_inquire_uowdsnfail | cics_inquire_uowenq | cics_inquire_uowlink | cics_inquire_urimap | cics_inquire_vtam | cics_inquire_web | cics_inquire_webservice | cics_inquire_wlmhealth | cics_inquire_xmltransform);

cics_inquire_association: ASSOCIATION cics_data_value ((ACAPPLNAME | ACMAJORVER | ACMICROVER | ACMINORVER | ACOPERNAME | ACPLATNAME | APPLDATA | APPLID | CLIENTIPADDR | CLIENTLOC | CLIENTPORT | DNAME | FACILNAME | INITUSERID | IPCONN | LUNAME | MVSIMAGE | NETID | ODADPTRDATA1 | ODADPTRDATA2 | ODADPTRDATA3 | ODADPTRID| ODAPPLID | ODCLNTIPADDR | ODCLNTPORT | ODFACILNAME | ODLUNAME | ODNETID | ODNETWORKID | ODSERVERPORT | ODSTARTTIME | ODTASKID | ODTCPIPS | ODTRANSID | ODUSERID | PHAPPLID | PHCOUNT | PHNETWORKID | PHSTARTTIME | PHTASKID | PHTRANSID | PROGRAM | PTCOUNT | PTSTARTTIME | PTTASKID | PTTRANSID | REALM | SERVERIPADDR | SERVERPORT | STARTTIME | TCPIPJOB | TCPIPSERVICE | TCPIPZONE | TRNGRPID | TRANSACTION | USERCORRDATA | USERID) cics_data_area | (CLNTIPFAMILY | FACILTYPE | IPFAMILY | ODFACILTYPE | ODIPFAMILY | SRVRIPFAMILY) cics_cvda | cics_handle_response)*;
cics_inquire_association_list: ASSOCIATION (LIST (LISTSIZE cics_data_area)? | (DNAME | DNAMELEN | REALM | REALMLEN | USERCORRDATA) cics_data_value | SET cics_ref | cics_handle_response)*;
cics_inquire_atomservice: ATOMSERVICE cics_data_value? ((cics_browse_start_end | NEXT) | (ATOMTYPE | CHANGEAGENT | ENABLESTATUS | INSTALLAGENT | RESOURCETYPE) cics_cvda | (BINDFILE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | CONFIGFILE | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | RESOURCENAME | URIMAP | XMLTRANSFORM) cics_data_area | cics_handle_response)*;
cics_inquire_autinstmodel: AUTINSTMODEL cics_data_value? ((cics_browse_start_end | NEXT) | cics_handle_response)*;
cics_inquire_autoinstall: AUTOINSTALL ((AIBRIDGE | CONSOLES | ENABLESTATUS) cics_cvda | (CURREQS | MAXREQS | PROGRAM) cics_data_area | cics_handle_response)*;
cics_inquire_brfacility: BRFACILITY cics_data_value? ((cics_browse_start_end | NEXT) | (KEEPTIME | LINKSYSTEM | LINKSYSNET | NETNAME | REMOTESYSNET | REMOTESYSTEM | TASKID | TERMID | TRANSACTION | USERID) cics_data_area | (NAMESPACE | TERMSTATUS) cics_cvda | cics_handle_response)*;
cics_inquire_bundle: BUNDLE cics_data_value? ((START | END | NEXT) | (BUNDLEID | MAJORVERSION | MGMTPART | MICROVERSION | MINORVERSION) cics_data_value | (AVAILSTATUS | CHANGEAGENT | ENABLESTATUS | INSTALLAGENT) cics_cvda | (BASESCOPE | BUNDLEDIR | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | ENABLEDCOUNT | INSTALLTIME | INSTALLUSRID | PARTCOUNT | TARGETCOUNT) cics_data_area | cics_handle_response)*;
cics_inquire_bundlepart: BUNDLEPART cics_data_area? (BUNDLE cics_data_value | (START | END | NEXT) | (METADATAFILE | PARTTYPE) cics_data_area | (AVAILSTATUS | ENABLESTATUS | PARTCLASS) cics_cvda | cics_handle_response)*;
cics_inquire_capdatapred: CAPDATAPRED ((START | END | NEXT) | (CAPTURESPEC | EVENTBINDING) cics_data_value | (CONTAINER | FIELDLENGTH | FIELDOFFSET | FILENAME | FILTERVALUE | LOCATION | STRUCTNAME | VARIABLENAME) cics_data_area | OPERATOR cics_cvda | cics_handle_response)*;
cics_inquire_capinfosrce: CAPINFOSRCE ((START | END | NEXT) | (CAPTURESPEC | EVENTBINDING) cics_data_value | (CONTAINER | FIELDLENGTH | FIELDOFFSET | FILENAME | ITEMNAME | LOCATION | STRUCTNAME | VARIABLENAME) cics_data_area | cics_handle_response)*;
cics_inquire_capoptpred: CAPOPTPRED ((START | END | NEXT) | (CAPTURESPEC | EVENTBINDING)  cics_data_value | (FILTERVALUE | OPTIONNAME) cics_data_area | OPERATOR cics_cvda | cics_handle_response)*;
cics_inquire_capturespec: CAPTURESPEC cics_data_area? ((START | END | NEXT) | (CAPTUREPOINT | CURRPGM | CURRTRANID | CURRUSERID | EVENTNAME | NUMDATAPRED | NUMINFOSRCE | NUMOPTPRED | PRIMPRED) cics_data_area | EVENTBINDING cics_data_value | (CAPTUREPTYPE | CURRPGMOP | CURRTRANIDOP | CURRUSERIDOP | PRIMPREDOP | PRIMPREDTYPE) cics_cvda | cics_handle_response)*;
cics_inquire_connection: CONNECTION cics_data_value? ((cics_browse_start_end | NEXT) | (ACCESSMETHOD | ACQSTATUS | AUTOCONNECT | CHANGEAGENT | CONNSTATUS | CONNTYPE | CQP | EXITTRACING | INSTALLAGENT | PENDSTATUS | PROTOCOL | RECOVSTATUS | SERVSTATUS | XLNSTATUS | ZCPTRACING) cics_cvda | (AIDCOUNT | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | GRNAME | INSTALLTIME | INSTALLUSRID | LINKSYSTEM | MEMBERNAME | NETNAME | NQNAME | RECEIVECOUNT | REMOTENAME | REMOTESYSNET | REMOTESYSTEM | SENDCOUNT) cics_data_area | cics_handle_response)*;
cics_inquire_cfdtpool: CFDTPOOL cics_data_value? ((cics_browse_start_end | NEXT) | CONNSTATUS cics_cvda | cics_handle_response)*;
cics_inquire_db2conn: DB2CONN ((ACCOUNTREC | AUTHTYPE | CHANGEAGENT | COMAUTHTYPE | CONNECTERROR | CONNECTST | DROLLBACK | INSTALLAGENT | NONTERMREL | PRIORITY | RESYNCMEMBER | STANDBYMODE | THREADERROR | THREADWAIT) cics_cvda | (AUTHID | CHANGEAGREL | CHANGETIME | CHANGEUSRID | COMAUTHID | COMTHREADLIM | COMTHREADS | DB2GROUPID | DB2ID | DB2RELEASE | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | MSGQUEUE1 | MSGQUEUE2 | MSGQUEUE3 | PLAN | PLANEXITNAME | PURGECYCLEM | PURGECYCLES | REUSELIMIT | SIGNID | STATSQUEUE | TCBLIMIT | TCBS | THREADLIMIT | THREADS) cics_data_area | cics_handle_response)*;
cics_inquire_db2entry: DB2ENTRY cics_data_value? ((cics_browse_start_end | NEXT) | (ACCOUNTREC | AUTHTYPE | CHANGEAGENT | DISABLEDACT | DROLLBACK | ENABLESTATUS | INSTALLAGENT | PRIORITY | SHARELOCKS | THREADWAIT) cics_cvda | (AUTHID | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | PLAN | PLANEXITNAME | PROTECTNUM | PTHREADS | THREADLIMIT | THREADS) cics_data_area | cics_handle_response)*;
cics_inquire_db2tran: DB2TRAN cics_data_value? ((cics_browse_start_end | NEXT) | (DB2ENTRY | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | PLAN | PLANEXITNAME | TRANSID) cics_data_area | (CHANGEAGENT | INSTALLAGENT) cics_cvda | cics_handle_response)*;
cics_inquire_deletshipped: DELETSHIPPED ((IDLE | IDLEHRS | IDLEMINS | IDLESECS | INTERVAL | INTERVALHRS | INTERVALMINS | INTERVALSECS) cics_data_area | cics_handle_response)*;
cics_inquire_dispatcher: DISPATCHER ((ACTOPENTCBS | ACTSSLTCBS | ACTTHRDTCBS | ACTXPTCBS | MAXOPENTCBS | MAXSSLTCBS | MAXTHRDTCBS | MAXXPTCBS | MROBATCH | PRTYAGING | RUNAWAY | SCANDELAY | SUBTASKS | TIME) cics_data_area | cics_handle_response)*;
cics_inquire_doctemplate: DOCTEMPLATE cics_data_value? ((cics_browse_start_end | NEXT) | (APPENDCRLF | CHANGEAGENT | INSTALLAGENT | TEMPLATETYPE | TYPE) cics_cvda | (CACHESIZE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DDNAME | DEFINESOURCE | DEFINETIME | DSNAME | EXITPGM | FILE | HFSFILE | INSTALLTIME | INSTALLUSRID | MEMBER | PROGRAM | TDQUEUE | TEMPLATENAME | TSQUEUE) cics_data_area | cics_handle_response)*;
cics_inquire_dsname: DSNAME cics_data_value? ((cics_browse_start_end | NEXT) | (ACCESSMETHOD | AVAILABILITY | BACKUPTYPE | OBJECT | LOGREPSTATUS | LOSTLOCKS | QUIESCESTATE | RECOVSTATUS | RETLOCKS | VALIDITY) cics_cvda | (BASEDSNAME | FILECOUNT | FWDRECOVLOG | FWDRECOVLSN) cics_data_area | cics_handle_response)*;
cics_inquire_dumpds: DUMPDS ((CURRENTDDS | INITIALDDS) cics_data_area | (OPENSTATUS | SWITCHSTATUS) cics_cvda | cics_handle_response)*;
cics_inquire_enq: ENQ ((START | END | NEXT) | (ENQSCOPE | RESOURCE | RESLEN | UOW) cics_data_value | (DURATION | ENQFAILS | NETUOWID | QUALIFIER | QUALLEN | RESLEN | RESOURCE | TASKID | TRANSID | UOW) cics_data_area | (RELATION | STATE | TYPE) cics_cvda | cics_handle_response)+;
cics_inquire_enqmodel: ENQMODEL cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | INSTALLAGENT | STATUS) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | ENQSCOPE | ENQNAME | INSTALLTIME | INSTALLUSRID) cics_data_area | cics_handle_response)*;
cics_inquire_epadapter: EPADAPTER cics_data_value? ((cics_browse_start_end | NEXT) | (ADAPTERTYPE | AUTHORITY | DATAFORMAT | EMITMODE | ENABLESTATUS | INVOKETYPE | PRIORITY | TRANSMODE | CHANGEAGENT | INSTALLAGENT) cics_cvda | (AUTHUSERID | CONFIGDATA1 | PROGRAM | TRANSACTION | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID) cics_data_area | cics_handle_response)*;
cics_inquire_epadapterset: EPADAPTERSET cics_data_area? ((cics_browse_start_end | NEXT) | (EPADAPTERNUM |  CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID) cics_data_area | (ENABLESTATUS | CHANGEAGENT | INSTALLAGENT) cics_cvda | cics_handle_response)*;
cics_inquire_epadaptinset: EPADAPTINSET ((START | END | NEXT) | EPADAPTERSET cics_data_value | EPADAPTER cics_data_area | cics_handle_response)*;
cics_inquire_eventbinding: EVENTBINDING cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | ENABLESTATUS | EPADAPTERRES | INSTALLAGENT) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | EPADAPTER | EPADAPTERSET | INSTALLTIME | INSTALLUSRID | USERTAG) cics_data_area | cics_handle_response)*;
cics_inquire_eventprocess: EVENTPROCESS (EPSTATUS cics_cvda | SCHEMALEVEL cics_data_area | cics_handle_response)*;
cics_inquire_exci: EXCI cics_data_value? ((START | END | NEXT) | (TASK | URID) cics_data_value | cics_handle_response)*;
cics_inquire_exitprogram: EXITPROGRAM cics_data_value? ((START | END | NEXT) | EXIT cics_data_value | (ENTRYNAME | GAENTRYNAME | GALENGTH | GAUSECOUNT | NUMEXITS | QUALIFIER | TALENGTH | USECOUNT) cics_data_area | (APIST | CONCURRENTST | CONNECTST | FORMATEDFST | INDOUBTST | PURGEABLEST | SHUTDOWNST | SPIST | STARTSTATUS | TASKSTARTST) cics_cvda | ENTRY cics_ref | cics_handle_response)*;
cics_inquire_featurekey: FEATUREKEY cics_data_value? ((START | END | NEXT) | (VALUE | FILEPATH) cics_data_area | cics_handle_response)*;
cics_inquire_file: FILE cics_data_value? ((cics_browse_start_end | NEXT) | (ACCESSMETHOD | ADD | BLOCKFORMAT | BROWSE | CHANGEAGENT | DELETE | DISPOSITION | EMPTYSTATUS | ENABLESTATUS | EXCLUSIVE | FWDRECSTATUS | INSTALLAGENT | LOADTYPE | OBJECT | OPENSTATUS | RBATYPE | READ | READINTEG | RECORDFORMAT | RECOVSTATUS | RELTYPE | REMOTETABLE | RLSACCESS | TABLE | TYPE | UPDATE | UPDATEMODEL) cics_cvda |(BASEDSNAME | BLOCKKEYLEN | BLOCKSIZE | CFDTPOOL | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | DSNAME | INSTALLTIME | INSTALLUSRID | JOURNALNUM | KEYLENGTH | KEYPOSITION | LSRPOOLNUM | MAXNUMRECS | RECORDSIZE | REMOTENAME | REMOTESYSTEM | STRINGS | TABLENAME) cics_data_area | cics_handle_response)*;
cics_inquire_host: HOST cics_data_area? ((cics_browse_start_end | NEXT) | (TCPIPSERVICE) cics_data_area | ENABLESTATUS cics_cvda | cics_handle_response)*;
cics_inquire_ipconn: IPCONN cics_cvda? ((cics_browse_start_end | NEXT) | (AUTOCONNECT | CHANGEAGENT | CONNSTATUS | HA | HOSTTYPE | IDPROP | IPFAMILY | INSTALLAGENT | LINKAUTH | MIRRORLIFE | PENDSTATUS | RECOVSTATUS | SERVSTATUS | SSLTYPE | USERAUTH) cics_cvda | (APPLID | CERTIFICATE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | CIPHERS | CLIENTLOC | DEFINESOURCE | DEFINETIME | HOST | IPRESOLVED | INSTALLTIME | INSTALLUSRID | MAXQTIME | NETWORKID | NUMCIPHERS | PARTNER | PORT | QUEUELIMIT | RECEIVECOUNT | SECURITYNAME | SENDCOUNT | TCPIPSERVICE) cics_data_area | cics_handle_response)*;
cics_inquire_ipfacility: IPFACILITY cics_data_value (IPCONN cics_data_area | IPFACILTYPE cics_cvda | cics_handle_response)*;
cics_inquire_irc: IRC (OPENSTATUS cics_cvda | XCFGROUP cics_data_area | cics_handle_response)*;
cics_inquire_journalmodel: JOURNALMODEL cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | INSTALLAGENT | TYPE) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | JOURNALNAME | STREAMNAME) cics_data_area | cics_handle_response)*;
cics_inquire_journalname: JOURNALNAME cics_data_value? ((cics_browse_start_end | NEXT) | (STATUS | TYPE) cics_cvda | STREAMNAME cics_data_area | cics_handle_response)*;
cics_inquire_jvmendpoint: JVMENDPOINT cics_data_value? ((START | END | NEXT) | JVMSERVER cics_data_value | (TYPE | PORT | SECPORT | HOST) cics_data_area | ENABLESTATUS cics_cvda | cics_handle_response)*;
cics_inquire_jvmserver: JVMSERVER cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | ENABLESTATUS | INSTALLAGENT) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | CURRENTHEAP | DEFINESOURCE | DEFINETIME | GCPOLICY | INITHEAP | INSTALLTIME | INSTALLUSRID | JAVAHOME | JVMPROFILE | LERUNOPTS | LOG | MAXHEAP | OCCUPANCY | PID | PROFILE | PROFILEDIR | STDERR | STDOUT | THREADCOUNT | THREADLIMIT | TRACE | WORKDIR) cics_data_area | cics_handle_response)*;
cics_inquire_library: LIBRARY cics_data_value? ((cics_browse_start_end | NEXT) | (APPLICATION | APPLMAJORVER | APPLMINORVER | APPLMICROVER | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | DSNAME01 | DSNAME02 | DSNAME03 | DSNAME04 | DSNAME05 | DSNAME06 | DSNAME07 | DSNAME08 | DSNAME09 | DSNAME10 | DSNAME11 | DSNAME12 | DSNAME13 | DSNAME14 | DSNAME15 | DSNAME16 | INSTALLUSRID | INSTALLTIME | NUMDSNAMES | PLATFORM | RANKING | SEARCHPOS) cics_data_area | (CHANGEAGENT | CRITICALST | ENABLESTATUS | INSTALLAGENT) cics_cvda | DSNAMELIST cics_ref | cics_handle_response)*;
cics_inquire_modename: MODENAME cics_data_value? ((START | END | NEXT) | CONNECTION cics_data_value | (ACTIVE | AVAILABLE | MAXIMUM | MAXWINNERS) cics_data_area | AUTOCONNECT cics_cvda | cics_handle_response)*;
cics_inquire_monitor: MONITOR ((APPLNAMEST | COMPRESSST | CONVERSEST | EXCEPTCLASS | IDNTYCLASS | PERFCLASS | RESRCECLASS | RMIST | STATUS | SYNCPOINTST | TIME) cics_cvda | (DPLLIMIT | FILELIMIT | FREQUENCY | FREQUENCYHRS | FREQUENCYMINS | FREQUENCYSECS | TSQUEUELIMIT | URIMAPLIMIT | WEBSERVLIMIT) cics_data_area | cics_handle_response)*;
cics_inquire_mqconn: MQCONN ((CHANGEAGENT | CONNECTST | INSTALLAGENT | RESYNCMEMBER) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | MQNAME | MQQMGR | MQRELEASE | TASKS | TRIGMONTASKS) cics_data_area | cics_handle_response)*;
cics_inquire_mqini: MQINI cics_data_value ((CHANGEAGENT | INSTALLAGENT) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INITQNAME | INSTALLTIME | INSTALLUSRID) cics_data_area | cics_handle_response)*;
cics_inquire_mqmonitor: MQMONITOR cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | ENABLESTATUS | INSTALLAGENT | MONSTATUS) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | MONDATA | MONUSERID | QNAME | TASKID | TRANSACTION | USERID) cics_data_area | cics_handle_response)*;
cics_inquire_mvstcb: MVSTCB cics_ref? ((START | END | NEXT) | SET cics_ref | NUMELEMENTS cics_data_area | cics_handle_response)*;
cics_inquire_nodejsapp: NODEJSAPP cics_data_value? ((cics_browse_start_end | NEXT) | (TERMINAL | BUNDLE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | LERUNOPTS | LOG | NODEHOME | PID | PROFILE | STARTSCRIPT | STDERR | STDOUT | TRACE) cics_data_area | (CHANGEAGENT | ENABLESTATUS | INSTALLAGENT) cics_cvda | cics_handle_response)*;
cics_inquire_osgibundle: OSGIBUNDLE cics_data_value? ((START | END | NEXT) | (OSGIVERSION | JVMSERVER) cics_data_value | (BUNDLE | BUNDLEPART | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | OSGIBUNDLEID) cics_data_area | (CHANGEAGENT | INSTALLAGENT | OSGISTATUS) cics_cvda | cics_handle_response)*;
cics_inquire_osgiservice: OSGISERVICE cics_data_value? ((START | END | NEXT) | JVMSERVER cics_data_value | (BUNDLE | BUNDLEPART | OSGIBUNDLE | OSGIVERSION | SRVCNAME) cics_data_area | SRVCSTATUS cics_cvda | cics_handle_response)*;
cics_inquire_partner: PARTNER cics_data_value? ((cics_browse_start_end | NEXT) | (NETWORK | NETNAME | PROFILE | TPNAME | TPNAMELEN) cics_data_area | cics_handle_response)*;
cics_inquire_pipeline: PIPELINE cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | ENABLESTATUS | INSTALLAGENT | MODE | MTOMNOXOPST | MTOMST | SENDMTOMST | XOPDIRECTST | XOPSUPPORTST) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | CIDDOMAIN | CONFIGFILE | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | MSGFORMAT | RESPWAIT | SHELF | SOAPLEVEL | SOAPRNUM | SOAPVNUM | WSDIR) cics_data_area | cics_handle_response)*;
cics_inquire_policy: POLICY cics_data_value? ((cics_browse_start_end | NEXT) | (BUNDLE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | USERTAG) cics_data_area | (CHANGEAGENT | ENABLESTATUS | INSTALLAGENT) cics_cvda | cics_handle_response)*;
cics_inquire_policyrule: POLICYRULE cics_data_value? ((START | END | NEXT) | POLICY cics_data_value | (ABENDCODE | ACTIONCOUNT | EPADAPTER | EPADAPTERSET | LASTACTTIME | RULEITEM | THRESHOLD) cics_data_area | (ACTIONTYPE | RULEGROUP | RULETYPE | WLMOPENST) cics_cvda | cics_handle_response)*;
cics_inquire_processtype: PROCESSTYPE cics_data_value? ((cics_browse_start_end | NEXT) | (AUDITLOG | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | FILE | INSTALLTIME | INSTALLUSRID) cics_data_area | (AUDITLEVEL | CHANGEAGENT | INSTALLAGENT | STATUS) cics_cvda | cics_handle_response)*;
cics_inquire_profile: PROFILE cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | INSTALLAGENT) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID) cics_data_area | cics_handle_response)*;
cics_inquire_program: PROGRAM cics_data_value? (AT cics_data_value | (START | END | NEXT) | (APIST | CEDFSTATUS | CHANGEAGENT | COBOLTYPE | COPY | CONCURRENCY | DATALOCATION | DYNAMSTATUS | EXECKEY | EXECUTIONSET | HOLDSTATUS | INSTALLAGENT | LANGDEDUCED | LANGUAGE | LPASTATUS | PROGTYPE | REPLICATION | RESIDENCY | RUNTIME | SHARESTATUS | STATUS) cics_cvda | (APPLICATION | APPLMAJORVER | APPLMINORVER | APPLMICROVER | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | JVMCLASS | JVMPROFILE | JVMSERVER | LENGTH | LIBRARY | LIBRARYDSN | OPERATION | PLATFORM | REMOTENAME | REMOTESYSTEM | RESCOUNT | TRANSID | USECOUNT) cics_data_area | (ENTRYPOINT | LOADPOINT) cics_ref | cics_handle_response)*;
cics_inquire_reqid: REQID cics_data_value? ((START | END | NEXT) | (REQTYPE | FMHSTATUS) cics_cvda | SET cics_ref | (TERMID | TRANSID | TIME | INTERVAL | HOURS | MINUTES | SECONDS | LENGTH | RTRANSID | RTERMID | QUEUE | USERID) cics_data_area | AFTER | AT | cics_handle_response)*;
cics_inquire_rrms: RRMS (OPENSTATUS cics_cvda | cics_handle_response)*;
cics_inquire_secdiscovery: SECDISCOVERY ((STATUS | CMD | DB2 | DCT | FCT | HFS | JCT | PCT | PPT | PSB | RES | TRAN | TST | USER) cics_cvda | (LASTSECDTIME | LASTWRITTIME | SECDCOUNT | NEWSECDCOUNT) cics_data_area | cics_handle_response)*;
cics_inquire_secrecording: SECRECORDING cics_data_value? ((cics_browse_start_end | NEXT) | (ODADPTRID | ODADPTRDATA1 | ODADPTRDATA2 | ODADPTRDATA3 | ODAPPLID | ODCLNTIPADDR | ODCLNTPORT | ODFACILNAME | ODFACILTYPE | ODIPFAMILY | ODLUNAME | ODNETID | ODNETWORKID | ODSERVERPORT | ODTCPIPS | ODTRANSID | ODUSERID) cics_data_value | (MAXIMUM | CURRENT) cics_data_area | cics_handle_response)*;
cics_inquire_statistics: STATISTICS (RECORDING cics_cvda | (ENDOFDAY | ENDOFDAYHRS | ENDOFDAYMINS | ENDOFDAYSECS | INTERVAL | INTERVALHRS | INTERVALMINS | INTERVALSECS | NEXTTIME | NEXTTIMEHRS | NEXTTIMEMINS | NEXTTIMESECS) cics_data_area | cics_handle_response)*;
cics_inquire_storage: STORAGE ((ADDRESS | ELEMENT | ELEMENTLIST | LENGTHLIST) cics_ref | (FLENGTH | NUMELEMENTS) cics_data_area | TASK cics_data_value | cics_handle_response)*;
cics_inquire_storage64: STORAGE64 ((ELEMENT64 | ELEMENTLIST | LENGTHLIST) cics_ref | (ADDRESS64 | DSANAME | TASK) cics_data_value | (FLENGTH | NUMELEMENTS) cics_data_area | cics_handle_response)*;
cics_inquire_streamname: STREAMNAME cics_data_value? ((cics_browse_start_end | NEXT) | (STATUS | SYSTEMLOG) cics_cvda | USECOUNT cics_data_area | cics_handle_response)*;
cics_inquire_subpool: SUBPOOL cics_data_area? (AT cics_data_value | (START | END | NEXT) | DSANAME cics_data_area | cics_handle_response)*;
cics_inquire_sysdumpcode: SYSDUMPCODE cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | DAEOPTION | DUMPSCOPE | INSTALLAGENT | SHUTOPTION | SYSDUMPING) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | CURRENT | DEFINESOURCE | DEFINETIME | DSPLIST | INSTALLTIME | INSTALLUSRID | JOBLIST | MAXIMUM) cics_data_area | cics_handle_response)*;
cics_inquire_system: SYSTEM ((ACTOPENTCBS | AIDCOUNT | AKP | CDSASIZE | CICSSYS | CICSTSLEVEL | DB2CONN | DFLTUSER | DSALIMIT | DSRTPROGRAM | DTRPROGRAM | ECDSASIZE | EDSALIMIT | EPCDSASIZE | EPUDSASIZE | ERDSASIZE | ESDSASIZE | EUDSASIZE | GCDSASIZE | GMMTEXT | GMMLENGTH | GSDSASIZE | GUDSASIZE | GMMTRANID | JOBNAME | LASTCOLDTIME | LASTEMERTIME | LASTINITTIME | LASTWARMTIME | LOGDEFER | MAXOPENTCBS | MAXTASKS | MEMLIMIT | MQCONN | MROBATCH | MVSSMFID | MVSSYSNAME | OPREL | OPSYS | OSLEVEL | PCDSASIZE | PLTPIUSR | PROGAUTOEXIT | PRTYAGING | PUDSASIZE | RDSASIZE | REGIONUSERID | RELEASE | RUNAWAY | SCANDELAY | SDSASIZE | SDTMEMLIMIT | SDTRAN | STARTUPDATE | TIME | UDSASIZE) cics_data_area | SRRTASKS cics_data_value | (CICSSTATUS | CMDPROTECT | COLDSTATUS | DEBUGTOOL | DUMPING | FORCEQR | HEALTHCHECK | INITSTATUS | MESSAGECASE | PROGAUTOCTLG | PROGAUTOINST | REENTPROTECT | RLSSTATUS | SECURITYMGR | SHUTSTATUS | SOSABOVEBAR | SOSABOVELINE | SOSBELOWLINE | SOSSTATUS | STARTUP | STOREPROTECT | TRANISOLATE | XRFSTATUS) cics_cvda |  cics_handle_response)*;
cics_inquire_tag: TAG cics_data_value? ((START | END | NEXT) | cics_handle_response)*;
cics_inquire_task: TASK cics_data_value? ((ACTIVITY | ACTIVITYID | ATTACHTIME | BRFACILITY | BRIDGE | CURRENTPROG | DB2PLAN | DTIMEOUT | FACILITY | IDENTIFIER | INDOUBTMINS | IPFLISTSIZE | PRIORITY | PROCESS | PROCESSTYPE | PROFILE | PROGRAM | REMOTENAME | REMOTESYSTEM | RTIMEOUT | RUNAWAY | STARTCODE | SUSPENDTIME | SUSPENDTYPE | SUSPENDVALUE | RESNAME | TRANCLASS | TCLASS | TRANPRIORITY | TRANSACTION | TRPROF | TWASIZE | UOW | USERID) cics_data_area | (CMDSEC | DUMPING | FACILITYTYPE | INDOUBT | INDOUBTWAIT | ISOLATEST | PURGEABILITY | RESSEC | ROUTING | RUNSTATUS | SCRNSIZE | SRRSTATUS | STORAGECLEAR | TASKDATAKEY | TASKDATALOC | TCB | TRACING) cics_cvda | IPFACILITIES cics_ref |  cics_handle_response)*;
cics_inquire_task_list: TASK (LIST | DISPATCHABLE | RUNNING | SUSPENDED | LISTSIZE cics_data_area | (SET | SETTRANSID) cics_ref |  cics_handle_response)*;
cics_inquire_tclass: TCLASS cics_data_value ((CURRENT | MAXIMUM) cics_data_area |  cics_handle_response)*;
cics_inquire_tcpip: TCPIP ((ACTSOCKETS | CRLPROFILE | MAXSOCKETS) cics_data_value | (OPENSTATUS | SSLCACHE) cics_cvda |  cics_handle_response)*;
cics_inquire_tcpipservice: TCPIPSERVICE cics_data_value? ((cics_browse_start_end | NEXT) | (CERTIFICATE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | CIPHERS | CLOSETIMEOUT | CONNECTIONS | DEFINESOURCE | DEFINETIME | GENERICTCPS | HOST | INSTALLTIME | INSTALLUSRID | IPADDRESS | IPRESOLVED | MAXDATALEN | MAXPERSIST | NUMCIPHERS | OPTIONSPGM | PORT | REALM | SPECIFTCPS | TRANSID | URM) cics_data_area | BACKLOG cics_data_value | (ATTACHSEC | ATTLS | AUTHENTICATE | CHANGEAGENT | HOSTTYPE | INSTALLAGENT | IPFAMILY | OPENSTATUS | PRIVACY | PROTOCOL | SOCKETCLOSE | SSLTYPE) cics_cvda | cics_handle_response)*;
cics_inquire_tdqueue: TDQUEUE cics_data_value? ((cics_browse_start_end | NEXT) | (ATITERMID | ATITRANID | ATIUSERID | BLOCKSIZE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DATABUFFERS | DDNAME | DEFINESOURCE | DEFINETIME | DSNAME | INDIRECTNAME | INSTALLTIME | INSTALLUSRID | MEMBER | NUMITEMS | RECORDLENGTH | REMOTENAME | REMOTESYSTEM | TRIGGERLEVEL) cics_data_area | (ATIFACILITY | BLOCKFORMAT | CHANGEAGENT | DISPOSITION | EMPTYSTATUS | ENABLESTATUS | ERROROPTION | INDOUBT | INDOUBTWAIT | INSTALLAGENT | IOTYPE | OPENSTATUS | PRINTCONTROL | RECORDFORMAT | RECOVSTATUS | REWIND | SYSOUTCLASS | TYPE) cics_cvda |  cics_handle_response)*;
cics_inquire_tempstorage: TEMPSTORAGE ((TSMAININUSE | TSMAINLIMIT) cics_data_value |  cics_handle_response)*;
cics_inquire_netname: NETNAME cics_data_value? (TERMINAL cics_data_value?)? ((START | END | NEXT) | (NETNAME | AIDCOUNT | ALTPAGEHT | ALTPAGEWD | ALTPRINTER | ALTSCRNHT | ALTSCRNWD | ALTSUFFIX | CONSOLE | CORRELID | DEFPAGEHT | DEFPAGEWD | DEFSCRNHT | DEFSCRNWD | GCHARS | GCODES | LINKSYSTEM | MAPNAME | MAPSETNAME | MODENAME | NATLANG | NEXTTRANSID | NQNAME | OPERID | PAGEHT | PAGEWD | PRINTER | REMOTENAME | REMOTESYSNET | REMOTESYSTEM | SCRNHT | SCRNWD | TASKID | TCAMCONTROL | TERMINAL | TERMMODEL | TERMPRIORITY | TNADDR | TNPORT | TRANSACTION | USERAREALEN | USERID | USERNAME) cics_data_area | (ACCESSMETHOD | ACQSTATUS | ALTPRTCOPYST | APLKYBDST | APLTEXTST | ASCII | ATISTATUS | AUDALARMST | AUTOCONNECT | BACKTRANSST | COLORST | COPYST | CREATESESS | DATASTREAM | DEVICE | DISCREQST | DUALCASEST | EXITTRACING | EXTENDEDDSST | FMHPARMST | FORMFEEDST | HFORMST | HILIGHTST | KATAKANAST | LIGHTPENST | MSRCONTROLST | NATURE | OBFORMATST | OBOPERIDST | OUTLINEST | PAGESTATUS | PARTITIONSST | PRINTADAPTST | PROGSYMBOLST | PRTCOPYST | QUERYST | RELREQST | SECURITY | SERVSTATUS | SESSIONTYPE | SIGNONSTATUS | SOSIST | TERMSTATUS | TEXTKYBDST | TEXTPRINTST | TNIPFAMILY | TRACING | TTISTATUS | UCTRANST | VALIDATIONST | VFORMST | ZCPTRACING) cics_cvda | USERAREA cics_ref |  cics_handle_response)*;
cics_inquire_terminal: TERMINAL cics_data_value? (NETNAME cics_data_value?)? ((START | END | NEXT) | (NETNAME | AIDCOUNT | ALTPAGEHT | ALTPAGEWD | ALTPRINTER | ALTSCRNHT | ALTSCRNWD | ALTSUFFIX | CONSOLE | CORRELID | DEFPAGEHT | DEFPAGEWD | DEFSCRNHT | DEFSCRNWD | GCHARS | GCODES | LINKSYSTEM | MAPNAME | MAPSETNAME | MODENAME | NATLANG | NEXTTRANSID | NQNAME | OPERID | PAGEHT | PAGEWD | PRINTER | REMOTENAME | REMOTESYSNET | REMOTESYSTEM | SCRNHT | SCRNWD | TASKID | TCAMCONTROL | TERMMODEL | TERMPRIORITY | TNADDR | TNPORT | TRANSACTION | USERAREALEN | USERID | USERNAME) cics_data_area | (ACCESSMETHOD | ACQSTATUS | ALTPRTCOPYST | APLKYBDST | APLTEXTST | ASCII | ATISTATUS | AUDALARMST | AUTOCONNECT | BACKTRANSST | COLORST | COPYST | CREATESESS | DATASTREAM | DEVICE | DISCREQST | DUALCASEST | EXITTRACING | EXTENDEDDSST | FMHPARMST | FORMFEEDST | HFORMST | HILIGHTST | KATAKANAST | LIGHTPENST | MSRCONTROLST | NATURE | OBFORMATST | OBOPERIDST | OUTLINEST | PAGESTATUS | PARTITIONSST | PRINTADAPTST | PROGSYMBOLST | PRTCOPYST | QUERYST | RELREQST | SECURITY | SERVSTATUS | SESSIONTYPE | SIGNONSTATUS | SOSIST | TERMSTATUS | TEXTKYBDST | TEXTPRINTST | TNIPFAMILY | TRACING | TTISTATUS | UCTRANST | VALIDATIONST | VFORMST | ZCPTRACING) cics_cvda | USERAREA cics_ref |  cics_handle_response)*;
cics_inquire_tracedest: TRACEDEST ((CURAUXDS | TABLESIZE) cics_data_area | (AUXSTATUS | GTFSTATUS | INTSTATUS | SWITCHSTATUS) cics_cvda |  cics_handle_response)*;
cics_inquire_traceflag: TRACEFLAG ((SINGLESTATUS | SYSTEMSTATUS | TCEXITSTATUS | USERSTATUS) cics_cvda |  cics_handle_response)*;
cics_inquire_tracetype: TRACETYPE (TRACETYPE | SPECIAL | STANDARD | FLAGSET cics_cvda | (AP | AS | BA | BM | BR | CP | DC | DD | DH | DM | DP | DS | DU | EC | EI | EJ | EM | EP | FC | GC | IC | IE | IS | KC | KE | LC | LD | LG | LM | ME | ML | MN | MP | NQ | OT | PA | PC | PG | PI | PT | RA | RI | RL | RM | RS | RX | RZ | SC | SH | SJ | SM | SO | ST | SZ | TC | TD | TI | TR | TS | UE | US | WB | WU | W2 | XM | XS |
                                                                                         APPLICATION | ASYNCSERVICE | BUSAPPMGR | BRIDGE | CPI | DIRMGR | DOCUMENT | DOMAINMGR | DEBUGTOOL | DISPATCHER | DUMP | EVENTCAPTURE | ENTJAVA | EVENTMGR | EVENTPROC | GLOBALCATLG | IPECI | KERNEL | LOCALCATLG | LOADER | LOGGER | LOCKMGR | MESSAGE | MONITOR | MANAGEDPLAT | ENQUEUE | OBJECTTRAN | PARAMGR | PROGMGR | PIPEMGR | PARTNER |
                                                                                         RMIADAPTERS | RMI | RESLIFEMGR | RECOVERY | REGIONSTAT | RRS | REQUESTSTRM | SCHEDULER | SJVM | STORAGE | SOCKETS | STATISTICS | TIMER | TRACE | TEMPSTORAGE | USER | WEB | WEBRESTMGR | WEB2 | TRANMGR | SECURITY) cics_data_area | cics_handle_response)*;
cics_inquire_tranclass: TRANCLASS cics_data_value? (AT cics_data_value | (START | END | NEXT) | (ACTIVE | MAXACTIVE | PURGETHRESH | QUEUED | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID) cics_data_area | (CHANGEAGENT | INSTALLAGENT | PURGEACTION) cics_cvda |  cics_handle_response)*;
cics_inquire_trandumpcode: TRANDUMPCODE cics_data_value? ((cics_browse_start_end | NEXT) | (CURRENT | MAXIMUM | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID) cics_data_area | (DUMPSCOPE | SHUTOPTION | SYSDUMPING | TRANDUMPING | CHANGEAGENT | INSTALLAGENT) cics_cvda |  cics_handle_response)*;
cics_inquire_transaction: TRANSACTION  cics_data_value? (AT cics_data_value | (cics_browse_start_end | NEXT) | (BREXIT | DTIMEOUT | FACILITYLIKE | INDOUBTMINS | OTSTIMEOUT | PRIORITY | PROFILE | PROGRAM | REMOTENAME | REMOTESYSTEM | RTIMEOUT | RUNAWAY | TCLASS | TRANCLASS | TRPROF | TWASIZE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID) cics_data_area | (APPLICATION | APPLMAJORVER | APPLMICROVER | APPLMINORVER | OPERATION | PLATFORM) cics_data_value | (AVAILSTATUS | CMDSEC | DUMPING | INDOUBT | INDOUBTWAIT | ISOLATEST | PURGEABILITY | RESSEC | ROUTING | ROUTESTATUS | RUNAWAYTYPE | SCRNSIZE | SHUTDOWN | STATUS | STORAGECLEAR | TASKDATAKEY | TASKDATALOC | TRACING | CHANGEAGENT | INSTALLAGENT) cics_cvda |  cics_handle_response)*;
cics_inquire_tsmodel: TSMODEL cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | EXPIRYINT | EXPIRYINTMIN | INSTALLTIME | INSTALLUSRID | POOLNAME | PREFIX | REMOTEPREFIX | REMOTESYSTEM) cics_data_area | (CHANGEAGENT | INSTALLAGENT | LOCATION | RECOVSTATUS | SECURITYST) cics_cvda |  cics_handle_response)*;
cics_inquire_tspool: TSPOOL cics_data_value? ((cics_browse_start_end | NEXT) | CONNSTATUS cics_cvda |  cics_handle_response)*;
cics_inquire_tsqueue: (TSQUEUE | TSQNAME) cics_data_value? (AT cics_data_value | (START | END | NEXT) | (EXPIRYINT | EXPIRYINTMIN | FLENGTH | LASTUSEDINT | MAXITEMLEN | MINITEMLEN | NUMITEMS | TRANSID) cics_data_area | (POOLNAME | SYSID | TSMODEL) cics_data_value | (LOCATION | RECOVSTATUS) cics_cvda |  cics_handle_response)*;
cics_inquire_uow: UOW cics_data_area? ((cics_browse_start_end | NEXT) | (AGE | LINK | NETNAME | NETUOWID | OTSTID | SYSID | TASKID | TERMID | TRANSID | USERID) cics_data_area | (UOWSTATE | WAITCAUSE | WAITSTATE) cics_cvda |  cics_handle_response)*;
cics_inquire_uowdsnfail: UOWDSNFAIL ((START | END | NEXT) | (DSNAME | NETNAME | SYSID | UOW) cics_data_area | (CAUSE | REASON | RLSACCESS) cics_cvda |  cics_handle_response)*;
cics_inquire_uowenq: UOWENQ ((START | END | NEXT) | (DURATION | ENQFAILS | NETUOWID | QUALIFIER | QUALLEN | RESLEN | RESOURCE | TASKID | TRANSID | UOW) cics_data_area | (ENQSCOPE | RESOURCE | RESLEN | UOW) cics_data_value | (RELATION | STATE | TYPE) cics_cvda |  cics_handle_response)*;
cics_inquire_uowlink: UOWLINK cics_data_area? ((cics_browse_start_end | NEXT) | (HOST | PORT | BRANCHQUAL | LINK | NETUOWID | RMIQFY | SYSID | UOW | URID | XID) cics_data_area | (PROTOCOL | RESYNCSTATUS | ROLE | TYPE) cics_cvda |  cics_handle_response)*;
cics_inquire_urimap: URIMAP cics_data_value? ((cics_browse_start_end | NEXT) | (ATOMSERVICE | CERTIFICATE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | CHARACTERSET | CIPHERS | CONVERTER | DEFINESOURCE | DEFINETIME | HFSFILE | HOST | HOSTCODEPAGE | INSTALLTIME | INSTALLUSRID | IPRESOLVED | LOCATION | MEDIATYPE | NUMCIPHERS | PATH | PIPELINE | PORT | PROGRAM | SOCKETCLOSE | SOCKPOOLSIZE | TCPIPSERVICE | TEMPLATENAME | TRANSACTION | USERID | WEBSERVICE) cics_data_area | (APPLICATION | APPLMAJORVER | APPLMINORVER | APPLMICROVER | OPERATION | PLATFORM) cics_data_value | (ANALYZERSTAT | AUTHENTICATE | AVAILSTATUS | CHANGEAGENT | ENABLESTATUS | HOSTTYPE | INSTALLAGENT | IPFAMILY | REDIRECTTYPE | SCHEME | USAGE) cics_cvda |  cics_handle_response)*;
cics_inquire_vtam: VTAM ((GRNAME | PSDINTERVAL | PSDINTHRS | PSDINTMINS | PSDINTSECS) cics_data_area | (GRSTATUS | OPENSTATUS | PSTYPE) cics_cvda |  cics_handle_response)*;
cics_inquire_web: WEB ((GARBAGEINT | TIMEOUTINT) cics_data_area |  cics_handle_response)*;
cics_inquire_webservice: WEBSERVICE cics_name? ((cics_browse_start_end | NEXT) | (ARCHIVEFILE | BINDING | CCSID | CHANGEAGREL | CHANGETIME | CHANGEUSRID | CONTAINER | DEFINESOURCE | DEFINETIME | ENDPOINT | INSTALLTIME | INSTALLUSRID | LASTMODTIME | MAPPINGLEVEL | MAPPINGRNUM | MAPPINGVNUM | MINRUNLEVEL | MINRUNRNUM | MINRUNVNUM | PIPELINE | PROGRAM | URIMAP | WSBIND | WSDLFILE) cics_data_area | (CHANGEAGENT | INSTALLAGENT | PGMINTERFACE | STATE | VALIDATIONST | XOPDIRECTST | XOPSUPPORTST) cics_cvda |  cics_handle_response)*;
cics_inquire_wlmhealth: WLMHEALTH ((ADJUSTMENT | HEALTH | HEALTHABSTIM | INTERVAL) cics_data_area | OPENSTATUS cics_cvda |  cics_handle_response)*;
cics_inquire_xmltransform: XMLTRANSFORM cics_name? ((cics_browse_start_end | NEXT) | (BUNDLE | CCSID | MAPPINGLEVEL | MAPPINGRNUM | MAPPINGVNUM | MINRUNLEVEL | MINRUNRNUM | MINRUNVNUM | XMLSCHEMA | XSDBIND | CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID) cics_data_area | (VALIDATIONST | CHANGEAGENT | ENABLESTATUS | INSTALLAGENT) cics_cvda |  cics_handle_response)*;


/** INVOKE APPLICATION / INVOKE SERVICE */
cics_invoke: INVOKE (cics_invoke_application | cics_invoke_service);

cics_invoke_application: ((APPLICATION | OPERATION | PLATFORM | CHANNEL) cics_name | (MAJORVERSION | MINORVERSION | COMMAREA | LENGTH) cics_data_value |
                EXACTMATCH | MINIMUM | cics_handle_response)*;

cics_invoke_service: ((SERVICE | WEBSERVICE | CHANNEL | OPERATION | URI | URIMAP | SCOPE | SCOPELEN) cics_data_value | cics_handle_response)*;

/** ISSUE (all of them) */
cics_issue:
	ISSUE (cics_issue_print | cics_issue_wait | cics_issue_eods | cics_issue_abend | cics_issue_abort | cics_issue_add | cics_issue_confirmation
	      | cics_issue_copy | cics_issue_disconnect | cics_issue_end | cics_issue_endfile_endoutput | cics_issue_erase | cics_issue_erase_aup | cics_issue_error
          | cics_issue_load | cics_issue_note | cics_issue_pass | cics_issue_prepare | cics_issue_query | cics_issue_receive | cics_issue_replace | cics_issue_send
          | cics_issue_signal);

cics_issue_abend: (ABEND | CONVID cics_name | STATE cics_cvda | cics_handle_response)+;
cics_issue_abort: (ABORT | cics_issue_common | cics_handle_response)+;
cics_issue_add: (ADD | (DESTID | DESTIDLENG | VOLUME | VOLUMELENG | LENGTH | NUMREC) cics_data_value |  (FROM | RIDFLD) cics_data_area  | DEFRESP | NOWAIT | RRN | cics_handle_response)+;
cics_issue_confirmation: (CONFIRMATION | CONVID cics_name | STATE cics_cvda | cics_handle_response)+;
cics_issue_copy: (COPY | TERMID cics_name | CTLCHAR cics_data_value | WAIT | cics_handle_response)+;
cics_issue_disconnect: (DISCONNECT | SESSION cics_name | cics_handle_response)+;
cics_issue_end: (END | cics_issue_common | cics_handle_response)+;
cics_issue_endfile_endoutput: (ENDFILE | ENDOUTPUT | cics_handle_response)+;
cics_issue_erase: (ERASE | (DESTID | DESTIDLENG | VOLUME | VOLUMELENG | KEYLENGTH | KEYNUMBER | NUMREC) cics_data_value | RIDFLD cics_data_area | RRN | DEFRESP | NOWAIT | cics_handle_response)+;
cics_issue_erase_aup: ERASEAUP (WAIT | cics_handle_response)*;
cics_issue_error: (ERROR | CONVID cics_name | STATE cics_cvda | cics_handle_response)+;
cics_issue_load: (LOAD | PROGRAM cics_name | CONVERSE | cics_handle_response)+;
cics_issue_note: (NOTE | (DESTID | DESTIDLENG | VOLUME | VOLUMELENG) cics_data_value | RIDFLD cics_data_area | RRN | cics_handle_response)+;
cics_issue_pass: (PASS | LUNAME cics_name | FROM cics_data_area | (LENGTH | LOGMODE) cics_data_value | LOGONLOGMODE | NOQUIESCE | cics_handle_response)+;
cics_issue_prepare: (PREPARE | CONVID cics_name | STATE cics_cvda | cics_handle_response)+;
cics_issue_query: (QUERY | (DESTID | DESTIDLENG | VOLUME | VOLUMELENG) cics_data_value | cics_handle_response)+;
cics_issue_receive: (RECEIVE | (INTO | LENGTH) cics_data_area | SET cics_ref | cics_handle_response)+;
cics_issue_replace: (REPLACE | (DESTID | DESTIDLENG | VOLUME | VOLUMELENG | LENGTH | NUMREC | KEYLENGTH | KEYNUMBER) cics_data_value | (FROM | RIDFLD) cics_data_area | RRN | DEFRESP | NOWAIT | cics_handle_response)+;
cics_issue_send: (SEND | LENGTH cics_data_value | FROM cics_data_area | cics_issue_common | NOWAIT | DEFRESP | cics_handle_response)+;
cics_issue_signal: (SIGNAL | (CONVID | SESSION) cics_name | STATE cics_cvda | cics_handle_response)+;
cics_issue_wait: (WAIT | cics_issue_common | cics_handle_response)+;
cics_issue_print: (PRINT | cics_handle_response)+;
cics_issue_eods: (EODS | cics_handle_response)+;
cics_issue_common: ((DESTID | DESTIDLENG | VOLUME | VOLUMELENG | SUBADDR) cics_data_value | CONSOLE | PRINT | CARD | WPMEDIA1 | WPMEDIA2 | WPMEDIA3 | WPMEDIA4)+;

/** LINK / LINK ACQPROCESS / LINK ACTIVITY: */
cics_link: LINK (cics_link_program | cics_link_acqprocess | cics_link_activity);
cics_link_program: ((PROGRAM | SYSID | TRANSID | CHANNEL) cics_name | (COMMAREA | INPUTMSG) cics_data_area |
                (LENGTH | DATALENGTH | INPUTMSGLEN) cics_data_value | SYNCONRETURN | cics_handle_response)*;
cics_link_acqprocess: (ACQPROCESS | INPUTEVENT cics_data_value | cics_handle_response)*;
cics_link_activity: (ACQACTIVITY | (ACTIVITY | INPUTEVENT) cics_data_value | cics_handle_response)*;

/** EXCI LINK, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-link-command-exci*/
cics_exci_link: LINK cics_link_program_exci;
cics_link_commarea_exci: COMMAREA cics_data_area (LENGTH cics_data_value)? (DATALENGTH cics_data_value)?;
cics_link_channel_exci: CHANNEL cics_name;
cics_link_program_exci: PROGRAM cics_name
                     (
                        cics_link_commarea_exci
                        | cics_link_channel_exci
                        | APPLID cics_data_area
                        | TRANSID cics_name
                        | RETCODE cics_data_area
                        | SYNCONRETURN
                        | cics_handle_response
                     )+;

/** EXCI DELETE, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-delete-channel-command-exci*/
cics_exci_delete: DELETE CHANNEL cics_data_value RETCODE cics_data_area;

/** EXCI DELETE CONTAINER, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-delete-container-command-exci*/
cics_exci_delete_container: DELETE CONTAINER cics_data_value CHANNEL cics_data_value RETCODE cics_data_area;

/** EXCI ENDBROWSE, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-endbrowse-container-command-exci*/
cics_exci_endbrowse_container: ENDBROWSE CONTAINER BROWSETOKEN cics_data_value RETCODE cics_data_area;

/** EXCI GET CONTAINER, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-get-container-command-exci*/
cics_exci_get_container: GET CONTAINER cics_data_value CHANNEL cics_data_value (exci_data_area | cics_exci_ref | (NODATA FLENGTH cics_data_value))
                            ((INTOCCSID cics_data_value)
                            | (INTOCODEPAGE cics_data_value)
                            | (CONVERTST cics_cvda (CCSID cics_data_area)?))?
                            RETCODE cics_data_area;
exci_data_area: INTO cics_data_area (FLENGTH cics_data_area (BYTEOFFSET cics_data_area)?)?;
cics_exci_ref: SET cics_ref FLENGTH cics_data_area (BYTEOFFSET cics_data_area)?;

/** EXCI GETNEXT CONTAINER, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-getnext-container-command-exci*/
cics_exci_get_next_container: GETNEXT CONTAINER cics_data_area BROWSETOKEN cics_data_value RETCODE cics_data_area;

/** EXCI CICS MOVE CONTAINER< ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-move-container-command-exci*/
cics_exci_move_container: MOVE CONTAINER cics_data_value AS cics_data_value CHANNEL cics_data_value TOCHANNEL cics_data_value RETCODE cics_data_area;

/** EXCI CICS PUT CONTAINER, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-put-container-command-exci */
cics_exci_put_container: PUT CONTAINER cics_data_value CHANNEL cics_data_value FROM cics_data_area (FLENGTH cics_data_value)?
                        (BIT | DATATYPE cics_cvda | CHAR)? (FROMCCSID cics_data_value | FROMCODEPAGE cics_data_value)? APPEND?
                        RETCODE cics_data_area;

/** EXCI QUERY CHANNEL, ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-query-channel-command-exci*/
cics_exci_query_channel: QUERY CHANNEL cics_data_value CONTAINERCNT cics_data_area RETCODE cics_data_area;

/** EXCI STARTBROWSE CONTAINER (EXCI), ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-startbrowse-container-command-exci */
cics_exci_startbrowse_container: STARTBROWSE CONTAINER CHANNEL cics_data_value BROWSETOKEN cics_data_area RETCODE cics_data_area;

/** LOAD */
cics_load: LOAD cics_load_options;
cics_load_options: (PROGRAM cics_name | (SET |  ENTRY) cics_ref | (LENGTH | FLENGTH) cics_data_area | HOLD | cics_handle_response)+;

/** MONITOR */
cics_monitor: MONITOR cics_monitor_options;
cics_monitor_options: (POINT cics_data_value | (DATA1 | DATA2 | ENTRYNAME) cics_data_area | cics_handle_response)+;

/** MOVE CONTAINER (both) */
cics_move: MOVE cics_move_body;
cics_move_body: ((CONTAINER | FROMACTIVITY | TOACTIVITY | AS | CHANNEL | TOCHANNEL) cics_data_value | FROMPROCESS |
           TOPROCESS | cics_handle_response)+;

/** PERFORM System Commands */
cics_perform:PERFORM (cics_perform_deletshipped | cics_perform_dump | cics_perform_endaffinity | cics_perform_jvmserver | cics_perform_pipeline |
                      cics_perform_resettime | cics_perform_secdiscovery | cics_perform_security | cics_perform_shutdown | cics_perform_ssl | cics_perform_statistics);

cics_perform_deletshipped:(DELETSHIPPED | cics_handle_response)+;
cics_perform_dump:(DUMP | (DUMPCODE | TITLELENGTH | CALLER | CALLERLENGTH) cics_data_value | (TITLE | DUMPID) cics_data_area | cics_handle_response)+;
cics_perform_endaffinity:(ENDAFFINITY | (NETNAME | NETID) cics_data_value | cics_handle_response)+;
cics_perform_jvmserver:(JVMSERVER cics_data_area | JVMTYPE cics_cvda | JVM | JVMACTION cics_cvda | DUMP | DUMPTYPE cics_cvda | ALL | JAVACORE | HEAP | SNAPTRACE | GATHER | GATHERTYPE cics_cvda |
                        DIAGNOSTICS | STACKTRACE | TASKID cics_data_value | LIBERTY | LIBRTYACTION cics_cvda | REFRESH | RESOURCETYPE cics_cvda | APPLICATION | APPID cics_data_area | APPIDLEN cics_data_area |
                        CONFIG | SERVERDUMP | OSGI | OSGIACTION cics_cvda | REFRESHPKGS | cics_handle_response)+;
cics_perform_pipeline:(PIPELINE cics_data_value | ACTION cics_cvda | SCAN | cics_handle_response)+;
cics_perform_resettime:(RESETTIME | cics_handle_response)+;
cics_perform_secdiscovery:(SECDISCOVERY | ACTION cics_cvda | WRITE | cics_handle_response)+;
cics_perform_security:(SECURITY | REBUILD | ESMRESP cics_data_area | cics_handle_response)+;
cics_perform_shutdown:(SHUTDOWN | IMMEDIATE | TAKEOVER | DUMP | PLT cics_data_value | PLTNAME cics_data_value | RESTART | NORESTART | SDTRAN cics_data_value | NOSDTRAN |
                       XLT cics_data_value | cics_handle_response)+;
cics_perform_ssl:(SSL | REBUILD | GSKRESP cics_data_area |cics_handle_response)+;
cics_perform_statistics:(STATISTICS | ALL | RESETNOW | RECORD | ASYNCSERVICE | ATOMSERVICE | AUTOINSTALL | BUNDLE | CAPTURESPEC | CIPHER | CONNECTION | DB2 | DISPATCHER | DOCTEMPLATE | ENQUEUE | EPADAPTER |
                        EVENTBINDING | EVENTPROCESS | FEPI | FILE | IPCONN | JOURNALNAME | JOURNALNUM | JVMPROGRAM | JVMSERVER | LIBRARY | LSRPOOL | MONITOR | MQCONN | MQMONITOR | NODEJSAPP |
                        PIPELINE | POLICY | PROGAUTO | PROGRAM | PROGRAMDEF | RECOVERY | SECURITY | STATS | STORAGE | STREAMNAME | SYSDUMP | TABLEMGR | TCPIP | TCPIPSERVICE | TDQUEUE |
                        TERMINAL | TRANCLASS | TCLASS | TRANDUMP | TRANSACTION | TSQUEUE | URIMAP | USER | VTAM | WEBSERVICE | XMLTRANSFORM | cics_handle_response)+;

/** POINT */
cics_point: POINT cics_point_options;
cics_point_options: ((CONVID | SESSION) cics_name | cics_handle_response)*;

/** POP HANDLE */
cics_pop: POP cics_pop_option;
cics_pop_option: (HANDLE | cics_handle_response)*;

/** POST */
cics_post: POST cics_post_options;
cics_post_options: (INTERVAL (cics_zero_digit | cics_hhmmss) | TIME cics_hhmmss | AFTER | (HOURS | MINUTES | SECONDS) cics_data_value |
                 AT | SET cics_ref | REQID cics_name | cics_handle_response)+;


/** PURGE MESSAGE */
cics_purge: PURGE cics_handle_response? MESSAGE cics_handle_response?;

/** PUSH HANDLE */
cics_push: PUSH cics_handle_response? HANDLE cics_handle_response?;

/** PUT CONTAINER (both of them): */
cics_put_container: (PUT cics_put_container_bts | (PUT|PUT64) cics_put_container_channel);
cics_put_container_bts: ((ACQACTIVITY | PROCESS | ACQPROCESS) | (ACTIVITY | CONTAINER | FLENGTH) cics_data_value | FROM cics_data_area | cics_handle_response)+;
cics_put_container_channel: ((BIT | CHAR | APPEND | PREPEND) | (CHANNEL | CONTAINER | FLENGTH | FROMCCSID | FROMCODEPAGE) cics_data_value | FROM cics_data_area | DATATYPE cics_cvda | cics_handle_response)+;

/** QUERY CHANNEL / COUNTER / DCOUNTER / SECURITY */
cics_query: QUERY (cics_query_channel | cics_query_counter | cics_query_security);
cics_query_channel: (CHANNEL cics_data_value | CONTAINERCNT cics_data_area | cics_handle_response)+;
cics_query_counter: (cics_counter_dcounter | POOL cics_name | (VALUE | MINIMUM | MAXIMUM) cics_data_area | NOSUSPEND | cics_handle_response)+;
cics_query_security: (SECURITY | (RESTYPE | RESCLASS | RESIDLENGTH | RESID | USERID) cics_data_value |
                     (LOGMESSAGE | READ | UPDATE | CONTROL |ALTER) cics_cvda | cics_handle_response)+;

/** READ */
cics_read: READ cics_read_body;
cics_read_body: ((UNCOMMITTED | CONSISTENT | REPEATABLE | UPDATE | GENERIC | DEBKEY | DEBREC | RBA | RRN | XRBA | EQUAL | GTEQ | NOSUSPEND) | (FILE | DATASET | SYSID) cics_name
                            | (KEYLENGTH) cics_data_value | (TOKEN | INTO | RIDFLD | LENGTH) cics_data_area | SET cics_ref | cics_handle_response)+;

/** READNEXT | READPREV*/
cics_readnext_readprev: (READNEXT | READPREV)  cics_readnext_readprev_body;
cics_readnext_readprev_body: (cics_file_name | INTO cics_data_area | SET cics_ref | UNCOMMITTED | CONSISTENT | REPEATABLE |
               UPDATE | TOKEN cics_data_area | RIDFLD cics_data_area | KEYLENGTH cics_data_value | REQID cics_data_value |
               SYSID cics_data_area | LENGTH cics_data_area | RBA | RRN | XRBA | NOSUSPEND | cics_handle_response)*;

/** READQ TD / TS */
cics_into_set:                  INTO cics_data_area | SET cics_ref;
cics_readq: READQ cics_readq_ts_td;
cics_readq_ts_td: (TS | TD | (QUEUE | QNAME) cics_name | cics_into_set | NEXT | (LENGTH | NUMITEMS | SYSID) cics_data_area |
                   ITEM cics_data_value | NOSUSPEND | cics_handle_response)+;

/** RELEASE */
cics_release: RELEASE cics_release_option;
cics_release_option: (PROGRAM cics_name | cics_handle_response)+;

/** RESYNC ENTRYNAME System Command */
cics_resync_entryname: RESYNC cics_resync_entryname_opts;
cics_resync_entryname_opts: ((ENTRYNAME| QUALIFIER | IDLIST | IDLISTLENGTH) cics_data_value | PARTIAL | cics_handle_response)+;

/** REMOVE SUBEVENT */
cics_remove: REMOVE cics_remove_option;
cics_remove_option: ((SUBEVENT | EVENT) cics_data_value | cics_handle_response)+;

/** REQUEST */
cics_request: REQUEST (cics_request_body);
cics_request_body: (ENCRYPTPTKT cics_ref | (PASSTICKET | FLENGTH | ENCRYPTKEY | ESMREASON | ESMRESP) cics_data_area | ESMAPPNAME (cics_data_value | cics_data_area) | cics_handle_response)+;

/** RESET ACQPROCESS / RESET ACTIVITY */
cics_reset: RESET (cics_reset_acqprocess | cics_reset_activity);
cics_reset_acqprocess: (ACQPROCESS | cics_handle_response)+;
cics_reset_activity: (ACTIVITY cics_data_value | cics_handle_response)+;

/** RESETBR */
cics_resetbr: RESETBR cics_resetbr_options;
cics_resetbr_options: ((FILE | DATASET) cics_name | (RIDFLD | SYSID) cics_data_area | (KEYLENGTH | REQID) cics_data_value | GENERIC |
              GTEQ | EQUAL | RBA | RRN |XRBA | cics_handle_response)+;

/** RESTYPE HELPER */
cics_restype: RESTYPE cics_cvda | ASYNCSERVICE | ATOMSERVICE | BUNDLE | DB2CONN | DB2ENTRY | DISPATCHER | DOCTEMPLATE |
              EPADAPTER | ENQUEUE | EVENTBINDING | EVENTPROCESS | FILE | IPCONN | JOURNALNAME | JVMPROGRAM | JVMSERVER |
              LIBRARY | LSRPOOL | MONITOR | MQCONN | MQMONITOR | MVSTCB | NODEJSAPP | PIPELINE | POLICY | PROGAUTO |
              PROGRAM | PROGRAMDEF | RECOVERY | SECURITY | STATS | STORAGE | STREAMNAME | SUBPOOL | SYSDUMPCODE | TASKSUBPOOL |
              TCPIP | TCPIPSERVICE | TDQUEUE | TRANCLASS | TRANDUMPCODE | TRANSACTION | TSQUEUE | URIMAP | USER | WEBSERVICE |
              XMLTRANSFORM;
cics_subrestype: SUBRESTYPE cics_cvda | CAPTURESPEC | POLICYRULE;

/** RESUME */
cics_resume: RESUME cics_resume_body;
cics_resume_body: ((ACQACTIVITY | ACQPROCESS) | ACTIVITY cics_data_value | cics_handle_response)+;

/** RETRIEVE - / REATTACH EVENT / SUBEVENT */
cics_retrieve: RETRIEVE (cics_retrieve_standard | cics_retrieve_reattach | cics_retrieve_subevent);
cics_retrieve_standard: ((INTO | LENGTH | RTRANSID  | RTERMID  | QUEUE) cics_data_area | SET cics_ref | WAIT | cics_handle_response)*;
cics_retrieve_reattach: (REATTACH | EVENT cics_data_area | EVENTTYPE cics_cvda | cics_handle_response)*;
cics_retrieve_subevent: (SUBEVENT cics_data_area | EVENT cics_data_value |  EVENTTYPE cics_cvda | cics_handle_response)*;

/** RETURN */
cics_return: RETURN cics_return_body?;
cics_return_body: ((IMMEDIATE | ENDACTIVITY) | (TRANSID | CHANNEL) cics_name | (LENGTH | INPUTMSGLEN) cics_data_value | (COMMAREA | INPUTMSG) cics_data_area | cics_handle_response)+;

/** REWIND COUNTER / DCOUNTER */
cics_rewind: REWIND cics_rewind_opts;
cics_rewind_opts:(COUNTER cics_name | DCOUNTER cics_name | NOSUSPEND | POOL cics_name | INCREMENT cics_data_value | cics_handle_response)+;

/** REWRITE: */
cics_rewrite: REWRITE cics_rewrite_body;
cics_rewrite_body: (NOSUSPEND | (FILE | DATASET | SYSID) cics_name | LENGTH cics_data_value | (TOKEN | FROM) cics_data_area | cics_handle_response)+;

/** ROUTE */
cics_route: ROUTE cics_route_body?;
cics_route_body: ((AFTER | AT | NLEOM) | (REQID | LDC) cics_name | TIME cics_hhmmss | INTERVAL (cics_hhmmss | cics_zero_digit) |  ERRTERM cics_name? | (HOURS | MINUTES | SECONDS) cics_data_value | (TITLE | LIST | OPCLASS) cics_data_area | cics_handle_response)+;

/** RUN */
cics_run: RUN (cics_run_default | cics_run_transid);
cics_run_default: ((ACTIVITY | FACILITYTOKN | INPUTEVENT) cics_data_value | ACQACTIVITY | ACQPROCESS | SYNCHRONOUS | ASYNCHRONOUS | cics_handle_response)+;
cics_run_transid: (TRANSID cics_name | CHANNEL cics_name | CHILD cics_data_area | cics_handle_response)+;

/** SET */
cics_set: SET (cics_set_association_usercorrdata | cics_set_atomservice | cics_set_brfacility | cics_set_bundle | cics_set_connection |
        cics_set_db2conn | cics_set_db2entry | cics_set_db2tran | cics_set_deletshipped | cics_set_dispatcher | cics_set_doctemplate | cics_set_dsname | cics_set_dumpds |
        cics_set_enqmodel | cics_set_epadapter | cics_set_epadapterset | cics_set_eventbinding | cics_set_eventprocess |
        cics_set_file | cics_set_host | cics_set_ipconn | cics_set_irc | cics_set_journalname | cics_set_journalnum | cics_set_jvmserver | cics_set_jvmendpoint |
        cics_set_library | cics_set_modename | cics_set_monitor | cics_set_mqconn | cics_set_mqmonitor | cics_set_netname | cics_set_otel | cics_set_pipeline | cics_set_processtype | cics_set_program |
        cics_set_secdiscovery | cics_set_secrecording | cics_set_statistics | cics_set_sysdumpcode | cics_set_system | cics_set_tags_refresh | cics_set_task |
        cics_set_tclass | cics_set_tcpip | cics_set_tcpipservice | cics_set_tdqueue | cics_set_tempstorage | cics_set_terminal | cics_set_tracedest | cics_set_traceflag |
        cics_set_tracetype | cics_set_tranclass | cics_set_trandumpcode | cics_set_transaction | cics_set_tsqueue |
        cics_set_uow | cics_set_uowlink | cics_set_urimap | cics_set_volume | cics_set_vtam | cics_set_web | cics_set_webservice | cics_set_wlmhealth | cics_set_xmltransform | cics_set_autoinstall);

cics_set_association_usercorrdata: (ASSOCIATION | USERCORRDATA cics_data_value | cics_handle_response)+;
cics_set_atomservice: (ATOMSERVICE cics_data_area | (ENABLED | DISABLED) | ENABLESTATUS cics_cvda | cics_handle_response)+;
cics_set_autoinstall: (AUTOINSTALL | (AIBRIDGE | CONSOLES) cics_cvda | (MAXREQS | PROGRAM) cics_data_value | cics_handle_response)+;
cics_set_brfacility: (BRFACILITY cics_data_value | RELEASED | TERMSTATUS cics_cvda | cics_handle_response)+;
cics_set_bundle: (BUNDLE cics_data_value | (AVAILABLE | UNAVAILABLE | ENABLED | DISABLED | PHASEIN) | (AVAILSTATUS | ENABLESTATUS | COPY) cics_cvda | cics_handle_response)+;
cics_set_connection: (CONNECTION cics_data_area | (ACQUIRED | RELEASED | ENDAFFINITY | EXITTRACE | NOEXITTRACE | NOTPENDING | CANCEL | FORCECANCEL | FORCEPURGE | KILL | PURGE | NORECOVDATA | INSERVICE | OUTSERVICE | BACKOUT | COMMIT | FORCEUOW | RESYNC | NOZCPTRACE | ZCPTRACE) |
                        (ACQSTATUS | CONNSTATUS | AFFINITY | EXITTRACING | PENDSTATUS | PURGETYPE | RECOVSTATUS | SERVSTATUS | UOWACTION | ZCPTRACING) cics_cvda | cics_handle_response)+;
cics_set_db2conn: ((DB2CONN | UOW | TASK | TXID | NONE | GROUP | SIGN | TERM | TX | OPID | USERID | WAIT | NOWAIT | FORCE | CGROUP | CSIGN | CTERM | CTX | COPID | CUSERID | ABEND | SQLCODE | CONNECTED | NOTCONNECTED | RELEASE | NORELEASE | HIGH | EQUAL | LOW | RESYNC | NORESYNC | NOCONNECT | CONNECT | RECONNECT | TWAIT | NOTWAIT) | SECURITY cics_rebuild |
                            (AUTHID | COMAUTHID | COMTHREADLIM | DB2GROUPID | DB2ID | MSGQUEUE1 | MSGQUEUE2 | MSGQUEUE3 | PLAN | PLANEXITNAME | PURGECYCLEM | PURGECYCLES | REUSELIMIT | SIGNID | STATSQUEUE | TCBLIMIT | THREADLIMIT) cics_data_value |
                            (ACCOUNTREC | AUTHTYPE | BUSY | COMAUTHTYPE | CONNECTERROR | CONNECTST | NONTERMREL | PRIORITY | RESYNCMEMBER | STANDBYMODE | THREADWAIT) cics_cvda | cics_handle_response)+;
cics_set_db2entry: ((UOW | TASK | TXID | NONE | GROUP | SIGN | TERM | TX | OPID | USERID | WAIT | NOWAIT | FORCE | ABEND | SQLCODE | POOL | ENABLED | DISABLED | HIGH | EQUAL | LOW | YES | NO | TWAIT | NOTWAIT | TPOOL) |
                            (DB2ENTRY | AUTHID | PLAN | PLANEXITNAME | PROTECTNUM | THREADLIMIT) cics_data_area | (ACCOUNTREC | AUTHTYPE | BUSY | DISABLEDACT | ENABLESTATUS | PRIORITY | SHARELOCKS | THREADWAIT) cics_cvda | cics_handle_response)+;
cics_set_db2tran: ((DB2ENTRY | DB2TRAN | TRANSID) cics_data_area | cics_handle_response)+;
cics_set_deletshipped: (DELETSHIPPED | (IDLE | IDLEHRS | IDLEMINS | IDLESECS | INTERVAL | INTERVALHRS | INTERVALMINS | INTERVALSECS) cics_data_value | cics_handle_response)+;
cics_set_dispatcher: (DISPATCHER | (MAXOPENTCBS | MAXSSLTCBS | MAXXPTCBS | MROBATCH | PRTYAGING | RUNAWAY | SCANDELAY | TIME) cics_data_value | cics_handle_response)+;
cics_set_doctemplate: (DOCTEMPLATE cics_data_value | NEWCOPY | COPY cics_cvda | cics_handle_response)+;
cics_set_dsname: (DSNAME cics_data_value | (REMOVE | RECOVERED | RESETLOCKS | RETRY | AVAILABLE | RREPL | UNAVAILABLE | QUIESCED | IMMQUIESCED | UNQUIESCED | WAIT | NOWAIT | BACKOUT | COMMIT | FORCE) |
                            (ACTION | AVAILABILITY | QUESCESTATE | BUSY | UOWACTION) cics_cvda | cics_handle_response)+;
cics_set_dumpds: ((DUMPDS | CLOSED | OPEN | SWITCH | NOSWITCH | SWITCHNEXT | SWITCHALL) | INITIALDDS cics_data_value | (OPENSTATUS | SWITCHSTATUS) cics_cvda | cics_handle_response)+;
cics_set_enqmodel: (ENQMODEL cics_data_value | (ENABLED | DISABLED) | STATUS cics_cvda | cics_handle_response)+;
cics_set_epadapter: (EPADAPTER cics_data_value | (ENABLED | DISABLED) | ENABLESTATUS cics_cvda | cics_handle_response)+;
cics_set_epadapterset: (EPADAPTERSET cics_data_value | (ENABLED | DISABLED) | ENABLESTATUS cics_cvda | cics_handle_response)+;
cics_set_eventbinding: (EVENTBINDING cics_data_value | (ENABLED | DISABLED) | ENABLESTATUS cics_cvda | cics_handle_response)+;
cics_set_eventprocess: ((EVENTPROCESS | STARTED | DRAIN | STOPPED) | (EPSTATUS) cics_cvda | cics_handle_response)+;
cics_set_file: ((ADDABLE | NOTADDABLE | BROWSABLE | NOTBROWSABLE | WAIT | FORCE | NOWAIT | DELETABLE | NOTDELETABLE | OLD | SHARE | EMPTY | EMPTYREQ | NOEMPTYREQ | ENABLED | DISABLED | OPEN | CLOSED | EXCTL | NOEXCTL | LOAD | NOLOAD |
                                                    READABLE | NOTREADABLE | UNCOMMITTED | CONSISTENT | REPEATABLE | RLS | NOTRLS | CFTABLE | CICSTABLE | NOTTABLE | USERTABLE | UPDATABLE | NOTUPDATABLE | CONTENTION | LOCKING) |
                                                  (ADD | BROWSE | BUSY | DELETE | DISPOSITION | EMPTYSTATUS | ENABLESTATUS | OPENSTATUS | EXCLUSIVE | LOADTYPE | READ | READINTEG | RLSACCESS | TABLE | UPDATE | UPDATEMODEL) cics_cvda |
                                                   (FILE | DATASET| CFDTPOOL | DSNAME | OBJECTNAME | KEYLENGTH | LSRPOOLNUM | MAXNUMRECS | RECORDSIZE | STRINGS | TABLENAME) cics_data_value | cics_handle_response)+;
cics_set_host: (HOST cics_data_area | ENABLESTATUS cics_cvda | cics_handle_response)+;
cics_set_ipconn: (IPCONN cics_data_value | (ACQUIRED | RELEASED | NOTPENDING | CANCEL | FORCECANCEL | FORCEPURGE | KILL | PURGE | NORECOVDATA | INSERVICE | OUTSERVICE | BACKOUT | COMMIT | FORCEUOW | RESYNC) |
                                        (CONNSTATUS | PENDSTATUS | PURGETYPE | RECOVSTATUS | SERVSTATUS | UOWACTION) cics_cvda | cics_handle_response)+;
cics_set_irc: ((IRC | CLOSED | IMMCLOSE | OPEN) | OPENSTATUS cics_cvda | cics_handle_response)+;
cics_set_journalname: (JOURNALNAME cics_data_value | (FLUSH | RESET | DISABLED | ENABLED) | (ACTION | STATUS) cics_cvda | cics_handle_response)+;
cics_set_journalnum: (JOURNALNUM cics_data_value | (ADVANCE | CLOSED | CLOSELEAVE | OPENOUTPUT) | OPENSTATUS cics_cvda | cics_handle_response)+;
cics_set_jvmendpoint: ((ENABLED | DISABLED) | (JVMENDPOINT | JVMSERVER) cics_data_value | ENABLESTATUS cics_cvda | cics_handle_response)+;
cics_set_jvmserver: ((ENABLED | DISABLED | PHASEOUT | PURGE | FORCEPURGE | KILL) | (JVMSERVER | THREADLIMIT) cics_data_value | (ENABLESTATUS | PURGETYPE) cics_cvda | cics_handle_response)+;
cics_set_library: ((CRITICAL | NONCRITICAL | ENABLED | DISABLED) | (LIBRARY | RANKING) cics_data_value | (CRITICALST | ENABLESTATUS) cics_cvda | cics_handle_response)+;
cics_set_modename: ((ACQUIRED | CLOSED) | (MODENAME | AVAILABLE | CONNECTION) cics_data_value | ACQSTATUS cics_cvda | cics_handle_response)+;
cics_set_monitor:  ((MONITOR | COMPRESS | NOCOMPRESS | CONVERSE | NOCONVERSE | EXCEPT | NOEXCEPT | IDNTY | NOIDNTY | PERF | NOPERF | RESRCE | NORESRCE | ON | OFF | SYNCPOINT | NOSYNCPOINT) |
                            (DPLLIMIT | FILELIMIT | FREQUENCY | FREQUENCYHRS | FREQUENCYMIN | FREQUENCYSEC | TSQUEUELIMIT | URIMAPLIMIT | WEBSERVLIMIT) cics_data_value |
                            (COMPRESSST | CONVERSEST | EXCEPTCLASS | IDNTYCLASS | PERFCLASS | RESRCECLASS | STATUS | SYNCPOINTST) cics_cvda | cics_handle_response)+;
cics_set_mqconn: ((MQCONN| WAIT | NOWAIT | FORCE | CONNECTED | NOTCONNECTED | RESYNC | NORESYNC | GROUPRESYNC) | MQNAME cics_data_area | (BUSY | CONNECTST | RESYNCMEMBER) cics_cvda | cics_handle_response)+;
cics_set_mqmonitor: (MQMONITOR cics_data_value | (AUTOSTART | NOAUTOSTART | ENABLED | DISABLED | STARTED | STOPPED) | (AUTOSTATUS | ENABLESTATUS | MONSTATUS) cics_cvda | cics_handle_response)+;
cics_set_netname: (NETNAME cics_data_value | (EXITTRACE | NOEXITTRACE) | EXITTRACING cics_cvda | cics_handle_response)+;
cics_set_otel: (OTEL | TRACE cics_cvda | cics_handle_response)+;
cics_set_pipeline: (PIPELINE cics_data_value | (ENABLED | DISABLED) | RESPWAIT cics_data_area | ENABLESTATUS cics_cvda | cics_handle_response)+;
cics_set_processtype: (PROCESSTYPE cics_data_value | (DISABLED | ENABLED | ACTIVITY | FULL | OFF | PROCESS) | (STATUS | AUDITLEVEL) cics_cvda | cics_handle_response)+;
cics_set_program: ((CEDF | NOCEDF | NEWCOPY | PHASEIN | DPLSUBSET | FULLAPI | REPLICATOR | NOREPLICATOR | JVM | NOJVM | PRIVATE | SHARED | DISABLED | ENABLED) |
                                          (PROGRAM | JVMCLASS | JVMPROFILE | OPERATION) cics_data_value | (CEDFSTATUS | COPY | EXECUTIONSET | REPLICATION | RUNTIME | SHARESTATUS | STATUS | VERSION) cics_cvda | cics_handle_response)+;
cics_set_secdiscovery: ((SECDISCOVERY | ON | OFF | DISCOVERALL) | (STATUS | CMD | DB2 | DCT | FCT | HFS | JCT | PCT | PPT | PSB | RES | TST | USER) cics_cvda | cics_handle_response)+;
cics_set_secrecording: ((ADD | MODIFY | REMOVE) | MAXIMUM cics_data_area | ACTION cics_cvda |
                                    (SECRECORDING | ODADPTRID | ODADPTRDATA1 | ODADPTRDATA2 | ODADPTRDATA3 | ODAPPLID | ODCLNTIPADDR | ODCLNTPORT | ODFACILNAME |
                                      ODFACILTYPE | ODIPFAMILY | ODLUNAME | ODNETID | ODNETWORKID | ODSERVERPORT | ODTCPIPS | ODTRANSID | ODUSERID) cics_data_value | cics_handle_response)+;
cics_set_statistics: ((STATISTICS | ON | OFF | RECORDNOW | RESETNOW) |
                            (ENDOFDAY | ENDOFDAYHRS | ENDOFDAYMINS | ENDOFDAYSECS | INTERVAL | INTERVALHRS | INTERVALMINS | INTERVALSECS) cics_data_value |
                            (RECORDING) cics_cvda | cics_handle_response)+;
cics_set_sysdumpcode: ((ADD | REMOVE | RESET | DAE | NODAE | LOCAL | RELATED | NOSHUTDOWN | SHUTDOWN | NOSYSDUMP | SYSDUMP) | (SYSDUMPCODE | DSPLIST | JOBLIST | MAXIMUM) cics_data_value | (ACTION | DAEOPTION | DUMPSCOPE | SHUTOPTION | SYSDUMPING) cics_cvda | cics_handle_response)+;
cics_set_system: ((SYSTEM | DEBUG | NODEBUG | NOSYSDUMP | TABLEONLY | SYSDUMP | FORCE | NOFORCE | CTLGALL | CTLGMODIFY | CTLGNONE | AUTOACTIVE | AUTOINACTIVE) |
                        (AKP | DSALIMIT | DSRTPROGRAM | DTRPROGRAM | EDSALIMIT | GMMTEXT | GMMLENGTH | MAXTASKS | MROBATCH | PROGAUTOEXIT | PRTYAGING | RUNAWAY | SCANDELAY | SDTMEMLIMIT | TIME) cics_data_value |
                         (LOGDEFER | NEWMAXTASKS) cics_data_area | (DEBUGTOOL | DUMPING | FORCEQR | PROGAUTOCTLG | PROGAUTOINST) cics_cvda | cics_handle_response)+;
cics_set_tags_refresh: (TAGS | REFRESH | cics_handle_response)+;
cics_set_task: ((FORCEPURGE | KILL | PURGE | SRRACTIVE | SRRINACTIVE) | (TASK | PRIORITY) cics_data_value | (PURGETYPE | SRRSTATUS) cics_cvda | cics_handle_response)+;
cics_set_tclass: ((TCLASS | MAXIMUM) cics_data_value | cics_handle_response)+;
cics_set_tcpip: ((TCPIP | CLOSED | IMMCLOSE | OPEN) | (MAXSOCKETS | OPENSTATUS) cics_data_value | NEWMAXSOCKET cics_data_area | cics_handle_response)+;
cics_set_tcpipservice: ((CLOSED | IMMCLOSE | OPEN) | (BACKLOG | MAXDATALEN) cics_data_area | (TCPIPSERVICE | URM) cics_data_value | OPENSTATUS cics_cvda | cics_handle_response)+;
cics_set_tdqueue: ((NOTERMINAL | TERMINAL | DISABLED | ENABLED | CLOSED | OPEN) | (ATITERMID | ATITRANID | ATIUSERID | TRIGGERLEVEL | TDQUEUE) cics_data_value | (ATIFACILITY | ENABLESTATUS | OPENSTATUS) cics_cvda | cics_handle_response)+;
cics_set_tempstorage: (TEMPSTORAGE | TSMAINLIMIT cics_data_value | cics_handle_response)+;
cics_set_terminal: ((ACQUIRED | COLDACQ | RELEASED | ALTPRTCOPY | NOALTPRTCOPY | ATI | NOATI | CREATE | NOCREATE | DISCREQ | NODISCREQ | EXITTRACE | NOEXITTRACE | OBFORMAT | NOOBFORMAT | AUTOPAGEABLE | PAGEABLE | PRTCOPY | NOPRTCOPY | FORCEPURGE | KILL | PURGE | FORCE |
                                            CANCEL | RELREQ | NORELREQ | INSERVICE | OUTSERVICE | SPECTRACE | STANTRACE | NOTTI | TTI | UCTRAN | NOUCTRAN | TRANIDONLY | NOZCPTRACE | ZCPTRACE) |
                                            (ALTPRINTER | MAPNAME | MAPSETNAME | NEXTTRANSID | OPERID | PRINTER | TCAMCONTROL | TERMPRIORITY | TERMINAL) cics_data_value |
                                            (ACQSTATUS | TERMSTATUS | ALTPRTCOPYST | ATISTATUS | CREATESESS | DISCREQST | EXITTRACING | OBFORMATST | PAGESTATUS | PRTCOPYST | PURGETYPE | RELREQST | SERVSTATUS | TRACING | TTISTATUS | UCTRANST | ZCPTRACING) cics_cvda | cics_handle_response)+;
cics_set_tracedest: ((TRACEDEST | AUXPAUSE | AUXSTART | AUXSTOP | GTFSTART | GTFSTOP | INTSTART | INTSTOP | SWITCH | NOSWITCH | SWITCHNEXT | SWITCHALL) | TABLESIZE cics_data_value | (AUXSTATUS | GTFSTATUS | INTSTATUS | SWITCHACTION | SWITCHSTATUS) cics_cvda | cics_handle_response)+;
cics_set_traceflag: ((TRACEFLAG | SINGLEOFF | SINGLEON | SYSTEMOFF | SYSTEMON | TCEXITALL | TCEXITALLOFF | TCEXITNONE | TCEXITSYSTEM | USEROFF | USERON) | (SINGLESTATUS | SYSTEMSTATUS | TCEXITSTATUS | USERSTATUS) cics_cvda | cics_handle_response)+;
cics_set_tracetype: ((TRACETYPE | SPECIAL | STANDARD) |
                        (AP | APPLICATION | AS | ASYNCSERVICE | BA | BM | BR | BRIDGE | BUSAPPMGR | CP | CPI | DC | DD | DEBUGTOOL | DH | DIRMGR | DISPATCHER | DM | DOCUMENT | DOMAINMGR | DP | DS | DU | DUMP | EC | EI | EJ | EM | ENQUEUE | ENTJAVA | EP | EVENTCAPTURE | EVENTMGR | EVENTPROC | FC |
                           GC | GLOBALCATLG | IC | IE | IPECI | IS | KC | KE | KERNEL | LC | LD | LG | LM | LOADER | LOCALCATLG | LOCKMGR | LOGGER | MANAGEDPLAT | ME | MESSAGE | ML | MN | MONITOR | MP | NQ | OBJECTTRAN | OT | PA | PARAMGR | PARTNER | PC | PG | PI | PIPEMGR | PROGMGR | PT |
                            RA | RECOVERY | REGIONSTAT | REQUESTSTRM | RESLIFEMGR | RI | RL | RM | RMI | RMIADAPTERS | RRS | RS | RX | RZ | SC | SCHEDULER | SECURITY | SH | SJ | SJVM | SM | SO | SOCKETS | ST | STATISTICS | STORAGE | SZ | TC | TD | TEMPSTORAGE | TI | TIMER | TR | TRACE | TRANMGR | TS | UE | US | USER | W2 | WB | WEB | WEB2 | WEBRESTMGR | WU | XM | XS) cics_data_value
                        | FLAGSET cics_cvda | cics_handle_response)+;
cics_set_tranclass: ((ABEND | DISCARD) | (TRANCLASS | MAXACTIVE | PURGETHRESH) cics_data_value | PURGEACTION cics_cvda | cics_handle_response)+;
cics_set_trandumpcode: ((ADD | REMOVE | RESET | LOCAL | RELATED | NOSHUTDOWN | SHUTDOWN | NOSYSDUMP | SYSDUMP | NOTRANDUMP | TRANDUMP) |
                                    (TRANDUMPCODE | MAXIMUM) cics_data_value | (ACTION | DUMPSCOPE | SHUTOPTION | SYSDUMPING | TRANDUMPING) cics_cvda | cics_handle_response)+;
cics_set_transaction: ((TRANDUMP | NOTRANDUMP | NOTPURGEABLE | PURGEABLE | SYSTEM | USER | SHUTDISABLED | SHUTENABLED | DISABLED | ENABLED | SPECTRACE | SPRSTRACE | STANTRACE | OTELTRACE | PROPEMIT | PROP | PROPINIT | PROPINITEMIT | NOOTELTRACE) |
                                    (PRIORITY | RUNAWAY | TCLASS | TRANCLASS | TRANSACTION) cics_data_value | (DUMPING | PURGEABILITY | RUNAWAYTYPE | SHUTDOWN | STATUS | TRACING) cics_cvda | cics_handle_response)+;
cics_set_tsqueue: ((TSQUEUE | TSQNAME | SYSID | POOLNAME | LASTUSEDINT) cics_data_value | ACTION cics_cvda | cics_handle_response)+;
cics_set_uow: (UOW cics_data_value | (COMMIT | BACKOUT | FORCE) | UOWSTATE cics_cvda | cics_handle_response)+;
cics_set_uowlink: (UOWLINK cics_data_value | DELETE | ACTION cics_cvda | cics_handle_response)+;
cics_set_urimap: (URIMAP cics_data_area | (DISABLED | ENABLED | NONE | PERMANENT | TEMPORARY) | LOCATION cics_data_area | (ENABLESTATUS | REDIRECTTYPE) cics_cvda | cics_handle_response)+;
cics_set_volume: ((ADD | REMOVE | OK | NOWRITE) | (JRNL | VOLUME) cics_data_value | (ACTION | AVAIL) cics_cvda)+;
cics_set_vtam: ((VTAM | CLOSED | FORCECLOSE | IMMCLOSE | OPEN | DEREGISTERED) | (PSDINTERVAL | PSDINTHRS | PSDINTMINS | PSDINTSECS) cics_data_value | (OPENSTATUS) cics_cvda | cics_handle_response)+;
cics_set_web: (WEB | (GARBAGEINT | TIMEOUTINT) cics_data_value | cics_handle_response)+;
cics_set_webservice: (WEBSERVICE cics_name | (VALIDATION | NOVALIDATION) | VALIDATIONST cics_cvda | cics_handle_response)+;
cics_set_wlmhealth: (WLMHEALTH | (ADJUSTMENT | INTERVAL) cics_data_value | OPENSTATUS cics_cvda | cics_handle_response)+;
cics_set_xmltransform: (XMLTRANSFORM cics_name | (VALIDATION | NOVALIDATION) | VALIDATIONST cics_cvda | cics_handle_response)+;

/** SIGNAL EVENT */
cics_signal: SIGNAL cics_signal_options;
cics_signal_options: ((EVENT | FROMCHANNEL | FROMLENGTH) cics_data_value | FROM cics_data_area  | cics_handle_response)+;

/** SIGNOFF */
cics_signoff: SIGNOFF cics_handle_response?;

/** SIGNON */
cics_signon: SIGNON (cics_signon_body|cics_signon_token_body);
cics_signon_body: ((USERID | GROUPID | LANGUAGECODE | NATLANG | PASSWORD | NEWPASSWORD | PHRASELEN | NEWPHRASELEN | OIDCARD) cics_data_value |
                    (CHANGETIME | DAYSLEFT | ESMREASON | ESMRESP | EXPIRYTIME | INVALIDCOUNT | LANGINUSE | LASTUSETIME | NATLANGINUSE | PHRASE | NEWPHRASE) cics_data_area | cics_handle_response)+;
cics_signon_token_body: ((KERBEROS | BIT | BASE64) | (TOKENLEN | GROUPID | LANGUAGECODE | NATLANG) cics_data_value |
                    (TOKEN | LANGINUSE | NATLANGINUSE | ESMREASON | ESMRESP) cics_data_area | (TOKENTYPE | DATATYPE) cics_cvda | cics_handle_response)+;

/** SOAPFAULT ADD / CREATE / DELETE */
cics_soapfault: SOAPFAULT (cics_soapfault_add | cics_soapfault_create | cics_soapfault_delete);
cics_soapfault_add: ADD ((FAULTSTRING | FAULTSTRLEN |NATLANG | SUBCODESTR | SUBCODELEN | FROMCCSID) cics_data_value | cics_handle_response)+;
cics_soapfault_create: CREATE ((CLIENT | SERVER | SENDER | RECEIVER) | (FAULTCODESTR | FAULTCODELEN | FAULTSTRING | FAULTSTRLEN | NATLANG | ROLE | ROLELENGTH | FAULTACTOR | FAULTACTLEN | DETAIL | DETAILLENGTH | FROMCCSID) cics_data_value
                        | (FAULTCODE) cics_cvda | cics_handle_response)+;
cics_soapfault_delete: (DELETE | cics_handle_response)+;

/** SPOOLCLOSE */
cics_spoolclose: SPOOLCLOSE cics_spoolclose_options;
cics_spoolclose_options: (TOKEN cics_data_area | KEEP | DELETE | cics_handle_response)+;

/** SPOOLOPEN INPUT / SPOOLOPEN OUTPUT */
cics_spoolopen: SPOOLOPEN (cics_spoolopen_input | cics_spoolopen_output);
cics_spoolopen_input: (INPUT | TOKEN cics_data_area | USERID cics_data_value | CLASS cics_data_value | cics_handle_response)+;
cics_spoolopen_output: (OUTPUT | TOKEN cics_data_area | (USERID | NODE | CLASS | RECORDLENGTH) cics_data_value | OUTDESCR cics_ref |
                NOCC | ASA | MCC | PRINT | PUNCH | NOHANDLE | cics_handle_response)+;

/** SPOOLREAD */
cics_spoolread: SPOOLREAD cics_spoolread_options;
cics_spoolread_options: ((TOKEN | INTO | TOFLENGTH) cics_data_area | MAXFLENGTH cics_data_value | cics_handle_response)+;

/** SPOOLWRITE */
cics_spoolwrite: SPOOLWRITE cics_spoolwrite_options;
cics_spoolwrite_options: ((TOKEN | FROM) cics_data_area | FLENGTH cics_data_value | LINE | PAGE  | cics_handle_response)+;

/** START - / ATTACH / BREXIT / CHANNEL */
cics_start: START (cics_start_transid | cics_start_attach | cics_start_brexit | cics_start_channel);
cics_start_transid: ((FMH | NOCHECK | PROTECT | AFTER | AT) | (TRANSID | REQID | TERMID | RTRANSID | RTERMID | QUEUE | SYSID) cics_name | FROM cics_data_area |
                    (LENGTH | USERID | HOURS | MINUTES | SECONDS) cics_data_value | (INTERVAL (cics_hhmmss | cics_zero_digit)) | TIME cics_hhmmss | cics_handle_response)+;
cics_start_attach: (ATTACH | TRANSID cics_name | FROM cics_data_area | LENGTH cics_data_value | cics_handle_response)+;
cics_start_brexit: (BREXIT cics_name? | TRANSID cics_name | BRDATA cics_data_area | (BRDATALENGTH | USERID) cics_data_value | cics_handle_response)+;
cics_start_channel: ((NOCHECK | PROTECT) | (TRANSID | CHANNEL | TERMID | SYSID) cics_name | USERID cics_data_value | cics_handle_response)+;
cics_zero_digit: LPARENCHAR ZERO_DIGIT RPARENCHAR;

/** STARTBR */
cics_startbr: STARTBR cics_startbr_options;
cics_startbr_options: ((FILE | DATASET) cics_name | (RIDFLD | SYSID) cics_data_area | (KEYLENGTH | REQID) cics_data_value | GENERIC |
              DEBKEY | DEBREC | RBA | RRN | XRBA | GTEQ | EQUAL | cics_handle_response)+;

/** STARTBROWSE ACTIVITY / CONTAINER / EVENT / PROCESS / TIMER */
cics_startbrowse: STARTBROWSE (cics_startbrowse_body);
cics_startbrowse_body: ((ACTIVITY | CONTAINER | EVENT | PROCESS | TIMER) | (ACTIVITYID | PROCESSTYPE | CHANNEL) cics_data_value | cics_startbrowse_processWithValue_subrule | BROWSETOKEN cics_data_area | cics_handle_response)+;
cics_startbrowse_processWithValue_subrule: PROCESS cics_data_value;

/** SUSPEND (both) */
cics_suspend: SUSPEND cics_suspend_body;
cics_suspend_body: (ACQACTIVITY | ACQPROCESS | ACTIVITY cics_data_value | cics_handle_response)*;

/** SYNCPOINT / SYNCPOINT ROLLBACK */
cics_syncpoint: SYNCPOINT cics_syncpoint_rollback;
cics_syncpoint_rollback: (ROLLBACK | cics_handle_response)*;

/** TEST EVENT */
cics_test: TEST cics_test_body;
cics_test_body: (EVENT cics_data_value | FIRESTATUS cics_cvda | cics_handle_response)+;

/** TRANSFORM DATATOXML / XMLTODATA */
cics_transform: TRANSFORM (cics_transform_json | cics_transform_xml);
cics_transform_json: ((DATATOJSON|JSONTODATA) | (CHANNEL | INCONTAINER | OUTCONTAINER) cics_data_value | TRANSFORMER cics_name | cics_handle_response)+;
cics_transform_xml: ((DATATOXML|XMLTODATA) | (CHANNEL | DATCONTAINER | XMLCONTAINER | NSCONTAINER) cics_data_value | (ELEMNAME | ELEMNAMELEN | ELEMNS | ELEMNSLEN | TYPENAME | TYPENAMELEN | TYPENS | TYPENSLEN) cics_data_area | XMLTRANSFORM cics_name | cics_handle_response)+;

/** UNLOCK */
cics_unlock: UNLOCK cics_unlock_body;
cics_unlock_body: (cics_file_name | TOKEN cics_data_area | SYSID cics_data_area | cics_handle_response)+;

/** UPDATE COUNTER / UPDATE DCOUNTER */
cics_update: UPDATE cics_update_counter_dcounter;
cics_update_counter_dcounter: ((COUNTER | DCOUNTER | POOL) cics_name | (VALUE  | COMPAREMIN  | COMPAREMAX) cics_data_value | NOSUSPEND | cics_handle_response)+;

/** VERIFY PASSWORD / VERIFY PHRASE / VERIFY TOKEN */
cics_verify: VERIFY (cics_verify_password | cics_verify_phrase | cics_verify_token);
cics_verify_password: ((PASSWORD | USERID | GROUPID) cics_data_value | (CHANGETIME | DAYSLEFT | ESMREASON | ESMRESP | EXPIRYTIME |
                INVALIDCOUNT | LASTUSETIME) cics_data_area | cics_handle_response)+;
cics_verify_phrase: ((PHRASE | CHANGETIME | DAYSLEFT | ESMREASON | ESMRESP | EXPIRYTIME | INVALIDCOUNT | LASTUSETIME ) cics_data_area |
                (PHRASELEN | USERID | GROUPID) cics_data_value  | cics_handle_response)+;
cics_verify_token: ((TOKEN | ISUSERID | ENCRYPTKEY | OUTTOKENLEN | ESMRESP | ESMREASON) cics_data_area | TOKENLEN cics_data_value |
                (TOKENTYPE | DATATYPE) cics_cvda | BASICAUTH | JWT | KERBEROS | BIT | BASE64 | OUTTOKEN cics_ref | cics_handle_response)+;

/** WAIT CONVID / EVENT / EXTERNAL / JOURNALNAME / JOURNALNUM / SIGNAL / TERMINAL */
cics_wait: WAIT (cics_wait_convid | cics_wait_event | cics_wait_external | cics_wait_journalname | cics_wait_signal | cics_wait_terminal);
cics_wait_convid: (CONVID cics_name | STATE cics_cvda | cics_handle_response)+;
cics_wait_event: (EVENT | ECADDR cics_value | NAME cics_name | cics_handle_response)+;
cics_wait_external: (EXTERNAL | (ECBLIST | NUMEVENTS) cics_value | PURGEABILITY cics_cvda | NAME cics_name | PURGEABLE | NOTPURGEABLE | cics_handle_response)+;
cics_wait_journalname: ((JOURNALNAME | JOURNALNUM) cics_value | REQID cics_value | cics_handle_response)+;
cics_wait_signal: (SIGNAL | cics_handle_response)+;
cics_wait_terminal: (TERMINAL | (CONVID | SESSION) cics_name | cics_handle_response)+;

/** WAITCICS */
cics_waitcics: WAITCICS cics_waitcics_body;
cics_waitcics_body: (ECBLIST cics_value | NUMEVENTS cics_data_value | PURGEABLE | PURGEABILITY cics_cvda |
               NOTPURGEABLE | NAME cics_name | cics_handle_response)+;

/** WEB (all) */
cics_web: WEB (cics_web_close | cics_web_converse | cics_web_endbrowse | cics_web_extract | cics_web_open |
          cics_web_parse | cics_web_read | cics_web_readnext | cics_web_receive | cics_web_retrieve |
          cics_web_send | cics_web_startbrowse | cics_web_write);
cics_web_close: (CLOSE | SESSTOKEN cics_data_value | cics_handle_response)+;
cics_web_converse: ((CONVERSE | GET | HEAD | PATCH | POST | PUT | TRACE | OPTIONS | DELETE | NODOCDELETE | DOCDELETE | EXPECT | NOCLOSE | CLOSE | NONE | BASICAUTH | NOTRUNCATE | CLICONVERT | NOINCONVERT | NOOUTCONVERT | NOCLICONVERT) |
            (SESSTOKEN | URIMAP | PATHLENGTH | QUERYSTRLEN | DOCTOKEN | FROMLENGTH | CONTAINER | CHANNEL | USERNAME | USERNAMELEN | PASSWORD | PASSWORDLEN | TOCONTAINER | TOCHANNEL | MAXLENGTH | STATUSLEN | CHARACTERSET) cics_data_value |
            (PATH | MEDIATYPE | QUERYSTRING | FROM | INTO | TOLENGTH | STATUSCODE | STATUSTEXT | BODYCHARSET) cics_data_area |
            (METHOD | DOCSTATUS | ACTION | CLOSESTATUS | AUTHENTICATE | CLIENTCONV) cics_cvda |
            SET cics_ref | cics_handle_response)+;
cics_web_endbrowse: (ENDBROWSE | FORMFIELD | HTTPHEADER | SESSTOKEN cics_data_value | QUERYPARM | cics_handle_response)+; // All three variants
cics_web_extract: (EXTRACT | HOSTLENGTH cics_data_value |
            (HOST | HTTPMETHOD | METHODLENGTH | HTTPVERSION | VERSIONLEN | PATH | PATHLENGTH | PORTNUMBER | QUERYSTRING | QUERYSTRLEN | URIMAP | SESSTOKEN | REALM | REALMLEN) cics_data_area |
            (SCHEME | HOSTTYPE | REQUESTTYPE) cics_cvda | cics_handle_response)+;
cics_web_open: ((OPEN | HTTP | HTTPS) | (URIMAP | CIPHERS | NUMCIPHERS | CERTIFICATE | CODEPAGE | HOST | HOSTLENGTH | PORTNUMBER) cics_data_value | (SESSTOKEN | HTTPVNUM | HTTPRNUM) cics_data_area | SCHEME cics_cvda | cics_handle_response)+;
cics_web_parse: (PARSE | (URL | URLLENGTH) cics_data_value | (SCHEMENAME | HOST | HOSTLENGTH | PORTNUMBER | PATH | PATHLENGTH | QUERYSTRING | QUERYSTRLEN) cics_data_area | HOSTTYPE cics_cvda | cics_handle_response)+;
cics_web_read: (READ | (QUERYPARM | NAMELENGTH | CHARACTERSET | HOSTCODEPAGE) cics_data_value | (FORMFIELD | HTTPHEADER | SESSTOKEN | VALUE | VALUELENGTH) cics_data_area | SET cics_ref | cics_handle_response)+;
cics_web_readnext: (READNEXT | (FORMFIELD | QUERYPARM | HTTPHEADER | VALUE | VALUELENGTH) cics_data_area | (SESSTOKEN | NAMELENGTH) cics_data_value | cics_handle_response)+;
cics_web_receive: ((RECEIVE | NOTRUNCATE | SRVCONVERT | NOSRVCONVERT | CLICONVERT | NOCLICONVERT) | (MAXLENGTH | CHARACTERSET | HOSTCODEPAGE | MEDIATYPE | TOCONTAINER | TOCHANNEL | SESSTOKEN | STATUSCODE | STATUSLEN) cics_data_value |
            (INTO | LENGTH | BODYCHARSET | STATUSTEXT) cics_data_area | SET cics_ref | (SERVERCONV | TYPE | CLIENTCONV) cics_cvda | cics_handle_response)+;

cics_web_retrieve: (RETRIEVE | DOCTOKEN cics_data_area | cics_handle_response)+;
cics_web_send: ((BASICAUTH | CHUNKEND | CHUNKNO | CHUNKYES | CLICONVERT | CLOSE | DELETE | DOCDELETE | EVENTUAL | EXPECT | GET | HEAD | IMMEDIATE | NOCLICONVERT | NOCLOSE | NODOCDELETE | NONE | NOSRVCONVERT | OPTIONS | PATCH | POST | PUT | SEND | SRVCONVERT | TRACE) |
               (CHANNEL | CHARACTERSET | CONTAINER | DOCTOKEN | FROMLENGTH | HOSTCODEPAGE | LENGTH | MEDIATYPE | PASSWORD | PASSWORDLEN | PATHLENGTH | QUERYSTRLEN | SESSTOKEN | STATUSCODE | STATUSLEN | URIMAP | USERNAME | USERNAMELEN) cics_data_value |
               (FROM | PATH | QUERYSTRING | STATUSTEXT) cics_data_area |
               (ACTION | AUTHENTICATE | CHUNKING | CLIENTCONV | CLOSESTATUS | DOCSTATUS | METHOD | SERVERCONV) cics_cvda | cics_handle_response)+;
cics_web_startbrowse: ((STARTBROWSE | HTTPHEADER) | (CHARACTERSET | HOSTCODEPAGE) cics_data_value | (FORMFIELD | QUERYPARM) cics_data_area? | (NAMELENGTH | SESSTOKEN) cics_data_area | cics_handle_response)+;
cics_web_write: (WRITE | (HTTPHEADER | NAMELENGTH | SESSTOKEN | VALUE | VALUELENGTH) cics_data_area | cics_handle_response)+;

/** WRITE / WRITE JOURNALNAME / WRITE OPERATOR */
cics_write: WRITE (cics_write_file | cics_write_journalname | cics_write_operator);
cics_write_file: ((FILE | DATASET | SYSID) cics_name | MASSINSERT | (FROM | RIDFLD) cics_data_area |
                (KEYLENGTH | LENGTH) cics_data_value | RBA | RRN | XRBA | NOSUSPEND | cics_handle_response)*;
cics_write_journalname: ((JOURNALNAME | JTYPEID | FLENGTH) cics_data_value | (FROM | REQID) cics_data_area |
                (PREFIX | PFXLENG) cics_data_value | WAIT | NOSUSPEND | cics_handle_response)*;
cics_write_operator: (OPERATOR | (TEXT | TEXTLENGTH | ROUTECODES  | NUMROUTES | CONSNAME | MAXLENGTH | TIMEOUT) cics_data_value |
                EVENTUAL | ACTION cics_cvda | CRITICAL | IMMEDIATE | (REPLY | REPLYLENGTH) cics_data_area | cics_handle_response)*;

/** WRITEQ TD/TS */
cics_writeq: WRITEQ (cics_writeq_td | cics_writeq_ts);
cics_writeq_td: (TD | (QUEUE | SYSID) cics_name | FROM cics_data_area | LENGTH cics_data_value | cics_handle_response)*;
cics_writeq_ts: (TS | (QNAME | QUEUE | SYSID) cics_name | (FROM | NUMITEMS | ITEM) cics_data_area |
                LENGTH cics_data_value | REWRITE | AUXILIARY | MAIN | NOSUSPEND | cics_handle_response)*;

/** WSACONTEXT BUILD / DELETE / GET */
cics_wsacontext: WSACONTEXT (cics_wsacontext_build | cics_wsacontext_delete | cics_wsacontext_get);
cics_wsacontext_build: (BUILD | (CHANNEL | ACTION | MESSAGEID | RELATESURI | RELATESTYPE | EPRFROM | EPRLENGTH | FROMCCSID | FROMCODEPAGE) cics_data_value |
                    (EPRTYPE | EPRFIELD) cics_cvda | cics_handle_response)+;
cics_wsacontext_delete: (DELETE | CHANNEL cics_data_value | cics_handle_response)+;
cics_wsacontext_get: (GET | (CONTEXTTYPE | EPRTYPE | EPRFIELD) cics_cvda | (CHANNEL | RELATESINDEX | INTOCCSID | INTOCODEPAGE) cics_data_value |
                    (ACTION | MESSAGEID | RELATESURI | RELATESTYPE | EPRINTO | EPRLENGTH) cics_data_area | EPRSET cics_ref | cics_handle_response)+;

/** WSAEPR CREATE */
cics_wsaepr: WSAEPR cics_wsaepr_body;
cics_wsaepr_body: (CREATE | EPRINTO cics_data_area | EPRSET cics_data_area | EPRLENGTH cics_data_area | ADDRESS cics_data_value |
             REFPARMS cics_data_value | REFPARMSLEN cics_data_value | METADATA cics_data_value | METADATALEN cics_data_value |
             FROMCCSID cics_data_value | FROMCODEPAGE cics_data_value | cics_handle_response)+;

/** XCTL: */
cics_xctl: XCTL cics_xctl_body;
cics_xctl_body: (PROGRAM cics_name | COMMAREA cics_data_area | LENGTH cics_data_value | CHANNEL cics_name | INPUTMSG cics_data_area |
           INPUTMSGLEN cics_data_value | cics_handle_response)+;

/** FILE or DATASET */
cics_file_name: (FILE | DATASET) cics_name;

/** RESP **/
cics_resp: (RESP | RESP2) cics_data_area;

cics_handle_response: cics_inline_handle_exception;
cics_inline_handle_exception: (cics_resp | NOHANDLE)+;

cics_data_area: LPARENCHAR data_area RPARENCHAR;
cics_data_value: LPARENCHAR data_value RPARENCHAR;
cics_cvda: LPARENCHAR cvda RPARENCHAR;
cics_name: LPARENCHAR name RPARENCHAR;
cics_ref: LPARENCHAR ptr_ref RPARENCHAR;
cics_rebuild: LPARENCHAR REBUILD RPARENCHAR;
cics_hhmmss: LPARENCHAR hhmmss RPARENCHAR;
cics_label: LPARENCHAR paragraphNameUsage RPARENCHAR;
cics_value: LPARENCHAR ptr_value RPARENCHAR;

cicsWord
    : WORD_IDENTIFIER | cicsWords
    ;

cicsWords:
ABORT
 | ACQFAIL
 | ACQUIRING
 | ADDFAIL
 | ADDRESS
 | AFTER
 | AINIT
 | ALLCONN
 | ALLOCATD
 | ALLQUERY
 | ALLVALUES
 | ALTER
 | ALTERABLE
 | ANALYZER
 | APPC
 | APPCPARALLEL
 | APPCSINGLE
 | APPLNAME
 | AS
 | ASACTL
 | ASCII7
 | ASCII8
 | ASRUNTRAN
 | ASSEMBLER
 | ASSERTED
 | ASSIGN
 | ASSOCIATION
 | AT
 | ATOM
 | ATTACH
 | ATTENTION
 | ATTLSAWARE
 | AUDALARM
 | AUTOARCH
 | AUTOAUTH
 | AUTOCONN
 | AUTOINIT
 | AUTOINSTALL
 | AUTOREGISTER
 | AUTOTERMID
 | AWARE
 | BACKTRANS
 | BACKUPNONBWO
 | BASE
 | BASEAPI
 | BASESPACE
 | BATCHLU
 | BDAM
 | BEGINSESSION
 | BGAM
 | BINARY
 | BINIT
 | BIPROG
 | BISYNCH
 | BLK
 | BLOCKED
 | BOTH
 | BSAM
 | BTAM
 | C_CHAR
 | CACHE
 | CANCEL
 | CANCELLED
 | CANCELLING
 | CAPDATAPRED
 | CAPINFOSRCE
 | CAPOPTPRED
 | CATEGORY
 | CBE
 | CBER
 | CCE
 | CD
 | CDRDLPRT
 | CERTIFICAUTH
 | CERTUSER
 | CFE
 | CHANNEL
 | CHAR
 | CICSAPI
 | CICSECURITY
 | CICSEXECKEY
 | CKOPEN
 | CLASS
 | CLASSCACHE
 | CLIENTAUTH
 | CLIENTCERT
 | CLOSE
 | CLOSEFAILED
 | CLOSEREQ
 | CLOSING
 | CLOUD
 | CMDPROT
 | CMDSECEXT
 | CMDSECNO
 | CMDSECYES
 | COBOL
 | COBOLII
 | COLD
 | COLDQUERY
 | COLDSTART
 | COLLECTION
 | COMMAREA
 | COMMITFAIL
 | CONFFREE
 | CONFRECV
 | CONFSEND
 | CONNECTING
 | CONTEXT
 | CONTNLU
 | CONTROL
 | CONTROLSHUT
 | CONVIDLE
 | COORDINATOR
 | COPY
 | CORBA
 | CPLUSPLUS
 | CREATESPI
 | CSDAPI
 | CSDBATCH
 | CTRLABLE
 | CURRENTPGM
 | CUSTOM
 | DAEOPT
 | DATA
 | DATASETFULL
 | DB2CONN
 | DBCONN
 | DBENTRY
 | DBTRAN
 | DEADLOCK
 | DEC
 | DEFAULTUSER
 | DEFINITION
 | DEFRESP1
 | DEFRESP1OR2
 | DEFRESP2
 | DEFRESP3
 | DELETE
 | DELETEFAIL
 | DELETSHIPPED
 | DELEXITERROR
 | DELIMITER
 | DEREGERROR
 | DEST
 | DETAIL
 | DISABLEDHOST
 | DISABLING
 | DISCARDFAIL
 | DISCARDING
 | DISCONNING
 | DISCOVER
 | DISK1
 | DISK2
 | DISKPAUSE
 | DISPATCHABLE
 | DISPATCHER
 | DOESNOTEQUAL
 | DOESNOTEXIST
 | DOESNOTSTART
 | DORMANT
 | DRAINING
 | DREPAPI
 | DREPBATCH
 | DSIE
 | DUALCASE
 | DUMMY
 | DUMPDS
 | DYNAMIC
 | EB
 | EBCDIC
 | ECI
 | EJB
 | EMERGENCY
 | ENABLING
 | END
 | ENDFILE
 | ENQ
 | ENTER
 | ENTRY
 | EPADAPTINSET
 | EQUAL
 | EQUALS
 | ERASE
 | ERROR
 | ESDS
 | EVENT
 | EVENTPROCESS
 | EXCEPTION
 | EXCEPTRESP
 | EXECENQ
 | EXECENQADDR
 | EXECINSTALL
 | EXISTS
 | EXPORT
 | EXTENDED
 | EXTENDEDDS
 | EXTERNAL
 | EXTRA
 | EXTSECURITY
 | FAILED
 | FAILEDBKOUT
 | FAILINGBKOUT
 | FAULTTOEPR
 | FCLOSE
 | FEED
 | FINALQ
 | FINPUT
 | FIRED
 | FIRSTINIT
 | FIRSTQ
 | FIXED
 | FOPEN
 | FOR
 | FORCED
 | FORCLOSING
 | FORMATTED
 | FOUTPUT
 | FREEING
 | FROM
 | FROMEPR
 | FULLAUTO
 | FWDRECOVABLE
 | GMT
 | GOHIGHERTHAN
 | GOINGOUT
 | GOLOWERTHAN
 | GREATERTHAN
 | GRPLIST
 | HARDCOPY
 | HEURBACKOUT
 | HEURCOMMIT
 | HFORM
 | HOME
 | HOSTNAME
 | HTTPNO
 | HTTPYES
 | IDENTIFY
 | IGNORERR
 | IIOP
 | IMMCLOSING
 | IMPORT
 | INACTIVE
 | INBOUND
 | INDEXRECFULL
 | INDIRECT
 | INFLIGHT
 | INITCOMPLETE
 | INITIAL
 | INITING
 | INOUT
 | INPUT
 | INQUIRE
 | INSTALLED
 | INSTALLFAIL
 | INTACTLU
 | INTERNAL
 | INTO
 | INTRA
 | INVALID
 | INVOKE
 | IOERROR
 | IPIC
 | IPV4
 | IPV6
 | IRC
 | ISCMMCONV
 | ISNOTGREATER
 | ISNOTLESS
 | ISOLATE
 | JAVA
 | JMS
 | JVMPOOL
 | KEYED
 | KSDS
 | LABEL
 | LAST
 | LCKSTRUCFULL
 | LE370
 | LEAVE
 | LENGTH
 | LESSTHAN
 | LIC
 | LINE
 | LINK
 | LIST
 | LOC24
 | LOC31
 | LOGICAL
 | LOGREPLICATE
 | LOGTERM
 | LOSE
 | LPA
 | LU61
 | LUCMODGRP
 | LUCSESS
 | LUP
 | LUSTAT
 | LUTYPE4
 | LUTYPE6
 | LUW
 | MAGTAPE
 | MCHCTL
 | MDT
 | MESSAGE
 | MIXED
 | MMDDYYYY
 | MNPS
 | MOD
 | MODE
 | MODE24
 | MODE31
 | MODEANY
 | MODEL
 | MONITOR
 | MORE_RESERVED
 | MQCONN
 | MRO
 | MTOM
 | MTOMNOXOP
 | MVS
 | N906
 | N906D
 | NEGATIVE
 | NEW
 | NEWSESSION
 | NEXT
 | NOALARM
 | NOANALYZER
 | NOAPLKYBD
 | NOAPLTEXT
 | NOAPPEND
 | NOAPPLNAME
 | NOAUDALARM
 | NOAUTHENTIC
 | NOAUTO
 | NOAUTOARCH
 | NOBACKOUT
 | NOBACKTRANS
 | NOCLASSCACHE
 | NOCLEAR
 | NOCMDPROT
 | NOCOLOR
 | NOCONV
 | NOCONVERT
 | NOCOPY
 | NOCTL
 | NODAEOPT
 | NODISCOVER
 | NODUALCASE
 | NOEMIT
 | NOEVENT
 | NOEXIT
 | NOEXTENDEDDS
 | NOFMH
 | NOFMHPARM
 | NOFORMATEDF
 | NOFORMFEED
 | NOHFORM
 | NOHILIGHT
 | NOHOLD
 | NOISOLATE
 | NOKATAKANA
 | NOKEEP
 | NOLIGHTPEN
 | NOLOGREPLICA
 | NOLOSTLOCKS
 | NOMDT
 | NOMSGJRNL
 | NOMSRCONTROL
 | NOMTOM
 | NOMTOMNOXOP
 | NONAUTOCONN
 | NONCICS
 | NONLE370
 | NONRESIDENT
 | NONTRANS
 | NOOBOPERID
 | NOOUTLINE
 | NOPARTITIONS
 | NOPHASEOUT
 | NOPRESETSEC
 | NOPRINTADAPT
 | NOPROGSYMBOL
 | NOPROP
 | NOPS
 | NOQUERY
 | NOREENTPROT
 | NORETAINED
 | NOREUSE
 | NORMALBKOUT
 | NORMALRESP
 | NORMI
 | NOROLLBACK
 | NOSECURITY
 | NOSENDMTOM
 | NOSOSI
 | NOSPI
 | NOSSL
 | NOSTSN
 | NOSYSLOG
 | NOTALLOWED
 | NOTALTERABLE
 | NOTAPPLIC
 | NOTASKSTART
 | NOTAWARE
 | NOTBRWBLE
 | NOTBUSY
 | NOTCDEB
 | NOTCTRLABLE
 | NOTDEFINED
 | NOTDELBLE
 | NOTDYNAMIC
 | NOTEMPTY
 | NOTEXTENDED
 | NOTEXTKYBD
 | NOTEXTPRINT
 | NOTFIRED
 | NOTFWDRCVBLE
 | NOTHOTPOOL
 | NOTINBOUND
 | NOTINIT
 | NOTINSTALLED
 | NOTKEYED
 | NOTLPA
 | NOTREADY
 | NOTRECOVABLE
 | NOTREQUIRED
 | NOTROUTABLE
 | NOTSHARED
 | NOTSOS
 | NOTSUPPORTED
 | NOTSUSPENDED
 | NOTUPDBLE
 | NOTUSED
 | NOUSER
 | NOVFORM
 | NOXOPDIRECT
 | NOXOPSUPPORT
 | NRS
 | OBOPERID
 | OBTAINING
 | OLDCOPY
 | OLDSESSION
 | OPENERROR
 | OPENING
 | OPENINPUT
 | OPTIONAL
 | ORGANIZATION
 | OTS
 | OUTPUT
 | OVERRIDE
 | PAGE
 | PARSE
 | PARTITIONS
 | PASSWORD
 | PAUSED
 | PDSMEMBER
 | PENDBEGIN
 | PENDDATA
 | PENDFREE
 | PENDING
 | PENDINIT
 | PENDPASS
 | PENDRECEIVE
 | PENDRELEASE
 | PENDRESOLVE
 | PENDSTART
 | PENDSTSN
 | PENDUNSOL
 | PHYSICAL
 | PLI
 | POLICYSCOPE
 | POSITIVE
 | POSTCOMMAND
 | PRECOMMAND
 | PRESETSEC
 | PRIMARY
 | PRINCIPAL
 | PRINTADAPT
 | PROCESS
 | PROGRAM
 | PROGRAMINIT
 | PROGSYMBOL
 | PROPONLY
 | PROTECTED
 | PROVIDER
 | PUBLISH
 | PURGE
 | QR
 | QUIESCING
 | READBACK
 | READONLY
 | READY
 | RECEIVE
 | RECORD
 | RECOVDATA
 | RECOVERABLE
 | RECOVERLOCKS
 | REENTPROT
 | REGERROR
 | REGION
 | REGISTERED
 | REJECT
 | RELEASE
 | RELEASING
 | RELOAD
 | RELOADING
 | REMLOSTLOCKS
 | REMOTE
 | REMSESSION
 | REMTABLE
 | REPLACE
 | REPLYTOEPR
 | REQCONTEXT
 | REQUESTER
 | REREAD
 | RESET
 | RESIDENT
 | RESOLVED
 | RESOLVING
 | RESPCONTEXT
 | RESPECTED
 | RESSECEXT
 | RESSECINT
 | RESSECNO
 | RESSECYES
 | RESSYS
 | RESUMED
 | RETAINED
 | RETRACT
 | RETURN
 | REUSE
 | REVERTED
 | REWIND
 | REWRITE
 | RFC1123
 | RFC3339
 | RLSACTIVE
 | RLSGONE
 | RLSINACTIVE
 | RLSSERVER
 | ROUTABLE
 | RPG
 | RRCOMMITFAIL
 | RRDS
 | RRINDOUBT
 | RRMS
 | RRSUR
 | RTR
 | RU
 | RUN
 | RUNNING
 | RZINSTOR
 | SAMESENDMTOM
 | SCS
 | SDLC
 | SECDISCOVERY
 | SECERROR
 | SECONDINIT
 | SECURITY
 | SECUSER
 | SEND
 | SENDMTOM
 | SEQDISK
 | SERVICE
 | SESSIONFAIL
 | SESSIONLOST
 | SETFAIL
 | SHARED
 | SHUNTED
 | SIGNEDOFF
 | SIGNEDON
 | SKIP_RESERVED
 | SMF
 | SNPS
 | SOAP
 | SOCKET
 | SOMEAVAIL
 | SOS
 | SOSABOVE
 | SOSBELOW
 | SPECIAL
 | SPECIFIC
 | STANDARD
 | STANDBY
 | START
 | STARTING
 | STARTSWITH
 | STARTTERM
 | STATIC
 | STATISTICS
 | STATUS
 | STOPPING
 | STORAGE
 | STORAGE64
 | STSN
 | STSNSET
 | STSNTEST
 | SUBORDINATE
 | SUBSPACE
 | SUMMUNLIKE
 | SUPPORTED
 | SURROGATE
 | SUSPENDED
 | SWITCHING
 | SYMBOL
 | SYNCFREE
 | SYNCONRETURN
 | SYNCRECV
 | SYNCSEND
 | SYS370
 | SYS7BSCA
 | SYSCONNECT
 | SYSLOG
 | SYSPLEX
 | SYSTEM
 | SYSTEM3
 | SYSTEM7
 | T1050
 | T1053
 | T2260L
 | T2260R
 | T2265
 | T2740
 | T2741BCD
 | T2741COR
 | T2770
 | T2780
 | T2980
 | T3275R
 | T3277L
 | T3277R
 | T3284L
 | T3284R
 | T3286L
 | T3286R
 | T3600BI
 | T3601
 | T3614
 | T3650ATT
 | T3650PIPE
 | T3650USER
 | T3653HOST
 | T3735
 | T3740
 | T3780
 | T3790
 | T3790SCSP
 | T3790UP
 | T7770
 | TAG
 | TAPE1
 | TAPE2
 | TASK
 | TASKEND
 | TCAM
 | TCAMSNA
 | TCONSOLE
 | TCPIP
 | TDQ
 | TELETYPE
 | TEMPSTORAGE
 | TERMINAL
 | TERMINATE
 | TEST
 | TEXT
 | THIRDINIT
 | TIMER
 | TITLE
 | TM3278M2
 | TM3278M3
 | TM3278M4
 | TM3278M5
 | TM3279M2
 | TM3279M3
 | TM3279M4
 | TM3279M5
 | TOEPR
 | TPSM55M2
 | TPSM55M3
 | TPSM55M4
 | TPSM55M5
 | TRACEDEST
 | TRACEFLAG
 | TRACETYPE
 | TRANDATA
 | TRANS
 | TRANSTART
 | TSQ
 | TSQUEUE
 | TTCAM
 | TWX3335
 | TYPE
 | UKOPEN
 | UNATTEMPTED
 | UNBLOCKED
 | UNCONNECTED
 | UNDEFINED
 | UNDETERMINED
 | UNENABLED
 | UNENABLING
 | UNEXPECTED
 | UNEXPIRED
 | UNINSTALLED
 | UNKNOWN
 | UNPROTECTED
 | UNREGISTERED
 | UNRESOLVED
 | UNSOLDATA
 | UNUSABLE
 | UOWDSNFAIL
 | UOWENQ
 | UPDATING
 | URMTERMID
 | USED
 | USEREXECKEY
 | UTC
 | VALID
 | VALUE
 | VARIABLE
 | VFORM
 | VIDEOTERM
 | VRRDS
 | VSAM
 | VTAM
 | WAIT
 | WAITCOMMIT
 | WAITER
 | WAITFORGET
 | WAITING
 | WAITRMI
 | WAITRRMS
 | WARMSTART
 | WBE
 | WEB
 | WIN
 | WLMHEALTH
 | WMQ
 | XCF
 | XMRUNTRAN
 | XNOTDONE
 | XOK
 | XOPDIRECT
 | XOPSUPPORT
 | XPLINK
 | YEAR
 | YYYYDDD
 | YYYYMMDD
 | cicsTranslatorCompileDirectivedKeywords;

cicsLexerDefinedVariableUsageTokens:
ABCODE
  | ABDUMP
  | ABEND
  | ABENDCODE
  | ABOFFSET
  | ABORT
  | ABPROGRAM
  | ABSTIME
  | ACAPPLNAME
  | ACCESSMETHOD
  | ACCOUNTREC
  | ACCUM
  | ACEE
  | ACMAJORVER
  | ACMICROVER
  | ACMINORVER
  | ACOPERNAME
  | ACPLATNAME
  | ACQACTIVITY
  | ACQPROCESS
  | ACQSTATUS
  | ACQUACTIVITY
  | ACQUIRE
  | ACQUIRED
  | ACTION
  | ACTIONCOUNT
  | ACTIONTYPE
  | ACTIVE
  | ACTIVITY
  | ACTIVITYBUSY
  | ACTIVITYERR
  | ACTIVITYID
  | ACTOPENTCBS
  | ACTPARTN
  | ACTSOCKETS
  | ACTSSLTCBS
  | ACTTHRDTCBS
  | ACTXPTCBS
  | ADAPTERTYPE
  | ADD
  | ADDABLE
  | ADDRESS
  | ADJUSTMENT
  | ADDRESS64
  | ADVANCE
  | AFFINITY
  | AGE
  | AIBRIDGE
  | AID
  | AIDCOUNT
  | AKP
  | ALARM
  | ALL
  | ALLOCATE
  | ALLOCERR
  | ALTER
  | ALTERNATE
  | ALTPAGEHT
  | ALTPAGEWD
  | ALTPRINTER
  | ALTPRTCOPY
  | ALTPRTCOPYST
  | ALTSCRNHT
  | ALTSCRNWD
  | ALTSUFFIX
  | ANALYZERSTAT
  | AND
  | ANY
  | ANYKEY
  | AP
  | APIST
  | APLKYBD
  | APLKYBDST
  | APLTEXT
  | APLTEXTST
  | APPEND
  | APPENDCRLF
  | APPID
  | APPIDLEN
  | APPLDATA
  | APPLICATION
  | APPLID
  | APPLMAJORVER
  | APPLMICROVER
  | APPLMINORVER
  | APPLNAMEST
  | APPNOTFOUND
  | ARCHIVEFILE
  | AS
  | ASA
  | ASCII
  | ASIS
  | ASKTIME
  | ASRAINTRPT
  | ASRAKEY
  | ASRAPSW
  | ASRAPSW16
  | ASRAREGS
  | ASRAREGS64
  | ASRASPC
  | ASRASTG
  | ASSIGN
  | ASSOCIATION
  | ASYNCHRONOUS
  | ASYNCSERVICE
  | AT
  | ATI
  | ATIFACILITY
  | ATISTATUS
  | ATITERMID
  | ATITRANID
  | ATIUSERID
  | ATOMSERVICE
  | ATOMTYPE
  | ATTACH
  | ATTACHID
  | ATTACHSEC
  | ATTACHTIME
  | ATTLS
  | ATTRIBUTES
  | ATTRLEN
  | AUDALARMST
  | AUDITLEVEL
  | AUDITLOG
  | AUTHENTICATE
  | AUTHID
  | AUTHORITY
  | AUTHTYPE
  | AUTHUSERID
  | AUTINSTMODEL
  | AUTOACTIVE
  | AUTOCONNECT
  | AUTOINACTIVE
  | AUTOINSTALL
  | AUTOPAGE
  | AUTOPAGEABLE
  | AUTOSTART
  | AUTOSTATUS
  | AUXILIARY
  | AUXPAUSE
  | AUXSTART
  | AUXSTATUS
  | AUXSTOP
  | AVAIL
  | AVAILABILITY
  | AVAILABLE
  | AVAILSTATUS
  | BA
  | BACKLOG
  | BACKOUT
  | BACKTRANSST
  | BACKUPTYPE
  | BASE64
  | BASEDSNAME
  | BASESCOPE
  | BASICAUTH
  | BEFORE
  | BELOW
  | BIF
  | BINARY
  | BINDFILE
  | BINDING
  | BIT
  | BLOCKFORMAT
  | BLOCKKEYLEN
  | BLOCKSIZE
  | BM
  | BODYCHARSET
  | BOOKMARK
  | BR
  | BRANCHQUAL
  | BRDATA
  | BRDATALENGTH
  | BREXIT
  | BRFACILITY
  | BRIDGE
  | BROWSABLE
  | BROWSE
  | BROWSETOKEN
  | BTRANS
  | BUFFER
  | BUILD
  | BUNDLE
  | BUNDLEDIR
  | BUNDLEID
  | BUNDLEPART
  | BUSAPPMGR
  | BUSY
  | BYTEOFFSET
  | CACHESIZE
  | CADDRLENGTH
  | CALLER
  | CALLERLENGTH
  | CANCEL
  | CAPDATAPRED
  | CAPINFOSRCE
  | CAPOPTPRED
  | CAPTUREPOINT
  | CAPTUREPTYPE
  | CAPTURESPEC
  | CARD
  | CAUSE
  | CBIDERR
  | CBUFF
  | CCSID
  | CCSIDERR
  | CDSASIZE
  | CEDF
  | CEDFSTATUS
  | CERTIFICATE
  | CFDTPOOL
  | CFTABLE
  | CGROUP
  | CHANGE
  | CHANGEAGENT
  | CHANGEAGREL
  | CHANGED
  | CHANGETIME
  | CHANGEUSRID
  | CHANNEL
  | CHANNELERR
  | CHAR
  | CHARACTERSET
  | CHECK
  | CHILD
  | CHUNKEND
  | CHUNKING
  | CHUNKNO
  | CHUNKYES
  | CICSDATAKEY
  | CICSSTATUS
  | CICSSYS
  | CICSTABLE
  | CICSTSLEVEL
  | CIDDOMAIN
  | CIPHER
  | CIPHERS
  | CLASS
  | CLEAR
  | CLICONVERT
  | CLIENT
  | CLIENTADDR
  | CLIENTADDRNU
  | CLIENTCONV
  | CLIENTIPADDR
  | CLIENTLOC
  | CLIENTNAME
  | CLIENTPORT
  | CLNTADDR6NU
  | CLNTCODEPAGE
  | CLNTIPFAMILY
  | CLOSE
  | CLOSED
  | CLOSESTATUS
  | CLOSETIMEOUT
  | CLRPARTN
  | CMD
  | CMDPROTECT
  | CMDSEC
  | CNAMELENGTH
  | CNOTCOMPL
  | COBOLTYPE
  | CODEPAGE
  | CODEPAGEERR
  | COLDACQ
  | COLDSTATUS
  | COLLECT
  | COLOR
  | COLORST
  | COMAUTHID
  | COMAUTHTYPE
  | COMMAREA
  | COMMIT
  | COMMONNAME
  | COMMONNAMLEN
  | COMPAREMAX
  | COMPAREMIN
  | COMPAT
  | COMPATMODE
  | COMPID
  | COMPLETE
  | COMPOSITE
  | COMPRESS
  | COMPRESSST
  | COMPSTATUS
  | COMTHREADLIM
  | COMTHREADS
  | CONCURRENCY
  | CONCURRENTST
  | CONDITION
  | CONFIG
  | CONFIGDATA1
  | CONFIGFILE
  | CONFIRM
  | CONFIRMATION
  | CONNECT
  | CONNECTED
  | CONNECTERROR
  | CONNECTION
  | CONNECTIONS
  | CONNECTST
  | CONNSTATUS
  | CONNTYPE
  | CONSISTENT
  | CONSNAME
  | CONSOLE
  | CONSOLES
  | CONTAINER
  | CONTAINERCNT
  | CONTAINERERR
  | CONTENTION
  | CONTEXTTYPE
  | CONTROL
  | CONVDATA
  | CONVERSE
  | CONVERSEST
  | CONVERSET
  | CONVERTER
  | CONVERTST
  | CONVERTTIME
  | CONVID
  | COPID
  | COPY
  | COPYST
  | CORBASERVER
  | CORRELID
  | COUNTER
  | COUNTRY
  | COUNTRYLEN
  | CP
  | CPI
  | CQP
  | CREATE
  | CREATESESS
  | CRITICAL
  | CRITICALST
  | CRLPROFILE
  | CSD
  | CSDERR
  | CSIGN
  | CTERM
  | CTLCHAR
  | CTLGALL
  | CTLGMODIFY
  | CTLGNONE
  | CTX
  | CURAUXDS
  | CURRENT
  | CURRENTDDS
  | CURRENTHEAP
  | CURRENTPROG
  | CURREQS
  | CURRPGM
  | CURRPGMOP
  | CURRTRANID
  | CURRTRANIDOP
  | CURRUSERID
  | CURRUSERIDOP
  | CURSOR
  | CUSERID
  | CWA
  | CWALENG
  | DAE
  | DAEOPTION
  | DATA
  | DATA1
  | DATA2
  | DATABUFFERS
  | DATAFORMAT
  | DATALENGTH
  | DATALOCATION
  | DATAONLY
  | DATAPOINTER
  | DATASET
  | DATASTR
  | DATASTREAM
  | DATATOJSON
  | DATATOXML
  | DATATYPE
  | DATCONTAINER
  | DATE
  | DATEFORM
  | DATESEP
  | DATESTRING
  | DAYCOUNT
  | DAYOFMONTH
  | DAYOFWEEK
  | DAYOFYEAR
  | DAYS
  | DAYSLEFT
  | DB2
  | DB2CONN
  | DB2ENTRY
  | DB2GROUPID
  | DB2ID
  | DB2PLAN
  | DB2RELEASE
  | DB2TRAN
  | DC
  | DCOUNTER
  | DCT
  | DD
  | DDMMYY
  | DDMMYYYY
  | DDNAME
  | DEBKEY
  | DEBREC
  | DEBUG
  | DEBUGTOOL
  | DEEDIT
  | DEFAULT
  | DEFINE
  | DEFINESOURCE
  | DEFINETIME
  | DEFPAGEHT
  | DEFPAGEWD
  | DEFRESP
  | DEFSCRNHT
  | DEFSCRNWD
  | DELAY
  | DELETABLE
  | DELETE
  | DELETEQ
  | DELETSHIPPED
  | DELIMITER
  | DEQ
  | DEREGISTERED
  | DESTCOUNT
  | DESTID
  | DESTIDLENG
  | DETAIL
  | DETAILLENGTH
  | DEVICE
  | DFHRESP
  | DFHVALUE
  | DFLTUSER
  | DH
  | DIAGNOSTICS
  | DIGEST
  | DIGESTTYPE
  | DIRMGR
  | DISABLE
  | DISABLED
  | DISABLEDACT
  | DISCARD
  | DISCONNECT
  | DISCOVERALL
  | DISCREQ
  | DISCREQST
  | DISPATCHABLE
  | DISPATCHER
  | DISPOSITION
  | DJAR
  | DM
  | DNAME
  | DNAMELEN
  | DOCDELETE
  | DOCSIZE
  | DOCSTATUS
  | DOCTEMPLATE
  | DOCTOKEN
  | DOCUMENT
  | DOMAINMGR
  | DP
  | DPLIST
  | DPLLIMIT
  | DPLSUBSET
  | DRAIN
  | DROLLBACK
  | DS
  | DS3270
  | DSALIMIT
  | DSANAME
  | DSNAME
  | DSNAME01
  | DSNAME02
  | DSNAME03
  | DSNAME04
  | DSNAME05
  | DSNAME06
  | DSNAME07
  | DSNAME08
  | DSNAME09
  | DSNAME10
  | DSNAME11
  | DSNAME12
  | DSNAME13
  | DSNAME14
  | DSNAME15
  | DSNAME16
  | DSNAMELIST
  | DSNNOTFOUND
  | DSPLIST
  | DSRTPROGRAM
  | DSSCS
  | DSSTAT
  | DTIMEOUT
  | DTRPROGRAM
  | DU
  | DUALCASEST
  | DUMP
  | DUMPCODE
  | DUMPDS
  | DUMPID
  | DUMPING
  | DUMPSCOPE
  | DUMPTYPE
  | DUPACTION
  | DUPERROR
  | DUPKEY
  | DUPNOREPLACE
  | DUPREC
  | DUPREPLACE
  | DUPRES
  | DURATION
  | DYNAMSTATUS
  | EC
  | ECADDR
  | ECBLIST
  | ECDSASIZE
  | EDSALIMIT
  | EI
  | EIB
  | EJ
  | ELEMENT
  | ELEMENT64
  | ELEMENTLIST
  | ELEMNAME
  | ELEMNAMELEN
  | ELEMNS
  | ELEMNSLEN
  | EM
  | EMITMODE
  | EMPTY
  | EMPTYREQ
  | EMPTYSTATUS
  | ENABLE
  | ENABLED
  | ENABLEDCOUNT
  | ENABLESTATUS
  | ENCRYPTKEY
  | ENCRYPTPTKT
  | END
  | ENDACTIVITY
  | ENDAFFINITY
  | ENDBR
  | ENDBRGROUP
  | ENDBRLIST
  | ENDBROWSE
  | ENDBRRSRCE
  | ENDDATA
  | ENDFILE
  | ENDINPT
  | ENDOFDAY
  | ENDOFDAYHRS
  | ENDOFDAYMINS
  | ENDOFDAYSECS
  | ENDOUTPUT
  | ENDPOINT
  | ENQ
  | ENQBUSY
  | ENQFAILS
  | ENQMODEL
  | ENQNAME
  | ENQSCOPE
  | ENQUEUE
  | ENTER
  | ENTJAVA
  | ENTRY
  | ENTRYNAME
  | ENTRYPOINT
  | ENVDEFERR
  | EOC
  | EODS
  | EOF_TOKEN
  | EP
  | EPADAPTER
  | EPADAPTERNUM
  | EPADAPTERRES
  | EPADAPTERSET
  | EPADAPTINSET
  | EPCDSASIZE
  | EPRFIELD
  | EPRFROM
  | EPRINTO
  | EPRLENGTH
  | EPRSET
  | EPRTYPE
  | EPSTATUS
  | EPUDSASIZE
  | EQUAL
  | ERASE
  | ERASEAUP
  | ERDSASIZE
  | ERROR
  | ERRORMSG
  | ERRORMSGLEN
  | ERROROPTION
  | ERRTERM
  | ESDSASIZE
  | ESMAPPNAME
  | ESMREASON
  | ESMRESP
  | EUDSASIZE
  | EVENT
  | EVENTBINDING
  | EVENTCAPTURE
  | EVENTERR
  | EVENTMGR
  | EVENTNAME
  | EVENTPROC
  | EVENTPROCESS
  | EVENTTYPE
  | EVENTUAL
  | EWASUPP
  | EXACTMATCH
  | EXCEPT
  | EXCEPTCLASS
  | EXCEPTION
  | EXCI
  | EXCLUSIVE
  | EXCTL
  | EXECKEY
  | EXECUTABLE
  | EXECUTIONSET
  | EXIT
  | EXITALL
  | EXITPGM
  | EXITPROGRAM
  | EXITTRACE
  | EXITTRACING
  | EXPECT
  | EXPIRED
  | EXPIRYINT
  | EXPIRYINTMIN
  | EXPIRYTIME
  | EXTDS
  | EXTENDEDDSST
  | EXTERNAL
  | EXTRACT
  | FACILITY
  | FACILITYLIKE
  | FACILITYTOKN
  | FACILITYTYPE
  | FACILNAME
  | FACILTYPE
  | FALSE
  | FAULTACTLEN
  | FAULTACTOR
  | FAULTCODE
  | FAULTCODELEN
  | FAULTCODESTR
  | FAULTSTRING
  | FAULTSTRLEN
  | FC
  | FCI
  | FCT
  | FEATUREKEY
  | FETCH
  | FIELD
  | FIELDLENGTH
  | FIELDOFFSET
  | FILE
  | FILECOUNT
  | FILELIMIT
  | FILENAME
  | FILENOTFOUND
  | FILEPATH
  | FILTERVALUE
  | FIRESTATUS
  | FLAGSET
  | FLAGSTATUS
  | FLENGTH
  | FLUSH
  | FMH
  | FMHPARM
  | FMHPARMST
  | FMHSTATUS
  | FOR
  | FORCE
  | FORCECANCEL
  | FORCECLOSE
  | FORCEPURGE
  | FORCEQR
  | FORCEUOW
  | FORMATEDF
  | FORMATEDFST
  | FORMATTIME
  | FORMFEED
  | FORMFEEDST
  | FORMFIELD
  | FREE
  | FREEKB
  | FREEMAIN
  | FREEMAIN64
  | FREQUENCY
  | FREQUENCYHRS
  | FREQUENCYMIN
  | FREQUENCYMINS
  | FREQUENCYSEC
  | FREQUENCYSECS
  | FROM
  | FROMACTIVITY
  | FROMCCSID
  | FROMCHANNEL
  | FROMCODEPAGE
  | FROMDOC
  | FROMFLENGTH
  | FROMLENGTH
  | FROMPROCESS
  | FRSET
  | FULL
  | FULLAPI
  | FULLDATE
  | FUNCERR
  | FUNCTION
  | FWDRECOVLOG
  | FWDRECOVLSN
  | FWDRECSTATUS
  | GAENTRYNAME
  | GAEXECUTABLE
  | GALENGTH
  | GALOCATION
  | GARBAGEINT
  | GASET
  | GATHER
  | GATHERTYPE
  | GAUSECOUNT
  | GC
  | GCDSASIZE
  | GCHARS
  | GCODES
  | GCPOLICY
  | GDS
  | GENERIC
  | GENERICTCPS
  | GET
  | GET64
  | GETMAIN
  | GETMAIN64
  | GETNEXT
  | GETNEXTGROUP
  | GETNEXTLIST
  | GETNEXTRSRCE
  | GLOBALCATLG
  | GMEXITOPT
  | GMMI
  | GMMLENGTH
  | GMMTEXT
  | GMMTRANID
  | GRNAME
  | GROUP
  | GROUPID
  | GROUPRESYNC
  | GRSTATUS
  | GSDSASIZE
  | GSKRESP
  | GTEQ
  | GTFSTART
  | GTFSTATUS
  | GTFSTOP
  | GUDSASIZE
  | HA
  | HANDLE
  | HEAD
  | HEADER
  | HEALTH
  | HEALTHABSTIM
  | HEALTHCHECK
  | HEAP
  | HEX
  | HFORMST
  | HFS
  | HFSFILE
  | HIGH
  | HIGH_VALUE
  | HIGH_VALUES
  | HILIGHT
  | HILIGHTST
  | HOLD
  | HOLDSTATUS
  | HONEOM
  | HOST
  | HOSTCODEPAGE
  | HOSTLENGTH
  | HOSTTYPE
  | HOURS
  | HTTP
  | HTTPS
  | HTTPHEADER
  | HTTPMETHOD
  | HTTPRNUM
  | HTTPVERSION
  | HTTPVNUM
  | IC
  | IDENTIFIER
  | IDLE
  | IDLEHRS
  | IDLEMINS
  | IDLESECS
  | IDLIST
  | IDLISTLENGTH
  | IDNTY
  | IDNTYCLASS
  | IDPROP
  | IE
  | IGNORE
  | IGREQCD
  | IGREQID
  | ILLOGIC
  | IMMCLOSE
  | IMMEDIATE
  | IMMQUIESCED
  | IN
  | INBFMH
  | INCOMPLETE
  | INCONTAINER
  | INCREMENT
  | INDIRECTNAME
  | INDOUBT
  | INDOUBTMINS
  | INDOUBTST
  | INDOUBTWAIT
  | INITHEAP
  | INITIALDDS
  | INITIMG
  | INITPARM
  | INITPARMLEN
  | INITQNAME
  | INITSTATUS
  | INITUSERID
  | INPARTN
  | INPUT
  | INPUTEVENT
  | INPUTMSG
  | INPUTMSGLEN
  | INQUIRE
  | INQUIREGROUP
  | INQUIRELIST
  | INQUIRERSRCE
  | INSERT
  | INSERVICE
  | INSTALL
  | INSTALLAGENT
  | INSTALLTIME
  | INSTALLUSRID
  | INTEGER
  | INTERVAL
  | INTERVALHRS
  | INTERVALMINS
  | INTERVALSECS
  | INTO
  | INTOCCSID
  | INTOCODEPAGE
  | INTSTART
  | INTSTATUS
  | INTSTOP
  | INVALIDCOUNT
  | INVERRTERM
  | INVEXITREQ
  | INVITE
  | INVLDC
  | INVMPSZ
  | INVOKE
  | INVOKETYPE
  | INVOKINGPROG
  | INVPARTN
  | INVPARTNSET
  | INVREQ
  | INVTSREQ
  | IOERR
  | IOTYPE
  | IPADDRESS
  | IPCONN
  | IPECI
  | IPFACILITIES
  | IPFACILITY
  | IPFACILTYPE
  | IPFAMILY
  | IPFLISTSIZE
  | IPRESOLVED
  | IRC
  | IS
  | ISCINVREQ
  | ISOLATEST
  | ISSUE
  | ISSUER
  | ISUSERID
  | ITEM
  | ITEMERR
  | ITEMNAME
  | IUTYPE
  | JAVACORE
  | JAVAHOME
  | JCT
  | JIDERR
  | JOBLIST
  | JOBNAME
  | JOURNALMODEL
  | JOURNALNAME
  | JOURNALNUM
  | JOURNALSTATUS
  | JRNL
  | JSONTODATA
  | JTYPEID
  | JUSFIRST
  | JUSLAST
  | JUSTIFY
  | JVM
  | JVMACTION
  | JVMCLASS
  | JVMENDPOINT
  | JVMPROFILE
  | JVMPROGRAM
  | JVMSERVER
  | JVMTYPE
  | JWT
  | KATAKANA
  | KATAKANAST
  | KC
  | KE
  | KEEP
  | KEEPTIME
  | KERBEROS
  | KERNEL
  | KEYLENGTH
  | KEYNUMBER
  | KEYPOSITION
  | KILL
  | L40
  | L64
  | L80
  | LABEL
  | LANGDEDUCED
  | LANGINUSE
  | LANGUAGE
  | LANGUAGECODE
  | LAST
  | LASTACTTIME
  | LASTCOLDTIME
  | LASTEMERTIME
  | LASTINITTIME
  | LASTMODTIME
  | LASTRESET
  | LASTRESETABS
  | LASTRESETHRS
  | LASTRESETMIN
  | LASTRESETSEC
  | LASTSECDTIME
  | LASTUSEDINT
  | LASTUSETIME
  | LASTWARMTIME
  | LASTWRITTIME
  | LD
  | LDC
  | LDCMNEM
  | LDCNUM
  | LEAVEKB
  | LENGERR
  | LENGTH
  | LENGTHLIST
  | LERUNOPTS
  | LEVEL
  | LG
  | LIBERTY
  | LIBRARY
  | LIBRARYDSN
  | LIBRTYACTION
  | LIGHTPEN
  | LIGHTPENST
  | LINAGE_COUNTER
  | LINE
  | LINEADDR
  | LINK
  | LINKABEND
  | LINKAGE
  | LINKAUTH
  | LINKEDITMODE
  | LINKLEVEL
  | LINKSYSNET
  | LINKSYSTEM
  | LIST
  | LISTACTION
  | LISTLENGTH
  | LISTSIZE
  | LLID
  | LM
  | LOAD
  | LOADER
  | LOADING
  | LOADPOINT
  | LOADTYPE
  | LOCAL
  | LOCALCATLG
  | LOCALCCSID
  | LOCALITY
  | LOCALITYLEN
  | LOCATION
  | LOCK
  | LOCKED
  | LOCKING
  | LOCKMGR
  | LOG
  | LOGDEFER
  | LOGGER
  | LOGMESSAGE
  | LOGMODE
  | LOGONLOGMODE
  | LOGONMSG
  | LOGREPSTATUS
  | LOSTLOCKS
  | LOW
  | LOW_VALUE
  | LOW_VALUES
  | LPASTATUS
  | LSRPOOL
  | LSRPOOLNUM
  | LUNAME
  | MAIN
  | MAJORVERSION
  | MANAGEDPLAT
  | MAP
  | MAPCOLUMN
  | MAPFAIL
  | MAPHEIGHT
  | MAPLINE
  | MAPNAME
  | MAPONLY
  | MAPPED
  | MAPPINGDEV
  | MAPPINGLEVEL
  | MAPPINGRNUM
  | MAPPINGVNUM
  | MAPSET
  | MAPSETNAME
  | MAPWIDTH
  | MASSINSERT
  | MAXACTIVE
  | MAXDATALEN
  | MAXFLENGTH
  | MAXHEAP
  | MAXIMUM
  | MAXITEMLEN
  | MAXLENGTH
  | MAXLIFETIME
  | MAXNUMRECS
  | MAXOPENTCBS
  | MAXPERSIST
  | MAXPROCLEN
  | MAXQTIME
  | MAXREQS
  | MAXSOCKETS
  | MAXSSLTCBS
  | MAXTASKS
  | MAXTHRDTCBS
  | MAXWINNERS
  | MAXXPTCBS
  | MCC
  | ME
  | MEDIATYPE
  | MEMBER
  | MEMBERNAME
  | MEMLIMIT
  | MESSAGE
  | MESSAGECASE
  | MESSAGEID
  | METADATA
  | METADATAFILE
  | METADATALEN
  | METHOD
  | METHODLENGTH
  | MGMTPART
  | MICROVERSION
  | MILLISECONDS
  | MILLISECS
  | MINIMUM
  | MINITEMLEN
  | MINORVERSION
  | MINRUNLEVEL
  | MINRUNRNUM
  | MINRUNVNUM
  | MINUTES
  | MIRRORLIFE
  | ML
  | MMDDYY
  | MMDDYYYY
  | MN
  | MODE
  | MODELIDERR
  | MODENAME
  | MODIFY
  | MONDATA
  | MONITOR
  | MONSTATUS
  | MONTH
  | MONTHOFYEAR
  | MONUSERID
  | MOVE
  | MP
  | MQCONN
  | MQINI
  | MQMONITOR
  | MQNAME
  | MQQMGR
  | MQRELEASE
  | MROBATCH
  | MSGFORMAT
  | MSGQUEUE1
  | MSGQUEUE2
  | MSGQUEUE3
  | MSR
  | MSRCONTROL
  | MSRCONTROLST
  | MTOMNOXOPST
  | MTOMST
  | MVSIMAGE
  | MVSSMFID
  | MVSSYSNAME
  | MVSTCB
  | NAME
  | NAMELENGTH
  | NAMESPACE
  | NATLANG
  | NATLANGINUSE
  | NATURE
  | NETID
  | NETNAME
  | NETNAMEIDERR
  | NETUOWID
  | NETWORK
  | NETWORKID
  | NEWCOPY
  | NEWMAXSOCKET
  | NEWMAXTASKS
  | NEWPASSWORD
  | NEWPHRASE
  | NEWPHRASELEN
  | NEWSECDCOUNT
  | NEXT
  | NEXTTIME
  | NEXTTIMEHRS
  | NEXTTIMEMINS
  | NEXTTIMESECS
  | NEXTTRANSID
  | NLEOM
  | NO
  | NOALTPRTCOPY
  | NOATI
  | NOAUTOPAGE
  | NOAUTOSTART
  | NOCC
  | NOCEDF
  | NOCHECK
  | NOCLICONVERT
  | NOCLOSE
  | NOCOMPAT
  | NOCOMPRESS
  | NOCONNECT
  | NOCONVERSE
  | NOCREATE
  | NODAE
  | NODATA
  | NODE
  | NODEBUG
  | NODEHOME
  | NODEIDERR
  | NODEJSAPP
  | NODISCREQ
  | NODOCDELETE
  | NODUMP
  | NOEDIT
  | NOEMPTYREQ
  | NOEXCEPT
  | NOEXCTL
  | NOEXITTRACE
  | NOFLUSH
  | NOFORCE
  | NOHANDLE
  | NOIDNTY
  | NOINCONVERT
  | NOJBUFSP
  | NOJVM
  | NOLOAD
  | NOLOG
  | NONCRITICAL
  | NONE
  | NONTERMREL
  | NONVAL
  | NOOBFORMAT
  | NOOTELTRACE
  | NOOUTCONVERT
  | NOPASSBKRD
  | NOPASSBKWR
  | NOPERF
  | NOPRTCOPY
  | NOQUEUE
  | NOQUIESCE
  | NORECOVDATA
  | NORELEASE
  | NORELREQ
  | NOREPLICATOR
  | NORESRCE
  | NORESTART
  | NORESYNC
  | NORMAL
  | NOSDTRAN
  | NOSHUTDOWN
  | NOSPACE
  | NOSPOOL
  | NOSRVCONVERT
  | NOSTART
  | NOSTG
  | NOSUSPEND
  | NOSWITCH
  | NOSYNCPOINT
  | NOSYSDUMP
  | NOTADDABLE
  | NOTADDBALE
  | NOTALLOC
  | NOTAUTH
  | NOTBROWSABLE
  | NOTCONNECTED
  | NOTDELETABLE
  | NOTE
  | NOTERMINAL
  | NOTFINISHED
  | NOTFND
  | NOTOPEN
  | NOTPENDING
  | NOTPURGEABLE
  | NOTRANDUMP
  | NOTREADABLE
  | NOTRLS
  | NOTRUNCATE
  | NOTSUPERUSER
  | NOTTABLE
  | NOTTI
  | NOTUPDATABLE
  | NOTWAIT
  | NOUCTRAN
  | NOVALIDATION
  | NOWAIT
  | NOWRITE
  | NOZCPTRACE
  | NQ
  | NQNAME
  | NSCONTAINER
  | NULL
  | NULLS
  | NUMCIPHERS
  | NUMDATAPRED
  | NUMDSNAMES
  | NUMELEMENTS
  | NUMEVENTS
  | NUMEXITS
  | NUMINFOSRCE
  | NUMITEMS
  | NUMOPTPRED
  | NUMREC
  | NUMROUTES
  | NUMSEGMENTS
  | NUMTAB
  | OBFORMAT
  | OBFORMATST
  | OBJECT
  | OBJECTNAME
  | OBJECTTRAN
  | OBOPERIDST
  | OCCUPANCY
  | ODADPTRDATA1
  | ODADPTRDATA2
  | ODADPTRDATA3
  | ODADPTRID
  | ODAPPLID
  | ODCLNTIPADDR
  | ODCLNTPORT
  | ODFACILNAME
  | ODFACILTYPE
  | ODIPFAMILY
  | ODLUNAME
  | ODNETID
  | ODNETWORKID
  | ODSERVERPORT
  | ODSTARTTIME
  | ODTASKID
  | ODTCPIPS
  | ODTRANSID
  | ODUSERID
  | OF
  | OFF
  | OIDCARD
  | OK
  | OLD
  | OPCLASS
  | OPEN
  | OPENAPI
  | OPENERR
  | OPENSTATUS
  | OPERATION
  | OPERATOR
  | OPERID
  | OPERKEYS
  | OPERPURGE
  | OPID
  | OPREL
  | OPSECURITY
  | OPSYS
  | OPTIONNAME
  | OPTIONS
  | OPTIONSPGM
  | OR
  | ORGABCODE
  | ORGANIZATION
  | ORGANIZATLEN
  | ORGUNIT
  | ORGUNITLEN
  | OSGI
  | OSGIACTION
  | OSGIBUNDLE
  | OSGIBUNDLEID
  | OSGISERVICE
  | OSGISTATUS
  | OSGIVERSION
  | OSLEVEL
  | OT
  | OTEL
  | OTELTRACE
  | OTSTID
  | OTSTIMEOUT
  | OUTCONTAINER
  | OUTDESCR
  | OUTDESCRERR
  | OUTLINE
  | OUTLINEST
  | OUTPARTN
  | OUTPUT
  | OUTSERVICE
  | OUTTOKEN
  | OUTTOKENLEN
  | OVERFLOW
  | OWNER
  | PA
  | PA1
  | PA2
  | PA3
  | PAGE
  | PAGEABLE
  | PAGEHT
  | PAGENUM
  | PAGESTATUS
  | PAGEWD
  | PAGE_COUNTER
  | PAGING
  | PARAMGR
  | PARSE
  | PARTCLASS
  | PARTCOUNT
  | PARTIAL
  | PARTITIONSET
  | PARTITIONSST
  | PARTN
  | PARTNER
  | PARTNERIDERR
  | PARTNFAIL
  | PARTNPAGE
  | PARTNS
  | PARTNSET
  | PARTTYPE
  | PASS
  | PASSBK
  | PASSTICKET
  | PASSWORD
  | PASSWORDLEN
  | PATCH
  | PATH
  | PATHLENGTH
  | PC
  | PCDSASIZE
  | PCT
  | PENDSTATUS
  | PERF
  | PERFCLASS
  | PERFORM
  | PERMANENT
  | PF1
  | PF10
  | PF11
  | PF12
  | PF13
  | PF14
  | PF15
  | PF16
  | PF17
  | PF18
  | PF19
  | PF2
  | PF20
  | PF21
  | PF22
  | PF23
  | PF24
  | PF3
  | PF4
  | PF5
  | PF6
  | PF7
  | PF8
  | PF9
  | PFXLENG
  | PG
  | PGMIDERR
  | PGMINTERFACE
  | PHAPPLID
  | PHASEIN
  | PHASEOUT
  | PHCOUNT
  | PHNETWORKID
  | PHRASE
  | PHRASELEN
  | PHSTARTTIME
  | PHTASKID
  | PHTRANSID
  | PI
  | PID
  | PIPELINE
  | PIPEMGR
  | PIPLENGTH
  | PIPLIST
  | PLAN
  | PLANEXITNAME
  | PLATFORM
  | PLT
  | PLTNAME
  | PLTPIUSR
  | POINT
  | POLICY
  | POLICYRULE
  | POOL
  | POOLERR
  | POOLNAME
  | POP
  | PORT
  | PORTNUMBER
  | PORTNUMNU
  | POST
  | PPT
  | PREDICATE
  | PREFIX
  | PREPARE
  | PREPEND
  | PRIMPRED
  | PRIMPREDOP
  | PRIMPREDTYPE
  | PRINCONVID
  | PRINSYSID
  | PRINT
  | PRINTADAPTST
  | PRINTCONTROL
  | PRINTER
  | PRIORITY
  | PRIVACY
  | PRIVATE
  | PROCESS
  | PROCESSBUSY
  | PROCESSERR
  | PROCESSTYPE
  | PROCLENGTH
  | PROCNAME
  | PROFILE
  | PROFILEDIR
  | PROFILEIDERR
  | PROGAUTO
  | PROGAUTOCTLG
  | PROGAUTOEXIT
  | PROGAUTOINST
  | PROGMGR
  | PROGRAM
  | PROGRAMDEF
  | PROGSYMBOLST
  | PROGTYPE
  | PROP
  | PROPEMIT
  | PROPINIT
  | PROPINITEMIT
  | PROTECT
  | PROTECTNUM
  | PROTOCOL
  | PRTCOPY
  | PRTCOPYST
  | PRTYAGING
  | PS
  | PSB
  | PSDINTERVAL
  | PSDINTHRS
  | PSDINTMINS
  | PSDINTSECS
  | PSTYPE
  | PT
  | PTCOUNT
  | PTHREADS
  | PTSTARTTIME
  | PTTASKID
  | PTTRANSID
  | PUDSASIZE
  | PUNCH
  | PURGE
  | PURGEABILITY
  | PURGEABLE
  | PURGEABLEST
  | PURGEACTION
  | PURGECYCLEM
  | PURGECYCLES
  | PURGETHRESH
  | PURGETYPE
  | PUSH
  | PUT
  | PUT64
  | QALL
  | QBUSY
  | QIDERR
  | QNAME
  | QNOTENAB
  | QSESSLIM
  | QUALIFIER
  | QUALLEN
  | QUASIRENT
  | QUERY
  | QUERYPARM
  | QUERYST
  | QUERYSTRING
  | QUERYSTRLEN
  | QUESCESTATE
  | QUEUE
  | QUEUED
  | QUEUELIMIT
  | QUIESCED
  | QUIESCESTATE
  | QUOTE
  | QUOTES
  | QZERO
  | RA
  | RANDOM
  | RANKING
  | RBA
  | RBATYPE
  | RBN
  | RDATT
  | RDSASIZE
  | READ
  | READABLE
  | READINTEG
  | READNEXT
  | READPREV
  | READQ
  | REALM
  | REALMLEN
  | REASON
  | REATTACH
  | REBUILD
  | RECEIVE
  | RECEIVECOUNT
  | RECEIVER
  | RECFM
  | RECONNECT
  | RECORD
  | RECORDBUSY
  | RECORDFORMAT
  | RECORDING
  | RECORDLEN
  | RECORDLENGTH
  | RECORDNOW
  | RECORDSIZE
  | RECOVERED
  | RECOVERY
  | RECOVSTATUS
  | REDIRECTTYPE
  | REDUCE
  | REENTPROTECT
  | REFPARMS
  | REFPARMSLEN
  | REFRESH
  | REFRESHPKGS
  | REGIONSTAT
  | REGIONUSERID
  | RELATED
  | RELATESINDEX
  | RELATESTYPE
  | RELATESURI
  | RELATION
  | RELEASE
  | RELEASED
  | RELREQ
  | RELREQST
  | RELTYPE
  | REMOTENAME
  | REMOTEPREFIX
  | REMOTESYSNET
  | REMOTESYSTEM
  | REMOTETABLE
  | REMOVE
  | RENAME
  | REPEATABLE
  | REPETABLE
  | REPLACE
  | REPLICATION
  | REPLICATOR
  | REPLY
  | REPLYLENGTH
  | REQID
  | REQTYPE
  | REQUEST
  | REQUESTMODEL
  | REQUESTSTRM
  | REQUESTTYPE
  | REQUIRED
  | RES
  | RESCLASS
  | RESCOUNT
  | RESET
  | RESETBR
  | RESETLOCKS
  | RESETNOW
  | RESETTIME
  | RESID
  | RESIDENCY
  | RESIDERR
  | RESIDLEN
  | RESIDLENGTH
  | RESLEN
  | RESLIFEMGR
  | RESNAME
  | RESOURCE
  | RESOURCENAME
  | RESOURCETYPE
  | RESP
  | RESP2
  | RESPWAIT
  | RESRCE
  | RESRCECLASS
  | RESSEC
  | RESTART
  | RESTYPE
  | RESULT
  | RESUME
  | RESUNAVAIL
  | RESYNC
  | RESYNCMEMBER
  | RESYNCNUMBER
  | RESYNCSTATUS
  | RETAIN
  | RETCODE
  | RETCORD
  | RETLOCKS
  | RETPAGE
  | RETRIECE
  | RETRIEVE
  | RETRY
  | RETURN
  | RETURNPROG
  | REUSELIMIT
  | REWIND
  | REWRITE
  | RI
  | RIDFLD
  | RL
  | RLS
  | RLSACCESS
  | RLSSTATUS
  | RM
  | RMI
  | RMIADAPTERS
  | RMIQFY
  | RMIST
  | ROLE
  | ROLELENGTH
  | ROLLBACK
  | ROLLEDBACK
  | ROUTE
  | ROUTECODES
  | ROUTESTATUS
  | ROUTING
  | RPROCESS
  | RREPL
  | RRESOURCE
  | RRMS
  | RRN
  | RRS
  | RS
  | RTEFAIL
  | RTERMID
  | RTESOME
  | RTIMEOUT
  | RTRANSID
  | RULEGROUP
  | RULEITEM
  | RULETYPE
  | RUN
  | RUNAWAY
  | RUNAWAYTYPE
  | RUNNING
  | RUNSTATUS
  | RUNTIME
  | RX
  | RZ
  | SADDRLENGTH
  | SC
  | SCAN
  | SCANDELAY
  | SCHEDULER
  | SCHEMALEVEL
  | SCHEME
  | SCHEMENAME
  | SCOPE
  | SCOPELEN
  | SCRNHT
  | SCRNSIZE
  | SCRNWD
  | SDSASIZE
  | SDTMEMLIMIT
  | SDTRAN
  | SEARCHPOS
  | SECDCOUNT
  | SECDISCOVERY
  | SECONDS
  | SECPORT
  | SECRECORDING
  | SECURITY
  | SECURITYMGR
  | SECURITYNAME
  | SECURITYST
  | SEGIDERR
  | SEGMENTLIST
  | SELNERR
  | SEND
  | SENDCOUNT
  | SENDER
  | SENDMTOMST
  | SERIALNUM
  | SERIALNUMLEN
  | SERVER
  | SERVERADDR
  | SERVERADDRNU
  | SERVERCONV
  | SERVERDUMP
  | SERVERIPADDR
  | SERVERNAME
  | SERVERPORT
  | SERVICE
  | SERVSTATUS
  | SESSBUSY
  | SESSION
  | SESSIONERR
  | SESSIONS
  | SESSIONTYPE
  | SESSTOKEN
  | SET
  | SETTRANSID
  | SH
  | SHARE
  | SHARED
  | SHARELOCKS
  | SHARESTATUS
  | SHELF
  | SHUTDISABLED
  | SHUTDOWN
  | SHUTDOWNST
  | SHUTENABLED
  | SHUTOPTION
  | SHUTSTATUS
  | SIGDATA
  | SIGN
  | SIGNAL
  | SIGNID
  | SIGNOFF
  | SIGNON
  | SIGNONSTATUS
  | SINGLEOFF
  | SINGLEON
  | SINGLESTATUS
  | SIT
  | SJ
  | SJVM
  | SM
  | SNAMELENGTH
  | SNAPTRACE
  | SO
  | SOAPFAULT
  | SOAPLEVEL
  | SOAPRNUM
  | SOAPVNUM
  | SOCKETCLOSE
  | SOCKETS
  | SOCKPOOLSIZE
  | SOSABOVEBAR
  | SOSABOVELINE
  | SOSBELOWLINE
  | SOSI
  | SOSIST
  | SOSSTATUS
  | SPACE
  | SPACES
  | SPECIAL
  | SPECIFTCPS
  | SPECTRACE
  | SPI
  | SPIST
  | SPOLBUSY
  | SPOLERR
  | SPOOLCLOSE
  | SPOOLOPEN
  | SPOOLREAD
  | SPOOLWRITE
  | SPRSTRACE
  | SQLCODE
  | SRRACTIVE
  | SRRINACTIVE
  | SRRSTATUS
  | SRRTASKS
  | SRVCNAME
  | SRVCONVERT
  | SRVCSTATUS
  | SRVRADDR6NU
  | SRVRIPFAMILY
  | SSL
  | SSLCACHE
  | SSLTYPE
  | ST
  | STACKTRACE
  | STANDARD
  | STANDBYMODE
  | STANTRACE
  | START
  | STARTBR
  | STARTBRGROUP
  | STARTBRLIST
  | STARTBROWSE
  | STARTBRRSRCE
  | STARTCODE
  | STARTED
  | STARTSCRIPT
  | STARTSTATUS
  | STARTTIME
  | STARTUP
  | STARTUPDATE
  | STATE
  | STATELEN
  | STATIONID
  | STATISTICS
  | STATS
  | STATSQUEUE
  | STATUS
  | STATUSCODE
  | STATUSLEN
  | STATUSTEXT
  | STDERR
  | STDOUT
  | STOP
  | STOPPED
  | STORAGE
  | STORAGE64
  | STORAGECLEAR
  | STOREPROTECT
  | STREAMNAME
  | STRELERR
  | STRFIELD
  | STRINGFORMAT
  | STRINGS
  | STRINGZONE
  | STRUCTNAME
  | SUBADDR
  | SUBCODELEN
  | SUBCODESTR
  | SUBEVENT
  | SUBEVENT1
  | SUBEVENT2
  | SUBEVENT3
  | SUBEVENT4
  | SUBEVENT5
  | SUBEVENT6
  | SUBEVENT7
  | SUBEVENT8
  | SUBPOOL
  | SUBRESID
  | SUBRESIDLEN
  | SUBRESTYPE
  | SUBTASKS
  | SUM
  | SUPPRESSED
  | SUSPEND
  | SUSPENDED
  | SUSPENDTIME
  | SUSPENDTYPE
  | SUSPENDVALUE
  | SUSPSTATUS
  | SWITCH
  | SWITCHACTION
  | SWITCHALL
  | SWITCHNEXT
  | SWITCHSTATUS
  | SYMBOL
  | SYMBOLERR
  | SYMBOLLIST
  | SYNCHRONOUS
  | SYNCLEVEL
  | SYNCONRETURN
  | SYNCPOINT
  | SYNCPOINTST
  | SYSBUSY
  | SYSDUMP
  | SYSDUMPCODE
  | SYSDUMPING
  | SYSID
  | SYSIDERR
  | SYSOUTCLASS
  | SYSTEM
  | SYSTEMLOG
  | SYSTEMOFF
  | SYSTEMON
  | SYSTEMSTATUS
  | SZ
  | TABLE
  | TABLEMGR
  | TABLENAME
  | TABLEONLY
  | TABLES
  | TABLESIZE
  | TAEXECUTABLE
  | TAG
  | TAGS
  | TAKEOVER
  | TALENGTH
  | TARGET
  | TARGETCOUNT
  | TASK
  | TASKDATAKEY
  | TASKDATALOC
  | TASKID
  | TASKIDERR
  | TASKPRIORITY
  | TASKS
  | TASKSTART
  | TASKSTARTST
  | TASKSUBPOOL
  | TC
  | TCAMCONTROL
  | TCB
  | TCBLIMIT
  | TCBS
  | TCEXITALL
  | TCEXITALLOFF
  | TCEXITNONE
  | TCEXITSTATUS
  | TCEXITSYSTEM
  | TCIDERR
  | TCLASS
  | TCPIP
  | TCPIPJOB
  | TCPIPSERVICE
  | TCPIPZONE
  | TCT
  | TCTUA
  | TCTUALENG
  | TD
  | TDQUEUE
  | TELLERID
  | TEMPLATE
  | TEMPLATENAME
  | TEMPLATERR
  | TEMPLATETYPE
  | TEMPORARY
  | TEMPSTORAGE
  | TERM
  | TERMCODE
  | TERMERR
  | TERMID
  | TERMIDERR
  | TERMINAL
  | TERMMODEL
  | TERMPRIORITY
  | TERMSTATUS
  | TEST
  | TEXT
  | TEXTKYBD
  | TEXTKYBDST
  | TEXTLENGTH
  | TEXTPRINT
  | TEXTPRINTST
  | THREADCOUNT
  | THREADERROR
  | THREADLIMIT
  | THREADS
  | THREADSAFE
  | THREADWAIT
  | THRESHOLD
  | TI
  | TIME
  | TIMEDOUT
  | TIMEOUT
  | TIMEOUTINT
  | TIMER
  | TIMERERR
  | TIMESEP
  | TITLE
  | TITLELENGTH
  | TNADDR
  | TNIPFAMILY
  | TNPORT
  | TO
  | TOACTIVITY
  | TOCHANNEL
  | TOCONTAINER
  | TOFLENGTH
  | TOKEN
  | TOKENERR
  | TOKENLEN
  | TOKENTYPE
  | TOLENGTH
  | TOPROCESS
  | TPNAME
  | TPNAMELEN
  | TPOOL
  | TR
  | TRACE
  | TRACEDEST
  | TRACEFLAG
  | TRACENUM
  | TRACETYPE
  | TRACING
  | TRAILER
  | TRAN
  | TRANCLASS
  | TRANDUMP
  | TRANDUMPCODE
  | TRANDUMPING
  | TRANIDONLY
  | TRANISOLATE
  | TRANMGR
  | TRANPRIORITY
  | TRANSACTION
  | TRANSCLASS
  | TRANSFORM
  | TRANSFORMER
  | TRANSID
  | TRANSIDERR
  | TRANSMODE
  | TRIGGER
  | TRIGGERLEVEL
  | TRIGMONTASKS
  | TRNGRPID
  | TRPROF
  | TRT
  | TRUE
  | TS
  | TSIOERR
  | TSMAININUSE
  | TSMAINLIMIT
  | TSMODEL
  | TSPOOL
  | TSQNAME
  | TSQUEUE
  | TSQUEUELIMIT
  | TST
  | TTI
  | TTISTATUS
  | TWA
  | TWAIT
  | TWALENG
  | TWASIZE
  | TX
  | TXID
  | TYPE
  | TYPENAME
  | TYPENAMELEN
  | TYPENS
  | TYPENSLEN
  | TYPETERM
  | UCTRAN
  | UCTRANST
  | UDSASIZE
  | UE
  | UNATTEND
  | UNAVAILABLE
  | UNCOMMITTED
  | UNESCAPED
  | UNEXPIN
  | UNLOCK
  | UNQUIESCED
  | UNTIL
  | UOW
  | UOWACTION
  | UOWDSNFAIL
  | UOWENQ
  | UOWLINK
  | UOWLNOTFOUND
  | UOWNOTFOUND
  | UOWSTATE
  | UPDATABLE
  | UPDATE
  | UPDATEMODEL
  | URI
  | URID
  | URIMAP
  | URIMAPLIMIT
  | URL
  | URLLENGTH
  | URM
  | US
  | USAGE
  | USECOUNT
  | USER
  | USERAREA
  | USERAREALEN
  | USERAUTH
  | USERCORRDATA
  | USERDATA
  | USERDATAKEY
  | USERDATALEN
  | USERDEFINE
  | USERID
  | USERIDERR
  | USERNAME
  | USERNAMELEN
  | USEROFF
  | USERON
  | USERPRIORITY
  | USERSTATUS
  | USERTABLE
  | USERTAG
  | USING
  | VALIDATION
  | VALIDATIONST
  | VALIDITY
  | VALUE
  | VALUELENGTH
  | VARIABLENAME
  | VERIFY
  | VERSION
  | VERSIONLEN
  | VFORMST
  | VOLIDERR
  | VOLUME
  | VOLUMELENG
  | VTAM
  | W2
  | WAIT
  | WAITCAUSE
  | WAITCICS
  | WAITSTATE
  | WB
  | WEB
  | WEB2
  | WEBRESTMGR
  | WEBSERVICE
  | WEBSERVLIMIT
  | WHEN_COMPILED
  | WLMHEALTH
  | WLMOPENST
  | WORKDIR
  | WPMEDIA1
  | WPMEDIA2
  | WPMEDIA3
  | WPMEDIA4
  | WRAP
  | WRBRK
  | WRITE
  | WRITEQ
  | WSACONTEXT
  | WSAEPR
  | WSBIND
  | WSDIR
  | WSDLFILE
  | WU
  | XCFGROUP
  | XCTL
  | XID
  | XLNSTATUS
  | XLT
  | XM
  | XMLCONTAINER
  | XMLSCHEMA
  | XMLTODATA
  | XMLTRANSFORM
  | XOPDIRECTST
  | XOPSUPPORTST
  | XRBA
  | XRFSTATUS
  | XS
  | XSDBIND
  | YEAR
  | YES
  | YYDDD
  | YYDDMM
  | YYMMDD
  | YYYYDDD
  | YYYYDDMM
  | YYYYMMDD
  | ZCPTRACE
  | ZCPTRACING
  | ZERO
  | ZEROES
  | ZEROS
;

name: variableNameUsage+;
data_value: variableNameUsage+;
data_area: variableNameUsage+;
cvda: variableNameUsage+;
ptr_ref: variableNameUsage+;
ptr_value: variableNameUsage+;
cics_document_set_symbollist: variableNameUsage+;
hhmmss: variableNameUsage+;

paragraphNameUsage
   : cicsWord | integerLiteral
   ;

variableNameUsage
   : generalIdentifier | NONNUMERICLITERAL | NUMERICLITERAL | integerLiteral
   ;
// identifier ----------------------------------

generalIdentifier
   : specialRegister | qualifiedDataName | functionCall
   ;

functionCall
   : FUNCTION functionName (LPARENCHAR argument (commaClause? argument)* RPARENCHAR)* referenceModifier?
   ;

referenceModifier
   : LPARENCHAR characterPosition COLONCHAR length? RPARENCHAR
   ;

characterPosition
   : arithmeticExpression
   ;

length
   : arithmeticExpression
   ;

argument
   : arithmeticExpression
   ;

// qualified data name ----------------------------------

qualifiedDataName
   : dataName tableCall? referenceModifier? inData*
   ;

tableCall
   : LPARENCHAR (ALL | arithmeticExpression) (commaClause? (ALL | arithmeticExpression))* RPARENCHAR
   ;

specialRegister
   : ADDRESS OF generalIdentifier
   | LENGTH OF? generalIdentifier | LINAGE_COUNTER
   ;

// in ----------------------------------

inData
   : (IN | OF) dataName tableCall? referenceModifier?
   ;

dataName
   : cicsWord | cicsLexerDefinedVariableUsageTokens
   ;

functionName
   : INTEGER | LENGTH | RANDOM | SUM | WHEN_COMPILED | cicsWord
   ;

figurativeConstant
   : ALL literal | HIGH_VALUE | HIGH_VALUES | LOW_VALUE | LOW_VALUES | NULL | NULLS | QUOTE | QUOTES | SPACE | SPACES | ZEROS | ZEROES
   ;

booleanLiteral
   : TRUE | FALSE
   ;

numericLiteral
   : NUMERICLITERAL | ZERO | integerLiteral
   ;

integerLiteral
   : INTEGERLITERAL
   ;

cicsDfhValue
   :  DFHVALUE LPARENCHAR cvda_opts RPARENCHAR
   ;
cicsDfhResp
   :  DFHRESP LPARENCHAR cics_conditions RPARENCHAR
   ;
literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral
   ;

// arithmetic expression ----------------------------------

arithmeticExpression
   : multDivs plusMinus*
   ;

plusMinus
   : (PLUSCHAR | MINUSCHAR) multDivs
   ;

multDivs
   : powers multDiv*
   ;

multDiv
   : (ASTERISKCHAR | SLASHCHAR) powers
   ;

powers
   : (PLUSCHAR | MINUSCHAR)? basis power*
   ;

power
   : DOUBLEASTERISKCHAR basis
   ;

basis
   : LPARENCHAR arithmeticExpression RPARENCHAR | literal | generalIdentifier
   ;

commaClause : COMMACHAR;

cvda_opts
  : ABEND
  | ACQFAIL
  | ACQUIRED
  | ACQUIRING
  | ACTIVE
  | ACTIVITY
  | ADD
  | ADDABLE
  | ADDFAIL
  | ADDRESS
  | ADVANCE
  | AINIT
  | ALARM
  | ALL
  | ALLCONN
  | ALLOCATD
  | ALLQUERY
  | ALLVALUES
  | ALTERABLE
  | ALTERNATE
  | ALTPRTCOPY
  | ANALYZER
  | AND
  | ANY
  | APLKYBD
  | APLTEXT
  | APPC
  | APPCPARALLEL
  | APPCSINGLE
  | APPEND
  | APPLICATION
  | APPLID
  | APPLNAME
  | ASACTL
  | ASCII7
  | ASCII8
  | ASRUNTRAN
  | ASSEMBLER
  | ASSERTED
  | ASYNCHRONOUS
  | ASYNCSERVICE
  | ATI
  | ATOM
  | ATOMSERVICE
  | ATTACH
  | ATTENTION
  | ATTLSAWARE
  | AUDALARM
  | AUTOACTIVE
  | AUTOARCH
  | AUTOAUTH
  | AUTOCONN
  | AUTOINACTIVE
  | AUTOINIT
  | AUTOINSTALL
  | AUTOPAGE
  | AUTOREGISTER
  | AUTOSTART
  | AUTOTERMID
  | AUXILIARY
  | AUXPAUSE
  | AUXSTART
  | AUXSTOP
  | AVAILABLE
  | AWARE
  | BACKOUT
  | BACKTRANS
  | BACKUPNONBWO
  | BASE
  | BASEAPI
  | BASESPACE
  | BASE64
  | BASICAUTH
  | BATCHLU
  | BDAM
  | BEGINSESSION
  | BELOW
  | BGAM
  | BINARY
  | BINIT
  | BIPROG
  | BISYNCH
  | BIT
  | BLK
  | BLOCKED
  | BOTH
  | BRIDGE
  | BROWSABLE
  | BSAM
  | BTAM
  | BUNDLE
  | BUSY
  | C_CHAR
  | CACHE
  | CANCEL
  | CANCELLED
  | CANCELLING
  | CAPTURESPEC
  | CATEGORY
  | CBE
  | CBER
  | CCE
  | CD
  | CDRDLPRT
  | CEDF
  | CERTIFICAUTH
  | CERTUSER
  | CFTABLE
  | CFE
  | CGROUP
  | CHANNEL
  | CHAR
  | CHECK
  | CHUNKEND
  | CHUNKNO
  | CHUNKYES
  | CICS
  | CICSAPI
  | CICSDATAKEY
  | CICSECURITY
  | CICSEXECKEY
  | CICSTABLE
  | CKOPEN
  | CLASSCACHE
  | CLEAR
  | CLICONVERT
  | CLIENT
  | CLIENTAUTH
  | CLIENTCERT
  | CLOSE
  | CLOSED
  | CLOSEFAILED
  | CLOSELEAVE
  | CLOSEREQ
  | CLOSING
  | CLOUD
  | CMDPROT
  | CMDSECEXT
  | CMDSECNO
  | CMDSECYES
  | COBOL
  | COBOLII
  | COLD
  | COLDACQ
  | COLDQUERY
  | COLDSTART
  | COLLECTION
  | COLOR
  | COMMAREA
  | COMMIT
  | COMMITFAIL
  | COMPAT
  | COMPLETE
  | COMPOSITE
  | COMPRESS
  | CONFFREE
  | CONFIG
  | CONFRECV
  | CONFSEND
  | CONNECT
  | CONNECTED
  | CONNECTING
  | CONNECTION
  | CONSISTENT
  | CONSOLE
  | CONTAINER
  | CONTENTION
  | CONTEXT
  | CONTNLU
  | CONTROLSHUT
  | CONVERSE
  | CONVIDLE
  | COORDINATOR
  | COPID
  | COPY
  | CORBA
  | CORBASERVER
  | CPLUSPLUS
  | CREATE
  | CREATESPI
  | CRITICAL
  | CSDAPI
  | CSDBATCH
  | CSIGN
  | CTERM
  | CTLGALL
  | CTLGMODIFY
  | CTLGNONE
  | CTRLABLE
  | CTX
  | CURRENT
  | CURRENTPGM
  | CUSERID
  | CUSTOM
  | DAEOPT
  | DATA
  | DATASET
  | DATASETFULL
  | DATASTREAM
  | DBCONN
  | DBENTRY
  | DBTRAN
  | DEADLOCK
  | DEBUG
  | DEC
  | DEFAULT
  | DEFAULTUSER
  | DEFINITION
  | DEFRESP1
  | DEFRESP1OR2
  | DEFRESP2
  | DEFRESP3
  | DELAY
  | DELETABLE
  | DELETE
  | DELETEFAIL
  | DELEXITERROR
  | DEREGERROR
  | DEREGISTERED
  | DEST
  | DIAGNOSTICS
  | DISABLED
  | DISABLEDHOST
  | DISABLING
  | DISCARD
  | DISCARDFAIL
  | DISCARDING
  | DISCONNECT
  | DISCONNING
  | DISCOVER
  | DISCREQ
  | DISK1
  | DISK2
  | DISKPAUSE
  | DISPATCHABLE
  | DISPATCHER
  | DJAR
  | DOCDELETE
  | DOCTEMPLATE
  | DOESNOTEQUAL
  | DOESNOTEXIST
  | DOESNOTSTART
  | DORMANT
  | DPLSUBSET
  | DRAINING
  | DREPAPI
  | DREPBATCH
  | DS3270
  | DSIE
  | DUALCASE
  | DUMMY
  | DUMP
  | DUMPCODE
  | DUPERROR
  | DUPNOREPLACE
  | DUPREPLACE
  | DYNAMIC
  | EB
  | EBCDIC
  | ECI
  | EJB
  | EMERGENCY
  | EMPTY
  | EMPTYREQ
  | ENABLED
  | ENABLING
  | ENDAFFINITY
  | ENQMODEL
  | ENQUEUE
  | ENTRYPOINT
  | EPADAPTER
  | EPADAPTERSET
  | EQUAL
  | EQUALS
  | ESDS
  | EVENT
  | EVENTBINDING
  | EVENTPROCESS
  | EVENTUAL
  | EXCEPT
  | EXCEPTRESP
  | EXCI
  | EXCTL
  | EXECENQ
  | EXECENQADDR
  | EXECINSTALL
  | EXISTS
  | EXIT
  | EXITTRACE
  | EXPECT
  | EXPIRED
  | EXPORT
  | EXTENDED
  | EXTENDEDDS
  | EXTRA
  | EXTSECURITY
  | FAILED
  | FAILEDBKOUT
  | FAILINGBKOUT
  | FAULTTOEPR
  | FCLOSE
  | FEED
  | FILE
  | FINALQ
  | FINPUT
  | FIRED
  | FIRSTINIT
  | FIRSTQ
  | FIXED
  | FLUSH
  | FMH
  | FMHPARM
  | FOPEN
  | FORCE
  | FORCECANCEL
  | FORCECLOSE
  | FORCED
  | FORCEPURGE
  | FORCLOSING
  | FORMATEDF
  | FORMATTED
  | FORMFEED
  | FOUTPUT
  | FREE
  | FREEING
  | FROMEPR
  | FULL
  | FULLAPI
  | FULLAUTO
  | FWDRECOVABLE
  | GATHER
  | GENERIC
  | GET
  | GMT
  | GOHIGHERTHAN
  | GOINGOUT
  | GOLOWERTHAN
  | GREATERTHAN
  | GROUP
  | GROUPRESYNC
  | GRPLIST
  | GTFSTART
  | GTFSTOP
  | HARDCOPY
  | HEAD
  | HEAP
  | HEURBACKOUT
  | HEURCOMMIT
  | HEX
  | HFORM
  | HFSFILE
  | HIGH
  | HILIGHT
  | HOLD
  | HOME
  | HOSTNAME
  | HTTP
  | HTTPNO
  | HTTPS
  | HTTPYES
  | IDENTIFY
  | IDNTY
  | IGNORE
  | IGNORERR
  | IIOP
  | IMMCLOSE
  | IMMCLOSING
  | IMMEDIATE
  | IMMQUIESCED
  | IMPORT
  | INACTIVE
  | INBOUND
  | INCOMPLETE
  | INDEXRECFULL
  | INDIRECT
  | INDOUBT
  | INFLIGHT
  | INITCOMPLETE
  | INITIAL
  | INITING
  | INOUT
  | INPUT
  | INSERVICE
  | INSTALLED
  | INSTALLFAIL
  | INTERNAL
  | INTACTLU
  | INTRA
  | INTSTART
  | INTSTOP
  | INVALID
  | IOERROR
  | IPCONN
  | IPECI
  | IPIC
  | IPV4
  | IPV6
  | IRC
  | ISCMMCONV
  | ISNOTGREATER
  | ISNOTLESS
  | ISOLATE
  | JAVA
  | JAVACORE
  | JMS
  | JOURNALMODEL
  | JOURNALNAME
  | JOURNALNUM
  | JVM
  | JVMPOOL
  | JVMPROFILE
  | JVMPROGRAM
  | JVMSERVER
  | JWT
  | KATAKANA
  | KEEP
  | KERBEROS
  | KEYED
  | KILL
  | KSDS
  | LCKSTRUCFULL
  | LEAVE
  | LESSTHAN
  | LE370
  | LIBERTY
  | LIBRARY
  | LIC
  | LIGHTPEN
  | LINK
  | LOAD
  | LOC24
  | LOC31
  | LOCAL
  | LOCKING
  | LOG
  | LOGICAL
  | LOGREPLICATE
  | LOGTERM
  | LOSE
  | LOW
  | LPA
  | LSRPOOL
  | LUCMODGRP
  | LUCSESS
  | LUP
  | LUSTAT
  | LUTYPE4
  | LUTYPE6
  | LUW
  | LU61
  | MAGTAPE
  | MAIN
  | MAP
  | MAPSET
  | MCHCTL
  | MDT
  | METADATA
  | MESSAGE
  | MESSAGEID
  | MIXED
  | MNPS
  | MOD
  | MODEANY
  | MODEL
  | MODE24
  | MODE31
  | MODIFY
  | MONITOR
  | MORE_RESERVED
  | MQCONN
  | MRO
  | MSRCONTROL
  | MTOM
  | MTOMNOXOP
  | MVS
  | MVSTCB
  | NEGATIVE
  | NEW
  | NEWCOPY
  | NEWSESSION
  | NOALARM
  | NOALTPRTCOPY
  | NOANALYZER
  | NOAPLKYBD
  | NOAPLTEXT
  | NOAPPEND
  | NOAPPLNAME
  | NOATI
  | NOAUDALARM
  | NOAUTHENTIC
  | NOAUTO
  | NOAUTOARCH
  | NOAUTOSTART
  | NOBACKOUT
  | NOBACKTRANS
  | NOCEDF
  | NOCHECK
  | NOCLASSCACHE
  | NOCLEAR
  | NOCLICONVERT
  | NOCLOSE
  | NOCMDPROT
  | NOCOLOR
  | NOCOMPAT
  | NOCOMPRESS
  | NOCONNECT
  | NOCONV
  | NOCONVERSE
  | NOCONVERT
  | NOCOPY
  | NOCREATE
  | NOCTL
  | NODAEOPT
  | NODE
  | NODEBUG
  | NODEJSAPP
  | NODISCOVER
  | NODISCREQ
  | NODOCDELETE
  | NODUALCASE
  | NOEMIT
  | NOEMPTYREQ
  | NOEVENT
  | NOEXCEPT
  | NOEXCTL
  | NOEXIT
  | NOEXITTRACE
  | NOEXTENDEDDS
  | NOFMH
  | NOFMHPARM
  | NOFORCE
  | NOFORMATEDF
  | NOFORMFEED
  | NOHFORM
  | NOHILIGHT
  | NOHOLD
  | NOIDNTY
  | NOINCONVERT
  | NOISOLATE
  | NOJVM
  | NOKATAKANA
  | NOKEEP
  | NOLIGHTPEN
  | NOLOAD
  | NOLOG
  | NOLOGREPLICA
  | NOLOSTLOCKS
  | NOMDT
  | NOMSGJRNL
  | NOMSRCONTROL
  | NOMTOM
  | NOMTOMNOXOP
  | NONAUTOCONN
  | NONCICS
  | NONCRITICAL
  | NONE
  | NONLE370
  | NONRESIDENT
  | NONTRANS
  | NOOBFORMAT
  | NOOBOPERID
  | NOOTELTRACE
  | NOOUTCONVERT
  | NOOUTLINE
  | NOPARTITIONS
  | NOPERF
  | NOPHASEOUT
  | NOPRESETSEC
  | NOPRINTADAPT
  | NOPROGSYMBOL
  | NOPROP
  | NOPRTCOPY
  | NOPS
  | NOQUERY
  | NORECOVDATA
  | NOREENTPROT
  | NORELEASE
  | NORELREQ
  | NOREPLICATOR
  | NORESRCE
  | NORESYNC
  | NORETAINED
  | NOREUSE
  | NORMAL
  | NORMALBKOUT
  | NORMALRESP
  | NORMI
  | NOROLLBACK
  | NOSECURITY
  | NOSENDMTOM
  | NOSHUTDOWN
  | NOSOSI
  | NOSPI
  | NOSRVCONVERT
  | NOSSL
  | NOSTSN
  | NOSWITCH
  | NOSYNCPOINT
  | NOSYSDUMP
  | NOSYSLOG
  | NOTADDABLE
  | NOTALLOWED
  | NOTALTERABLE
  | NOTAPPLIC
  | NOTASKSTART
  | NOTAWARE
  | NOTBRWBLE
  | NOTBUSY
  | NOTCDEB
  | NOTCONNECTED
  | NOTCTRLABLE
  | NOTDEFINED
  | NOTDELBLE
  | NOTDYNAMIC
  | NOTEMPTY
  | NOTEXTENDED
  | NOTERMINAL
  | NOTEXTKYBD
  | NOTEXTPRINT
  | NOTFIRED
  | NOTFWDRCVBLE
  | NOTHOTPOOL
  | NOTINBOUND
  | NOTINIT
  | NOTINSTALLED
  | NOTKEYED
  | NOTLPA
  | NOTPENDING
  | NOTPURGEABLE
  | NOTRANDUMP
  | NOTREADABLE
  | NOTREADY
  | NOTRECOVABLE
  | NOTREQUIRED
  | NOTRLS
  | NOTROUTABLE
  | NOTSHARED
  | NOTSOS
  | NOTSUPPORTED
  | NOTSUSPENDED
  | NOTTABLE
  | NOTTI
  | NOTUPDBLE
  | NOTUSED
  | NOTWAIT
  | NOUCTRAN
  | NOUSER
  | NOVALIDATION
  | NOVFORM
  | NOWAIT
  | NOWRITE
  | NOXOPDIRECT
  | NOXOPSUPPORT
  | NOZCPTRACE
  | NRS
  | N906
  | N906D
  | OBFORMAT
  | OBOPERID
  | OBTAINING
  | OFF
  | OK
  | OLD
  | OLDCOPY
  | OLDSESSION
  | ON
  | OPEN
  | OPENAPI
  | OPENERROR
  | OPENING
  | OPENINPUT
  | OPENOUTPUT
  | OPID
  | OPTIONAL
  | OPTIONS
  | OR
  | OSGI
  | OTELTRACE
  | OTS
  | OUTLINE
  | OUTPUT
  | OUTSERVICE
  | OVERRIDE
  | OWNER
  | PAGEABLE
  | PARTITIONS
  | PARTITIONSET
  | PARTNER
  | PATCH
  | PATH
  | PAUSED
  | PDSMEMBER
  | PENDBEGIN
  | PENDDATA
  | PENDFREE
  | PENDING
  | PENDINIT
  | PENDPASS
  | PENDRECEIVE
  | PENDRELEASE
  | PENDRESOLVE
  | PENDSTART
  | PENDSTSN
  | PENDUNSOL
  | PERF
  | PERMANENT
  | PHASEIN
  | PHASEOUT
  | PHYSICAL
  | PIPELINE
  | PLI
  | POLICY
  | POLICYRULE
  | POLICYSCOPE
  | POOL
  | POSITIVE
  | POST
  | POSTCOMMAND
  | PRECOMMAND
  | PRESETSEC
  | PRIMARY
  | PRINCIPAL
  | PRINTADAPT
  | PRIVATE
  | PROCESS
  | PROCESSTYPE
  | PROFILE
  | PROGAUTO
  | PROGRAM
  | PROGRAMDEF
  | PROGRAMINIT
  | PROGSYMBOL
  | PROPONLY
  | PROTECTED
  | PROVIDER
  | PRTCOPY
  | PUBLISH
  | PURGE
  | PURGEABLE
  | PUT
  | QR
  | QUASIRENT
  | QUEUE
  | QUIESCED
  | QUIESCING
  | READABLE
  | READBACK
  | READONLY
  | READY
  | REBUILD
  | RECEIVE
  | RECEIVER
  | RECONNECT
  | RECOVDATA
  | RECOVERABLE
  | RECOVERED
  | RECOVERLOCKS
  | RECOVERY
  | REENTPROT
  | REFPARMS
  | REFRESH
  | REFRESHPKGS
  | REGERROR
  | REGION
  | REGISTERED
  | REJECT
  | RELATED
  | RELEASE
  | RELEASED
  | RELEASING
  | RELOAD
  | RELOADING
  | RELREQ
  | REMLOSTLOCKS
  | REMOTE
  | REMOVE
  | REMSESSION
  | REMTABLE
  | REPEATABLE
  | REPLICATOR
  | REPLYTOEPR
  | REQCONTEXT
  | REQUEST
  | REQUESTER
  | REQUESTMODEL
  | REQUIRED
  | REREAD
  | RESET
  | RESETLOCKS
  | RESIDENT
  | RESOLVED
  | RESOLVING
  | RESPCONTEXT
  | RESPECTED
  | RESRCE
  | RESSECEXT
  | RESSECINT
  | RESSECNO
  | RESSECYES
  | RESSYS
  | RESUMED
  | RESYNC
  | RETAINED
  | RETRACT
  | RETRY
  | REUSE
  | REVERTED
  | RFC1123
  | RFC3339
  | RLS
  | RLSACTIVE
  | RLSGONE
  | RLSINACTIVE
  | RLSSERVER
  | RMI
  | ROLLBACK
  | ROUTABLE
  | ROUTE
  | RPG
  | RRCOMMITFAIL
  | RRDS
  | RREPL
  | RRINDOUBT
  | RRMS
  | RRSUR
  | RTR
  | RU
  | RUNNING
  | RZINSTOR
  | SAMESENDMTOM
  | SCAN
  | SCHEDULER
  | SCS
  | SDLC
  | SECERROR
  | SECONDINIT
  | SECURITY
  | SECUSER
  | SEND
  | SENDER
  | SENDMTOM
  | SERVER
  | SERVERDUMP
  | SERVICE
  | SESSION
  | SESSIONFAIL
  | SESSIONLOST
  | SESSIONS
  | SETFAIL
  | SEQDISK
  | SHARE
  | SHARED
  | SHUNTED
  | SHUTDISABLED
  | SHUTDOWN
  | SHUTENABLED
  | SIGN
  | SIGNEDOFF
  | SIGNEDON
  | SINGLEOFF
  | SINGLEON
  | SKIP_RESERVED
  | SMF
  | SNAPTRACE
  | SNPS
  | SOAP
  | SOCKET
  | SOMEAVAIL
  | SOS
  | SOSABOVE
  | SOSBELOW
  | SOSI
  | SPECIAL
  | SPECIFIC
  | SPECTRACE
  | SPI
  | SPRSTRACE
  | SQLCODE
  | SRRACTIVE
  | SRRINACTIVE
  | SRVCONVERT
  | SSL
  | STACKTRACE
  | STANDARD
  | STANDBY
  | STANTRACE
  | START
  | STARTED
  | STARTING
  | STARTTERM
  | STARTING
  | STARTSWITH
  | STARTUP
  | STATIC
  | STATS
  | STOPPED
  | STOPPING
  | STORAGE
  | STREAMNAME
  | STSN
  | STSNSET
  | STSNTEST
  | SUBORDINATE
  | SUBPOOL
  | SUBSPACE
  | SUMMUNLIKE
  | SUPPORTED
  | SURROGATE
  | SUSPENDED
  | SWITCH
  | SWITCHALL
  | SWITCHING
  | SWITCHNEXT
  | SYNCFREE
  | SYNCHRONOUS
  | SYNCPOINT
  | SYNCRECV
  | SYNCSEND
  | SYSCONNECT
  | SYSDUMP
  | SYSDUMPCODE
  | SYSLOG
  | SYSPLEX
  | SYSTEM
  | SYSTEM3
  | SYSTEM7
  | SYSTEMOFF
  | SYSTEMON
  | SYS370
  | SYS7BSCA
  | TABLE
  | TABLEMGR
  | TABLEONLY
  | TAKEOVER
  | TAPE1
  | TAPE2
  | TASK
  | TASKEND
  | TASKSUBPOOL
  | TASKSTART
  | TCAM
  | TCAMSNA
  | TCEXITALL
  | TCEXITALLOFF
  | TCEXITNONE
  | TCEXITSYSTEM
  | TCLASS
  | TCONSOLE
  | TCPIP
  | TCPIPSERVICE
  | TDQ
  | TDQUEUE
  | TELETYPE
  | TEMPLATENAME
  | TEMPORARY
  | TERM
  | TERMINAL
  | TERMINATE
  | TEXTKYBD
  | TEXTPRINT
  | THIRDINIT
  | THREADSAFE
  | TIME
  | TIMEOUT
  | TIMER
  | TOEPR
  | TPOOL
  | TPSM55M2
  | TPSM55M3
  | TPSM55M4
  | TPSM55M5
  | TRACE
  | TRAN
  | TRANCLASS
  | TRANDATA
  | TRANDUMP
  | TRANDUMPCODE
  | TRANIDONLY
  | TRANS
  | TRANSACTION
  | TRANSTART
  | TSMODEL
  | TSQ
  | TSQUEUE
  | TTCAM
  | TTI
  | TWAIT
  | TWX3335
  | TX
  | TXID
  | TYPETERM
  | TM3278M2
  | TM3278M3
  | TM3278M4
  | TM3278M5
  | TM3279M2
  | TM3279M3
  | TM3279M4
  | TM3279M5
  | T1050
  | T1053
  | T2260L
  | T2260R
  | T2265
  | T2740
  | T2741BCD
  | T2741COR
  | T2770
  | T2780
  | T2980
  | T3275R
  | T3277L
  | T3277R
  | T3284L
  | T3284R
  | T3286L
  | T3286R
  | T3600BI
  | T3601
  | T3614
  | T3650ATT
  | T3650PIPE
  | T3650USER
  | T3653HOST
  | T3735
  | T3740
  | T3780
  | T3790
  | T3790SCSP
  | T3790UP
  | T7770
  | UCTRAN
  | UKOPEN
  | UNATTEMPTED
  | UNAVAILABLE
  | UNBLOCKED
  | UNCOMMITTED
  | UNCONNECTED
  | UNDEFINED
  | UNDETERMINED
  | UNENABLED
  | UNENABLING
  | UNEXPECTED
  | UNEXPIRED
  | UNINSTALLED
  | UNKNOWN
  | UNPROTECTED
  | UNQUIESCED
  | UNREGISTERED
  | UNRESOLVED
  | UNSOLDATA
  | UNUSABLE
  | UOW
  | UPDATABLE
  | UPDATING
  | URIMAP
  | URMTERMID
  | USED
  | USER
  | USERDATAKEY
  | USEREXECKEY
  | USERID
  | USEROFF
  | USERON
  | USERTABLE
  | UTC
  | VALID
  | VALIDATION
  | VARIABLE
  | VERIFY
  | VFORM
  | VIDEOTERM
  | VRRDS
  | VSAM
  | VTAM
  | WAIT
  | WAITCOMMIT
  | WAITER
  | WAITFORGET
  | WAITING
  | WAITRMI
  | WAITRRMS
  | WARMSTART
  | WBE
  | WEB
  | WEBSERVICE
  | WIN
  | WLMHEALTH
  | WMQ
  | WRITE
  | XCF
  | XM
  | XMLTRANSFORM
  | XMRUNTRAN
  | XNOTDONE
  | XOK
  | XOPDIRECT
  | XOPSUPPORT
  | XPLINK
  | ZCPTRACE
  ;