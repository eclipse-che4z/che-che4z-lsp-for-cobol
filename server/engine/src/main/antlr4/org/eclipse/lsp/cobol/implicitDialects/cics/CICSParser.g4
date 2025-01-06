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

startRule: (cicsExecBlock | cicsDfhRespLiteral | cicsDfhValueLiteral | ~(EXEC_CICS|DFHRESP|DFHVALUE))* EOF;
compilerDirective: (.*? compilerOpts)* .*? EOF;
cicsExecBlock: EXEC_CICS (allCicsRule)* END_EXEC ;

allCicsRule: cics_send | cics_receive | cics_add | cics_address | cics_allocate | cics_asktime | cics_assign | cics_bif |
                       cics_build | cics_cancel | cics_change  | cics_check | cics_connect | cics_converttime |
                       cics_define | cics_delay | cics_delete | cics_deleteq | cics_deq | cics_document | cics_dump | cics_endbr |
                       cics_endbrowse | cics_enq | cics_enter | cics_extract | cics_force | cics_formattime | cics_free |
                       cics_freemain | cics_get | cics_getmain | cics_getmain64 | cics_getnext | cics_handle | cics_ignore | cics_inquire |
                       cics_invoke | cics_issue | cics_link | cics_load | cics_monitor | cics_move | cics_point | cics_pop |
                       cics_post | cics_purge | cics_push | cics_put | cics_query | cics_read | cics_readnext_readprev |
                       cics_readq | cics_release | cics_remove | cics_reset | cics_resetbr | cics_resume | cics_retrieve |
                       cics_return | cics_rewind | cics_rewrite | cics_route | cics_run | cics_signal | cics_signoff | cics_signon |
                       cics_soapfault | cics_spoolclose | cics_spoolopen | cics_spoolread | cics_spoolwrite | cics_start |
                       cics_startbr | cics_startbrowse | cics_suspend | cics_syncpoint | cics_test | cics_transform | cics_unlock |
                       cics_update | cics_verify | cics_wait | cics_waitcics | cics_web | cics_write | cics_writeq | cics_wsacontext |
                       cics_wsaepr | cics_xctl | cics_converse | cics_abend | cics_acquire | allExciRules | allSPRules
                      ;

// exci rules
allExciRules: cics_exci_link | cics_exci_delete | cics_exci_delete_container | cics_exci_endbrowse_container |
              cics_exci_get_container | cics_exci_get_next_container | cics_exci_move_container |
              cics_exci_put_container | cics_exci_query_channel | cics_exci_startbrowse_container ;

allSPRules: cics_discard | cics_inquire_system_programming;

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

//Helpers
cics_into_set:                  INTO cics_data_area | SET cics_ref;
cics_length_flength:            (LENGTH | FLENGTH) cics_data_area;

// CICS Group 1 (zOS DEFAULT, LUTYPE (2,3,4), 2260, 3270-logical, 3790 / 3270-display, 3600 pipeline, 3600-3601, 3600-3614, 3650, 3767, 3770, 3790 FF, 2980, Non z Default, APPC, LUTYPE 6.1, MRO)
cics_receive_group_one:         (INTO cics_data_area | SET cics_ref | cics_length_flength | cics_maxlength | (CONVID | SESSION) cics_name | STATE cics_cvda | ASIS | BUFFER | NOTRUNCATE | LEAVEKB | NOTRUNCATE | PASSBK | cics_handle_response)+;

cics_receive_partn:             (PARTN cics_data_area | cics_into_set | LENGTH cics_data_area | ASIS | cics_handle_response)+;

// RECEIVE MAPS
cics_receive_map: ((MAP | MAPSET | INPARTN) cics_name | cics_into_set | (FROM | LENGTH) cics_data_area | TERMINAL | ASIS | cics_handle_response)+;
cics_receive_map_mappingdev:    ((MAP | MAPSET) cics_name | (MAPPINGDEV | FROM | LENGTH) cics_data_area  | cics_into_set | cics_handle_response)+;


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
             NUMTAB cics_data_area | OPCLASS cics_data_area | OPERKEYS cics_data_area | OPID cics_data_area | OPSECURITY cics_data_area | ORGABCODE cics_data_area |
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
cics_cancel: CANCEL (cics_cancel_bts | cics_cancel_reqid);
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

cics_conditions: EOC | EODS | INVMPSZ | INVPARTN | INVREQ | MAPFAIL | PARTNFAIL | RDATT | UNEXPIN | ERROR | DUPREC;

/** CONNECT PROCESS */
cics_connect: CONNECT cics_connect_process;
cics_connect_process: (PROCESS | (CONVID | SESSION | PARTNER) cics_name | PROCNAME cics_data_area |
                      (PROCLENGTH | PIPLENGTH) cics_data_value | (SYNCLEVEL | PIPLIST) cics_data_area |
                       STATE cics_cvda | cics_handle_response)+;

/** CONVERTTIME */
cics_converttime: CONVERTTIME cics_converttime_opts;
cics_converttime_opts:(DATESTRING cics_data_area | ABSTIME cics_data_area | cics_handle_response)+;

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
cics_delete_group_two:  ((CHANNEL | EVENT | TIMER) cics_data_value | cics_handle_response)+;

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

/** DISCARD System Commands **/
cics_discard: DISCARD cics_discard_body;
cics_discard_body: cics_handle_response* (ATOMSERVICE | AUTINSTMODEL | BUNDLE | CONNECTION | DB2CONN | DB2ENTRY | DB2TRAN | DOCTEMPLATE |
                   ENQMODEL | FILE | IPCONN | JOURNALMODEL | JOURNALNAME | JVMSERVER | LIBRARY | MQCONN | MQMONITOR | PARTNER | PIPELINE |
                   PROCESSTYPE | PROFILE | PROGRAM | TCPIPSERVICE | TDQUEUE | TERMINAL | TRANCLASS | TRANSACTION | TSMODEL | URIMAP | WEBSERVICE) cics_data_value cics_handle_response*;

/** DOCUMENT CREATE / DELETE / INSERT / RETRIEVE / SET */
cics_document: DOCUMENT (cics_document_create | DELETE DOCTOKEN cics_data_area | cics_document_insert |
               cics_document_retrieve | cics_document_set);
cics_document_create: CREATE (DOCTOKEN cics_data_area | FROM cics_data_area | TEXT cics_data_area | BINARY cics_data_area |
                      LENGTH cics_data_area | FROMDOC cics_data_area | TEMPLATE cics_name | cics_document_create_symbollist |
                      DOCSIZE cics_data_area | HOSTCODEPAGE cics_name | cics_handle_response)+;
cics_document_create_symbollist: SYMBOLLIST cics_data_area (LISTLENGTH cics_data_value | DELIMITER cics_data_value |
                                 UNESCAPED | cics_handle_response)+;
cics_document_insert: INSERT (DOCTOKEN cics_data_area | FROM cics_data_area | TEXT cics_data_area | BINARY cics_data_area |
                      LENGTH cics_data_value | SYMBOL cics_name | TEMPLATE cics_name | FROMDOC cics_data_area |
                      BOOKMARK cics_name | DOCSIZE cics_data_value | HOSTCODEPAGE cics_name | AT cics_name | TO cics_name | cics_handle_response)+;
cics_document_retrieve: RETRIEVE (DOCTOKEN cics_data_area | INTO cics_data_area | LENGTH cics_data_value |
                        MAXLENGTH cics_data_value | CHARACTERSET cics_name | DATAONLY | cics_handle_response)+;
cics_document_set: SET (DOCTOKEN cics_data_area | SYMBOL cics_name | VALUE cics_data_area | SYMBOLLIST cics_data_area | DELIMITER cics_data_value |
                   LENGTH cics_data_value | UNESCAPED | cics_handle_response)+;

/** DUMP TRANSACTION */
cics_dump: DUMP TRANSACTION (DUMPCODE cics_name | cics_dump_transaction_from  | cics_dump_transaction_segmentlist | cics_dump_code_opts)+;
cics_dump_transaction_from: (FROM cics_data_area | cics_length_flength | cics_handle_response)+;
cics_dump_code_opts: (COMPLETE | TRT | TASK | STORAGE | PROGRAM | TERMINAL | TABLES | FCT | PCT | PPT | SIT | TCT | DUMPID cics_data_area | cics_handle_response)+;
cics_dump_transaction_segmentlist: ((SEGMENTLIST | LENGTHLIST | NUMSEGMENTS) cics_data_area | cics_handle_response)+;

/** ENDBR */
cics_endbr: ENDBR ((FILE | DATASET) cics_name | REQID cics_data_value | SYSID cics_data_area | cics_handle_response)*;

/** ENDBROWSE (all of them) */
cics_endbrowse: ENDBROWSE (ACTIVITY | CONTAINER | EVENT | PROCESS | TIMER | (BROWSETOKEN | RETCODE) cics_data_value | cics_handle_response)*;

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
cics_free: FREE (CONVID cics_name | SESSION cics_name | STATE cics_cvda | cics_handle_response)*;

/** FREEMAIN */
cics_freemain: (FREEMAIN | FREEMAIN64) cics_freemain_opts;
cics_freemain_opts:(DATA cics_data_area | DATAPOINTER cics_value | cics_handle_response)+;

/** GET CONTAINER / GET COUNTER / GET DCOUNTER */
cics_get: GET (cics_get_container_bts | cics_get_container_channel | cics_get_counter_dcounter);
cics_get_container_bts: ((CONTAINER | ACTIVITY) cics_data_value | ACQACTIVITY | PROCESS | ACQPROCESS | (INTO | FLENGTH) cics_data_area |
                    SET cics_ref | NODATA  | cics_handle_response)*;
cics_get_container_channel: ((CONTAINER | CHANNEL | BYTEOFFSET | INTOCCSID | INTOCODEPAGE) cics_data_value | (INTO | FLENGTH | CCSID) cics_data_area |
                    SET cics_ref | NODATA | CONVERTST cics_cvda | cics_handle_response)*;
cics_get_counter_dcounter: ((COUNTER | DCOUNTER | POOL) cics_name | VALUE cics_data_area | (INCREMENT | COMPAREMIN | COMPAREMAX) cics_data_value |
                  WRAP | NOSUSPEND | REDUCE | cics_handle_response)*;

/** GETMAIN */
cics_getmain: GETMAIN (SET cics_ref | FLENGTH cics_data_value | BELOW | LENGTH cics_data_value | INITIMG cics_data_value |
              EXECUTABLE | SHARED | NOSUSPEND | USERDATAKEY | CICSDATAKEY | cics_handle_response)+;
cics_getmain64: GETMAIN64 (SET cics_ref | FLENGTH cics_data_value | LOCATION cics_cvda |
                  EXECUTABLE | SHARED | NOSUSPEND | USERDATAKEY | CICSDATAKEY | cics_handle_response)+;


