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

startRule: .*? ((cicsExecBlock | cicsDfhRespLiteral | cicsDfhValueLiteral) .*?) * EOF;
compilerDirective: (.*? compilerXOpts)* .*? EOF;
cicsExecBlock: EXEC CICS allCicsRule END_EXEC DOT?
             | EXEC CICS (allCicsRule | invalidInput)+ END_EXEC DOT?
             | EXEC CICS END_EXEC DOT?
             | {notifyError("cicsParser.missingEndExec");} EXEC CICS allCicsRule
             | {notifyError("cicsParser.missingEndExec");} EXEC CICS
             ;

allCicsRule: cics_send | cics_receive | cics_add | cics_address | cics_allocate | cics_asktime | cics_assign | cics_bif |
                       cics_build | cics_cancel | cics_change | cics_change_task | cics_check | cics_connect | cics_converttime |
                       cics_define | cics_delay | cics_delete | cics_deleteq | cics_deq | cics_document | cics_dump | cics_endbr |
                       cics_endbrowse | cics_enq | cics_enter | cics_extract | cics_force | cics_formattime | cics_free |
                       cics_freemain | cics_gds | cics_get | cics_getmain | cics_getnext | cics_handle | cics_ignore | cics_inquire |
                       cics_invoke | cics_issue | cics_link | cics_load | cics_monitor | cics_move | cics_point | cics_pop |
                       cics_post | cics_purge | cics_push | cics_put | cics_query | cics_read | cics_readnext |
                       cics_readq | cics_release | cics_remove | cics_reset | cics_resetbr | cics_resume | cics_retrieve |
                       cics_return | cics_rewind | cics_rewrite | cics_route | cics_run | cics_signal | cics_signoff | cics_signon |
                       cics_soapfault | cics_spoolclose | cics_spoolopen | cics_spoolread | cics_spoolwrite | cics_start |
                       cics_startbr | cics_startbrowse | cics_suspend | cics_syncpoint | cics_test | cics_transform | cics_unlock |
                       cics_update | cics_verify | cics_wait | cics_waitcics | cics_web | cics_write | cics_writeq | cics_wsacontext |
                       cics_wsaepr | cics_xctl | cics_converse | cics_abend | cics_acquire | allExciRules
                      ;

// exci rules
allExciRules: cics_exci_link | cics_exci_delete | cics_exci_delete_container | cics_exci_endbrowse_container |
              cics_exci_get_container | cics_exci_get_next_container | cics_exci_move_container |
              cics_exci_put_container | cics_exci_query_channel | cics_exci_startbrowse_container ;

// compiler options
compilerXOpts
   : XOPTS LPARENCHAR compilerXOptsOption (commaClause? compilerXOptsOption)* RPARENCHAR
   ;

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
cics_receive: RECEIVE (cics_receive_group | cics_receive_appc | cics_receive_lu61 | cics_partn | cics_rcv_map);
cics_receive_group: (cics_into | cics_fLength | ASIS | BUFFER | NOTRUNCATE| cics_handle_response)+;
cics_receive_appc: (CONVID cics_name | cics_into | cics_fLength | NOTRUNCATE | STATE cics_cvda | cics_handle_response)+;
cics_receive_lu61: (SESSION cics_name | cics_into | cics_fLength | NOTRUNCATE | cics_handle_response)+;
cics_fLength: ((LENGTH cics_data_area | FLENGTH cics_data_area) | cics_maxlength)+;

cics_rcv_map: MAP (cics_receive_map | cics_receive_mappingdev);
cics_receive_map: cics_name (MAPSET cics_name | cics_into | TERMINAL | ASIS | INPARTN cics_name |
                  FROM cics_data_area | cics_fLength | cics_handle_response)+;
cics_receive_mappingdev: cics_name (MAPPINGDEV cics_data_value | FROM cics_data_area | LENGTH cics_data_area |
                         MAPSET cics_name | cics_into | cics_handle_response)+;
cics_partn: PARTN cics_data_area (cics_into | cics_fLength | ASIS | cics_handle_response)+;

/** SEND: */
cics_send: SEND (cics_send_group | cics_send_mro | cics_send_appc | cics_send_control | cics_send_map | cics_send_page |
           cics_send_partnset | cics_send_text | cics_len_map);
cics_send_group: cics_send_from (cics_send_from_wait | cics_send_from_ctlchar | cics_send_3600_01 | cics_send_2980);

cics_send_from_wait: WAIT? (INVITE | LAST | cics_send_defaultmax | cics_send_lu23 | cics_handle_response)*;
cics_send_defaultmax: (CNOTCOMPL | DEFRESP | STRFIELD | FMH | cics_handle_response)+;
cics_send_lu23: (cics_send_erase | CTLCHAR cics_data_value | STRFIELD | DEFRESP | cics_handle_response)+;
cics_send_from_ctlchar: (CTLCHAR cics_data_value)? (cics_send_3560_3270 | cics_send_2260);
cics_send_3560_3270: WAIT? (cics_send_erase | INVITE | LAST | CNOTCOMPL | DEFRESP | FMH | cics_handle_response)*;
cics_send_2260: (LINEADDR cics_data_value | WAIT | LEAVEKB | cics_handle_response)+;
cics_send_3600_01: (LDC cics_name | FMH | WAIT | INVITE | LAST | CNOTCOMPL | DEFRESP | cics_handle_response)+;
cics_send_2980: (PASSBK | CBUFF)?;
cics_len_map: ((LENGTH cics_data_value | FLENGTH cics_data_value) | cics_send_map | cics_handle_response)+;
cics_send_mro: (SESSION cics_name | WAIT | INVITE | LAST | ATTACHID cics_name | FROM cics_data_area |
               LENGTH cics_data_value | FLENGTH cics_data_value | FMH | DEFRESP | STATE cics_cvda | cics_send_erase | cics_handle_response)+;
cics_send_appc: (CONVID cics_name | cics_send_from | INVITE | LAST | CONFIRM | WAIT | STATE cics_cvda | cics_handle_response)+;
cics_send_control: CONTROL (cics_send_control_min | cics_send_control_std | cics_send_control_full);
cics_send_control_min: (cics_send_cursor | FORMFEED | cics_send_erase | ERASEAUP | PRINT | FREEKB | ALARM | FRSET | cics_handle_response)+;
cics_send_control_std: (MSR cics_data_value | OUTPARTN cics_name | ACTPARTN cics_name | LDC cics_name | cics_handle_response)+;
cics_send_control_full: (ACCUM | cics_send_terminal | SET cics_ref | PAGING | REQID cics_name | HONEOM | L40 | L64 | L80 | cics_handle_response)+;
cics_send_map: MAP cics_name (cics_send_map_null | cics_send_map_mappingdev);
cics_send_map_null: (cics_send_map_min | cics_send_map_std | cics_send_map_full);
cics_send_map_min: (MAPSET cics_name | MAPONLY | FROM cics_data_area | DATAONLY | LENGTH cics_data_value
                   | cics_send_cursor | FORMFEED | cics_send_erase | ERASEAUP | PRINT | FREEKB | ALARM | FRSET | cics_handle_response)+;
cics_send_map_std: (NLEOM | MSR cics_data_value | FMHPARM cics_name | OUTPARTN cics_name | ACTPARTN cics_name |
                   LDC cics_name | cics_handle_response)+;
cics_send_map_full: (ACCUM | cics_send_terminal | SET cics_ref | PAGING | REQID cics_name | NOFLUSH
                    | HONEOM | L40 | L64 | L80 | cics_handle_response)+;
cics_send_map_mappingdev: MAPPINGDEV cics_data_value (SET cics_ref | MAPSET cics_name | MAPONLY | FROM cics_data_area |
                          DATAONLY | LENGTH cics_data_value | cics_send_cursor | FORMFEED | ERASE | ERASEAUP | PRINT |
                          FREEKB | ALARM | FRSET | cics_handle_response)+;

cics_send_page: PAGE (RELEASE | TRANSID cics_name | RETAIN | TRAILER cics_data_area | SET cics_ref |
                cics_send_autopage | NOAUTOPAGE | OPERPURGE | FMHPARM cics_name | LAST | cics_handle_response)*;
cics_send_partnset: PARTNSET cics_name?;
cics_send_text: TEXT (cics_send_text_null | cics_send_text_mapped | cics_send_text_noedit);
cics_send_text_null: (cics_send_text_std | cics_send_text_full);
cics_send_text_std: FROM cics_data_area cics_send_text_std_args*;
cics_send_text_std_args: LENGTH cics_data_value | CURSOR cics_data_value | FORMFEED | cics_send_erase |
                     PRINT | FREEKB | ALARM | NLEOM | FMHPARM cics_name | OUTPARTN cics_name | ACTPARTN cics_name |
                     LDC cics_name | MSR cics_data_value | cics_handle_response;
cics_send_text_full: FROM cics_data_area (cics_send_text_std_args | cics_send_terminal | SET cics_ref | PAGING | REQID cics_name | HEADER cics_data_area |
                     TRAILER cics_data_area | JUSTIFY cics_data_value | JUSFIRST | JUSLAST | ACCUM |
                     HONEOM | L40 | L64 | L80 | cics_handle_response)*;
cics_send_text_mapped: MAPPED (FROM cics_data_area | LENGTH cics_data_value | cics_send_terminal |
                       SET cics_ref | PAGING | REQID cics_name | cics_handle_response)*;
cics_send_text_noedit: NOEDIT (FROM cics_data_area | LENGTH cics_data_value | cics_send_erase | PRINT | FREEKB | ALARM |
                       OUTPARTN cics_name | cics_send_terminal | PAGING | REQID cics_name |
                       HONEOM | L40 | L64 | L80 | cics_handle_response)*;

cics_send_from: FROM cics_data_area (LENGTH cics_data_value | FLENGTH cics_data_value) cics_handle_response?;
cics_send_erase: ERASE (DEFAULT | ALTERNATE)?;
cics_send_cursor: CURSOR cics_data_value?;
cics_send_terminal: (TERMINAL | WAIT | LAST)+;
cics_send_autopage: AUTOPAGE (CURRENT | ALL)?;

/** CONVERSE: */
cics_converse: CONVERSE (cics_converse_appc | cics_converse_lu23_3270 | cics_converse_lu61 | cics_converse_mro | cics_cnv_group);

cics_cnv_group: cics_converse_from_into_to (cics_converse_default | cics_converse_lu4 | cics_converse_scs |
                cics_converse_3601 | cics_converse_3614_3653_3767 | cics_converse_3650int_3770 |
                cics_converse_3650_3270 | cics_converse_3680_3790F | cics_converse_3790_3270 | cics_converse_2260);
