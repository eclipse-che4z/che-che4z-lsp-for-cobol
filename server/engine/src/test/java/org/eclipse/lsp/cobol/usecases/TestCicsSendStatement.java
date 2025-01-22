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

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS SEND command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-send-zos-communications-server-default">SEND
 * Command</a>
 *
 * <p>This class tests all variations of the SEND command found in the link above.
 */
public class TestCicsSendStatement {
  private static final String SEND_FROM_LENGTH_VALID = "SEND FROM({$varFour}) LENGTH({$varOne})";
  private static final String SEND_LENGTH_VALID = "SEND FROM({$varFour}) LENGTH({$varOne}) FMH";
  private static final String SEND_FROM_FLENGTH_VALID = "SEND FROM({$varFour}) FLENGTH({$varOne})";
  private static final String SEND_FROM_VALID = "SEND FROM({$varOne})";
  private static final String SEND_WAIT_VALID = "SEND WAIT";
  private static final String SEND_FROM_LENGTH_WAIT_VALID = "SEND FROM({$varFour}) LENGTH({$varOne}) WAIT";
  private static final String SEND_FROM_FLENGTH_WAIT_VALID = "SEND FROM({$varFour}) FLENGTH({$varOne}) WAIT";

  private static final String SEND_CONVID_FROM_LENGTH_VALID = "SEND CONVID({$varOne}) FROM({$varFour}) LENGTH({$varTwo})";
  private static final String SEND_CONVID_FROM_FLENGTH_VALID = "SEND CONVID({$varOne}) FROM({$varFour}) FLENGTH({$varTwo})";
  private static final String SEND_CONVID_FROM_LENGTH_INVITE_VALID = "SEND CONVID({$varOne}) FROM({$varFour}) LENGTH({$varTwo}) INVITE";
  private static final String SEND_CONVID_FROM_FLENGTH_LAST_VALID = "SEND CONVID({$varOne}) FROM({$varFour}) FLENGTH({$varTwo}) LAST";
  private static final String SEND_CONVID_FROM_FLENGTH_LAST_INVITE_INVALID = "SEND CONVID({$varOne}) FROM({$varFour}) FLENGTH({$varTwo}) {LAST|error1} {INVITE|error2}";
  private static final String SEND_CONVID_FROM_FLENGTH_CONFIRM_WAIT_INVALID = "SEND CONVID({$varOne}) FROM({$varFour}) FLENGTH({$varTwo}) {CONFIRM|error1} {WAIT|error2}";

  private static final String SEND_FROM_LENGTH_ERASE_VALID = "SEND FROM({$varFour}) LENGTH({$varOne}) ERASE";
  private static final String SEND_FROM_LENGTH_ERASE_STRFIELD_INVALID = "SEND FROM({$varFour}) LENGTH({$varOne}) {ERASE|error1} {STRFIELD|error2}";
  private static final String SEND_FROM_FLENGTH_ALTERNATE_INVALID = "SEND {FLENGTH(123) FMH|error1}";
  private static final String SEND_FROM_LENGTH_CTLCHAR_VALID = "SEND FROM({$varFour}) LENGTH({$varOne}) CTLCHAR({$varTwo})";
  private static final String SEND_FROM_FLENGTH_STRFIELD_VALID = "SEND FROM({$varFour}) FLENGTH({$varOne}) STRFIELD";

  private static final String SEND_CONVID_FROM_FLENGTH_CNOTCOMPL_DEFRESP_INVALID = "SEND CONVID({$varOne}) FROM({$varFour}) FLENGTH({$varTwo}) {CNOTCOMPL|error1} {DEFRESP|error2}";

  private static final String SEND_FROM_LENGTH_LDC_FMH_INVALID = "SEND FROM({$varFour}) LENGTH({$varOne}) {LDC|error1}(123) {FMH|error2}";