/** GETNEXT ACTIVITY / CONTAINER / EVENT / PROCESS */
cics_getnext: GETNEXT (cics_getnext_activity | cics_getnext_container | cics_getnext_event | cics_getnext_process);
cics_getnext_activity: (ACTIVITY cics_data_area | BROWSETOKEN cics_data_value ACTIVITYID cics_data_area |
                       LEVEL cics_data_area | cics_handle_response)+;
cics_getnext_event: (EVENT cics_data_area | BROWSETOKEN cics_data_value | COMPOSITE cics_data_area | EVENTTYPE cics_cvda |
                    FIRESTATUS cics_cvda | PREDICATE cics_cvda | TIMER cics_data_area | cics_handle_response)+;
cics_getnext_process: (PROCESS cics_data_area | BROWSETOKEN cics_data_value | ACTIVITYID cics_data_area | cics_handle_response)+;
cics_getnext_container: (CONTAINER cics_data_area | BROWSETOKEN cics_data_value | cics_handle_response)+;

/** HANDLE CONDITION / HANDLE AID / HANDLE ABEND: */
cics_handle: HANDLE (cics_handle_abend | cics_handle_aid | cics_handle_condition);
cics_handle_abend: ABEND (CANCEL | PROGRAM cics_name | LABEL cics_label | RESET | cics_handle_response)*;
cics_handle_aid: AID (ANYKEY (cics_label)? | CLEAR (empty_parens | cics_label)? | CLRPARTN (cics_label)? | ENTER (cics_label)? |
                 LIGHTPEN (cics_label)? | OPERID  (cics_label)? | pa_option (cics_label)? | pf_option (cics_label)? |
                 TRIGGER  (cics_label)? | cics_handle_response)*;
cics_handle_condition: CONDITION ((cics_conditions | cicsWord) cics_label? | cics_handle_response)+;

pa_option: PA1 | PA2 | PA3;
pf_option: PF1 | PF2 | PF3 | PF4 | PF5 | PF6 | PF7 | PF8 | PF9 | PF10 | PF11 | PF12 | PF13 | PF14 | PF15 | PF16 | PF17 |
           PF18 | PF19 | PF20 | PF21 | PF22 | PF23 | PF24;

/** IGNORE CONDITION */
cics_ignore: IGNORE CONDITION (cics_conditions | cicsWord | cics_handle_response)+;

/** INQUIRE, Application Commands ACTIVITYID / CONTAINER / EVENT / PROCESS / TIMER */
cics_inquire: INQUIRE (cics_inquire_process | cics_inquire_activityid | cics_inquire_container | cics_inquire_event | cics_inquire_timer);
cics_inquire_activityid: (ACTIVITYID cics_data_value | (COMPSTATUS | MODE | SUSPSTATUS) cics_cvda |
                         (ABCODE | ABPROGRAM | ACTIVITY | EVENT | PROCESS | PROCESSTYPE | PROGRAM | TRANSID | USERID) cics_data_area | cics_handle_response)+;
cics_inquire_container: ((CONTAINER | ACTIVITYID | PROCESS | PROCESSTYPE) cics_data_value | (DATALENTH | SET) cics_data_area | cics_handle_response)+;
cics_inquire_event: ((EVENT | ACTIVITYID) cics_data_value | (EVENTTYPE | FIRESTATUS | PREDICATE) cics_cvda | (COMPOSITE | TIMER) cics_data_area | cics_handle_response)+;
cics_inquire_process: PROCESS cics_data_value (PROCESSTYPE cics_data_value | ACTIVITYID cics_data_area | cics_handle_response)*;
cics_inquire_timer: ((TIMER | ACTIVITYID) cics_data_value | (EVENT | ABSTIME) cics_data_area| STATUS cics_cvda | cics_handle_response)+;

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
cics_inquire_capturespec: CAPTURESPEC cics_data_area? ((START | END | NEXT) | (CAPTUREPOINT | CURRPGM | CURRTRANID | CURRUSERID | EVENTNAME | NUMDATAPRD | NUMINFOSRCE | NUMOPTPRED | PRIMPRED) cics_data_area | EVENTBINDING cics_data_value | (CAPTUREPTYPE | CURRPGMOP | CURRTRANIDOP | CURRUSERIDOP | PRIMPREDOP | PRIMPREDTYPE) cics_cvda | cics_handle_response)*;
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
cics_inquire_exci: EXCI cics_data_value ((TASK | UTIL) cics_data_value | cics_handle_response)*;
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
cics_inquire_mqconn: MQCONN ((CHANGEAGENT | CONNECTST | INSTALLAGENT | RESYNCNUMBER) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | DEFINESOURCE | DEFINETIME | INSTALLTIME | INSTALLUSRID | MQNAME | MQQMGR | MQRELEASE | TASKS | TRIGMONTASKS) cics_data_area | cics_handle_response)*;
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
cics_inquire_secdiscovery: SECDISCOVERY ((STATUS | CMD | DB2 | DCT | FCT | HFS | JCT | PCT | PPT | PSB | RES | TRAN | TST | USER) cics_cvda | (LATSECDTIME | LASTWRITTIME | SECDCOUNT | NEWSECDCOUNT) cics_data_area | cics_handle_response)*;
cics_inquire_secrecording: SECRECORDING cics_data_value? ((cics_browse_start_end | NEXT) | (ODADPTRID | ODADPTRDATA1 | ODADPTRDATA2 | ODADPTRDATA3 | ODAPPLID | ODCLNTIPADDR | ODCLNTPORT | ODFACILNAME | ODFACILTYPE | ODIPFAMILY | ODLUNAME | ODNETID | ODNETWORKID | ODSERVERPORT | ODTCPIPS | ODTRANSID | ODUSERID) cics_data_value | (MAXIMUM | CURRENT) cics_data_area | cics_handle_response)*;
cics_inquire_statistics: STATISTICS (RECORDING cics_cvda | (ENDOFDAY | ENDOFDAYHRS | ENDOFDAYMINS | ENDOFDAYSECS | INTERVAL | INTERVALHRS | INTERVALMINS | INTERVALSECS | NEXTTIME | NEXTTIMEHRS | NEXTTIMEMINS | NEXTTIMESECS) cics_data_area | cics_handle_response)*;
cics_inquire_storage: STORAGE ((ADDRESS | ELEMENT | ELEMENTLIST | LENGTHLIST) cics_ref | (FLENGTH | NUMELEMENTS) cics_data_area | TASK cics_data_value | cics_handle_response)*;
cics_inquire_storage64: STORAGE64 ((ELEMENT64 | ELEMENTLIST | LENGTHLIST) cics_ref | (ADRESS64 | DSANAME | TASK) cics_data_value | (FLENGTH | NUMELEMENTS) cics_data_area | cics_handle_response)*;
cics_inquire_streamname: STREAMNAME cics_data_value? ((cics_browse_start_end | NEXT) | (STATUS | SYSTEMLOG) cics_cvda | USECOUNT cics_data_area | cics_handle_response)*;
cics_inquire_subpool: SUBPOOL cics_data_area (DSANAME cics_data_area | cics_handle_response)*;
cics_inquire_sysdumpcode: SYSDUMPCODE cics_data_value? ((cics_browse_start_end | NEXT) | (CHANGEAGENT | DAEOPTION | DUMPSCOPE | INSTALLAGENT | SHUTOPTION | SYSDUMPING) cics_cvda | (CHANGEAGREL | CHANGETIME | CHANGEUSRID | CURRENT | DEFINESOURCE | DEFINETIME | DSPLIST | INSTALLTIME | INSTALLUSRID | JOBLIST | MAXIMUM) cics_data_area | cics_handle_response)*;
cics_inquire_system: SYSTEM ((ACTOPENTCBS | AIDCOUNT | AKP | CDSASIZE | CICSSYS | CICSTSLEVEL | DB2CONN | DFLTUSER | DSALIMIT | DSRTPROGRAM | DTRPROGRAM | ECDSASIZE | EDSALIMIT | EPCDSASIZE | EPUDSASIZE | ERDSASIZE | ESDSASIZE | EUDSASIZE | GCDSASIZE | GMMTEXT | GMMLENGTH | GSDSASIZE | GUDSASIZE | GMMTRANID | JOBNAME | LASTCOLDTIME | LASTEMERTIME | LASTINITTIME | LASTWARMTIME | LOGDEFER | MAXOPENTCBS | MAXTASKS | MEMLIMIT | MQCONN | MROBATCH | MVSSMFID | MVSSYSNAME | OPREL | OPSYS | OSLEVEL | PCDSASIZE | PLTPIUSR | PROGAUTOEXIT | PRTYAGING | PUDSASIZE | RDSASIZE | REGIONUSERID | RELEASE | RUNAWAY | SCANDELAY | SDSASIZE | SDTMEMLIMIT | SDTRAN | STARTUPDATE | TIME | UDSASIZE) cics_data_area | SRRTASKS cics_data_value | (CICSSTATUS | CMDPROTECT | COLDSTATUS | DEBUGTOOL | DUMPING | FORCEQR | HEALTHCHECK | INITSTATUS | MESSAGECASE | PROGAUTOCTLG | PROGAUTOINST | REENTPROTECT | RLSSTATUS | SECURITYMGR | SHUTSTATUS | SOSABOVEBAR | SOSABOVELINE | SOSBELOWLINE | SOSSTATUS | STARTUP | STOREPROTECT | TRANISOLATE | XRFSTATUS) cics_cvda |  cics_handle_response)*;
cics_inquire_tag: TAG (START | NEXT | END |  cics_handle_response)*;
cics_inquire_task: TASK ((ACTIVITY | ACTIVITYID | ATTACHTIME | BRFACILITY | BRIDGE | CURRENTPROG | DB2PLAN | DTIMEOUT | FACILITY | IDENTIFIER | INDOUBTMINS | IPFLISTSIZE | PRIORITY | PROCESS | PROCESSTYPE | PROFILE | PROGRAM | REMOTENAME | REMOTESYSTEM | RTIMEOUT | RUNAWAY | STARTCODE | SUSPENDTIME | SUSPENDTYPE | SUSPENDVALUE | RESNAME | TRANCLASS | TCLASS | TRANPRIORITY | TRANSACTION | TRPROF | TWASIZE | UOW | USERID) cics_data_area | (CMDSEC | DUMPING | FACILITYTYPE | INDOUBT | INDOUBTWAIT | ISOLATEST | PURGEABILITY | RESSEC | ROUTING | RUNSTATUS | SCRNSIZE | SRRSTATUS | STORAGECLEAR | TASKDATAKEY | TASKDATALOC | TCB | TRACING) cics_cvda | IPFACILITIES cics_ref |  cics_handle_response)*;
cics_inquire_task_list: TASK (LIST | DISPATCHABLE | RUNNING | SUSPENDED | LISTSIZE cics_data_area | (SET | SETTRANSID) cics_ref |  cics_handle_response)*;
cics_inquire_tclass: TCLASS cics_data_value ((CURRENT | MAXIMUM) cics_data_area |  cics_handle_response)*;
cics_inquire_tcpip: TCPIP ((ACTSOCKETS | CRLPROFILE | MAXSOCKETS) cics_data_value | (OPENSTATUS | SSLCACHE) cics_cvda |  cics_handle_response)*;
cics_inquire_tcpipservice: TCPIPSERVICE cics_data_value ((CERTIFICATE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | CIPHERS | CLOSETIMEOUT | CONNECTIONS | DEFINESOURCE | DEFINETIME | GENERICTCPS | HOST | INSTALLTIME | INSTALLUSRID | IPADDRESS | IPRESOLVED | MAXDATALEN | MAXPERSIST | NUMCIPHERS | OPTIONSPGM | PORT | REALM | SPECIFTCPS | TRANSID | URM) cics_data_area | BACKLOG cics_data_value | (ATTACHSEC | ATTLS | AUTHENTICATE | CHANGEAGENT | HOSTTYPE | INSTALLAGENT | IPFAMILY | OPENSTATUS | PRIVACY | PROTOCOL | SOCKETCLOSE | SSLTYPE) cics_cvda | cics_handle_response)*;
cics_inquire_tdqueue: TDQUEUE cics_data_value? ((cics_browse_start_end | NEXT) | (ATITERMID | ATITRANID | ATIUSERID | BLOCKSIZE | DATABUFFERS | DDNAME | DSNAME | INDIRECTNAME | MEMBER | NUMITEMS | RECORDLENGTH | REMOTENAME | REMOTESYSTEM | TRIGGERLEVEL) cics_data_area | (ATIFACILITY | BLOCKFORMAT | DISPOSITION | EMPTYSTATUS | ENABLESTATUS | ERROROPTION | INDOUBT | INDOUBTWAIT | IOTYPE | OPENSTATUS | PRINTCONTROL | RECORDFORMAT | RECOVSTATUS | REWIND | SYSOUTCLASS | TYPE) cics_cvda |  cics_handle_response)*;
cics_inquire_tempstorage: TEMPSTORAGE ((TSMAININUSE | TSMAINLIMIT) cics_data_value |  cics_handle_response)*;
cics_inquire_netname: NETNAME cics_data_value? (TERMINAL cics_data_value?)? ((START | END | NEXT) | (NETNAME | AIDCOUNT | ALTPAGEHT | ALTPAGEWD | ALTPRINTER | ALTSCRNHT | ALTSCRNWD | ALTSUFFIX | CONSOLE | CORRELID | DEFPAGEHT | DEFPAGEWD | DEFSCRNHT | DEFSCRNWD | GCHARS | GCODES | LINKSYSTEM | MAPNAME | MAPSETNAME | MODENAME | NATLANG | NEXTTRANSID | NQNAME | OPERID | PAGEHT | PAGEWD | PRINTER | REMOTENAME | REMOTESYSNET | REMOTESYSTEM | SCRNHT | SCRNWD | TASKID | TCAMCONTROL | TERMMODEL | TERMPRIORITY | TNADDR | TNPORT | TRANSACTION | USERAREALEN | USERID | USERNAME) cics_data_area | (ACCESSMETHOD | ACQSTATUS | ALTPRTCOPYST | APLKYBDST | APLTEXTST | ASCII | ATISTATUS | AUDALARMST | AUTOCONNECT | BACKTRANSST | COLORST | COPYST | CREATESESS | DATASTREAM | DEVICE | DISCREQST | DUALCASEST | EXITTRACING | EXTENDEDDSST | FMHPARMST | FORMFEEDST | HFORMST | HILIGHTST | KATAKANAST | LIGHTPENST | MSRCONTROLST | NATURE | OBFORMATST | OBOPERIDST | OUTLINEST | PAGESTATUS | PARTITIONSST | PRINTADAPTST | PROGSYMBOLST | PRTCOPYST | QUERYST | RELREQST | SECURITY | SERVSTATUS | SESSIONTYPE | SIGNONSTATUS | SOSIST | TERMSTATUS | TEXTKYBDST | TEXTPRINTST | TNIPFAMILY | TRACING | TTISTATUS | UCTRANST | VALIDATIONST | VFORMST | ZCPTRACING) cics_cvda | USERAREA cics_ref |  cics_handle_response)*;
cics_inquire_terminal: TERMINAL cics_data_value? (NETNAME cics_data_value?)? ((START | END | NEXT) | (NETNAME | AIDCOUNT | ALTPAGEHT | ALTPAGEWD | ALTPRINTER | ALTSCRNHT | ALTSCRNWD | ALTSUFFIX | CONSOLE | CORRELID | DEFPAGEHT | DEFPAGEWD | DEFSCRNHT | DEFSCRNWD | GCHARS | GCODES | LINKSYSTEM | MAPNAME | MAPSETNAME | MODENAME | NATLANG | NEXTTRANSID | NQNAME | OPERID | PAGEHT | PAGEWD | PRINTER | REMOTENAME | REMOTESYSNET | REMOTESYSTEM | SCRNHT | SCRNWD | TASKID | TCAMCONTROL | TERMMODEL | TERMPRIORITY | TNADDR | TNPORT | TRANSACTION | USERAREALEN | USERID | USERNAME) cics_data_area | (ACCESSMETHOD | ACQSTATUS | ALTPRTCOPYST | APLKYBDST | APLTEXTST | ASCII | ATISTATUS | AUDALARMST | AUTOCONNECT | BACKTRANSST | COLORST | COPYST | CREATESESS | DATASTREAM | DEVICE | DISCREQST | DUALCASEST | EXITTRACING | EXTENDEDDSST | FMHPARMST | FORMFEEDST | HFORMST | HILIGHTST | KATAKANAST | LIGHTPENST | MSRCONTROLST | NATURE | OBFORMATST | OBOPERIDST | OUTLINEST | PAGESTATUS | PARTITIONSST | PRINTADAPTST | PROGSYMBOLST | PRTCOPYST | QUERYST | RELREQST | SECURITY | SERVSTATUS | SESSIONTYPE | SIGNONSTATUS | SOSIST | TERMSTATUS | TEXTKYBDST | TEXTPRINTST | TNIPFAMILY | TRACING | TTISTATUS | UCTRANST | VALIDATIONST | VFORMST | ZCPTRACING) cics_cvda | USERAREA cics_ref |  cics_handle_response)*;
cics_inquire_tracedest: TRACEDEST ((CURAUXDS | TABLESIZE) cics_data_area | (AUXSTATUS | GTFSTATUS | INTSTATUS | SWITCHSTATUS) cics_cvda |  cics_handle_response)*;
cics_inquire_traceflag: TRACEFLAG ((SINGLESTATUS | SYSTEMSTATUS | TCEXITSTATUS | USERSTATUS) cics_cvda |  cics_handle_response)*;
cics_inquire_tracetype: TRACETYPE (TRACETYPE | SPECIAL | STANDARD | COMPID cics_data_area | FLAGSET cics_cvda |  cics_handle_response)*;
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
cics_move: MOVE ((CONTAINER | FROMACTIVITY | TOACTIVITY | AS | CHANNEL | TOCHANNEL) cics_data_value | FROMPROCESS |
           TOPROCESS | cics_handle_response)+;

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