cics_converse_default: (cics_maxlength | NOTRUNCATE | cics_handle_response)+;
cics_converse_lu4:  (DEFRESP | cics_maxlength | FMH | NOTRUNCATE | cics_handle_response)+;
cics_converse_scs:   (cics_maxlength | DEFRESP | STRFIELD | NOTRUNCATE | cics_handle_response)+;
cics_converse_3601:  (LDC cics_name | FMH | DEFRESP | cics_maxlength | NOTRUNCATE | cics_handle_response)+;
cics_converse_3614_3653_3767:   (DEFRESP | cics_maxlength | NOTRUNCATE | cics_handle_response)+;
cics_converse_3650int_3770:   (DEFRESP | FMH | cics_maxlength | NOTRUNCATE | cics_handle_response)+;
cics_converse_3650_3270:   (CTLCHAR cics_data_value | cics_converse_erase | DEFRESP | FMH | cics_maxlength | NOTRUNCATE | cics_handle_response)+;
cics_converse_3680_3790F:   (FMH | DEFRESP | cics_maxlength | NOTRUNCATE | cics_handle_response)+;
cics_converse_3790_3270:   (DEFRESP | CTLCHAR cics_data_value | cics_converse_erase2 | cics_handle_response)+;
cics_converse_2260:  cics_converse_default (CTLCHAR cics_data_value | LINEADDR cics_data_value | LEAVEKB | cics_handle_response)*;

cics_converse_appc:  (CONVID cics_name | cics_converse_from_into_to | cics_converse_default | STATE cics_cvda | cics_handle_response)+;
cics_converse_lu23_3270:  cics_converse_from_into (cics_converse_erase | CTLCHAR cics_data_value | STRFIELD |
                          TOLENGTH cics_data_area | TOFLENGTH cics_data_area | cics_maxlength | DEFRESP | NOTRUNCATE |
                          ASIS | cics_handle_response)*;
cics_converse_lu61:  (cics_converse_from61 | CONVID cics_name | SESSION cics_name | ATTACHID cics_name | cics_into |
                     TOLENGTH cics_data_area | TOFLENGTH cics_data_area | cics_maxlength | NOTRUNCATE | DEFRESP | cics_handle_response)+;
cics_converse_mro:  (CONVID cics_name | SESSION cics_name | ATTACHID cics_name | cics_converse_from61 |
                    TOLENGTH cics_data_area | TOFLENGTH cics_data_area | cics_maxlength | NOTRUNCATE | DEFRESP |
                    STATE cics_cvda | cics_handle_response)+;

cics_converse_erase: ERASE (DEFAULT | ALTERNATE)?;
cics_converse_erase2: (cics_converse_erase | cics_maxlength | NOTRUNCATE | cics_handle_response)+;

cics_converse_from: (FROM cics_data_area | FROMLENGTH cics_data_value | FROMFLENGTH cics_data_value | cics_handle_response)+;
cics_converse_from61: (cics_converse_from | FMH)+;

cics_into: (INTO cics_data_area | SET cics_ref) cics_handle_response?;
cics_converse_from_into: cics_converse_from cics_into;
cics_converse_from_into_to: cics_converse_from_into (TOLENGTH cics_data_area | TOFLENGTH cics_data_area) cics_handle_response?;
cics_maxlength: MAXLENGTH cics_data_value | MAXFLENGTH cics_data_value;


/** ABEND: */
cics_abend: ABEND (ABCODE cics_name | CANCEL | NODUMP | cics_handle_response)*;

/** ACQUIRE */
cics_acquire: PROCESS cics_data_value (PROCESSTYPE cics_data_value |
              ACTIVITYID cics_data_value | cics_handle_response?);

/** ADD SUBEVENT */
cics_add: ADD (SUBEVENT cics_data_value | EVENT cics_data_value | cics_handle_response)+;

/** ADDRESS / ADDRESS SET */
cics_address: ADDRESS (cics_address_null | cics_address_set);
cics_address_null: (ACEE cics_ref | COMMAREA cics_ref |
                   CWA cics_ref | EIB cics_ref |
                   TCTUA cics_ref | TWA cics_ref | cics_handle_response)+;
cics_address_set: (SET cics_data_area USING cics_ref |
                  SET cics_ref USING cics_data_area) cics_handle_response?;

/** ALLOCATE (all of them) */
cics_allocate: ALLOCATE (cics_allocate_sysid | cics_allocate_session | cics_allocate_partner);
cics_allocate_sysid: SYSID cics_data_area (PROFILE cics_name | NOQUEUE | STATE cics_cvda | cics_handle_response)*;
cics_allocate_session: SESSION  cics_name (PROFILE cics_name | NOQUEUE | cics_handle_response)*;
cics_allocate_partner: PARTNER cics_name (NOQUEUE | STATE cics_cvda | cics_handle_response)*;

/** ASKTIME */
cics_asktime: ASKTIME cics_handle_response? (ABSTIME (cics_data_area | cics_handle_response)+)?;

/** ASSIGN */
cics_assign: ASSIGN (ABCODE cics_data_area | ABDUMP cics_data_area | ABPROGRAM cics_data_area | ACTIVITY cics_data_area |
             ACTIVITYID cics_data_area | ALTSCRNHT cics_data_area | ALTSCRNWD cics_data_area | APLKYBD cics_data_area |
             APLTEXT cics_data_area | APPLID cics_data_area | ASRAINTRPT cics_data_area | ASRAKEY cics_cvda |
             ASRAPSW cics_data_area | ASRAREGS cics_data_area | ASRASPC cics_cvda | ASRASTG cics_cvda |
             BRIDGE cics_data_area | BTRANS cics_data_area | CHANNEL cics_data_area | CMDSEC cics_data_area |
             COLOR cics_data_area | CWALENG cics_data_area | DEFSCRNHT cics_data_area | DEFSCRNWD cics_data_area |
             DELIMITER cics_data_area | DESTCOUNT cics_data_area | DESTID cics_data_area | DESTIDLENG cics_data_area |
             DSSCS cics_data_area | DS3270 cics_data_area | EWASUPP cics_data_area | EXTDS cics_data_area |
             FACILITY cics_data_area | FCI cics_data_area | GCHARS cics_data_area | GCODES cics_data_area |
             GMMI cics_data_area | HILIGHT cics_data_area | INITPARM cics_data_area | INITPARMLEN cics_data_area |
             INPARTN cics_data_area | INVOKINGPROG cics_data_area | KATAKANA cics_data_area | LANGINUSE cics_data_area |
             LDCMNEM cics_data_area | LDCNUM cics_data_area | MAPCOLUMN cics_data_area | MAPHEIGHT cics_data_area)*
             (MAPLINE cics_data_area | MAPWIDTH cics_data_area | MSRCONTROL cics_data_area | NATLANGINUSE cics_data_area |
             NETNAME cics_data_area | NEXTTRANSID cics_data_area | NUMTAB cics_data_area | OPCLASS cics_data_area |
             OPERKEYS cics_data_area | OPID cics_data_area | OPSECURITY cics_data_area | ORGABCODE cics_data_area |
             OUTLINE cics_data_area | PAGENUM cics_data_area | PARTNPAGE cics_data_area | PARTNS cics_data_area |
             PARTNSET cics_data_area | PRINSYSID cics_data_area | PROCESS cics_data_area | PROCESSTYPE cics_data_area |
             PROGRAM cics_data_area | PS cics_data_area | QNAME cics_data_area | RESSEC cics_data_area |
             RESTART cics_data_area | RETURNPROG cics_data_area | SCRNHT cics_data_area | SCRNWD cics_data_area |
             SIGDATA cics_data_area | SOSI cics_data_area | STARTCODE cics_data_area | STATIONID cics_data_area |
             SYSID cics_data_area | TASKPRIORITY cics_data_area | TCTUALENG cics_data_area | TELLERID cics_data_area |
             TERMCODE cics_data_area | TERMPRIORITY cics_data_area | TEXTKYBD cics_data_area | TEXTPRINT cics_data_area |
             TRANPRIORITY cics_data_area | TWALENG cics_data_area | UNATTEND cics_data_area | USERID cics_data_area |
             USERNAME cics_data_area | USERPRIORITY cics_data_area | VALIDATION cics_data_area | cics_handle_response)*;

/** BIF DEEDIT / BIF DIGEST */
cics_bif: BIF (cics_bif_deedit | cics_bif_digest);
cics_bif_deedit: DEEDIT (FIELD cics_data_area | LENGTH cics_data_value | cics_handle_response)+;
cics_bif_digest: DIGEST (RECORD cics_data_value | RECORDLEN cics_data_value | HEX | BINARY | BASE64 | DIGESTTYPE cics_cvda |
                 RESULT cics_data_area | cics_handle_response)+;

/** BUILD ATTACH (both of them) */
cics_build: BUILD ATTACH (ATTACHID cics_name | PROCESS cics_name | RESOURCE cics_name | RPROCESS cics_name |
            RRESOURCE cics_name | QUEUE cics_name | IUTYPE cics_data_value | DATASTR cics_data_value |
            RECFM cics_data_value | cics_handle_response)+;

/** CANCEL (both of them) */
cics_cancel: CANCEL (ACTIVITY cics_data_value | ACQACTIVITY | ACQPROCESS | cics_cancel_reqid | cics_handle_response)*;
cics_cancel_reqid: REQID cics_name (SYSID cics_data_area |
                   TRANSID cics_name | cics_handle_response)*;

/** CHANGE PHRASE / PASSWORD / TASK */
cics_change: CHANGE (cics_change_phrase | cics_change_password);
cics_change_phrase: PHRASE cics_data_area (PHRASELEN cics_data_value | NEWPHRASE cics_data_area | NEWPHRASELEN cics_data_value |
                    USERID cics_data_value | ESMREASON cics_data_area | ESMRESP cics_data_area | cics_handle_response)+;
cics_change_password: PASSWORD cics_data_value (NEWPASSWORD cics_data_value | USERID cics_data_value |
                      ESMREASON cics_data_area | ESMRESP cics_data_area | cics_handle_response)+;
cics_change_task: TASK (PRIORITY cics_data_value)? cics_handle_response?;

/** CHECK ACQPROCESS / ACTIVITY / TIMER */
cics_check: CHECK (cics_check_activity | cics_check_timer);
cics_check_activity: (ACQPROCESS | ACTIVITY cics_data_value | ACQACTIVITY | COMPSTATUS cics_cvda | ABCODE cics_data_area |
                     ABPROGRAM cics_data_area | MODE cics_cvda | SUSPSTATUS cics_cvda | cics_handle_response)+;