  private static final String SEND_CONTROL_CURSOR_VALID = "SEND CONTROL CURSOR({$varOne})";
  private static final String SEND_CONTROL_ERASE_VALID = "SEND CONTROL ERASE";
  private static final String SEND_CONTROL_ERASE_ALTERNATE_VALID = "SEND CONTROL ERASE ALTERNATE";
  private static final String SEND_CONTROL_FREEKB_ALARM_VALID = "SEND CONTROL FREEKB ALARM";
  private static final String SEND_CONTROL_FORMFEED_PRINT_VALID = "SEND CONTROL FORMFEED PRINT";
  private static final String SEND_CONTROL_MSR_VALID = "SEND CONTROL MSR({$varOne})";
  private static final String SEND_CONTROL_OUTPARTN_LDC_INVALID = "SEND CONTROL {OUTPARTN|error1}({$varFour}) {LDC|error2}({$varFive})";
  private static final String SEND_CONTROL_ACCUM_TERMINAL_VALID = "SEND CONTROL ACCUM TERMINAL";
  private static final String SEND_CONTROL_SET_PAGING_INVALID = "SEND CONTROL {SET|error1}({$varOne}) {PAGING|error2}";
  private static final String SEND_CONTROL_WAIT_LAST_INVALID = "SEND {_{CONTROL} {WAIT} LAST|error1_}";
  private static final String SEND_CONTROL_REQID_HONEOM_VALID = "SEND CONTROL REQID({$varOne}) HONEOM";
  private static final String SEND_CONTROL_L80_VALID = "SEND CONTROL L80";

  private static final String SEND_MAP_VALID = "SEND MAP({$varOne})";
  private static final String SEND_MAP_MAPSET_VALID = "SEND MAP({$varOne}) MAPSET({$varTwo})";
  private static final String SEND_MAP_FROM_LENGTH_VALID = "SEND MAP({$varOne}) FROM({$varTwo}) LENGTH({$varThree})";
  private static final String SEND_MAP_DATAONLY_VALID = "SEND MAP({$varOne}) DATAONLY";
  private static final String SEND_MAP_DATAONLY_INVALID = "SEND MAP({$varOne}) {DATAONLY|error1} {MAPONLY|error2}";
  private static final String SEND_MAP_CURSOR_VALID = "SEND MAP({$varOne}) CURSOR({$varTwo})";
  private static final String SEND_MAP_ERASE_VALID = "SEND MAP({$varOne}) ERASE";
  private static final String SEND_MAP_ERASE_ALTERNATE_VALID = "SEND MAP({$varOne}) ERASE ALTERNATE";
  private static final String SEND_MAP_FREEKB_ALARM_VALID = "SEND MAP({$varOne}) FREEKB ALARM";
  private static final String SEND_MAP_FORMFEED_PRINT_VALID = "SEND MAP({$varOne}) FORMFEED PRINT";