cics_post_after: (AFTER | AT | HOURS cics_data_value | MINUTES cics_data_value | SECONDS cics_data_value | cics_handle_response)+;

/** PURGE MESSAGE */
cics_purge: PURGE cics_handle_response? MESSAGE cics_handle_response?;

/** PUSH HANDLE */
cics_push: PUSH cics_handle_response? HANDLE cics_handle_response?;

/** PUT CONTAINER (both of them): */
cics_put: PUT CONTAINER cics_data_value (cics_put_bts | cics_put_channel);
cics_put_bts: (ACTIVITY cics_data_value | ACQACTIVITY | PROCESS | ACQPROCESS | FROM cics_data_area | FLENGTH cics_data_value | cics_handle_response)+;
cics_put_channel: (CHANNEL cics_data_value | FROM cics_data_area | FLENGTH cics_data_value | BIT | DATATYPE cics_cvda |
                  CHAR | FROMCCSID cics_data_value | FROMCODEPAGE cics_data_value | cics_handle_response)+;

/** QUERY CHANNEL / COUNTER / DCOUNTER / SECURITY */
cics_query: QUERY (cics_query_channel | cics_query_counter | cics_query_security);
cics_query_channel: (CHANNEL cics_data_value | CONTAINERCNT cics_data_area | cics_handle_response)+;
cics_query_counter: (cics_counter_dcounter | POOL cics_name | (VALUE | MINIMUM | MAXIMUM) cics_data_area | NOSUSPEND | cics_handle_response)+;
cics_query_security: (SECURITY | (RESTYPE | RESCLASS | RESIDLENGTH | RESID | USERID) cics_data_value |
                     (LOGMESSAGE | READ | UPDATE | CONTROL |ALTER) cics_cvda | cics_handle_response)+;

/** READ */
cics_read: READ (cics_file_name | UNCOMMITTED | CONSISTENT | REPEATABLE | UPDATE | TOKEN cics_data_area |
           INTO cics_data_area | SET cics_ref | RIDFLD cics_data_area | KEYLENGTH cics_data_value | GENERIC |
           SYSID cics_data_area LENGTH cics_data_area | LENGTH cics_data_area | DEBKEY | DEBREC | RBA | RBN |
           XRBA | EQUAL | GTEQ | NOSUSPEND | cics_handle_response)+;

/** READNEXT | READPREV*/
cics_readnext_readprev: (READNEXT | READPREV)  (cics_file_name | INTO cics_data_area | SET cics_ref | UNCOMMITTED | CONSISTENT | REPEATABLE |
               UPDATE | TOKEN cics_data_area | RIDFLD cics_data_area | KEYLENGTH cics_data_value | REQID cics_data_value |
               SYSID cics_data_area | LENGTH cics_data_area | RBA | RRN | XRBA | NOSUSPEND | cics_handle_response)*;

/** READQ TD / TS */
cics_readq: READQ cics_readq_ts_td;
cics_readq_ts_td: (TS | TD | (QUEUE | QNAME) cics_name | cics_into_set | NEXT | (LENGTH | NUMITEMS | SYSID) cics_data_area |
                   ITEM cics_data_value | NOSUSPEND | cics_handle_response)+;

/** RELEASE */
cics_release: RELEASE cics_release_option;
cics_release_option: (PROGRAM cics_name | cics_handle_response)+;

/** REMOVE SUBEVENT */
cics_remove: REMOVE cics_remove_option;
cics_remove_option: ((SUBEVENT | EVENT) cics_data_value | cics_handle_response)+;

/** RESET ACQPROCESS / RESET ACTIVITY */
cics_reset: RESET (cics_reset_acqprocess | cics_reset_activity);
cics_reset_acqprocess: (ACQPROCESS | cics_handle_response)+;
cics_reset_activity: (ACTIVITY cics_data_value | cics_handle_response)+;