cics_check_timer: TIMER cics_data_value cics_handle_response? STATUS cics_cvda cics_handle_response?;

cics_conditions: EOC | EODS | INVMPSZ | INVPARTN | INVREQ | MAPFAIL | PARTNFAIL | RDATT | UNEXPIN | ERROR | DUPREC;

/** CONNECT PROCESS */
cics_connect: CONNECT PROCESS (CONVID cics_name | SESSION cics_name | PROCNAME cics_data_area |
              PROCLENGTH cics_data_value | PARTNER cics_name | cics_connect_piplist | SYNCLEVEL |
              cics_data_value | STATE cics_cvda | cics_handle_response)+;
cics_connect_piplist: PIPLIST cics_data_area cics_handle_response? (PIPLENGTH cics_data_value)? cics_handle_response?;

/** CONVERTTIME */
cics_converttime: CONVERTTIME (DATESTRING cics_data_area | ABSTIME cics_data_area | cics_handle_response)+;

/** DEFINE (all of them) */
cics_define: DEFINE (cics_define_activity | cics_define_composite | cics_define_counter | cics_define_dcounter |
             cics_define_input | cics_define_process | cics_define_timer);
cics_define_activity: ACTIVITY cics_data_value (EVENT cics_data_value | TRANSID cics_data_value
                      PROGRAM cics_data_value | USERID cics_data_value | ACTIVITYID cics_data_area | cics_handle_response)+;
cics_define_composite: COMPOSITE (EVENT cics_data_value | AND | OR | subevent_option cics_data_value | cics_handle_response)+;
subevent_option: SUBEVENT1 | SUBEVENT2 | SUBEVENT3 | SUBEVENT4 | SUBEVENT5 | SUBEVENT6 | SUBEVENT7 | SUBEVENT8;

cics_define_counter: COUNTER cics_name (POOL cics_name | cics_define_value | MAXIMUM cics_data_value | cics_handle_response)*;
cics_define_value: VALUE cics_data_value (MINIMUM cics_data_value | cics_handle_response)*;
cics_define_dcounter: DCOUNTER cics_name (POOL cics_name | cics_define_value | MAXIMUM cics_data_area | cics_handle_response)*;
cics_define_input: INPUT (EVENT cics_data_value | cics_handle_response)+;
cics_define_process: PROCESS cics_data_value (PROCESSTYPE cics_data_value | TRANSID cics_data_value |
                     PROGRAM cics_data_value | USERID cics_data_value | NOCHECK | cics_handle_response)+;
cics_define_timer: (TIMER cics_data_value EVENT cics_data_value | cics_define_after | cics_define_at)+;
cics_define_after: AFTER (DAYS cics_data_value | HOURS cics_data_value | MINUTES cics_data_value |
                   SECONDS cics_data_value | cics_handle_response)+;
cics_define_at: AT (HOURS cics_data_value | MINUTES cics_data_value | SECONDS cics_data_value | cics_handle_response)+ cics_define_on? cics_handle_response?;
cics_define_on: ON YEAR cics_data_value (MONTH cics_data_value DAYOFMONTH cics_data_value | DAYOFYEAR cics_data_value) cics_handle_response?;

/** DELAY */
cics_delay: DELAY (INTERVAL cics_zero_digit | INTERVAL cics_hhmmss | TIME cics_hhmmss | cics_delay_for | cics_dealy_until | REQID cics_name | cics_handle_response)+;
cics_delay_for: FOR (HOURS cics_data_value | MINUTES cics_data_value | SECONDS cics_data_value | MILLISECS cics_data_value)+;
cics_dealy_until: UNTIL (HOURS cics_data_value | MINUTES cics_data_value | SECONDS cics_data_value)+;

/** DELETE (all of them) */
cics_delete: DELETE (cics_delete_file | ACTIVITY cics_data_value | cics_delete_container | cics_delete_counter |
             EVENT cics_data_value | TIMER cics_data_value | cics_handle_response)+;
cics_delete_file: cics_file_name (TOKEN cics_data_area | cics_delete_ridfld | SYSID cics_data_area | NOSUSPEND |
                  RBA | RRN | cics_handle_response)*;
cics_delete_ridfld: RIDFLD cics_data_area (KEYLENGTH cics_data_value | GENERIC | NUMREC cics_data_area | cics_handle_response)*;
cics_delete_container: CONTAINER cics_data_value (ACTIVITY cics_data_value | ACQACTIVITY | PROCESS | ACQPROCESS |
                       CHANNEL cics_data_value | cics_handle_response)*;
cics_delete_counter: (COUNTER cics_name | DCOUNTER cics_name | POOL cics_name | cics_handle_response)+;

/** DELETEQ TD/TS */
cics_deleteq: DELETEQ (TD | TS | QUEUE cics_name | QNAME cics_name | SYSID cics_data_area | cics_handle_response)+;

/** DEQ */
cics_deq: DEQ (RESOURCE cics_data_area | LENGTH cics_data_value | UOW | MAXLIFETIME cics_cvda | TASK | cics_handle_response)+;

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
cics_document_set: SET (DOCTOKEN cics_data_area | SYMBOL cics_name | VALUE cics_data_area | cics_document_set_symbollist
                   LENGTH cics_data_value | UNESCAPED | cics_handle_response)+;

/** DUMP TRANSACTION */
cics_dump: DUMP (TRANSACTION | DUMPCODE cics_name |  FROM cics_data_area | LENGTH cics_data_value | FLENGTH cics_data_value |
           COMPLETE | TRT |  SEGMENTLIST cics_data_area | LENGTHLIST cics_data_area | NUMSEGMENTS cics_data_area |
           TASK | STORAGE | PROGRAM | TERMINAL | TABLES | FCT | PCT | PPT | SIT | TCT | DUMPID cics_data_area | cics_handle_response)+;

/** ENDBR */
cics_endbr: ENDBR cics_file_name (REQID cics_data_value | SYSID cics_data_area | cics_handle_response)*;

/** ENDBROWSE (all of them) */
cics_endbrowse: ENDBROWSE (ACTIVITY | CONTAINER | EVENT | PROCESS | BROWSETOKEN cics_data_value | cics_handle_response)+;

/** ENQ */
cics_enq: ENQ (RESOURCE cics_data_area | LENGTH cics_data_value | UOW | TASK | MAXLIFETIME cics_cvda | NOSUSPEND | cics_handle_response)+;

/** ENTER TRACENUM */
cics_enter: ENTER (TRACENUM cics_data_value | FROM cics_data_area | FROMLENGTH cics_data_area | RESOURCE cics_name | EXCEPTION | cics_handle_response)+;

/** EXTRACT (all of them) */
cics_extract: EXTRACT (cics_extract_attach | cics_extract_attributes | cics_extract_certificate |
              cics_extract_logonmsg | cics_extract_process | cics_extract_tcpip | cics_extract_tct | cics_extract_web);
cics_extract_attach: ATTACH (ATTACHID cics_name | CONVID cics_name | SESSION cics_name | PROCESS cics_data_area |
                     RESOURCE cics_data_area | RPROCESS cics_data_area | RRESOURCE cics_data_area |
                     QUEUE cics_data_area | IUTYPE cics_data_area | DATASTR cics_data_area | RECFM cics_data_area | cics_handle_response)*;

cics_extract_attributes: ATTRIBUTES (CONVID cics_name | SESSION cics_name | STATE cics_cvda) | cics_handle_response+;

cics_extract_certificate: CERTIFICATE cics_ref (LENGTH cics_data_area | SERIALNUM cics_ref | SERIALNUMLEN cics_data_area |
                          USERID cics_data_area | OWNER | ISSUER | COMMONNAME cics_ref | COMMONNAMLEN cics_data_area |
                          COUNTRY cics_ref | COUNTRYLEN cics_data_area | STATE cics_ref | STATELEN cics_data_area |
                          LOCALITY cics_ref | LOCALITYLEN cics_data_area | ORGANIZATION cics_ref |
                          ORGANIZATLEN cics_data_area | ORGUNIT cics_ref | ORGUNITLEN cics_data_area | cics_handle_response)*;

cics_extract_logonmsg: (LOGONMSG cics_into | LENGTH cics_data_area | cics_handle_response)+;
cics_extract_process: PROCESS (cics_extract_procname | CONVID cics_name | SYNCLEVEL cics_data_area | cics_extract_piplist | cics_handle_response)*;
cics_extract_procname: PROCNAME cics_data_area (PROCLENGTH cics_data_area | MAXPROCLEN cics_data_value | cics_handle_response)+;
cics_extract_piplist: PIPLIST cics_ref PIPLENGTH cics_data_area;
cics_extract_tcpip: TCPIP (AUTHENTICATE cics_cvda | cics_extract_clientname | cics_extract_servername | cics_extract_clientaddr |
                    CLNTIPFAMILY cics_cvda | CLIENTADDRNU cics_data_area | CLNTADDR6NU cics_data_area |
                    cics_extract_serveraddr | SRVRIPFAMILY cics_cvda | SERVERADDRNU cics_data_area | SRVRADDR6NU
                    cics_data_area | SSLTYPE cics_cvda | TCPIPSERVICE cics_data_area | PORTNUMBER cics_data_area |
                    PORTNUMNU cics_data_area | PRIVACY cics_cvda | MAXDATALEN cics_cvda | cics_handle_response)+;
                    
cics_extract_clientname: CLIENTNAME cics_data_area CNAMELENGTH cics_data_area;
cics_extract_servername: SERVERNAME cics_data_area SNAMELENGTH cics_data_area;
cics_extract_clientaddr: CLIENTADDR cics_data_area CADDRLENGTH cics_data_area;
cics_extract_serveraddr: SERVERADDR cics_data_area SADDRLENGTH cics_data_area;

cics_extract_tct: TCT (NETNAME cics_name | SYSID cics_data_area | TERMID cics_data_area | cics_handle_response)+;
cics_extract_web: WEB (SCHEME cics_cvda | cics_extract_host | cics_extract_httpmethod | cics_extract_httpversion |
                  cics_extract_path | PORTNUMBER cics_data_area | cics_extract_querystring | REQUESTTYPE cics_cvda | cics_handle_response)+;
cics_extract_host: HOST cics_data_area HOSTLENGTH cics_data_value (HOSTTYPE cics_cvda)?;
cics_extract_httpmethod: HTTPMETHOD cics_data_area METHODLENGTH cics_data_value;
cics_extract_httpversion: HTTPVERSION cics_data_area VERSIONLEN cics_data_area;
cics_extract_path: PATH cics_data_area PATHLENGTH cics_data_area;
cics_extract_querystring: QUERYSTRING cics_data_area QUERYSTRLEN cics_data_area;

