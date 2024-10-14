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
import java.util.Map;

/**
 * Test CICS ISSUE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-issue-abend">ISSUE Command</a>
 *
 * <p>This class tests all variations of the ISSUE command found in the link above.
 */
public class TestCICSIssue {
  private static final String ISSUE_ABEND_ALL_OPTIONS_VALID_ONE =
      "ISSUE ABEND CONVID({$varFour}) STATE({$varFive})";

  private static final String ISSUE_ABEND_PARTIAL_VALID_ONE = "ISSUE ABEND";

  private static final String ISSUE_ABORT_ALL_OPTIONS_VALID_ONE =
      "ISSUE ABORT SUBADDR({$varOne}) WPMEDIA1 VOLUME({$varOne}) VOLUMELENG({$varOne})";

  private static final String ISSUE_ABORT_PARTIAL_VALID_ONE =
      "ISSUE ABORT DESTID({$varOne}) DESTIDLENG({$varOne})";

  private static final String ISSUE_ABORT_INVALID_ONE = "ISSUE ABORT {PRINT|errorOne}";

  private static final String ISSUE_ADD_ALL_OPTIONS_VALID_ONE =
      "ISSUE ADD DESTID({$varOne}) DESTIDLENG({$varOne}) VOLUME({$varOne}) VOLUMELENG({$varOne}) FROM({$varFour}) LENGTH({$varOne}) NUMREC({$varOne}) DEFRESP NOWAIT RIDFLD({$varFour}) RRN";

  private static final String ISSUE_ADD_PARTIAL_VALID_ONE =
      "ISSUE ADD DESTID({$varOne}) VOLUME({$varOne}) FROM({$varFour})";

  private static final String ISSUE_CONFIRMATION_ALL_OPTIONS_VALID_ONE =
      "ISSUE CONFIRMATION CONVID({$varFour}) STATE({$varFive})";

  private static final String ISSUE_CONFIRMATION_PARTIAL = "ISSUE CONFIRMATION";

  private static final String ISSUE_COPY_FULL =
      "ISSUE COPY TERMID({$varFour}) CTLCHAR({$varThree}) WAIT";

  private static final String ISSUE_COPY_INVALID = "ISSUE {_COPY CTLCHAR(100)|errorOne_}";

  private static final String ISSUE_DISCONNECT_FULL = "ISSUE DISCONNECT SESSION(100) ";

  private static final String ISSUE_DISCONNECT_PARTIAL = "ISSUE DISCONNECT";

  private static final String ISSUE_END_FULL =
      "ISSUE END DESTID({$varOne}) DESTIDLENG({$varOne}) VOLUME({$varOne}) VOLUMELENG({$varOne})";

  private static final String ISSUE_END_PARTIAL = "ISSUE END";

  private static final String ISSUE_END_INVALID = "ISSUE END {CONSOLE|errorOne}";

  private static final String ISSUE_ENDFILE_FULL = "ISSUE ENDFILE ENDOUTPUT";

  private static final String ISSUE_ENDFILE_PARTIAL = "ISSUE ENDFILE";

  private static final String ISSUE_ENDOUTPUT_FULL = "ISSUE ENDOUTPUT ENDFILE";

  private static final String ISSUE_ENDOUTPUT_PARTIAL = "ISSUE ENDOUTPUT";

  private static final String ISSUE_EODS = "ISSUE EODS";

  private static final String ISSUE_ERASE_FULL =
      "ISSUE ERASE DESTID({$varOne}) DESTIDLENG({$varOne}) VOLUME({$varOne}) VOLUMELENG({$varOne}) RIDFLD({$varFour}) KEYLENGTH({$varOne}) KEYNUMBER({$varTwo}) NUMREC({$varOne}) DEFRESP NOWAIT";

  private static final String ISSUE_ERASE_PARTIAL =
      "ISSUE ERASE DESTID({$varOne}) VOLUME({$varOne}) RIDFLD({$varFour}) KEYLENGTH({$varOne}) DEFRESP";

  private static final String ISSUE_ERASE_INVALID =
      "ISSUE {_ERASE DESTID(100) VOLUME(100) NOWAIT|errorTwo|errorOne_}";

  private static final String ISSUE_ERASEAUP_FULL = "ISSUE ERASEAUP WAIT";