/** RESETBR */
cics_resetbr: RESETBR cics_file_name (RIDFLD cics_data_area | KEYLENGTH cics_data_value | GENERIC | REQID cics_data_value |
              SYSID cics_data_area | GTEQ | EQUAL | RBA | RRN |XRBA | cics_handle_response)+;

/** RESUME */
cics_resume: RESUME (ACQACTIVITY | ACQPROCESS | ACTIVITY cics_data_value | cics_handle_response)+;

/** RETRIEVE - / REATTACH EVENT / SUBEVENT */
cics_retrieve: RETRIEVE (cics_retrieve_standard | cics_retrieve_reattach | cics_retrieve_subevent);
cics_retrieve_standard: ((INTO | LENGTH | RTRANSID  | RTERMID  | QUEUE) cics_data_area | SET cics_ref | WAIT | cics_handle_response)*;
cics_retrieve_reattach: (REATTACH | EVENT cics_data_area | EVENTTYPE cics_cvda |  cics_handle_response)*;
cics_retrieve_subevent: (SUBEVENT cics_data_area | EVENT cics_data_value |  EVENTTYPE cics_cvda | cics_handle_response)*;

/** RETURN */
cics_return: RETURN cics_return_transid? cics_return_inputmsg? ENDACTIVITY?;
cics_return_transid: (TRANSID cics_name | CHANNEL cics_name | COMMAREA cics_data_area | LENGTH cics_data_value | IMMEDIATE | cics_handle_response)+;
cics_return_inputmsg: (INPUTMSG cics_data_area | INPUTMSGLEN cics_data_value | cics_handle_response)+;

/** REWIND COUNTER / DCOUNTER */
cics_rewind: REWIND (cics_rewind_counter | cics_rewind_dcounter);
cics_rewind_counter: COUNTER cics_name (POOL cics_name | INCREMENT cics_data_value | cics_handle_response)*;
cics_rewind_dcounter: DCOUNTER cics_name (POOL cics_name | INCREMENT cics_data_area | cics_handle_response)*;

/** REWRITE: */
cics_rewrite: REWRITE cics_file_name (TOKEN cics_data_area | FROM cics_data_area | SYSID cics_data_area
              LENGTH cics_data_value | LENGTH cics_data_value | NOSUSPEND | cics_handle_response)+;

/** ROUTE */
cics_route: ROUTE (INTERVAL cics_zero_digit | INTERVAL cics_hhmmss | TIME cics_hhmmss | cics_post_after |
            ERRTERM cics_name? | TITLE cics_data_area | LIST cics_data_area | OPCLASS cics_data_area |
            REQID cics_name | LDC cics_name | NLEOM | cics_handle_response)*;

/** RUN */
cics_run: RUN (cics_run_default | cics_run_transid);
cics_run_default: ((ACTIVITY | FACILITYTOKN | INPUTEVENT) cics_data_value | ACQACTIVITY | ACQPROCESS | SYNCHRONOUS | ASYNCHRONOUS | cics_handle_response)+;
cics_run_transid: (TRANSID cics_name | CHANNEL cics_name | CHILD cics_data_area | cics_handle_response)+;

/** SIGNAL EVENT */
cics_signal: SIGNAL (EVENT cics_data_value | FROMCHANNEL cics_data_value | FROM cics_data_area | FROMLENGTH cics_data_value | cics_handle_response)*;

/** SIGNOFF */
cics_signoff: SIGNOFF cics_handle_response?;

/** SIGNON */
cics_signon: SIGNON (USERID cics_data_value | ESMREASON cics_data_area | ESMRESP cics_data_area | GROUPID cics_data_value |
             LANGUAGECODE cics_data_value | NATLANG cics_data_value | LANGINUSE cics_data_area | NATLANGINUSE cics_data_area |
             PASSWORD cics_data_value | NEWPASSWORD cics_data_value | PHRASE cics_data_area | PHRASELEN cics_data_value |
             NEWPHRASE cics_data_area | NEWPHRASELEN cics_data_value | OIDCARD cics_data_value | cics_handle_response)*;

/** SOAPFAULT ADD / CREATE / DELETE */
cics_soapfault: SOAPFAULT (cics_soapfault_add | cics_soapfault_create | DELETE);
cics_soapfault_add: ADD (cics_soapfault_faultstring | cics_soapfault_subcodestr | FROMCCSID cics_data_value | cics_handle_response)+;
cics_soapfault_faultstring: (FAULTSTRING cics_data_value | FAULTSTRLEN cics_data_value | NATLANG cics_data_value)+;
cics_soapfault_subcodestr: (SUBCODESTR cics_data_value | SUBCODELEN cics_data_value)+;
cics_soapfault_create: CREATE (FAULTCODE cics_cvda | CLIENT | SERVER | SENDER | RECEIVER | cics_soapfault_faultcodestr |
                       cics_soapfault_faultstring | cics_soapfault_role | cics_soapfault_faultactor |
                       cics_soapfault_detail | FROMCCSID cics_data_value | cics_handle_response)+;
cics_soapfault_faultcodestr: (FAULTCODESTR cics_data_value | FAULTCODELEN cics_data_value)+;
cics_soapfault_role: (ROLE cics_data_value | ROLELENGTH cics_data_value)+;
cics_soapfault_faultactor: (FAULTACTOR cics_data_value | FAULTACTLEN cics_data_value)+;
cics_soapfault_detail: (DETAIL cics_data_value | DETAILLENGTH cics_data_value)+;

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
cics_start: START (cics_start_transid | cics_start_attach | cics_start_brexit);
cics_start_transid: (TRANSID cics_name | cics_start_null | cics_start_channel)+;
cics_start_null: ((INTERVAL cics_zero_digit | INTERVAL cics_hhmmss | TIME cics_hhmmss | cics_post_after) | REQID cics_name | cics_start_from |
                 (TERMID cics_name | USERID cics_data_value) | SYSID cics_data_area | RTRANSID cics_name | RTERMID cics_name |
                 QUEUE cics_name | NOCHECK | PROTECT | cics_handle_response)+;
cics_start_channel: CHANNEL cics_name (TERMID cics_name | USERID cics_data_value | SYSID cics_data_area | cics_handle_response)*;
cics_start_attach: ATTACH (TRANSID cics_name | cics_start_from | cics_handle_response)+;
cics_start_from: FROM (cics_data_area | LENGTH cics_data_value | FMH)+;
cics_start_brexit: BREXIT name? (TRANSID cics_name | BRDATA cics_data_area | BRDATALENGTH cics_data_value |USERID cics_data_value | cics_handle_response)+;
cics_zero_digit: LPARENCHAR ZERO_DIGIT RPARENCHAR;

/** STARTBR */
cics_startbr: STARTBR cics_file_name (RIDFLD cics_data_area | KEYLENGTH cics_data_value | GENERIC | REQID cics_data_value |
              SYSID cics_data_area | DEBKEY | DEBREC | RBA | RBN | XRBA | GTEQ | EQUAL | cics_handle_response)+;

/** STARTBROWSE ACTIVITY / CONTAINER / EVENT / PROCESS */
cics_startbrowse: STARTBROWSE (cics_startbrowse_activity | cics_startbrowse_container | cics_startbrowse_event |
                  cics_startbrowse_process);
cics_startbrowse_activity: ACTIVITY (ACTIVITYID cics_data_value | PROCESS cics_data_value PROCESSTYPE cics_data_value |
                           BROWSETOKEN cics_data_area | cics_handle_response)+;
cics_startbrowse_container: CONTAINER (ACTIVITYID cics_data_value | PROCESS cics_data_value PROCESSTYPE cics_data_value |
                            CHANNEL cics_data_value | BROWSETOKEN cics_data_area | cics_handle_response)+;
cics_startbrowse_event: EVENT (BROWSETOKEN cics_data_area | ACTIVITYID cics_data_value | cics_handle_response)+;
cics_startbrowse_process: PROCESS (PROCESSTYPE cics_data_value | BROWSETOKEN cics_data_area | cics_handle_response)+;

/** SUSPEND (both) */
cics_suspend: SUSPEND cics_suspend_body;
cics_suspend_body: (ACQACTIVITY | ACQPROCESS | ACTIVITY cics_data_value | cics_handle_response)*;

/** SYNCPOINT / SYNCPOINT ROLLBACK */
cics_syncpoint: SYNCPOINT cics_syncpoint_rollback;
cics_syncpoint_rollback: (ROLLBACK | cics_handle_response)*;

/** TEST EVENT */
cics_test: TEST (EVENT cics_data_value | FIRESTATUS cics_cvda | cics_handle_response)+;

/** TRANSFORM DATATOXML / XMLTODATA */
cics_transform: TRANSFORM (cics_transform_datatoxml | cics_transform_xmltodata);
cics_transform_datatoxml: DATATOXML (CHANNEL cics_data_value | DATCONTAINER cics_data_value | cics_transform_elemname
                          cics_transform_elemns | cics_transform_typenamens | XMLCONTAINER cics_data_value |
                          XMLTRANSFORM cics_name | cics_handle_response)+;
cics_transform_typenamens: (cics_transform_typename | cics_transform_typens)+;
cics_transform_typename: (TYPENAME cics_data_area | TYPENAMELEN cics_data_area)+;
cics_transform_typens: (TYPENS cics_data_area | TYPENSLEN cics_data_area)+;
cics_transform_elemns: (ELEMNS cics_data_area | ELEMNSLEN cics_data_area)+;
cics_transform_elemname: (ELEMNAME cics_data_area | ELEMNAMELEN cics_data_area)+;
cics_transform_xmltodata: XMLTODATA (CHANNEL cics_data_value | DATCONTAINER cics_data_value | cics_transform_elemname |
                          cics_transform_elemns | NSCONTAINER cics_data_value | cics_transform_typename |
                          cics_transform_typens | XMLCONTAINER cics_data_value | XMLTRANSFORM cics_name | cics_handle_response)+;

/** UNLOCK */
cics_unlock: UNLOCK (cics_file_name | TOKEN cics_data_area | SYSID cics_data_area | cics_handle_response)+;

/** UPDATE COUNTER / DCOUNTER */
cics_update: UPDATE (cics_update_counter | cics_update_dcounter);
cics_update_counter: COUNTER cics_name (POOL cics_name | VALUE cics_data_value | COMPAREMIN cics_data_value | COMPAREMAX cics_data_value | cics_handle_response)+;
cics_update_dcounter: DCOUNTER cics_name (POOL cics_name | VALUE cics_data_area | COMPAREMIN cics_data_area | COMPAREMAX cics_data_area | cics_handle_response)+;

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
cics_waitcics: WAITCICS (ECBLIST cics_value | NUMEVENTS cics_data_value | PURGEABLE | PURGEABILITY cics_cvda |
               NOTPURGEABLE | NAME cics_name | cics_handle_response)+;