/** FORCE TIMER */
cics_force: FORCE (TIMER cics_data_value | ACQUACTIVITY | ACQPROCESS | cics_handle_response)+;

/** FORMATTIME */
cics_formattime: FORMATTIME (ABSTIME cics_data_area | DATE cics_data_area | FULLDATE cics_data_area | DATEFORM cics_data_area
                 | DATESEP (cics_data_area)? | DAYCOUNT cics_data_area | DAYOFMONTH cics_data_area | DAYOFWEEK cics_data_area
                 | DDMMYY cics_data_area | DDMMYYYY cics_data_area | MILLISECONDS cics_data_area | MMDDYY cics_data_area
                 | MMDDYYYY cics_data_area | MONTHOFYEAR cics_data_area | cics_formattime_time | YEAR cics_data_area
                 | YYDDD cics_data_area | YYDDMM cics_data_area| YYMMDD cics_data_area | YYYYDDD cics_data_area | YYYYDDMM cics_data_area
                 | YYYYMMDD cics_data_area | DATESTRING cics_data_area | STRINGFORMAT cics_cvda | cics_handle_response)+;
cics_formattime_time: (TIME cics_data_area | (TIMESEP (cics_data_area)?))+;

/** FREE (all of them) */
cics_free: FREE (CONVID cics_name | SESSION cics_name | STATE cics_cvda | cics_handle_response)*;

/** FREEMAIN */
cics_freemain: FREEMAIN (DATA cics_data_area | DATAPOINTER cics_value | cics_handle_response)+;

/** GDS (all) */
cics_gds: GDS (cics_gds_allocate | cics_gds_assign | cics_gds_connect | cics_gds_extract | cics_gds_free |
          cics_gds_issue | cics_gds_receive | cics_gds_send | cics_gds_wait);
cics_gds_allocate: ALLOCATE (SYSID cics_data_area | MODENAME cics_name | PARTNER cics_name | CONVID cics_data_area |
                   RETCORD cics_data_area | NOQUEUE | STATE cics_cvda | cics_handle_response)+;
cics_gds_assign: ASSIGN (PRINCONVID cics_data_area | PRINSYSID cics_data_area | RETCODE cics_data_area | cics_handle_response)+;
cics_gds_connect: CONNECT (PROCESS | CONVID cics_name | PROCNAME cics_name | PROCLENGTH cics_data_value | PARTNER cics_name |
                  PIPLIST cics_data_area | PIPLENGTH cics_data_value | SYNCLEVEL cics_data_value | CONVDATA cics_data_area |
                  RETCODE cics_data_area | STATE cics_cvda | cics_handle_response)+;
cics_gds_extract: EXTRACT (cics_gds_attributes | cics_gds_process);
cics_gds_attributes: ATTRIBUTES (CONVID cics_name | STATE cics_cvda | CONVDATA cics_data_area | RETCODE cics_data_area | cics_handle_response)+;
cics_gds_process: PROCESS (CONVID cics_name | cics_extract_procname | SYNCLEVEL cics_data_area |
                  cics_extract_piplist | RETCODE cics_data_area | cics_handle_response)+;
cics_gds_free: FREE (CONVID cics_name | CONVDATA cics_data_area | RETCODE cics_data_area | STATE cics_cvda | cics_handle_response)+;
cics_gds_issue: ISSUE (ABEND | CONFIRMATION | ERROR | PREPARE | SIGNAL) (CONVID cics_name | CONVDATA cics_data_area |
                RETCODE cics_data_area | STATE cics_cvda | cics_handle_response)+;
cics_gds_receive: RECEIVE (CONVID cics_name | cics_into | FLENGTH cics_data_area | MAXFLENGTH
                  cics_data_value | BUFFER | LLID | CONVDATA cics_data_area | RETCODE cics_data_area | STATE cics_cvda | cics_handle_response)+;
cics_gds_send: SEND (CONVID cics_name | FROM cics_data_area | FLENGTH cics_data_value | INVITE | LAST | CONFIRM | WAIT |
               CONVDATA cics_data_area | RETCODE cics_data_area | STATE cics_cvda | cics_handle_response)+;
cics_gds_wait: WAIT (CONVID cics_name | CONVDATA cics_data_area | RETCODE cics_data_area | STATE cics_cvda | cics_handle_response)+;

/** GET CONTAINER (both of them) / GET COUNTER / GET DCOUNTER */
cics_get: GET (cics_get_container | cics_get_counter | cics_get_dcounter);
cics_get_container: CONTAINER cics_data_value (cics_get_bts | cics_get_channel);
cics_get_bts: (ACTIVITY cics_data_value | ACQACTIVITY | PROCESS | ACQPROCESS | INTO cics_data_area | SET cics_ref |
               NODATA | FLENGTH cics_data_area | cics_handle_response)+;
cics_get_channel: (CHANNEL cics_data_value | INTO cics_data_area | FLENGTH cics_data_area | SET cics_ref | FLENGTH cics_data_area |
                  NODATA | FLENGTH cics_data_area | INTOCCSID cics_data_value | INTOCODEPAGE cics_data_value | cics_get_convertst |
                  cics_handle_response)+;
cics_get_convertst: CONVERTST cics_cvda (CCSID cics_data_area)?;
cics_get_counter: COUNTER cics_name (POOL cics_name | VALUE cics_data_area | INCREMENT cics_data_value | REDUCE | WRAP |
                  COMPAREMIN cics_data_value | COMPAREMAX cics_data_value | cics_handle_response)+;
cics_get_dcounter: DCOUNTER cics_name (POOL cics_name | VALUE cics_data_area | INCREMENT cics_data_area | REDUCE | WRAP |
                   COMPAREMIN cics_data_area | COMPAREMAX cics_data_area | cics_handle_response)+;

/** GETMAIN */
cics_getmain: GETMAIN (SET cics_ref | FLENGTH cics_data_value | BELOW | LENGTH cics_data_value | INITIMG cics_data_value |
              SHARED | NOSUSPEND | USERDATAKEY | CICSDATAKEY | cics_handle_response)+;

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

/** INQUIRE ACTIVITYID / CONTAINER / EVENT / PROCESS / TIMER */
cics_inquire: INQUIRE (cics_inquire_activityid | cics_inquire_container | cics_inquire_event | cics_inquire_process |
              cics_inquire_timer | cics_inquire_urimap);
cics_inquire_activityid: ACTIVITYID cics_data_value (ABCODE cics_data_area | ABPROGRAM cics_data_area |
                         ACTIVITY cics_data_area | COMPSTATUS cics_cvda | EVENT cics_data_area | MODE cics_cvda |
                         PROCESS cics_data_area | PROCESSTYPE cics_data_area | PROGRAM cics_data_area |
                         SUSPSTATUS cics_cvda | TRANSID cics_data_area | USERID cics_data_area | cics_handle_response)*;
cics_inquire_container: CONTAINER cics_data_value (ACTIVITYID cics_data_value | PROCESS cics_data_value PROCESSTYPE
                        cics_data_value | DATALENTH cics_data_area | SET cics_data_area | cics_handle_response)*;
cics_inquire_event: EVENT cics_data_value (ACTIVITYID cics_data_value | EVENTTYPE cics_cvda | FIRESTATUS cics_cvda |
                    COMPOSITE cics_data_area | PREDICATE cics_cvda | TIMER cics_data_area | cics_handle_response)*;
cics_inquire_process: PROCESS cics_data_value (PROCESSTYPE cics_data_value | ACTIVITYID cics_data_area | cics_handle_response)+;
cics_inquire_timer: TIMER cics_data_value (ACTIVITYID cics_data_value | EVENT cics_data_area | STATUS cics_cvda |
                    ABSTIME cics_data_area | cics_handle_response)*;

/** Ref: https://www.ibm.com/docs/en/cics-ts/6.1?topic=commands-inquire-urimap */
cics_inquire_urimap: URIMAP cics_data_value (cics_inquire_urimap_data_val_args | cics_inquire_urimap_data_area_args | cics_inquire_urimap_data_cvda_args)*;
cics_inquire_urimap_data_val_args:(APPLICATION | APPLMAJORVER | APPLMINORVER | APPLMICROVER | OPERATION | PLATFORM) cics_data_value;
cics_inquire_urimap_data_area_args:(ATOMSERVICE | CERTIFICATE | CHANGEAGREL | CHANGETIME | CHANGEUSRID | CHARACTERSET |
                                CIPHERS | CONVERTER | DEFINESOURCE | DEFINETIME | HFSFILE | HOST | HOSTCODEPAGE |
                                INSTALLTIME | INSTALLUSRID | IPRESOLVED | LOCATION | MEDIATYPE | NUMCIPHERS | PATH |
                                PIPELINE | PORT | PROGRAM | SOCKETCLOSE | SOCKPOOLSIZE | TCPIPSERVICE | TEMPLATENAME |
                                TRANSACTION | USERID | WEBSERVICE) cics_data_area;
cics_inquire_urimap_data_cvda_args: (ANALYZERSTAT | AUTHENTICATE | AVAILSTATUS | CHANGEAGENT | ENABLESTATUS | HOSTTYPE |
                                 INSTALLAGENT | IPFAMILY | REDIRECTTYPE | SCHEME | USAGE) cics_cvda;

/** INVOKE SERVICE */
cics_invoke: INVOKE (SERVICE cics_data_value | CHANNEL cics_data_value | OPERATION cics_data_value | URI cics_data_value |
             URIMAP cics_data_value | SCOPE cics_data_value | SCOPELEN cics_data_value | cics_handle_response)+;

/** ISSUE (all of them) */
cics_issue: ISSUE (cics_issue_abend | cics_issue_abort | cics_issue_add | cics_issue_confirmation | cics_issue_copy |
            cics_issue_disconnect | cics_issue_endfile | cics_issue_endoutput | EODS | cics_issue_erase |
            cics_issue_eraseaup | cics_issue_load | cics_issue_note | cics_issue_pass | PRINT | cics_issue_query |
            cics_issue_receive | cics_issue_replace | cics_issue_send | cics_issue_signal);
	/** ISSUE ABEND, ISSUE ERROR and ISSUE PREPARE are combined into one as they have the same syntax */
cics_issue_abend: (ABEND | ERROR | PREPARE | CONVID cics_name | STATE cics_cvda | cics_handle_response)+;
	/** ISSUE ABORT, ISSUE END and ISSUE WAIT are combined into one as they have the same syntax */