  private static final String ISSUE_ERASEAUP_PARTIAL = "ISSUE ERASEAUP";

  private static final String ISSUE_ERROR_FULL = "ISSUE ERROR CONVID({$varFour}) STATE({$varFour})";

  private static final String ISSUE_ERROR_PARTIAL = "ISSUE ERROR";

  private static final String ISSUE_LOAD_FULL = "ISSUE LOAD PROGRAM({$varFour}) CONVERSE";

  private static final String ISSUE_LOAD_PARTIAL = "ISSUE LOAD PROGRAM({$varFour})";

  private static final String ISSUE_NOTE_FULL =
      "ISSUE NOTE DESTID({$varOne}) DESTIDLENG({$varOne}) VOLUME({$varOne}) VOLUMELENG({$varOne}) RIDFLD({$varFour}) RRN";

  private static final String ISSUE_NOTE_INVALID =
      "ISSUE NOTE DESTID(100) DESTIDLENG(111) {VOLUMELENG|errorOne}(100) RIDFLD(111) RRN";

  private static final String ISSUE_PASS_FULL =
      "ISSUE PASS LUNAME({$varOne}) FROM({$varFour}) LENGTH({$varone}) LOGONLOGMODE NOQUIESCE";

  private static final String ISSUE_PASS_PARTIAL =
      "ISSUE PASS LUNAME({$varOne}) LOGONLOGMODE NOQUIESCE";

  private static final String ISSUE_PASS_INVALID =
      "ISSUE PASS LUNAME(100) {LENGTH|errorOne}(100) LOGONLOGMODE NOQUIESCE";

  private static final String ISSUE_PREPARE_FULL =
      "ISSUE PREPARE CONVID({$varFour}) STATE({$varFour})";

  private static final String ISSUE_PREPARE_PARTIAL = "ISSUE PREPARE";

  private static final String ISSUE_PRINT_FULL = "ISSUE PRINT";

  private static final String ISSUE_QUERY_FULL =
      "ISSUE QUERY DESTID({$varOne}) DESTIDLENG({$varTwo}) VOLUME({$varFour}) VOLUMELENG({$varFive})";

  private static final String ISSUE_QUERY_PARTIAL = "ISSUE QUERY DESTID({$varOne})";

  private static final String ISSUE_QUERY_INVALID =
      "ISSUE QUERY DESTID(100) {VOLUMELENG|errorOne}(100)";

  private static final String ISSUE_RECEIVE_FULL =
      "ISSUE RECEIVE INTO({$varFour}) LENGTH({$varone})";

  private static final String ISSUE_RECEIVE_PARTIAL = "ISSUE RECEIVE SET({$varFour})";

  private static final String ISSUE_REPLACE_FULL =
      "ISSUE REPLACE DESTID({$varFour}) DESTIDLENG({$varOne}) VOLUME({$varOne}) VOLUMELENG({$varOne}) FROM({$varFour}) LENGTH({$varone}) NUMREC({$varOne}) RIDFLD({$varFour}) KEYLENGTH({$varOne}) KEYNUMBER({$varOne}) DEFRESP NOWAIT";

  private static final String ISSUE_REPLACE_PARTIAL =
      "ISSUE REPLACE DESTID({$varFour}) FROM({$varFour}) LENGTH({$varOne}) RIDFLD({$varFour}) RRN NOWAIT";

  private static final String ISSUE_REPLACE_INVALID =
      "ISSUE {_REPLACE DESTID(100) {VOLUMELENG|errorTwo}(100) FROM(101) LENGTH(100) RIDFLD(101) NOWAIT|errorOne_}";

  private static final String ISSUE_SEND_FULL =
      "ISSUE SEND SUBADDR({$varOne}) CARD VOLUME({$varTwo}) VOLUMELENG({$varThree}) FROM({$varOne}) LENGTH({$varOne}) NOWAIT DEFRESP";

  private static final String ISSUE_SEND_PARTIAL = "ISSUE SEND SUBADDR({$varOne}) FROM({$varOne})";

  private static final String ISSUE_SEND_INVALID =
      "ISSUE SEND SUBADDR(100) {VOLUMELENG|errorOne}(100) FROM(101)";