  private static final String SEND_MAP_MAPPINGDEV_INVALID = "SEND {MAP(123) MAPPINGDEV(123)|error1}";
  private static final String SEND_MAP_MAPPINGDEV_SET_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree})";
  private static final String SEND_MAP_MAPPINGDEV_MAPSET_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) MAPSET({$varFour})";
  private static final String SEND_MAP_MAPPINGDEV_FROM_LENGTH_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) FROM({$varFour}) LENGTH({$varFive})";
  private static final String SEND_MAP_MAPPINGDEV_DATAONLY_MAPONLY_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) {DATAONLY|error1} {MAPONLY|error2}";
  private static final String SEND_MAP_MAPPINGDEV_MAPONLY_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) MAPONLY";
  private static final String SEND_MAP_MAPPINGDEV_CURSOR_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) CURSOR({$varFour})";
  private static final String SEND_MAP_MAPPINGDEV_ERASE_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) ERASE";
  private static final String SEND_MAP_MAPPINGDEV_ERASEAUP_INVALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) {ERASE|error1} {ERASEAUP|error2}";
  private static final String SEND_MAP_MAPPINGDEV_FREEKB_ALARM_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) FREEKB ALARM";
  private static final String SEND_MAP_MAPPINGDEV_FORMFEED_PRINT_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) FORMFEED PRINT";
  private static final String SEND_MAP_MAPPINGDEV_FRSET_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) FRSET";
  private static final String SEND_MAP_MAPPINGDEV_COMPLEX_VALID = "SEND MAP({$varFour}) MAPPINGDEV({$varTwo}) SET({$varThree}) MAPSET({$varFour}) FROM({$varFive}) LENGTH({$varSix}) CURSOR({$varSix}) ERASE FREEKB ALARM";

  private static final String SEND_PAGE_RELEASE_VALID = "SEND PAGE RELEASE";
  private static final String SEND_PAGE_RETAIN_TRANSID_INVALID = "SEND {_{PAGE} {RETAIN} TRANSID(123)|error1_}";
  private static final String SEND_PAGE_TRAILER_VALID = "SEND PAGE TRAILER({$varOne})";
  private static final String SEND_PAGE_SET_VALID = "SEND PAGE SET({$varOne})";
  private static final String SEND_PAGE_AUTOPAGE_CURRENT_VALID = "SEND PAGE AUTOPAGE CURRENT";
  private static final String SEND_PAGE_AUTOPAGE_NOAUTOPAGE_INVALID = "SEND PAGE {AUTOPAGE|error1} {NOAUTOPAGE|error2}";
  private static final String SEND_PAGE_NOAUTOPAGE_VALID = "SEND PAGE NOAUTOPAGE";
  private static final String SEND_PAGE_OPERPURGE_VALID = "SEND PAGE OPERPURGE";
  private static final String SEND_PAGE_FMHPARM_VALID = "SEND PAGE FMHPARM({$varOne})";
  private static final String SEND_PAGE_LAST_VALID = "SEND PAGE LAST";
  private static final String SEND_PAGE_COMPLEX_VALID = "SEND PAGE RELEASE TRANSID({$varOne}) TRAILER({$varTwo}) SET({$varThree}) AUTOPAGE CURRENT OPERPURGE LAST";

  private static final String SEND_TEXT_FROM_LENGTH_VALID = "SEND TEXT FROM({$varOne}) LENGTH({$varTwo})";
  private static final String SEND_TEXT_FROM_CURSOR_FORMFEED_VALID = "SEND TEXT FROM({$varOne}) CURSOR({$varTwo}) FORMFEED";
  private static final String SEND_TEXT_FROM_ERASE_DEFAULT_VALID = "SEND TEXT FROM({$varOne}) ERASE DEFAULT";
  private static final String SEND_TEXT_FROM_PRINT_FREEKB_ALARM_VALID = "SEND TEXT FROM({$varOne}) PRINT FREEKB ALARM";
  private static final String SEND_TEXT_FROM_OUTPARTN_LDC_INVALID = "SEND TEXT FROM({$varOne}) {OUTPARTN|error1}({$varTwo}) {LDC|error2}({$varThree})";
  private static final String SEND_TEXT_FROM_TERMINAL_SET_INVALID = "SEND TEXT FROM({$varOne}) {TERMINAL|error1} {SET|error2}({$varTwo})";
  private static final String SEND_TEXT_FROM_PAGING_WAIT_LAST_VALID = "SEND TEXT FROM({$varOne}) PAGING WAIT LAST";
  private static final String SEND_TEXT_FROM_JUSTIFY_JUSFIRST_INVALID = "SEND TEXT FROM({$varOne}) {JUSTIFY|error1}({$varTwo}) {JUSFIRST|error2}";
  private static final String SEND_TEXT_FROM_ACCUM_HONEOM_VALID = "SEND TEXT FROM({$varOne}) ACCUM HONEOM";
  private static final String SEND_TEXT_FROM_L80_VALID = "SEND TEXT FROM({$varOne}) L80";
  private static final String SEND_TEXT_COMPLEX_VALID = "SEND TEXT FROM({$varOne}) LENGTH({$varTwo}) CURSOR({$varThree}) ERASE ALARM FMHPARM({$varFour}) LDC({$varSix}) SET({$varSix}) HEADER({$varSix}) TRAILER({$varSix}) JUSFIRST ACCUM L80";
  private static final String SEND_TEXT_LENGTH_INVALID = "SEND {_TEXT LENGTH(123)|error1_}";

  private static final String SEND_TEXT_MAPPED_FROM_LENGTH_VALID = "SEND TEXT MAPPED FROM({$varOne}) LENGTH({$varTwo})";
  private static final String SEND_TEXT_MAPPED_TERMINAL_PAGING_WAIT_LAST_REQID_INVALID = "SEND {_TEXT MAPPED {TERMINAL|error1} {PAGING|error2} WAIT LAST REQID(123)|error3_}";

  private static final String SEND_TEXT_NOEDIT_FROM_LENGTH_ERASE_VALID = "SEND TEXT NOEDIT FROM({$varOne}) LENGTH({$varTwo}) ERASE ALTERNATE";
  private static final String SEND_TEXT_NOEDIT_TERMINAL_PAGING_WAIT_LAST_REQID_L80_INVALID = "SEND {_TEXT NOEDIT {TERMINAL|error2} {PAGING|error3} WAIT LAST REQID({$varOne}) L80|error1_}";

  @Test
  void testSendFromLengthValid() {
    CICSTestUtils.noErrorTest(SEND_FROM_LENGTH_VALID);
  }

  @Test
  void testSendFromFLengthValid() {
    CICSTestUtils.noErrorTest(SEND_FROM_FLENGTH_VALID);
  }
  @Test
  void testSendWaitValid() {
    CICSTestUtils.noErrorTest(SEND_WAIT_VALID);
  }
  @Test
  void testSendFromLengthWaitValid() {
    CICSTestUtils.noErrorTest(SEND_FROM_LENGTH_WAIT_VALID);
  }

  @Test
  void testSendFromFLengthWaitValid() {
    CICSTestUtils.noErrorTest(SEND_FROM_FLENGTH_WAIT_VALID);
  }

  @Test
  void testSendLengthInvalidOne() {
    CICSTestUtils.noErrorTest(SEND_LENGTH_VALID);
  }

  @Test
  void testSendFromWaitInvalidOne() {
    CICSTestUtils.noErrorTest(SEND_FROM_VALID);
  }

  @Test
  void testSendConvidFromLengthValid() {
    CICSTestUtils.noErrorTest(SEND_CONVID_FROM_LENGTH_VALID);
  }

  @Test
  void testSendConvidFromFLengthValid() {
    CICSTestUtils.noErrorTest(SEND_CONVID_FROM_FLENGTH_VALID);
  }

  @Test
  void testSendConvidFromLengthInviteValid() {
    CICSTestUtils.noErrorTest(SEND_CONVID_FROM_LENGTH_INVITE_VALID);
  }

  @Test
  void testSendConvidFromFLengthLastValid() {
    CICSTestUtils.noErrorTest(SEND_CONVID_FROM_FLENGTH_LAST_VALID);
  }

  @Test
  void testSendConvidFromFLengthLastInviteInvalid() {
    CICSTestUtils.errorTest(
            SEND_CONVID_FROM_FLENGTH_LAST_INVITE_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INVITE or LAST",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INVITE or LAST",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendConvidFromFLengthConfirmWaitInvalid() {
    CICSTestUtils.errorTest(
            SEND_CONVID_FROM_FLENGTH_CONFIRM_WAIT_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: CONFIRM or WAIT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: CONFIRM or WAIT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendFromLengthEraseValid() {
    CICSTestUtils.noErrorTest(SEND_FROM_LENGTH_ERASE_VALID);
  }

  @Test
  void testSendFromLengthEraseStrfieldInvalid() {
    CICSTestUtils.errorTest(SEND_FROM_LENGTH_ERASE_STRFIELD_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: STRFIELD or ERASE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: STRFIELD or ERASE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
  @Test
  void testSendFromFLengthAlternateInvalid() {
    CICSTestUtils.errorTest(
            SEND_FROM_FLENGTH_ALTERNATE_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));

  }

  @Test
  void testSendFromLengthCtlcharValid() {
    CICSTestUtils.noErrorTest(SEND_FROM_LENGTH_CTLCHAR_VALID);
  }

  @Test
  void testSendFromFLengthStrfieldValid() {
    CICSTestUtils.noErrorTest(SEND_FROM_FLENGTH_STRFIELD_VALID);
  }

  @Test
  void testSendConvidFromFlengthCnotcomplDefrespInvalid() {
    CICSTestUtils.errorTest(SEND_CONVID_FROM_FLENGTH_CNOTCOMPL_DEFRESP_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: CNOTCOMPL or DEFRESP",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: CNOTCOMPL or DEFRESP",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendFromLengthLdcFmhInvalid() {
    CICSTestUtils.errorTest(SEND_FROM_LENGTH_LDC_FMH_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LDC or FMH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LDC or FMH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendControlCursorValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_CURSOR_VALID);
  }
  @Test
  void testSendControlEraseValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_ERASE_VALID);
  }

  @Test
  void testSendControlEraseAlternateValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_ERASE_ALTERNATE_VALID);
  }

  @Test
  void testSendControlFreekbAlarmValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_FREEKB_ALARM_VALID);
  }

  @Test
  void testSendControlFormfeedPrintValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_FORMFEED_PRINT_VALID);
  }

  @Test
  void testSendControlMsrValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_MSR_VALID);
  }

  @Test
  void testSendControlOutpartnLcdInvalid() {
    CICSTestUtils.errorTest(
            SEND_CONTROL_OUTPARTN_LDC_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: OUTPARTN or LDC",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: OUTPARTN or LDC",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
  @Test
  void testSendControlAccumTerminalValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_ACCUM_TERMINAL_VALID);
  }
  @Test
  void testSendControlSetPagingInvalid() {
    CICSTestUtils.errorTest(
            SEND_CONTROL_SET_PAGING_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or SET or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or SET or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
  @Test
  void testSendControlWaitLastInvalid() {
    CICSTestUtils.errorTest(
            SEND_CONTROL_WAIT_LAST_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: TERMINAL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
  @Test
  void testSendControlReqidHoneomValid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_REQID_HONEOM_VALID);
  }

  @Test
  void testSendControlL80Valid() {
    CICSTestUtils.noErrorTest(SEND_CONTROL_L80_VALID);
  }

  @Test
  void testSendMapValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_VALID);
  }

  @Test
  void testSendMapMapsetValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPSET_VALID);
  }

  @Test
  void testSendMapFromLengthValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_FROM_LENGTH_VALID);
  }

  @Test
  void testSendMapDataonlyValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_DATAONLY_VALID);
  }

  @Test
  void testSendMapDataonlyInvalid() {
    CICSTestUtils.errorTest(
            SEND_MAP_DATAONLY_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: DATAONLY or MAPONLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: DATAONLY or MAPONLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendMapCursorValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_CURSOR_VALID);
  }

  @Test
  void testSendMapEraseValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_ERASE_VALID);
  }

  @Test
  void testSendMapEraseAlternateValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_ERASE_ALTERNATE_VALID);
  }

  @Test
  void testSendMapFreekbAlarmValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_FREEKB_ALARM_VALID);
  }

  @Test
  void testSendMapFormfeedPrintValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_FORMFEED_PRINT_VALID);
  }

  @Test
  void testSendMapMappingdevInvalid() {
    CICSTestUtils.errorTest(
            SEND_MAP_MAPPINGDEV_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: SET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendMapMappingdevSetValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_SET_VALID);
  }

  @Test
  void testSendMapMappingdevMapsetValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_MAPSET_VALID);
  }

  @Test
  void testSendMapMappingdevFromLengthValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_FROM_LENGTH_VALID);
  }

  @Test
  void testSendMapMappingdevDataonlyMaponlyInvalid() {
    CICSTestUtils.errorTest(
            SEND_MAP_MAPPINGDEV_DATAONLY_MAPONLY_VALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: DATAONLY or MAPONLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: DATAONLY or MAPONLY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendMapMappingdevMaponlyValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_MAPONLY_VALID);
  }

  @Test
  void testSendMapMappingdevCursorValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_CURSOR_VALID);
  }

  @Test
  void testSendMapMappingdevEraseValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_ERASE_VALID);
  }

  @Test
  void testSendMapMappingdevEraseaupInvalid() {
    CICSTestUtils.errorTest(
            SEND_MAP_MAPPINGDEV_ERASEAUP_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ERASE or ERASEAUP",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ERASE or ERASEAUP",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendMapMappingdevFreekbAlarmValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_FREEKB_ALARM_VALID);
  }

  @Test
  void testSendMapMappingdevFormfeedPrintValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_FORMFEED_PRINT_VALID);
  }

  @Test
  void testSendMapMappingdevFrsetValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_FRSET_VALID);
  }

  @Test
  void testSendMapMappingdevComplexValid() {
    CICSTestUtils.noErrorTest(SEND_MAP_MAPPINGDEV_COMPLEX_VALID);
  }

  @Test
  void testSendPageReleaseValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_RELEASE_VALID);
  }

  @Test
  void testSendPageRetainTransidInvalid() {
    CICSTestUtils.errorTest(
            SEND_PAGE_RETAIN_TRANSID_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: RELEASE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendPageTrailerValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_TRAILER_VALID);
  }

  @Test
  void testSendPageSetValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_SET_VALID);
  }

  @Test
  void testSendPageAutopageCurrentValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_AUTOPAGE_CURRENT_VALID);
  }

  @Test
  void testSendPageAutopageNoautopageInvalid() {
    CICSTestUtils.errorTest(
            SEND_PAGE_AUTOPAGE_NOAUTOPAGE_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: AUTOPAGE or NOAUTOPAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: AUTOPAGE or NOAUTOPAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendPageNoautopageValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_NOAUTOPAGE_VALID);
  }

  @Test
  void testSendPageOperpurgeValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_OPERPURGE_VALID);
  }

  @Test
  void testSendPageFmhparmValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_FMHPARM_VALID);
  }

  @Test
  void testSendPageLastValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_LAST_VALID);
  }

  @Test
  void testSendPageComplexValid() {
    CICSTestUtils.noErrorTest(SEND_PAGE_COMPLEX_VALID);
  }

  @Test
  void testSendTextFromLengthValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_FROM_LENGTH_VALID);
  }

  @Test
  void testSendTextFromCursorFormfeedValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_FROM_CURSOR_FORMFEED_VALID);
  }

  @Test
  void testSendTextFromEraseDefaultValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_FROM_ERASE_DEFAULT_VALID);
  }

  @Test
  void testSendTextFromPrintFreekbAlarmValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_FROM_PRINT_FREEKB_ALARM_VALID);
  }

  @Test
  void testSendTextFromOutpartnLdcInvalid() {
    CICSTestUtils.errorTest(
            SEND_TEXT_FROM_OUTPARTN_LDC_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LDC or OUTPARTN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LDC or OUTPARTN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendTextFromTerminalSetInvalid() {
    CICSTestUtils.errorTest(
            SEND_TEXT_FROM_TERMINAL_SET_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or SET or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or SET or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendTextFromPagingWaitLastInvalid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_FROM_PAGING_WAIT_LAST_VALID);
  }

  @Test
  void testSendTextFromJustifyJusfirstInvalid() {
    CICSTestUtils.errorTest(
            SEND_TEXT_FROM_JUSTIFY_JUSFIRST_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: JUSTIFY or JUSFIRST or JUSLAST",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: JUSTIFY or JUSFIRST or JUSLAST",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
  @Test
  void testSendTextFromAccumHoneomValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_FROM_ACCUM_HONEOM_VALID);
  }

  @Test
  void testSendTextFromL80Valid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_FROM_L80_VALID);
  }

  @Test
  void testSendTextComplexValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_COMPLEX_VALID);
  }

  @Test
  void testSendTextLengthInvalid() {
    CICSTestUtils.errorTest(
            SEND_TEXT_LENGTH_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendTextMappedFromLengthValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_MAPPED_FROM_LENGTH_VALID);
  }

  @Test
  void testSendTextMappedTerminalPagingWaitLastReqidValid() {
    CICSTestUtils.errorTest(
            SEND_TEXT_MAPPED_TERMINAL_PAGING_WAIT_LAST_REQID_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error3",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendTextNoeditFromLengthEraseValid() {
    CICSTestUtils.noErrorTest(SEND_TEXT_NOEDIT_FROM_LENGTH_ERASE_VALID);
  }

  @Test
  void testSendTextNoeditTerminalPagingWaitLastReqidL80Invalid() {
    CICSTestUtils.errorTest(
            SEND_TEXT_NOEDIT_TERMINAL_PAGING_WAIT_LAST_REQID_L80_INVALID,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error3",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: TERMINAL or PAGING",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