cics_issue_abort: (ABORT | END | WAIT | cics_issue_destid | cics_issue_subaddr | cics_issue_volume | cics_handle_response)+;
cics_issue_destid: (DESTID cics_data_value | DESTIDLENG cics_data_value)+;
cics_issue_subaddr: (SUBADDR cics_data_value | CONSOLE | PRINT | CARD | WPMEDIA1 | WPMEDIA2 | WPMEDIA3 | WPMEDIA4)+;
cics_issue_volume: (VOLUME cics_data_value | VOLUMELENG cics_data_value)+;

cics_issue_add: ADD cics_issue_destid (cics_issue_volume | FROM cics_data_value | LENGTH cics_data_value |
                NUMREC cics_data_value | DEFRESP | NOWAIT | RIDFLD cics_data_area | RRN | cics_handle_response)+;
cics_issue_confirmation: CONFIRMATION (CONVID cics_name | STATE cics_cvda | cics_handle_response)+;
cics_issue_copy: COPY (TERMID cics_name | CTLCHAR cics_data_value | WAIT | cics_handle_response)+;
cics_issue_disconnect: DISCONNECT (SESSION cics_name | cics_handle_response)+;
cics_issue_endfile: (ENDFILE | ENDOUTPUT | cics_handle_response)+;
cics_issue_endoutput: (ENDOUTPUT | ENDFILE | cics_handle_response)+;
cics_issue_erase: ERASE (cics_issue_destid | cics_issue_volume | RIDFLD cics_data_area | KEYLENGTH cics_data_value |
                  KEYNUMBER cics_data_value | RRN | NUMREC cics_data_value | DEFRESP | NOWAIT | cics_handle_response)+;
cics_issue_eraseaup: (ERASEAUP | WAIT | cics_handle_response)+;
cics_issue_load: LOAD (PROGRAM cics_name | CONVERSE | cics_handle_response)+;
cics_issue_note: NOTE (cics_issue_destid | cics_issue_volume | RIDFLD cics_data_area | RRN | cics_handle_response)+;
cics_issue_pass: PASS (LUNAME cics_name | cics_issue_from | LOGMODE cics_data_value | LOGONLOGMODE | NOQUIESCE | cics_handle_response)+;
cics_issue_from: (FROM cics_data_area | LENGTH cics_data_value)+;
cics_issue_query: (QUERY cics_issue_destid | cics_issue_volume | cics_handle_response)+;
cics_issue_receive: (RECEIVE cics_into | LENGTH cics_data_area | cics_handle_response)+;
cics_issue_replace: (REPLACE cics_issue_destid | cics_issue_volume | FROM cics_data_area | LENGTH cics_data_value | RIDFLD
                    cics_data_area | KEYLENGTH cics_data_value | KEYNUMBER cics_data_value | RRN | DEFRESP | NOWAIT | cics_handle_response)+;
cics_issue_send: SEND (cics_issue_destid | cics_issue_subaddr | cics_issue_volume | FROM cics_data_area |
                 LENGTH cics_data_value | NOWAIT | DEFRESP | cics_handle_response)+;
cics_issue_signal: SIGNAL (cics_issue_convid | SESSION cics_name | STATE cics_cvda | cics_handle_response)?;
cics_issue_convid: (CONVID cics_name | STATE cics_cvda)+;

/** LINK / LINK ACQPROCESS / LINK ACTIVITY: */
cics_link: LINK (cics_link_program | cics_link_acqprocess | cics_link_activity);
cics_link_program: PROGRAM cics_name (cics_link_commarea | CHANNEL cics_name | cics_link_inputmsg |
                   SYSID cics_data_area | SYNCONRETURN | TRANSID cics_name | cics_handle_response)+;
cics_link_commarea: COMMAREA cics_data_area (LENGTH cics_data_value | DATALENGTH cics_data_value)*;
cics_link_inputmsg: INPUTMSG cics_data_area (INPUTMSGLEN cics_data_value)?;
cics_link_acqprocess: (ACQPROCESS | INPUTEVENT cics_data_value | cics_handle_response)+;
cics_link_activity: (ACTIVITY cics_data_value | ACQACTIVITY | INPUTEVENT cics_data_value | cics_handle_response)+;

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
cics_load: LOAD (PROGRAM cics_name | SET cics_ref | LENGTH cics_data_area | FLENGTH cics_data_area | ENTRY cics_ref | HOLD | cics_handle_response)*;

/** MONITOR */
cics_monitor: MONITOR (POINT cics_data_value | DATA1 cics_data_area | DATA2 cics_data_area | ENTRYNAME cics_data_area | cics_handle_response)+;

/** MOVE CONTAINER (both) */
cics_move: MOVE cics_handle_response? CONTAINER cics_data_value cics_handle_response? AS cics_data_value cics_handle_response? (cics_move_bts | cics_move_channel);
cics_move_bts: (FROMPROCESS | FROMACTIVITY cics_data_value | TOPROCESS | TOACTIVITY cics_data_value | cics_handle_response)+;
cics_move_channel: (CHANNEL cics_data_value | TOCHANNEL cics_data_value | cics_handle_response)+;

/** POINT */
cics_point: POINT (CONVID cics_name | SESSION cics_name | cics_handle_response)?;

/** POP HANDLE */
cics_pop: POP cics_handle_response? HANDLE cics_handle_response?;

/** POST */
cics_post: POST (INTERVAL cics_zero_digit | INTERVAL cics_hhmmss | TIME cics_hhmmss | cics_post_after | SET cics_ref
           REQID cics_name | cics_handle_response)*;
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

/** QUERY COUNTER / DCOUNTER / SECURITY */
cics_query: QUERY (cics_query_counter | cics_query_security);
cics_query_counter: (COUNTER cics_name | DCOUNTER cics_name) (POOL cics_name | VALUE cics_data_area | MINIMUM cics_data_area |
                    MAXIMUM cics_data_area | cics_handle_response)*;
cics_query_security: SECURITY (RESTYPE cics_data_value | RESCLASS cics_data_value | RESIDLENGTH cics_data_value | RESID cics_data_value |
                     LOGMESSAGE cics_cvda | READ cics_cvda | UPDATE cics_cvda | CONTROL cics_cvda | ALTER cics_cvda | cics_handle_response)+;
/** READ */
cics_read: READ (cics_file_name | UNCOMMITTED | CONSISTENT | REPEATABLE | UPDATE | TOKEN cics_data_area |
           INTO cics_data_area | SET cics_ref | RIDFLD cics_data_area | KEYLENGTH cics_data_value | GENERIC |
           SYSID cics_data_area LENGTH cics_data_area | LENGTH cics_data_area | DEBKEY | DEBREC | RBA | RBN |
           XRBA | EQUAL | GTEQ | NOSUSPEND | cics_handle_response)+;

/** READNEXT | READPREV*/
cics_readnext: (READNEXT | READPREV | cics_file_name | cics_into | UNCOMMITTED | CONSISTENT | REPETABLE |
               UPDATE TOKEN cics_data_area | RIDFLD cics_data_area | KEYLENGTH cics_data_value | REQID cics_data_value |
               SYSID cics_data_area | LENGTH cics_data_area | LENGTH cics_data_area | RBA | RRN | XRBA | NOSUSPEND | cics_handle_response)+;

/** READQ TD / TS */
cics_readq: READQ (cics_readq_td | cics_readq_ts);
cics_readq_td: TD (QUEUE cics_name | cics_into | LENGTH cics_data_area | SYSID cics_data_area | NOSUSPEND | cics_handle_response)+;
cics_readq_ts: TS? (QUEUE cics_name | QNAME cics_name | cics_into | LENGTH cics_data_area | NUMITEMS cics_data_area |
               NEXT | ITEM cics_data_value | SYSID cics_data_area | cics_handle_response)+;

/** RELEASE */
cics_release: RELEASE cics_handle_response? PROGRAM cics_name cics_handle_response?;

/** REMOVE SUBEVENT */
cics_remove: REMOVE (SUBEVENT cics_data_value | EVENT cics_data_value | cics_handle_response)+;

/** RESET ACQPROCESS / ACTIVITY */
cics_reset: RESET (ACQPROCESS | ACTIVITY cics_data_value | cics_handle_response)+;

/** RESETBR */
cics_resetbr: RESETBR cics_file_name (RIDFLD cics_data_area | KEYLENGTH cics_data_value | GENERIC | REQID cics_data_value |
              SYSID cics_data_area | GTEQ | EQUAL | RBA | RRN |XRBA | cics_handle_response)+;

/** RESUME */
cics_resume: RESUME (ACQACTIVITY | ACQPROCESS | ACTIVITY cics_data_value | cics_handle_response)+;

/** RETRIEVE - / REATTACH EVENT / SUBEVENT */
cics_retrieve: RETRIEVE (cics_retrieve_null | cics_retrieve_event);
cics_retrieve_null: cics_into (LENGTH cics_data_area | RTRANSID cics_data_area | RTERMID cics_data_area |
                    QUEUE cics_data_area | WAIT | cics_handle_response)*;
cics_retrieve_event: (REATTACH | SUBEVENT cics_data_area | EVENT cics_data_area | EVENTTYPE cics_cvda | cics_handle_response)+;



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
cics_run: RUN (ACTIVITY cics_data_value | ACQACTIVITY | ACQPROCESS | SYNCHRONOUS | ASYNCHRONOUS | FACILITYTOKN cics_data_value |
          INPUTEVENT cics_data_value | cics_handle_response)+;

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
cics_spoolclose: SPOOLCLOSE (TOKEN cics_data_area | KEEP | DELETE | NOHANDLE | cics_spoolclose_resp | cics_handle_response)+;
cics_spoolclose_resp: RESP RESP2?;

/** SPOOLOPEN INPUT / OUTPUT */
cics_spoolopen: SPOOLOPEN (cics_spoolopen_input | cics_spoolopen_output);
cics_spoolopen_input: INPUT (TOKEN cics_data_area | USERID cics_data_value | CLASS cics_data_value |NOHANDLE | cics_spoolclose_resp | cics_handle_response)+;
cics_spoolopen_output: OUTPUT (TOKEN cics_data_area | USERID cics_data_value | NODE cics_data_value | CLASS cics_data_value |
                       OUTDESCR cics_ref | NOCC | ASA | MCC | PRINT | RECORDLENGTH cics_data_value | PUNCH | NOHANDLE | cics_spoolclose_resp | cics_handle_response)+;