  private static final String ISSUE_SIGNAL_FULL =
      "ISSUE SIGNAL CONVID({$varFour}) STATE({$varFive})";

  private static final String ISSUE_SIGNAL_PARTIAL = "ISSUE SIGNAL";

  private static final String ISSUE_WAIT_FULL =
      "ISSUE WAIT DESTID({$varFour}) DESTIDLENG({$varOne}) VOLUME({$varOne}) VOLUMELENG({$varOne})";

  private static final String ISSUE_WAIT_PARTIAL = "ISSUE WAIT";

  private static final String ISSUE_WAIT_INVALID = "ISSUE WAIT {CONSOLE|errorOne}";

  private static final String ISSUE_WAIT_DUPLICATE_COMMON_INVALID =
      "ISSUE WAIT {SUBADDR|errorOne}(100) {CONSOLE|errorTwo} VOLUME(100) RESP(100) NOHANDLE {SUBADDR|errorThree|errorFour}(200) {DESTID|errorFive}(10) DESTIDLENG(100)";

  @Test
  void testIssueAbendAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(ISSUE_ABEND_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testIssueAbendPartialValidOne() {
    CICSTestUtils.noErrorTest(ISSUE_ABEND_PARTIAL_VALID_ONE);
  }

  @Test
  void testIssueAbortAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(ISSUE_ABORT_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testIssueAbortPartialValidOne() {
    CICSTestUtils.noErrorTest(ISSUE_ABORT_PARTIAL_VALID_ONE);
  }

  @Test
  void testIssueAbortInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: PRINT without SUBADDR",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_ABORT_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testIssueAddAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(ISSUE_ADD_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testIssueAddAllOptionsPartialValidOne() {
    CICSTestUtils.noErrorTest(ISSUE_ADD_PARTIAL_VALID_ONE);
  }

  @Test
  void testIssueConfirmationAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(ISSUE_CONFIRMATION_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testIssueConfirmationPartial() {
    CICSTestUtils.noErrorTest(ISSUE_CONFIRMATION_PARTIAL);
  }

  @Test
  void testIssueCopyFull() {
    CICSTestUtils.noErrorTest(ISSUE_COPY_FULL);
  }

  @Test
  void testIssueCopyInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: TERMID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_COPY_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssueDisconnectFull() {
    CICSTestUtils.noErrorTest(ISSUE_DISCONNECT_FULL);
  }

  @Test
  void testIssueDisconnectPartial() {
    CICSTestUtils.noErrorTest(ISSUE_DISCONNECT_PARTIAL);
  }

  @Test
  void testIssueEndFull() {
    CICSTestUtils.noErrorTest(ISSUE_END_FULL);
  }

  @Test
  void testIssueEndPartial() {
    CICSTestUtils.noErrorTest(ISSUE_END_PARTIAL);
  }

  @Test
  void testIssueEndInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: CONSOLE without SUBADDR",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_END_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssueEndFileFull() {
    CICSTestUtils.noErrorTest(ISSUE_ENDFILE_FULL);
  }

  @Test
  void testIssueEndFilePartial() {
    CICSTestUtils.noErrorTest(ISSUE_ENDFILE_PARTIAL);
  }

  @Test
  void testIssueEndOutputFull() {
    CICSTestUtils.noErrorTest(ISSUE_ENDOUTPUT_FULL);
  }

  @Test
  void testIssueEndOutputPartial() {
    CICSTestUtils.noErrorTest(ISSUE_ENDOUTPUT_PARTIAL);
  }

  @Test
  void testIssueEods() {
    CICSTestUtils.noErrorTest(ISSUE_EODS);
  }

  @Test
  void testIssueEraseFull() {
    CICSTestUtils.noErrorTest(ISSUE_ERASE_FULL);
  }

  @Test
  void testIssueErasePartial() {
    CICSTestUtils.noErrorTest(ISSUE_ERASE_PARTIAL);
  }

  @Test
  void testIssueEraseInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: RRN or KEYLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Missing required option: RIDFLD",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_ERASE_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssueEraseAUPFull() {
    CICSTestUtils.noErrorTest(ISSUE_ERASEAUP_FULL);
  }