/** WEB (all) */
cics_web: WEB (cics_web_close | cics_web_converse | cics_web_endbrowse | cics_web_extract | cics_web_open |
          cics_web_parse | cics_web_read | cics_web_readnext | cics_web_receive | cics_web_retrieve | cics_web_send |
          cics_web_startbrowse | cics_web_write);

cics_web_close: CLOSE (SESSTOKEN cics_data_value | cics_handle_response)+;

cics_web_converse: CONVERSE (((SESSTOKEN | MEDIATYPE | MAXLENGTH) cics_data_value) | cics_web_path | cics_web_urimap | cics_web_http_call_method | cics_web_querystring |
                   cics_web_body | cics_web_action_expect | cics_web_close_options | cics_web_converse_credentials | cics_web_into_set_tocontainer | (TOLENGTH | BODYCHARSET) cics_data_area | NOTRUNCATE |
                   cics_web_statuscode | cics_web_translation | cics_handle_response)+;

cics_web_endbrowse: ENDBROWSE (FORMFIELD | HTTPHEADER | SESSTOKEN cics_data_value | QUERYPARM | cics_handle_response)+; // All three variants

cics_web_extract: EXTRACT (cics_web_extract_server | cics_web_extract_client);
cics_web_extract_server: (((SCHEME | REQUESTTYPE) cics_cvda) | cics_web_host_hosttype | cics_web_httpmethod | cics_web_httpversion | cics_web_path | (PORTNUMBER cics_data_area) |
                         cics_web_querystring | cics_web_urimap | cics_handle_response)+;
cics_web_extract_client: ((SESSTOKEN | PORTNUMBER) cics_data_area | (SCHEME cics_cvda) | cics_web_host_hosttype | cics_web_httpversion | cics_web_path | cics_web_urimap | cics_web_realm | cics_handle_response)+;

cics_web_open: OPEN (cics_web_urimap | cics_web_host_portnumber | (CERTIFICATE|CODEPAGE) cics_data_value | ((SESSTOKEN | HTTPVNUM | HTTPRNUM) cics_data_area) | cics_web_open_deprecated | cics_handle_response)+;

cics_web_parse: PARSE ((URL|URLLENGTH|PORTNUMBER) cics_data_value | (SCHEMENAME cics_data_area) | cics_web_host_hosttype | cics_web_path | cics_web_querystring | cics_handle_response)+;

cics_web_read: READ ((FORMFIELD | HTTPHEADER) cics_data_area | QUERYPARM cics_data_value) ((NAMELENGTH | CHARACTERSET | HOSTCODEPAGE) cics_data_value | (SESSTOKEN | VALUE | VALUELENGTH) cics_data_area | SET ptr_ref | cics_handle_response)+;

cics_web_readnext: READNEXT (cics_web_readnext_formfield_queryparm | cics_web_readnext_httpheader);
cics_web_readnext_formfield_queryparm: (FORMFIELD|QUERYPARM) cics_data_area ((VALUE | VALUELENGTH) cics_data_area | NAMELENGTH cics_data_value | cics_handle_response)+;
cics_web_readnext_httpheader: HTTPHEADER cics_data_area ((VALUE|VALUELENGTH) cics_data_area | ((SESSTOKEN|NAMELENGTH) cics_data_value) | cics_handle_response)+;

cics_web_receive: RECEIVE (cics_web_receive_server_buffer | cics_web_receive_server_container | cics_web_receive_client);
cics_web_receive_server_buffer: (cics_web_into_set | (LENGTH|BODYCHARSET) cics_data_area | ((MAXLENGTH|CHARACTERSET|HOSTCODEPAGE|MEDIATYPE) cics_data_value) | NOTRUNCATE | (TYPE cics_cvda) | cics_web_server_convert | cics_handle_response)+;
cics_web_receive_server_container: (((TOCONTAINER|TOCHANNEL|CHARACTERSET|MEDIATYPE) cics_data_value) | (TYPE cics_cvda) | (BODYCHARSET cics_data_area) | cics_handle_response)+;
cics_web_receive_client: (((SESSTOKEN|MEDIATYPE) cics_data_value) | cics_web_statuscode | cics_web_receive_client_buffer | cics_web_receive_client_container | cics_handle_response)+;
cics_web_receive_client_buffer: (cics_web_into_set | (LENGTH|BODYCHARSET) cics_data_area | (MAXLENGTH cics_data_value) | NOTRUNCATE | cics_web_client_convert | cics_handle_response)+;
cics_web_receive_client_container: (TOCONTAINER cics_data_value | (TOCHANNEL cics_data_value) | (BODYCHARSET cics_data_area) | cics_handle_response)+;

cics_web_retrieve: RETRIEVE DOCTOKEN cics_data_area cics_handle_response*;

cics_web_send: SEND (cics_web_send_server | cics_web_send_client);
cics_web_send_server: ((cics_web_send_doctoken | cics_web_send_from_chunk | (HOSTCODEPAGE cics_data_value) | cics_web_send_container_subrule) | ((MEDIATYPE|CHARACTERSET) cics_data_value) | cics_web_server_convert | cics_web_statuscode |
                        (IMMEDIATE | EVENTUAL | ACTION cics_cvda) | (NOCLOSE | CLOSE | CLOSESTATUS cics_cvda) | cics_handle_response)+;
cics_web_send_client: SESSTOKEN cics_data_value (cics_web_http_call_method | cics_web_path | cics_web_urimap | cics_web_querystring | (cics_web_send_doctoken | cics_web_send_from_chunk | cics_web_send_container_subrule) | cics_web_client_convert |
                        (CHARACTERSET cics_data_value) | EXPECT | NOCLOSE | CLOSE | ((ACTION | CLOSESTATUS) cics_cvda) | cics_web_server_client_credentials | cics_handle_response)+;

cics_web_startbrowse: STARTBROWSE (cics_web_startbrowse_formfield_queryparm | cics_web_startbrowse_httpheader);
cics_web_startbrowse_formfield_queryparm: (((FORMFIELD|QUERYPARM) cics_data_area?) | (NAMELENGTH cics_data_area) | (CHARACTERSET|HOSTCODEPAGE) cics_data_value | cics_handle_response)+;
cics_web_startbrowse_httpheader: HTTPHEADER (SESSTOKEN cics_data_area | cics_handle_response)?;

cics_web_write: WRITE ((HTTPHEADER|NAMELENGTH|SESSTOKEN|VALUE|VALUELENGTH) cics_data_area | cics_handle_response)+;

// WEB Helpers
cics_web_path: (PATH cics_data_area | PATHLENGTH cics_data_value)+;
cics_web_urimap: URIMAP cics_data_value;
cics_web_querystring: (QUERYSTRING cics_data_area | QUERYSTRLEN cics_data_value)+;

cics_web_http_call_method: (GET | HEAD | PATCH | POST | PUT | TRACE | OPTIONS | DELETE | METHOD cics_cvda);

cics_web_body: (cics_web_body_doctoken | cics_web_from | cics_web_container);
cics_web_body_doctoken: (DOCTOKEN cics_data_value | NODOCDELETE | DOCDELETE | DOCSTATUS cics_cvda);
cics_web_from: FROM cics_data_area | FROMLENGTH cics_data_value;
cics_web_container: (CONTAINER | CHANNEL) cics_data_value;

cics_web_action_expect: (ACTION cics_cvda | EXPECT);
cics_web_close_options: (CLOSE | NOCLOSE | CLOSESTATUS cics_cvda);

cics_web_into_set_tocontainer: (INTO cics_data_area | SET ptr_ref | (TOCONTAINER|TOCHANNEL) cics_data_value);
cics_web_statuscode: (((STATUSCODE|STATUSTEXT) cics_data_area) | (STATUSLEN|LENGTH) cics_data_value)+;

cics_web_translation: (CHARACTERSET cics_data_value) | (CLICONVERT | NOINCONVERT | NOOUTCONVERT | NOCLICONVERT | CLIENTCONV cics_cvda);

cics_web_host: (HOST cics_data_area | HOSTLENGTH cics_data_value)+;
cics_web_host_hosttype: cics_web_host (HOSTTYPE cics_cvda)?;
cics_web_host_portnumber: cics_web_host PORTNUMBER cics_data_value SCHEME cics_cvda;
cics_web_httpmethod: ((HTTPMETHOD|METHODLENGTH) cics_data_area);
cics_web_httpversion: (HTTPVERSION|VERSIONLEN) cics_data_area;
cics_web_realm: (REALM|REALMLEN) cics_data_area;
cics_web_open_deprecated: (CIPHERS|NUMCIPHERS) cics_data_value;

cics_web_into_set: (INTO cics_data_area | SET ptr_ref);

cics_web_converse_credentials: cics_web_client_auth_type | cics_web_auth_username | cics_web_auth_password;
cics_web_server_client_credentials: (cics_web_client_auth_type | cics_web_auth_username_password);
cics_web_server_convert: (SRVCONVERT | NOSRVCONVERT | SERVERCONV cics_cvda);
cics_web_client_convert: (CLICONVERT | NOCLICONVERT | CLIENTCONV cics_cvda);
cics_web_client_auth_type: (NONE | BASICAUTH | AUTHENTICATE cics_cvda);
cics_web_auth_username_password: (cics_web_auth_username | cics_web_auth_password)+;
cics_web_auth_username: (USERNAME|USERNAMELEN) cics_data_value;
cics_web_auth_password: (PASSWORD|PASSWORDLEN) cics_data_value;

cics_web_send_doctoken: (DOCTOKEN cics_data_value | (NODOCDELETE | DOCDELETE | DOCSTATUS cics_cvda));
cics_web_send_from_chunk: FROM cics_data_area | FROMLENGTH cics_data_value | (CHUNKNO | CHUNKYES | CHUNKEND | CHUNKING cics_cvda);
cics_web_send_container_subrule: (CONTAINER cics_data_value | CHANNEL cics_data_value)+;

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
cics_wsacontext_build: BUILD (CHANNEL cics_data_value | ACTION cics_data_value | MESSAGEID cics_data_value |
                       cics_wsacontext_relatesuri | cics_wsacontext_eprtype | FROMCCSID cics_data_value |
                       FROMCODEPAGE cics_data_value | cics_handle_response)+;
cics_wsacontext_relatesuri: (RELATESURI cics_data_value | RELATESTYPE cics_data_value | cics_handle_response)+;
cics_wsacontext_eprtype: (EPRTYPE cics_cvda | EPRFIELD cics_cvda | EPRFROM cics_cvda | EPRLENGTH cics_data_value | cics_handle_response)+;
cics_wsacontext_delete: (DELETE | CHANNEL cics_data_value | cics_handle_response)+;
cics_wsacontext_get: GET (CONTEXTTYPE cics_cvda | CHANNEL cics_data_value | ACTION cics_data_area | MESSAGEID cics_data_area |
                     cics_wsacontext_grelatesuri | cics_wsacontext_geprtype | INTOCCSID cics_data_value |
                     INTOCODEPAGE cics_data_value | cics_handle_response)+;