/** SPOOLREAD */
cics_spoolread: SPOOLREAD (TOKEN cics_data_area | INTO cics_data_area | MAXFLENGTH cics_data_value |
                TOFLENGTH cics_data_area | NOHANDLE | cics_spoolclose_resp | cics_handle_response)+;

/** SPOOLWRITE */
cics_spoolwrite: SPOOLWRITE (TOKEN cics_data_area | FROM cics_data_area | FLENGTH cics_data_value | LINE | PAGE |
                 NOHANDLE | cics_spoolclose_resp | cics_handle_response)+;

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
cics_suspend: SUSPEND (ACQACTIVITY | ACQPROCESS | ACTIVITY cics_data_value | cics_handle_response)*;

/** SYNCPOINT / SYNCPOINT ROLLBACK */
cics_syncpoint: SYNCPOINT (cics_handle_response | ROLLBACK)*;

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
cics_unlock: UNLOCK cics_file_name (TOKEN cics_data_area | SYSID cics_data_area | cics_handle_response)*;

/** UPDATE COUNTER / DCOUNTER */
cics_update: UPDATE (cics_update_counter | cics_update_dcounter);
cics_update_counter: COUNTER cics_name (POOL cics_name | VALUE cics_data_value | COMPAREMIN cics_data_value | COMPAREMAX cics_data_value | cics_handle_response)+;
cics_update_dcounter: DCOUNTER cics_name (POOL cics_name | VALUE cics_data_area | COMPAREMIN cics_data_area | COMPAREMAX cics_data_area | cics_handle_response)+;
/** VERIFY PASSWORD / PHRASE */
cics_verify: VERIFY (PASSWORD cics_data_value | PHRASE cics_data_area PHRASELEN cics_data_value | USERID cics_data_value |
             CHANGETIME cics_data_area | DAYSLEFT cics_data_area | ESMREASON cics_data_area | ESMRESP cics_data_area |
             EXPIRYTIME cics_data_area | INVALIDCOUNT cics_data_area | LASTUSETIME cics_data_area | cics_handle_response)+;

/** WAIT CONVID / EVENT / EXTERNAL / JOURNALNAME / JOURNALNUM / SIGNAL / TERMINAL */
cics_wait: WAIT (CONVID cics_name | STATE cics_cvda | EVENT | ECADDR cics_value | NAME cics_name | EXTERNAL | ECBLIST cics_value |
           NUMEVENTS cics_data_value | PURGEABLE | BURGEABILITY cics_cvda | NOTPURGEABLE | NAME cics_name | JOURNALNAME cics_data_value |
           REQID cics_data_value | SIGNAL | TERMINAL | CONVID cics_name | SESSION cics_name | cics_handle_response)+;

/** WAITCICS */
cics_waitcics: WAITCICS (ECBLIST cics_value | NUMEVENTS cics_data_value | PURGEABLE | BURGEABILITY cics_cvda |
               NOTPURGEABLE | NAME cics_name | cics_handle_response)+;

/** WEB (all) */
cics_web: WEB (cics_web_close | cics_web_converse | cics_web_endbrowse | cics_web_extract | cics_web_open |
          cics_web_parse | cics_web_read | cics_web_readnext | cics_web_receive | cics_web_retrieve | cics_web_send |
          cics_web_startbrowse | cics_web_write);
cics_web_close: (CLOSE | SESSTOKEN cics_data_value | cics_handle_response)+;
cics_web_converse: CONVERSE (SESSTOKEN cics_data_value | PATH cics_data_area PATHLENGTH cics_data_value | URIMAP cics_data_value |
                   GET | HEAD | POST | PUT | TRACE | OPTIONS | DELETE | METHOD cics_cvda | MEDIATYPE cics_data_area |
                   cics_web_querystring | cics_web_body | ACTION cics_cvda | EXPECT | CLOSE | CLOSESTATUS cics_cvda | NOCLOSE |
                   cics_web_credentials | INTO cics_data_area | SET cics_ref | cics_web_tocontainer |TOLENGTH cics_data_area |
                   MAXLENGTH cics_data_value | NOTRUNCATE | STATUSCODE cics_data_area | cics_web_statustext |
                   cics_web_translation | BODYCHARSET cics_data_area | cics_handle_response)+;
cics_web_querystring: (QUERYSTRING cics_data_area | QUERYSTRLEN cics_data_value | cics_handle_response)+;
cics_web_tocontainer: (TOCONTAINER cics_data_value | TOCHANNEL cics_data_value | cics_handle_response)+;
cics_web_statustext: (STATUSTEXT cics_data_area | STATUSLEN cics_data_value | cics_handle_response)+;
cics_web_body: cics_web_doctoken | cics_web_from | cics_web_container;
cics_web_doctoken: (DOCTOKEN cics_data_value | NODOCDELETE | DOCDELETE | DOCSTATUS cics_cvda | cics_handle_response)+;
cics_web_from: (FROM cics_data_area | FROMLENGTH cics_data_value | cics_handle_response)+;
cics_web_container: (CONTAINER cics_data_value | CHANNEL cics_data_value | cics_handle_response)+;
cics_web_credentials: (cics_web_username | PASSWORD cics_data_value | PASSWORDLEN cics_data_value | cics_handle_response)+;
cics_web_username: (NONE | BASICAUTH | AUTHENTICATE cics_cvda | USERNAME cics_data_value | USERNAMELEN cics_data_value | cics_handle_response)+;
cics_web_translation: (CHARACTERSET cics_data_value | CLICONVERT | NOINCONVERT | NOOUTCONERT | NOCLICONVERT | CLIENTCONV cics_cvda | cics_handle_response)+;
cics_web_endbrowse: ENDBROWSE (FORMFIELD | HTTPHEADER | SESSTOKEN cics_data_value | QUERYPARM | cics_handle_response)+;
cics_web_extract: EXTRACT (SCHEME cics_cvda | cics_web_host | cics_web_httpmethod | cics_web_httpversion | cics_web_path |
                  PORTNUMBER cics_data_area | cics_web_querystring | REQUESTTYPE cics_cvda | cics_handle_response)+;
cics_web_host: HOST cics_data_area (HOSTLENGTH cics_data_value | HOSTTYPE cics_cvda | cics_handle_response)+;
cics_web_httpmethod: (HTTPMETHOD cics_data_area | METHODLENGTH cics_data_area | cics_handle_response)+;
cics_web_httpversion: (HTTPVERSION cics_data_area | VERSIONLEN cics_data_area | cics_handle_response)+;
cics_web_path: (PATH cics_data_area | PATHLENGTH cics_data_area | cics_handle_response)+;
cics_web_open: OPEN (URIMAP cics_data_value | cics_web_ohost | CERTIFICATE cics_data_value | cics_web_ciphers |
               CODEPAGE cics_data_value |SESSTOKEN cics_data_area | cics_web_httpvnum | cics_handle_response)+;
cics_web_ohost: HOST cics_data_value (HOSTLENGTH cics_data_value | PORTNUMBER cics_data_value | SCHEME cics_cvda | cics_handle_response)+;
cics_web_ciphers: (CIPHERS cics_data_value | NUMCIPHERS cics_data_value | cics_handle_response)+;
cics_web_httpvnum: (HTTPVNUM cics_data_area | HTTPRNUM cics_data_area | cics_handle_response)+;
cics_web_parse: PARSE (URL cics_data_value | URLLENGTH cics_data_value | SCHEMENAME cics_data_area | cics_web_host |
                PORTNUMBER cics_data_area | cics_web_path | cics_web_querystring | cics_handle_response)+;
cics_web_read: READ (cics_web_rformfield | cics_web_rhttpheader | cics_web_rqueryparm);
cics_web_rformfield: FORMFIELD cics_data_area (NAMELENGTH cics_data_value | VALUE cics_data_area | SET cics_ref |
                     VALUELENGTH cics_data_area | CHARACTERSET cics_data_value | HOSTCODEPAGE cics_data_value | cics_handle_response)+;
cics_web_rhttpheader: (HTTPHEADER cics_data_area | NAMELENGTH cics_data_value | SESSTOKEN cics_data_area | VALUE cics_data_area |
                      VALUELENGTH cics_data_area | cics_handle_response)+;
cics_web_rqueryparm: QUERYPARM cics_data_value (NAMELENGTH cics_data_value | VALUE cics_data_area | SET cics_ref |
                     VALUELENGTH cics_data_area | HOSTCODEPAGE cics_data_value | cics_handle_response)+;
cics_web_readnext: READNEXT (cics_web_rnformfield | cics_web_rnhttpheader);
cics_web_rnformfield: (FORMFIELD cics_data_area | QUERYPARM cics_data_area | NAMELENGTH cics_data_area |
                      VALUE cics_data_area | VALUELENGTH cics_data_area | cics_handle_response)+;
cics_web_rnhttpheader: (HTTPHEADER cics_data_area | NAMELENGTH cics_data_area | SESSTOKEN cics_data_value| 
                      VALUE cics_data_area | VALUELENGTH cics_data_area | cics_handle_response)+;
cics_web_receive: RECEIVE (cics_web_rserver | cics_web_rtocontainer | cics_web_rsesstoken);
cics_web_rserver: cics_into (LENGTH cics_data_area | MAXLENGTH cics_data_value | NOTRUNCATE | TYPE cics_cvda | SRVCONVERT |
                  NOSRVCONVERT | SERVERCONV cics_cvda | CHARACTERSET cics_data_value | HOSTCODEPAGE cics_data_value |
                  BODYCHARSET cics_data_area | MEDIATYPE cics_data_value | cics_handle_response)+;
cics_web_rtocontainer: TOCONTAINER cics_data_value (TOCHANNEL cics_data_value | TYPE cics_cvda | CHARACTERSET cics_data_value | CLNTCODEPAGE cics_data_value |
                       BODYCHARSET cics_data_area | MEDIATYPE cics_data_value | cics_handle_response)+;
cics_web_rsesstoken: SESSTOKEN cics_data_value (MEDIATYPE cics_data_area | cics_web_rcbuffers | cics_web_rccontainers | cics_handle_response)+;
cics_web_rcbuffers: cics_web_statuscode? (cics_into | LENGTH cics_data_area | MAXLENGTH cics_data_value |
                    NOTRUNCATE | CLICONVERT | NOCLICONVERT | CLIENTCONV cics_cvda | BODYCHARSET cics_data_area | CHARACTERSET cics_data_value |
                    CLNTCODEPAGE cics_data_value cics_handle_response)+;