  @Test
  void testIssueEraseAUPPartial() {
    CICSTestUtils.noErrorTest(ISSUE_ERASEAUP_PARTIAL);
  }

  @Test
  void testIssueErrorFull() {
    CICSTestUtils.noErrorTest(ISSUE_ERROR_FULL);
  }

  @Test
  void testIssueErrorPartial() {
    CICSTestUtils.noErrorTest(ISSUE_ERROR_PARTIAL);
  }

  @Test
  void testIssueLoadFull() {
    CICSTestUtils.noErrorTest(ISSUE_LOAD_FULL);
  }

  @Test
  void testIssueLoadPartial() {
    CICSTestUtils.noErrorTest(ISSUE_LOAD_PARTIAL);
  }

  @Test
  void testIssueNoteFull() {
    CICSTestUtils.noErrorTest(ISSUE_NOTE_FULL);
  }

  @Test
  void testIssueNoteInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: VOLUMELENG without VOLUME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_NOTE_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssuePassFull() {
    CICSTestUtils.noErrorTest(ISSUE_PASS_FULL);
  }

  @Test
  void testIssuePassPartial() {
    CICSTestUtils.noErrorTest(ISSUE_PASS_PARTIAL);
  }

  @Test
  void testIssuePassInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: LENGTH without FROM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_PASS_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssuePrepareFull() {
    CICSTestUtils.noErrorTest(ISSUE_PREPARE_FULL);
  }

  @Test
  void testIssuePreparePartial() {
    CICSTestUtils.noErrorTest(ISSUE_PREPARE_PARTIAL);
  }

  @Test
  void testIssuePrintFull() {
    CICSTestUtils.noErrorTest(ISSUE_PRINT_FULL);
  }

  @Test
  void testIssueQueryFull() {
    CICSTestUtils.noErrorTest(ISSUE_QUERY_FULL);
  }

  @Test
  void testIssueQueryPartial() {
    CICSTestUtils.noErrorTest(ISSUE_QUERY_PARTIAL);
  }

  @Test
  void testIssueQueryInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: VOLUMELENG without VOLUME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_QUERY_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssueReceiveFull() {
    CICSTestUtils.noErrorTest(ISSUE_RECEIVE_FULL);
  }

  @Test
  void testIssueReceivePartial() {
    CICSTestUtils.noErrorTest(ISSUE_RECEIVE_PARTIAL);
  }

  @Test
  void testissueReplaceFull() {
    CICSTestUtils.noErrorTest(ISSUE_REPLACE_FULL);
  }

  @Test
  void testissueReplacePartial() {
    CICSTestUtils.noErrorTest(ISSUE_REPLACE_PARTIAL);
  }

  @Test
  void testissueReplaceInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: RRN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Invalid option provided: VOLUMELENG without VOLUME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_REPLACE_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssueSendFull() {
    CICSTestUtils.noErrorTest(ISSUE_SEND_FULL);
  }

  @Test
  void testIssueSendPartial() {
    CICSTestUtils.noErrorTest(ISSUE_SEND_PARTIAL);
  }

  @Test
  void testIssueSendInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: VOLUMELENG without VOLUME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_SEND_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssueSignalFull() {
    CICSTestUtils.noErrorTest(ISSUE_SIGNAL_FULL);
  }

  @Test
  void testIssueSignalPartial() {
    CICSTestUtils.noErrorTest(ISSUE_SIGNAL_PARTIAL);
  }

  @Test
  void testIssueWaitFull() {
    CICSTestUtils.noErrorTest(ISSUE_WAIT_FULL);
  }

  @Test
  void testIssueWaitPartial() {
    CICSTestUtils.noErrorTest(ISSUE_WAIT_PARTIAL);
  }

  @Test
  void testIssueWaitInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: CONSOLE without SUBADDR",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_WAIT_INVALID, expectedDiagnostics);
  }

  @Test
  void testIssueWaitDuplicateCommonInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: SUBADDR or DESTID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Invalid option provided: CONSOLE with DESTID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorThree",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: SUBADDR or DESTID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorFour",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: SUBADDR",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorFive",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: SUBADDR or DESTID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ISSUE_WAIT_DUPLICATE_COMMON_INVALID, expectedDiagnostics);
  }
}