cics_wsacontext_grelatesuri: RELATESURI cics_data_area (RELATESTYPE cics_data_area | RELATESINDEX cics_data_value | cics_handle_response)+;
cics_wsacontext_geprtype: EPRTYPE cics_cvda (EPRFIELD cics_cvda | EPRINTO cics_data_area | EPRSET cics_ref | EPRLENGTH cics_data_area | cics_handle_response)+;

/** WSAEPR CREATE */
cics_wsaepr: WSAEPR (CREATE | EPRINTO cics_data_area | EPRSET cics_data_area | EPRLENGTH cics_data_area | ADDRESS cics_data_value |
             REFPARMS cics_data_value | REFPARMSLEN cics_data_value | METADATA cics_data_value | METADATALEN cics_data_value |
             FROMCCSID cics_data_value | FROMCODEPAGE cics_data_value | cics_handle_response)+;

/** XCTL: */
cics_xctl: XCTL (PROGRAM cics_name | COMMAREA cics_data_area | LENGTH cics_data_value | CHANNEL cics_name | INPUTMSG cics_data_area |
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
cics_hhmmss: LPARENCHAR hhmmss RPARENCHAR;
cics_label: LPARENCHAR paragraphNameUsage RPARENCHAR;
cics_value: LPARENCHAR ptr_value RPARENCHAR;
empty_parens: LPARENCHAR RPARENCHAR;

cicsWord
    : WORD_IDENTIFIER | cicsWords
    ;

cicsWords:
ABORT
 | ADDRESS
 | AFTER
 | ALTER
 | AS
 | ASSIGN
 | ASSOCIATION
 | AT
 | ATTACH
 | AUTOINSTALL
 | BINARY
 | CANCEL
 | CAPDATAPRED
 | CAPINFOSRCE
 | CAPOPTPRED
 | CHANNEL
 | CLASS
 | CLOSE
 | COMMAREA
 | CONTROL
 | COPY
 | DATA
 | DB2CONN
 | DELETE
 | DELETSHIPPED
 | DELIMITER
 | DETAIL
 | DISPATCHABLE
 | DISPATCHER
 | DUMPDS
 | END
 | ENDFILE
 | ENQ
 | ENTER
 | ENTRY
 | EPADAPTINSET
 | EQUAL
 | ERASE
 | ERROR
 | EVENT
 | EVENTPROCESS
 | EXCEPTION
 | EXTERNAL
 | FOR
 | FROM
 | INPUT
 | INQUIRE
 | INTO
 | INVOKE
 | IRC
 | LABEL
 | LAST
 | LENGTH
 | LINE
 | LINK
 | LIST
 | MESSAGE
 | MMDDYYYY
 | MODE
 | MONITOR
 | MQCONN
 | NEXT
 | ORGANIZATION
 | OUTPUT
 | PAGE
 | PARSE
 | PASSWORD
 | PROCESS
 | PROGRAM
 | PURGE
 | RECEIVE
 | RECORD
 | RELEASE
 | REPLACE
 | RESET
 | RETURN
 | REWIND
 | REWRITE
 | RRMS
 | RUN
 | RUNNING
 | SECDISCOVERY
 | SECURITY
 | SEND
 | SERVICE
 | SHARED
 | SPECIAL
 | STANDARD
 | START
 | STATISTICS
 | STATUS
 | STORAGE
 | STORAGE64
 | SUSPENDED
 | SYMBOL
 | SYNCONRETURN
 | SYSTEM
 | TAG
 | TASK
 | TCPIP
 | TEMPSTORAGE
 | TERMINAL
 | TEST
 | TEXT
 | TIMER
 | TITLE
 | TRACEDEST
 | TRACEFLAG
 | TRACETYPE
 | TSQUEUE
 | TYPE
 | UOWDSNFAIL
 | UOWENQ
 | VALUE
 | VTAM
 | WAIT
 | WEB
 | WLMHEALTH
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
 | ACTION
 | ACTIONCOUNT
 | ACTIONTYPE
 | ACTIVE
 | ACTIVITY
 | ACTIVITYID
 | ACTOPENTCBS
 | ACTPARTN
 | ACTSOCKETS
 | ACTSSLTCBS
 | ACTTHRDTCBS
 | ACTXPTCBS
 | ADAPTERTYPE
 | ADD
 | ADDRESS
 | ADJUSTMENT
 | ADRESS64
 | AGE
 | AIBRIDGE
 | AID
 | AIDCOUNT
 | AKP
 | ALARM
 | ALTPAGEHT
 | ALTPAGEWD
 | ALTPRINTER
 | ALTPRTCOPYST
 | ALTSCRNHT
 | ALTSCRNWD
 | ALTSUFFIX
 | ANALYZERSTAT
 | ANYKEY
 | APIST
 | APLKYBD
 | APLKYBDST
 | APLTEXT
 | APLTEXTST
 | APPENDCRLF
 | APPLDATA
 | APPLICATION
 | APPLID
 | APPLMAJORVER
 | APPLMICROVER
 | APPLMINORVER
 | APPLNAMEST
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
 | ASSOCIATION
 | ASYNCHRONOUS
 | AT
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
 | AUDALARMST
 | AUDITLEVEL
 | AUDITLOG
 | AUTHENTICATE
 | AUTHID
 | AUTHORITY
 | AUTHTYPE
 | AUTHUSERID
 | AUTINSTMODEL
 | AUTOCONNECT
 | AUTOINSTALL
 | AUTOPAGE
 | AUXILIARY
 | AUXSTATUS
 | AVAILABILITY
 | AVAILABLE
 | AVAILSTATUS
 | BACKLOG
 | BACKTRANSST
 | BACKUPTYPE
 | BASE64
 | BASEDSNAME
 | BASESCOPE
 | BASICAUTH
 | BELOW
 | BIF
 | BINDFILE
 | BINDING
 | BLOCKFORMAT
 | BLOCKKEYLEN
 | BLOCKSIZE
 | BODYCHARSET
 | BOOKMARK
 | BRANCHQUAL
 | BRDATA
 | BRDATALENGTH
 | BREXIT
 | BRFACILITY
 | BRIDGE
 | BROWSE
 | BROWSETOKEN
 | BTRANS
 | BUFFER
 | BUILD
 | BUNDLE
 | BUNDLEDIR
 | BUNDLEID
 | BUNDLEPART
 | CACHESIZE
 | CADDRLENGTH
 | CAPTUREPOINT
 | CAPTUREPTYPE
 | CAPTURESPEC
 | CARD
 | CAUSE
 | CBUFF
 | CCSID
 | CDSASIZE
 | CEDFSTATUS
 | CERTIFICATE
 | CFDTPOOL
 | CHANGE
 | CHANGEAGENT
 | CHANGEAGREL
 | CHANGETIME
 | CHANGEUSRID
 | CHANNEL
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
 | CICSTSLEVEL
 | CIDDOMAIN
 | CIPHERS
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
 | COLDSTATUS
 | COLOR
 | COLORST
 | COMAUTHID
 | COMAUTHTYPE
 | COMMAREA
 | COMMONNAME
 | COMMONNAMLEN
 | COMPAREMAX
 | COMPAREMIN
 | COMPID
 | COMPLETE
 | COMPOSITE
 | COMPRESSST
 | COMPSTATUS
 | COMTHREADLIM
 | COMTHREADS
 | CONCURRENCY
 | CONCURRENTST
 | CONFIGDATA1
 | CONFIGFILE
 | CONFIRM
 | CONFIRMATION
 | CONNECT
 | CONNECTERROR
 | CONNECTION
 | CONNECTIONS
 | CONNECTST
 | CONNSTATUS
 | CONNTYPE
 | CONSISTENT
 | CONSOLE
 | CONSOLES
 | CONTAINER
 | CONTEXTTYPE
 | CONVDATA
 | CONVERSE
 | CONVERSEST
 | CONVERTER
 | CONVERTST
 | CONVERTTIME
 | CONVID
 | COPY
 | COPYST
 | CORRELID
 | COUNTER
 | COUNTRY
 | COUNTRYLEN
 | CQP
 | CREATE
 | CREATESESS
 | CRITICAL
 | CRITICALST
 | CRLPROFILE
 | CTLCHAR
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
 | CWA
 | CWALENG
 | DAEOPTION
 | DATA1
 | DATA2
 | DATABUFFERS
 | DATAFORMAT
 | DATALENGTH
 | DATALENTH
 | DATALOCATION
 | DATAONLY
 | DATAPOINTER
 | DATASET
 | DATASTR
 | DATASTREAM
 | DATATOXML
 | DATATYPE
 | DATCONTAINER
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
 | DCOUNTER
 | DCT
 | DDMMYY
 | DDMMYYYY
 | DDNAME
 | DEBKEY
 | DEBREC
 | DEBUGTOOL
 | DEEDIT
 | DEFINE
 | DEFINESOURCE
 | DEFINETIME
 | DEFPAGEHT
 | DEFPAGEWD
 | DEFRESP
 | DEFSCRNHT
 | DEFSCRNWD
 | DELAY
 | DELETE
 | DELETEQ
 | DEQ
 | DESTCOUNT
 | DESTID
 | DESTIDLENG
 | DETAILLENGTH
 | DEVICE
 | DFHRESP
 | DFHVALUE
 | DFLTUSER
 | DIGEST
 | DIGESTTYPE
 | DISABLEDACT
 | DISCARD
 | DISCONNECT
 | DISCREQST
 | DISPOSITION
 | DNAME
 | DNAMELEN
 | DOCDELETE
 | DOCSIZE
 | DOCSTATUS
 | DOCTOKEN
 | DOCUMENT
 | DPLLIMIT
 | DROLLBACK
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
 | DSPLIST
 | DSRTPROGRAM
 | DSSCS
 | DTIMEOUT
 | DTRPROGRAM
 | DUALCASEST
 | DUMP
 | DUMPCODE
 | DUMPID
 | DUMPING
 | DUMPSCOPE
 | DUPREC
 | DURATION
 | DYNAMSTATUS
 | ECADDR
 | ECBLIST
 | ECDSASIZE
 | EDSALIMIT
 | EIB
 | ELEMENT
 | ELEMENT64
 | ELEMENTLIST
 | ELEMNAME
 | ELEMNAMELEN
 | ELEMNS
 | ELEMNSLEN
 | EMITMODE
 | EMPTYSTATUS
 | ENABLEDCOUNT
 | ENABLESTATUS
 | ENCRYPTKEY
 | ENDACTIVITY
 | ENDBR
 | ENDBROWSE
 | ENDFILE
 | ENDOFDAY
 | ENDOFDAYHRS
 | ENDOFDAYMINS
 | ENDOFDAYSECS
 | ENDOUTPUT
 | ENDPOINT
 | ENQ
 | ENQFAILS
 | ENQNAME
 | ENQSCOPE
 | ENTRY
 | ENTRYNAME
 | ENTRYPOINT
 | EOC
 | EODS
 | EPADAPTER
 | EPADAPTERNUM
 | EPADAPTERRES
 | EPADAPTERSET
 | EPCDSASIZE
 | EPRFIELD
 | EPRFROM
 | EPRINTO
 | EPRLENGTH
 | EPRSET
 | EPRTYPE
 | EPSTATUS
 | EPUDSASIZE
 | ERASE
 | ERASEAUP
 | ERDSASIZE
 | ERRORMSG
 | ERRORMSGLEN
 | ERROROPTION
 | ERRTERM
 | ESDSASIZE
 | ESMREASON
 | ESMRESP
 | EUDSASIZE
 | EVENT
 | EVENTBINDING
 | EVENTNAME
 | EVENTTYPE
 | EVENTUAL
 | EWASUPP
 | EXACTMATCH
 | EXCEPTCLASS
 | EXCLUSIVE
 | EXECKEY
 | EXECUTABLE
 | EXECUTIONSET
 | EXIT
 | EXITPGM
 | EXITTRACING
 | EXPECT
 | EXPIRYINT
 | EXPIRYINTMIN
 | EXPIRYTIME
 | EXTDS
 | EXTENDEDDSST
 | EXTRACT
 | FACILITY
 | FACILITYLIKE
 | FACILITYTOKN
 | FACILITYTYPE
 | FACILNAME
 | FACILTYPE
 | FAULTACTLEN
 | FAULTACTOR
 | FAULTCODE
 | FAULTCODELEN
 | FAULTCODESTR
 | FAULTSTRING
 | FAULTSTRLEN
 | FCI
 | FCT
 | FIELD
 | FIELDLENGTH
 | FIELDOFFSET
 | FILE
 | FILECOUNT
 | FILELIMIT
 | FILENAME
 | FILEPATH
 | FILTERVALUE
 | FIRESTATUS
 | FLAGSET
 | FLENGTH
 | FMH
 | FMHPARM
 | FMHPARMST
 | FMHSTATUS
 | FORCE
 | FORCEQR
 | FORMATEDFST
 | FORMATTIME
 | FORMFEED
 | FORMFEEDST
 | FORMFIELD
 | FREEKB
 | FREEMAIN
 | FREEMAIN64
 | FREQUENCY
 | FREQUENCYHRS
 | FREQUENCYMINS
 | FREQUENCYSECS
 | FROMACTIVITY
 | FROMCCSID
 | FROMCHANNEL
 | FROMCODEPAGE
 | FROMDOC
 | FROMFLENGTH
 | FROMLENGTH
 | FROMPROCESS
 | FRSET
 | FULLDATE
 | FWDRECOVLOG
 | FWDRECOVLSN
 | FWDRECSTATUS
 | GAENTRYNAME
 | GALENGTH
 | GARBAGEINT
 | GAUSECOUNT
 | GCDSASIZE
 | GCHARS
 | GCODES
 | GCPOLICY
 | GDS
 | GENERIC
 | GENERICTCPS
 | GET
 | GETMAIN
 | GETMAIN64
 | GETNEXT
 | GMEXITOPT
 | GMMI
 | GMMLENGTH
 | GMMTEXT
 | GMMTRANID
 | GRNAME
 | GROUPID
 | GRSTATUS
 | GSDSASIZE
 | GTEQ
 | GTFSTATUS
 | GUDSASIZE
 | HA
 | HANDLE
 | HEAD
 | HEADER
 | HEALTH
 | HEALTHABSTIM
 | HEALTHCHECK
 | HEX
 | HFORMST
 | HFS
 | HFSFILE
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
 | HTTPHEADER
 | HTTPMETHOD
 | HTTPRNUM
 | HTTPVERSION
 | HTTPVNUM
 | IDENTIFIER
 | IDLE
 | IDLEHRS
 | IDLEMINS
 | IDLESECS
 | IDNTYCLASS
 | IDPROP
 | IGNORE
 | IMMEDIATE
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
 | INPUTEVENT
 | INPUTMSG
 | INPUTMSGLEN
 | INQUIRE
 | INSTALLAGENT
 | INSTALLTIME
 | INSTALLUSRID
 | INTEGER
 | INTERVAL
 | INTERVALHRS
 | INTERVALMINS
 | INTERVALSECS
 | INTOCCSID
 | INTOCODEPAGE
 | INTSTATUS
 | INVALIDCOUNT
 | INVITE
 | INVMPSZ
 | INVOKE
 | INVOKETYPE
 | INVOKINGPROG
 | INVPARTN
 | INVREQ
 | IOTYPE
 | IPADDRESS
 | IPCONN
 | IPFACILITIES
 | IPFACILTYPE
 | IPFAMILY
 | IPFLISTSIZE
 | IPRESOLVED
 | ISOLATEST
 | ISSUE
 | ISSUER
 | ISUSERID
 | ITEM
 | ITEMNAME
 | IUTYPE
 | JAVAHOME
 | JCT
 | JOBLIST
 | JOBNAME
 | JOURNALNAME
 | JOURNALNUM
 | JTYPEID
 | JUSFIRST
 | JUSLAST
 | JUSTIFY
 | JVMCLASS
 | JVMPROFILE
 | JVMSERVER
 | JWT
 | KATAKANA
 | KATAKANAST
 | KEEP
 | KEEPTIME
 | KERBEROS
 | KEYLENGTH
 | KEYNUMBER
 | KEYPOSITION
 | L40
 | L64
 | L80
 | LANGDEDUCED
 | LANGINUSE
 | LANGUAGE
 | LANGUAGECODE
 | LASTACTTIME
 | LASTCOLDTIME
 | LASTEMERTIME
 | LASTINITTIME
 | LASTMODTIME
 | LASTUSEDINT
 | LASTUSETIME
 | LASTWARMTIME
 | LASTWRITTIME
 | LATSECDTIME
 | LDC
 | LDCMNEM
 | LDCNUM
 | LEAVEKB
 | LENGTH
 | LENGTHLIST
 | LERUNOPTS
 | LEVEL
 | LIBRARY
 | LIBRARYDSN
 | LIGHTPEN
 | LIGHTPENST
 | LINAGE_COUNTER
 | LINEADDR
 | LINK
 | LINKAGE
 | LINKAUTH
 | LINKLEVEL
 | LINKSYSNET
 | LINKSYSTEM
 | LIST
 | LISTLENGTH
 | LISTSIZE
 | LLID
 | LOAD
 | LOADPOINT
 | LOADTYPE
 | LOCALCCSID
 | LOCALITY
 | LOCALITYLEN
 | LOCATION
 | LOG
 | LOGDEFER
 | LOGMESSAGE
 | LOGMODE
 | LOGONLOGMODE
 | LOGONMSG
 | LOGREPSTATUS
 | LOSTLOCKS
 | LOW_VALUE
 | LOW_VALUES
 | LPASTATUS
 | LSRPOOLNUM
 | LUNAME
 | MAIN
 | MAJORVERSION
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
 | MEDIATYPE
 | MEMBER
 | MEMBERNAME
 | MEMLIMIT
 | MESSAGECASE
 | MESSAGEID
 | METADATA
 | METADATAFILE
 | METADATALEN
 | METHODLENGTH
 | MGMTPART
 | MICROVERSION
 | MILLISECONDS
 | MINIMUM
 | MINITEMLEN
 | MINORVERSION
 | MINRUNLEVEL
 | MINRUNRNUM
 | MINRUNVNUM
 | MINUTES
 | MIRRORLIFE
 | MMDDYY
 | MMDDYYYY
 | MODE
 | MODENAME
 | MONDATA
 | MONITOR
 | MONSTATUS
 | MONTH
 | MONTHOFYEAR
 | MONUSERID
 | MQCONN
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
 | NAME
 | NAMELENGTH
 | NAMESPACE
 | NATLANG
 | NATLANGINUSE
 | NATURE
 | NETID
 | NETNAME
 | NETUOWID
 | NETWORK
 | NETWORKID
 | NEWPASSWORD
 | NEWPHRASE
 | NEWPHRASELEN
 | NEWSECDCOUNT
 | NEXTTIME
 | NEXTTIMEHRS
 | NEXTTIMEMINS
 | NEXTTIMESECS
 | NEXTTRANSID
 | NLEOM
 | NOAUTOPAGE
 | NOCC
 | NOCHECK
 | NOCLICONVERT
 | NOCLOSE
 | NODATA
 | NODE
 | NODEHOME
 | NODOCDELETE
 | NODUMP
 | NOEDIT
 | NOFLUSH
 | NOHANDLE
 | NOINCONVERT
 | NONE
 | NONTERMREL
 | NOOUTCONVERT
 | NOQUEUE
 | NOQUIESCE
 | NOSRVCONVERT
 | NOSUSPEND
 | NOTE
 | NOTPURGEABLE
 | NOTRUNCATE
 | NOWAIT
 | NQNAME
 | NSCONTAINER
 | NUMCIPHERS
 | NUMDATAPRD
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
 | OBFORMATST
 | OBJECT
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
 | OIDCARD
 | OPCLASS
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
 | ORGABCODE
 | ORGANIZATLEN
 | ORGUNIT
 | ORGUNITLEN
 | OSGIBUNDLE
 | OSGIBUNDLEID
 | OSGISTATUS
 | OSGIVERSION
 | OSLEVEL
 | OTSTID
 | OTSTIMEOUT
 | OUTDESCR
 | OUTLINE
 | OUTLINEST
 | OUTPARTN
 | OUTTOKEN
 | OUTTOKENLEN
 | OWNER
 | PA1
 | PA2
 | PA3
 | PAGEHT
 | PAGENUM
 | PAGESTATUS
 | PAGEWD
 | PAGE_COUNTER
 | PAGING
 | PARSE
 | PARTCLASS
 | PARTCOUNT
 | PARTITIONSST
 | PARTN
 | PARTNER
 | PARTNFAIL
 | PARTNPAGE
 | PARTNS
 | PARTNSET
 | PARTTYPE
 | PASS
 | PASSBK
 | PASSWORDLEN
 | PATCH
 | PATH
 | PATHLENGTH
 | PCDSASIZE
 | PCT
 | PENDSTATUS
 | PERFCLASS
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
 | PGMINTERFACE
 | PHAPPLID
 | PHCOUNT
 | PHNETWORKID
 | PHRASE
 | PHRASELEN
 | PHSTARTTIME
 | PHTASKID
 | PHTRANSID
 | PID
 | PIPELINE
 | PIPLENGTH
 | PIPLIST
 | PLAN
 | PLANEXITNAME
 | PLATFORM
 | PLTPIUSR
 | POINT
 | POLICY
 | POOL
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
 | PROCESS
 | PROCESSTYPE
 | PROCLENGTH
 | PROCNAME
 | PROFILE
 | PROFILEDIR
 | PROGAUTOCTLG
 | PROGAUTOEXIT
 | PROGAUTOINST
 | PROGRAM
 | PROGSYMBOLST
 | PROGTYPE
 | PROTECT
 | PROTECTNUM
 | PROTOCOL
 | PRTCOPYST
 | PRTYAGING
 | PS
 | PSB
 | PSDINTERVAL
 | PSDINTHRS
 | PSDINTMINS
 | PSDINTSECS
 | PSTYPE
 | PTCOUNT
 | PTHREADS
 | PTSTARTTIME
 | PTTASKID
 | PTTRANSID
 | PUDSASIZE
 | PUNCH
 | PURGEABILITY
 | PURGEABLE
 | PURGEABLEST
 | PURGEACTION
 | PURGECYCLEM
 | PURGECYCLES
 | PURGETHRESH
 | PUSH
 | PUT
 | QNAME
 | QUALIFIER
 | QUALLEN
 | QUERY
 | QUERYPARM
 | QUERYST
 | QUERYSTRING
 | QUERYSTRLEN
 | QUEUE
 | QUEUED
 | QUEUELIMIT
 | QUIESCESTATE
 | RANKING
 | RBA
 | RBATYPE
 | RBN
 | RDATT
 | RDSASIZE
 | READ
 | READINTEG
 | READNEXT
 | READPREV
 | READQ
 | REALM
 | REALMLEN
 | REASON
 | REATTACH
 | RECEIVECOUNT
 | RECEIVER
 | RECFM
 | RECORDFORMAT
 | RECORDING
 | RECORDLEN
 | RECORDLENGTH
 | RECORDSIZE
 | RECOVSTATUS
 | REDIRECTTYPE
 | REDUCE
 | REENTPROTECT
 | REFPARMS
 | REFPARMSLEN
 | REGIONUSERID
 | RELATESINDEX
 | RELATESTYPE
 | RELATESURI
 | RELATION
 | RELEASE
 | RELREQST
 | RELTYPE
 | REMOTENAME
 | REMOTEPREFIX
 | REMOTESYSNET
 | REMOTESYSTEM
 | REMOTETABLE
 | REMOVE
 | REPEATABLE
 | REPETABLE
 | REPLICATION
 | REPLY
 | REPLYLENGTH
 | REQID
 | REQTYPE
 | REQUESTTYPE
 | RES
 | RESCLASS
 | RESCOUNT
 | RESETBR
 | RESID
 | RESIDENCY
 | RESIDLENGTH
 | RESLEN
 | RESNAME
 | RESOURCE
 | RESOURCENAME
 | RESOURCETYPE
 | RESP
 | RESP2
 | RESPWAIT
 | RESRCECLASS
 | RESSEC
 | RESTART
 | RESTYPE
 | RESULT
 | RESUME
 | RESYNCMEMBER
 | RESYNCNUMBER
 | RESYNCSTATUS
 | RETAIN
 | RETCODE
 | RETCORD
 | RETLOCKS
 | RETRIECE
 | RETRIEVE
 | RETURNPROG
 | REUSELIMIT
 | REWIND
 | RIDFLD
 | RLSACCESS
 | RLSSTATUS
 | RMIQFY
 | RMIST
 | ROLE
 | ROLELENGTH
 | ROLLBACK
 | ROUTE
 | ROUTECODES
 | ROUTESTATUS
 | ROUTING
 | RPROCESS
 | RRESOURCE
 | RRN
 | RTERMID
 | RTIMEOUT
 | RTRANSID
 | RULEGROUP
 | RULEITEM
 | RULETYPE
 | RUNAWAY
 | RUNAWAYTYPE
 | RUNSTATUS
 | RUNTIME
 | SADDRLENGTH
 | SCANDELAY
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
 | SECONDS
 | SECPORT
 | SECURITY
 | SECURITYMGR
 | SECURITYNAME
 | SECURITYST
 | SEGMENTLIST
 | SENDCOUNT
 | SENDER
 | SENDMTOMST
 | SERIALNUM
 | SERIALNUMLEN
 | SERVER
 | SERVERADDR
 | SERVERADDRNU
 | SERVERCONV
 | SERVERIPADDR
 | SERVERNAME
 | SERVERPORT
 | SERVSTATUS
 | SESSION
 | SESSIONTYPE
 | SESSTOKEN
 | SET
 | SETTRANSID
 | SHARED
 | SHARELOCKS
 | SHARESTATUS
 | SHELF
 | SHUTDOWN
 | SHUTDOWNST
 | SHUTOPTION
 | SHUTSTATUS
 | SIGDATA
 | SIGNAL
 | SIGNID
 | SIGNOFF
 | SIGNON
 | SIGNONSTATUS
 | SINGLESTATUS
 | SIT
 | SNAMELENGTH
 | SOAPFAULT
 | SOAPLEVEL
 | SOAPRNUM
 | SOAPVNUM
 | SOCKETCLOSE
 | SOCKPOOLSIZE
 | SOSABOVEBAR
 | SOSABOVELINE
 | SOSBELOWLINE
 | SOSI
 | SOSIST
 | SOSSTATUS
 | SPECIFTCPS
 | SPIST
 | SPOOLCLOSE
 | SPOOLOPEN
 | SPOOLREAD
 | SPOOLWRITE
 | SRRSTATUS
 | SRRTASKS
 | SRVCNAME
 | SRVCONVERT
 | SRVCSTATUS
 | SRVRADDR6NU
 | SRVRIPFAMILY
 | SSLCACHE
 | SSLTYPE
 | STANDBYMODE
 | STARTBR
 | STARTBROWSE
 | STARTCODE
 | STARTSCRIPT
 | STARTSTATUS
 | STARTTIME
 | STARTUP
 | STARTUPDATE
 | STATE
 | STATELEN
 | STATIONID
 | STATSQUEUE
 | STATUS
 | STATUSCODE
 | STATUSLEN
 | STATUSTEXT
 | STDERR
 | STDOUT
 | STORAGE
 | STORAGECLEAR
 | STOREPROTECT
 | STREAMNAME
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
 | SUBTASKS
 | SUSPEND
 | SUSPENDTIME
 | SUSPENDTYPE
 | SUSPENDVALUE
 | SUSPSTATUS
 | SWITCHSTATUS
 | SYMBOL
 | SYMBOLLIST
 | SYNCHRONOUS
 | SYNCLEVEL
 | SYNCONRETURN
 | SYNCPOINT
 | SYNCPOINTST
 | SYSDUMPING
 | SYSID
 | SYSOUTCLASS
 | SYSTEMLOG
 | SYSTEMSTATUS
 | TABLE
 | TABLENAME
 | TABLES
 | TABLESIZE
 | TALENGTH
 | TARGETCOUNT
 | TASK
 | TASKDATAKEY
 | TASKDATALOC
 | TASKID
 | TASKPRIORITY
 | TASKS
 | TASKSTARTST
 | TCAMCONTROL
 | TCB
 | TCBLIMIT
 | TCBS
 | TCEXITSTATUS
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
 | TEMPLATETYPE
 | TERMCODE
 | TERMID
 | TERMINAL
 | TERMMODEL
 | TERMPRIORITY
 | TERMSTATUS
 | TEXTKYBD
 | TEXTKYBDST
 | TEXTLENGTH
 | TEXTPRINT
 | TEXTPRINTST
 | THREADCOUNT
 | THREADERROR
 | THREADLIMIT
 | THREADS
 | THREADWAIT
 | THRESHOLD
 | TIME
 | TIMEOUT
 | TIMEOUTINT
 | TIMER
 | TIMESEP
 | TNADDR
 | TNIPFAMILY
 | TNPORT
 | TOACTIVITY
 | TOCHANNEL
 | TOCONTAINER
 | TOFLENGTH
 | TOKEN
 | TOKENLEN
 | TOKENTYPE
 | TOLENGTH
 | TOPROCESS
 | TPNAME
 | TPNAMELEN
 | TRACE
 | TRACENUM
 | TRACING
 | TRAILER
 | TRAN
 | TRANCLASS
 | TRANDUMPING
 | TRANISOLATE
 | TRANPRIORITY
 | TRANSACTION
 | TRANSFORM
 | TRANSID
 | TRANSMODE
 | TRIGGER
 | TRIGGERLEVEL
 | TRIGMONTASKS
 | TRNGRPID
 | TRPROF
 | TRT
 | TS
 | TSMAININUSE
 | TSMAINLIMIT
 | TSMODEL
 | TSQUEUE
 | TSQUEUELIMIT
 | TST
 | TTISTATUS
 | TWA
 | TWALENG
 | TWASIZE
 | TYPE
 | TYPENAME
 | TYPENAMELEN
 | TYPENS
 | TYPENSLEN
 | UCTRANST
 | UDSASIZE
 | UNATTEND
 | UNCOMMITTED
 | UNESCAPED
 | UNEXPIN
 | UNLOCK
 | UOW
 | UOWSTATE
 | UPDATE
 | UPDATEMODEL
 | URI
 | URID
 | URIMAP
 | URIMAPLIMIT
 | URL
 | URLLENGTH
 | URM
 | USAGE
 | USECOUNT
 | USER
 | USERAREA
 | USERAREALEN
 | USERAUTH
 | USERCORRDATA
 | USERDATAKEY
 | USERID
 | USERNAME
 | USERNAMELEN
 | USERPRIORITY
 | USERSTATUS
 | USERTAG
 | UTIL
 | VALIDATION
 | VALIDATIONST
 | VALIDITY
 | VALUE
 | VALUELENGTH
 | VARIABLENAME
 | VERIFY
 | VERSIONLEN
 | VFORMST
 | VOLUME
 | VOLUMELENG
 | WAIT
 | WAITCAUSE
 | WAITCICS
 | WAITSTATE
 | WEB
 | WEBSERVICE
 | WEBSERVLIMIT
 | WHEN_COMPILED
 | WLMOPENST
 | WORKDIR
 | WPMEDIA1
 | WPMEDIA2
 | WPMEDIA3
 | WPMEDIA4
 | WRAP
 | WRITEQ
 | WSACONTEXT
 | WSAEPR
 | WSBIND
 | WSDIR
 | WSDLFILE
 | XCFGROUP
 | XCTL
 | XID
 | XLNSTATUS
 | XMLCONTAINER
 | XMLSCHEMA
 | XMLTODATA
 | XMLTRANSFORM
 | XOPDIRECTST
 | XOPSUPPORTST
 | XRBA
 | XRFSTATUS
 | XSDBIND
 | YEAR
 | YYDDD
 | YYDDMM
 | YYMMDD
 | YYYYDDD
 | YYYYDDMM
 | YYYYMMDD
 | ZCPTRACING;

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

cicsDfhRespLiteral
   : DFHRESP LPARENCHAR (cics_conditions | cicsWord | literal) RPARENCHAR
   ;

cicsDfhValueLiteral
   : DFHVALUE LPARENCHAR (cics_conditions | cicsWord | literal) RPARENCHAR
   ;

literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral | cicsDfhRespLiteral | cicsDfhValueLiteral
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