cics_web_statuscode: STATUSCODE cics_data_value cics_web_statustext;
cics_web_rccontainers: (cics_web_statustext | TOCONTAINER cics_data_value | TOCHANNEL cics_data_value | BODYCHARSET cics_data_area | CHARACTERSET cics_data_value
                    | CLNTCODEPAGE cics_data_value | cics_handle_response)+;
cics_web_retrieve: (RETRIECE | DOCTOKEN cics_data_area | cics_handle_response)+;
cics_web_send: SEND (cics_web_sserver | cics_web_sclient);
cics_web_sserver: (cics_web_doctoken | cics_web_ssfrom | cics_web_container | MEDIATYPE cics_data_value | SRVCONVERT |
                  NOSRVCONVERT | SERVERCONV cics_cvda | CHARACTERSET cics_data_value | cics_web_ssstatuscode |
                  IMMEDIATE | EVENTUAL | ACTION cics_cvda | NOCLOSE | CLOSE | CLOSESTATUS cics_cvda | cics_handle_response)+;
cics_web_sfrom: FROM cics_data_area (FROMLENGTH cics_data_value | CHUNKNO | CHUNKYES | CHUNKEND | CHUNKING cics_cvda | cics_handle_response)+;
cics_web_ssfrom: cics_web_sfrom (HOSTCODEPAGE cics_data_value)?;
cics_web_ssstatuscode: STATUSCODE cics_data_value (STATUSTEXT cics_data_area | STATUSLEN cics_data_value | LENGTH cics_data_value | cics_handle_response)+;
cics_web_sclient: SESSTOKEN cics_data_value (GET | HEAD | POST | PUT | TRACE | OPTIONS | DELETE | METHOD cics_cvda |
                  cics_web_path | URIMAP cics_data_value | cics_web_querystring| cics_web_scbody |
                  CLICONVERT | NOCLICONVERT | CLIENTCONV cics_cvda | CHARACTERSET cics_data_value |
                  EXPECT | ACTION cics_cvda | NOCLOSE | CLOSE | CLOSESTATUS cics_cvda | cics_web_scauth | cics_handle_response)+;
cics_web_scbody: MEDIATYPE cics_data_value (cics_web_doctoken | cics_web_sfrom | cics_web_container)?;
cics_web_scauth: (NONE | BASICAUTH | AUTHENTICATE cics_cvda | cics_web_sccredentials | cics_handle_response)+;
cics_web_sccredentials: USERNAME cics_data_value (USERNAMELEN cics_data_value | PASSWORD cics_data_value | PASSWORDLEN cics_data_value | cics_handle_response)+;
cics_web_startbrowse: STARTBROWSE (cics_web_sbformfield | cics_web_sbhttpheader | cics_web_sbqueryparm);
cics_web_sbformfield: FORMFIELD cics_data_area? (NAMELENGTH cics_data_area | CHARACTERSET cics_data_value | HOSTCODEPAGE cics_data_value | cics_handle_response)+;
cics_web_sbhttpheader: (HTTPHEADER | SESSTOKEN cics_data_area | cics_handle_response)+;
cics_web_sbqueryparm: QUERYPARM cics_data_area? (NAMELENGTH cics_data_area | HOSTCODEPAGE cics_data_value | cics_handle_response)+;
cics_web_write: WRITE (HTTPHEADER cics_data_area | NAMELENGTH cics_data_value | SESSTOKEN cics_data_value |
                VALUE cics_data_area | VALUELENGTH cics_data_value | cics_handle_response)+;

/** WRITE / WRITE JOURNALNAME / WRITE OPERATOR */
cics_write: WRITE (cics_write_file | cics_write_journalname | cics_write_operator);
cics_write_file: cics_file_name (MASSINSERT | FROM cics_data_area | RIDFLD cics_data_area | KEYLENGTH cics_data_value |
                 SYSID cics_data_area | LENGTH cics_data_value | LENGTH cics_data_value | RBA | RBN | XRBA | NOSUSPEND | cics_handle_response)+;
cics_write_journalname: JOURNALNAME cics_data_value (JTYPEID cics_data_value | FROM cics_data_area | FLENGTH cics_data_value |
                        REQID cics_data_area | cics_write_prefix | WAIT | NOSUSPEND | cics_handle_response)+;
cics_write_prefix: (PREFIX cics_data_value | PFXLENG cics_data_value | cics_handle_response)+;
cics_write_operator: OPERATOR (TEXT cics_data_value | TEXTLENGTH cics_data_value | cics_write_routecodes |
                     EVENTUAL | ACTION cics_cvda | CRITICAL | IMMEDIATE | cics_write_reply | cics_handle_response)+;
cics_write_routecodes: (ROUTECODES cics_data_value | NUMROUTES cics_data_value | cics_handle_response)+;
cics_write_reply: REPLY cics_data_area (MAXLENGTH cics_data_value | REPLYLENGTH cics_data_area | TIMEOUT cics_data_value | cics_handle_response)+;

/** WRITEQ TD/TS */
cics_writeq: WRITEQ (cics_writeq_td | cics_writeq_ts);
cics_writeq_td: TD (QUEUE cics_name | FROM cics_data_area | LENGTH cics_data_value | SYSID cics_data_area | cics_handle_response)+;
cics_writeq_ts: TS? (QUEUE cics_name | QNAME cics_name | FROM cics_data_area | LENGTH cics_data_value |
                NUMITEMS cics_data_area | ITEM cics_data_area | REWRITE | SYSID cics_data_area | AUXILIARY | MAIN | NOSUSPEND | cics_handle_response)+;

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
cics_wsaepr: WSAEPR CREATE (EPRINTO cics_data_area | EPRSET cics_data_area | EPRLENGTH cics_data_area | ADDRESS cics_data_value |
             REFPARMS cics_data_value | REFPARMSLEN cics_data_value | METADATA cics_data_value | METADATALEN cics_data_value |
             FROMCCSID cics_data_value | FROMCODEPAGE cics_data_value | cics_handle_response)+;

/** XCTL: */
cics_xctl: XCTL (PROGRAM cics_name | COMMAREA cics_data_area | LENGTH cics_data_value | CHANNEL cics_name | INPUTMSG cics_data_area |
           INPUTMSGLEN cics_data_value | cics_handle_response)+;

/** FILE or DATASET */
cics_file_name: (FILE | DATASET) cics_name;

/** RESP **/
cics_resp: (RESP | RESP2) cics_data_area;

cics_handle_response: cics_inline_handle_exception | WAIT;
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
    : IDENTIFIER | cicsWords
    ;

cicsWords
    : ENDFILE | ERROR | ABORT | ADDRESS | AFTER | ALTER | AS | ASSIGN | AT | BINARY | CANCEL | CHANNEL | CLASS | CLOSE
    | CONTROL | COPY | DATA | DELETE | DELIMITER | DETAIL | END | ENTER | ENTRY | EQUAL | ERASE | EVENT
    | EXCEPTION | EXTERNAL | FOR | FROM | INPUT | INTO | INVOKE | LABEL | LAST | LENGTH | LINE | LINK | LIST | MESSAGE
    | MMDDYYYY | MODE | ORGANIZATION | OUTPUT | PAGE | PARSE | PASSWORD | PROCESS
    | PROGRAM | PURGE | RECEIVE | RECORD | RELEASE | REPLACE | RESET | RETURN | REWIND | REWRITE
    | RUN | SECURITY | SEND | SERVICE | SHARED | START | STATUS | SYNCONRETURN | SYMBOL | TASK | TERMINAL | TEST | TEXT
    | TIMER | TITLE | TYPE | VALUE | WAIT | YEAR | YYYYDDD | YYYYMMDD | COMMAREA
    | cicsTranslatorCompileDirectivedKeywords
    ;

cicsLexerDefinedVariableUsageTokens: ABCODE | ABDUMP | ABEND | ABORT | ABPROGRAM | ABSTIME | ACCUM | ACEE | ACQACTIVITY
    | ACQPROCESS | ACQUACTIVITY | ACTION | ACTIVITY | ACTIVITYID | ACTPARTN | AID | ALARM | ALTSCRNHT | ALTSCRNWD
    | ANYKEY | APLKYBD | APLTEXT | APPLID | AS | ASA | ASIS | ASKTIME | ASRAINTRPT | ASRAKEY | ASRAPSW | ASRAREGS | ASRASPC
    | ASRASTG | ASYNCHRONOUS | ATTACH | ATTACHID | ATTRIBUTES | AUTHENTICATE | AUTOPAGE | AUXILIARY | BASE64
    | BASICAUTH | BELOW | BIF | BODYCHARSET | BOOKMARK | BRDATA | BRDATALENGTH | BREXIT | BRIDGE | BROWSETOKEN
    | BTRANS | BUFFER | BUILD | BURGEABILITY | CADDRLENGTH | CARD | CBUFF | CCSID | CERTIFICATE | CHANGE | CHANGETIME
    | CHANNEL | CHAR | CHARACTERSET | CHECK | CHUNKEND | CHUNKING | CHUNKNO | CHUNKYES | CICSDATAKEY | CIPHERS | CLEAR
    | CLICONVERT | CLIENT | CLIENTADDR | CLIENTADDRNU | CLIENTCONV | CLNTCODEPAGE | CLIENTNAME | CLNTADDR6NU | CLNTIPFAMILY
    | CLOSESTATUS | CLRPARTN | CMDSEC | CNAMELENGTH | CNOTCOMPL | CODEPAGE | COLOR | COMMAREA | COMMONNAME
    | COMMONNAMLEN | COMPAREMAX | COMPAREMIN | COMPLETE | COMPOSITE | COMPSTATUS | CONFIRM | CONFIRMATION | CONNECT
    | CONSISTENT | CONSOLE | CONTAINER | CONTEXTTYPE | CONVDATA | CONVERSE | CONVERTST | CONVERTTIME | CONVID
    | COUNTER | COUNTRY | COUNTRYLEN | CREATE | CRITICAL | CTLCHAR | CURRENT | CWA | CWALENG | DATA1 | DATA2
    | DATALENGTH | DATALENTH | DATAONLY | DATAPOINTER | DATASET | DATASTR | DATATOXML | DATATYPE | DATCONTAINER
    | DATEFORM | DATESEP | DATESTRING | DAYCOUNT | DAYOFMONTH | DAYOFWEEK | DAYOFYEAR | DAYS | DAYSLEFT | DCOUNTER
    | DDMMYY | DDMMYYYY | DEBKEY | DEBREC | DEEDIT | DEFINE | DEFRESP | DEFSCRNHT | DEFSCRNWD | DELAY | DELETEQ
    | DEQ | DESTCOUNT | DESTID | DESTIDLENG | DETAILLENGTH | DFHRESP | DFHVALUE | DIGEST | DIGESTTYPE | DISCONNECT
    | DOCDELETE | DOCSIZE | DOCSTATUS | DOCTOKEN | DOCUMENT | DS3270 | DSSCS | DUMP | DUMPCODE | DUMPID | DUPREC
    | ECADDR | ECBLIST | EIB | ELEMNAME | ELEMNAMELEN | ELEMNS | ELEMNSLEN | ENDACTIVITY | ENDBR | ENDBROWSE | ENDFILE
    | ENDOUTPUT | ENQ | ENTRYNAME | EOC | EODS | EPRFIELD | EPRFROM | EPRINTO | EPRLENGTH | EPRSET | EPRTYPE | ERASE
    | ERASEAUP | ERRTERM | ESMREASON | ESMRESP | EVENT | EVENTTYPE | EVENTUAL | EWASUPP | EXPECT | EXPIRYTIME | EXTDS
    | EXTRACT | FACILITY | FACILITYTOKN | FAULTACTLEN | FAULTACTOR | FAULTCODE | FAULTCODELEN | FAULTCODESTR
    | FAULTSTRING | FAULTSTRLEN | FCI | FCT | FIELD | FIRESTATUS | FLENGTH | FMH | FMHPARM | FORCE | FORMATTIME
    | FORMFEED | FORMFIELD | FREEKB | FREEMAIN | FROMACTIVITY | FROMCCSID | FROMCHANNEL | FROMCODEPAGE | FROMDOC
    | FROMFLENGTH | FROMLENGTH | FROMPROCESS | FRSET | FULLDATE | GCHARS | GCODES | GDS | GENERIC | GET | GETMAIN
    | GETNEXT | GMMI | GROUPID | GTEQ | HANDLE | HEAD | HEADER | HEX | HIGH_VALUE | HIGH_VALUES | HILIGHT | HOLD
    | HONEOM | HOST | HOSTCODEPAGE | HOSTLENGTH | HOSTTYPE | HOURS | HTTPHEADER | HTTPMETHOD | HTTPRNUM | HTTPVERSION
    | HTTPVNUM | IGNORE | IMMEDIATE | INCREMENT | INITIMG | INITPARM | INITPARMLEN | INPARTN | INPUTEVENT | INPUTMSG
    | INPUTMSGLEN | INQUIRE | INTEGER | INTERVAL | INTOCCSID | INTOCODEPAGE | INVALIDCOUNT | INVITE | INVMPSZ | INVOKE
    | INVOKINGPROG | INVPARTN | INVREQ | ISSUE | ISSUER | ITEM | IUTYPE | JOURNALNAME | JTYPEID | JUSFIRST | JUSLAST
    | JUSTIFY | KATAKANA | KEEP | KEYLENGTH | KEYNUMBER | L40 | L64 | L80 | LANGINUSE | LANGUAGECODE | LASTUSETIME
    | LDC | LDCMNEM | LDCNUM | LEAVEKB | LENGTHLIST | LEVEL | LIGHTPEN | LINAGE_COUNTER | LINEADDR | LINK | LIST
    | LISTLENGTH | LLID | LOAD | LOCALITY | LOCALITYLEN | LOGMESSAGE | LOGMODE | LOGONLOGMODE | LOGONMSG | LOW_VALUE
    | LOW_VALUES | LUNAME | MAIN | MAP | MAPCOLUMN | MAPFAIL | MAPHEIGHT | MAPLINE | MAPONLY | MAPPED
    | MAPPINGDEV | MAPSET | MAPWIDTH | MASSINSERT | MAXDATALEN | MAXFLENGTH | MAXIMUM | MAXLENGTH | MAXLIFETIME
    | MAXPROCLEN | MCC | MEDIATYPE | MESSAGEID | METADATA | METADATALEN | METHODLENGTH | MILLISECONDS | MINIMUM
    | MINUTES | MMDDYY | MMDDYYYY | MODENAME | MONITOR | MONTH | MONTHOFYEAR | MSR | MSRCONTROL | NAME | NAMELENGTH
    | NATLANG | NATLANGINUSE | NETNAME | NEWPASSWORD | NEWPHRASE | NEWPHRASELEN | NEXTTRANSID | NLEOM | NOAUTOPAGE
    | NOCC | NOCHECK | NOCLICONVERT | NOCLOSE | NODATA | NODE | NODOCDELETE | NODUMP | NOEDIT | NOFLUSH | NOHANDLE
    | NOINCONVERT | NONE | NOOUTCONERT | NOQUEUE | NOQUIESCE | NOSRVCONVERT | NOSUSPEND | NOTE | NOTPURGEABLE
    | NOTRUNCATE | NOWAIT | NSCONTAINER | NUMCIPHERS | NUMEVENTS | NUMITEMS | NUMREC | NUMROUTES | NUMSEGMENTS
    | NUMTAB | OIDCARD | OPCLASS | OPERATION | OPERATOR | OPERID | OPERKEYS | OPERPURGE | OPID | OPSECURITY
    | OPTIONS | ORGABCODE | ORGANIZATLEN | ORGUNIT | ORGUNITLEN | OUTDESCR | OUTLINE | OUTPARTN | OWNER | PA1 | PA2
    | PA3 | PAGENUM | PAGE_COUNTER | PAGING | PARSE | PARTN | PARTNER | PARTNFAIL | PARTNPAGE | PARTNS | PARTNSET
    | PASS | PASSBK | PASSWORDLEN | PATH | PATHLENGTH | PCT | PF1 | PF10 | PF11 | PF12 | PF13 | PF14 | PF15 | PF16
    | PF17 | PF18 | PF19 | PF2 | PF20 | PF21 | PF22 | PF23 | PF24 | PF3 | PF4 | PF5 | PF6 | PF7 | PF8 | PF9 | PFXLENG
    | PHRASE | PHRASELEN | PIPLENGTH | PIPLIST | POINT | POOL | POP | PORTNUMBER | PORTNUMNU | POST | PPT | PREDICATE
    | PREFIX | PREPARE | PRINCONVID | PRINSYSID | PRINT | PRIORITY | PRIVACY | PROCESS | PROCESSTYPE | PROCLENGTH
    | PROCNAME | PROFILE | PROTECT | PS | PUNCH | PURGEABLE | PUSH | PUT | QNAME | QUERY | QUERYPARM | QUERYSTRING
    | QUERYSTRLEN | RBA | RBN | RDATT | READNEXT | READPREV | READQ | REATTACH | RECEIVER | RECFM | RECORDLEN
    | RECORDLENGTH | REDUCE | REFPARMS | REFPARMSLEN | RELATESINDEX | RELATESTYPE | RELATESURI | REMOVE | REPEATABLE
    | REPETABLE | REPLY | REPLYLENGTH | REQID | REQUESTTYPE | RESCLASS | RESETBR | RESID | RESIDLENGTH | RESOURCE
    | RESP | RESP2 | RESSEC | RESTART | RESTYPE | RESULT | RESUME | RETAIN | RETCODE | RETCORD | RETRIECE | RETRIEVE
    | RETURNPROG | RIDFLD | ROLE | ROLELENGTH | ROLLBACK | ROUTE | ROUTECODES | RPROCESS | RRESOURCE | RRN | RTERMID
    | RTRANSID | SADDRLENGTH | SCHEME | SCHEMENAME | SCOPE | SCOPELEN | SCRNHT | SCRNWD | SECONDS | SEGMENTLIST
    | SENDER | SERIALNUM | SERIALNUMLEN | SERVER | SERVERADDR | SERVERADDRNU | SERVERCONV | SERVERNAME | SESSION
    | SESSTOKEN | SHARED | SIGDATA | SIGNAL | SIGNOFF | SIGNON | SIT | SNAMELENGTH | SOAPFAULT | SOSI | SPOOLCLOSE
    | SPOOLOPEN | SPOOLREAD | SPOOLWRITE | SRVCONVERT | SRVRADDR6NU | SRVRIPFAMILY | SSLTYPE | STARTBR | STARTBROWSE
    | STARTCODE | STATE | STATELEN | STATIONID | STATUSCODE | STATUSLEN | STATUSTEXT | STORAGE | STRFIELD
    | STRINGFORMAT | SUBADDR | SUBCODELEN | SUBCODESTR | SUBEVENT | SUBEVENT1 | SUBEVENT2 | SUBEVENT3 | SUBEVENT4
    | SUBEVENT5 | SUBEVENT6 | SUBEVENT7 | SUBEVENT8 | SUSPEND | SUSPSTATUS | SYMBOL | SYMBOLLIST | SYNCHRONOUS
    | SYNCLEVEL | SYNCONRETURN | SYNCPOINT | SYSID | TABLES | TASK | TASKPRIORITY | TCPIP | TCPIPSERVICE | TCT | TCTUA
    | TCTUALENG | TD | TELLERID | TEMPLATE | TERMCODE | TERMID | TERMPRIORITY | TEXTKYBD | TEXTLENGTH | TEXTPRINT
    | TIMEOUT | TIMER | TIMESEP | TOACTIVITY | TOCHANNEL | TOCONTAINER | TOFLENGTH | TOKEN | TOLENGTH | TOPROCESS
    | TRACENUM | TRAILER | TRANPRIORITY | TRANSACTION | TRANSFORM | TRANSID | TRIGGER | TRT | TS | TWA | TWALENG
    | TYPENAME | TYPENAMELEN | TYPENS | TYPENSLEN | UNATTEND | UNCOMMITTED | UNESCAPED | UNEXPIN | UNLOCK | UOW
    | UPDATE | URI | URIMAP | URL | URLLENGTH | USERDATAKEY | USERID | USERNAME | USERNAMELEN | USERPRIORITY
    | VALIDATION | VALUELENGTH | VERIFY | VERSIONLEN | VOLUME | VOLUMELENG | WAIT | WAITCICS | WEB | WHEN_COMPILED
    | WPMEDIA1 | WPMEDIA2 | WPMEDIA3 | WPMEDIA4 | WRAP | WRITEQ | WSACONTEXT | WSAEPR | XCTL | XMLCONTAINER
    | XMLTODATA | XMLTRANSFORM | XRBA | YEAR | YYDDD | YYDDMM | YYMMDD | YYYYDDD | YYYYDDMM | YYYYMMDD;

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

invalidInput
    :  {notifyError("cicsParser.invalidInput", "'" + _input.LT(1).getText() + "'");} notExec
    ;

//notExec: (~ END_EXEC)+;
notExec: (literal | dataName | (LPARENCHAR .*? RPARENCHAR))+;