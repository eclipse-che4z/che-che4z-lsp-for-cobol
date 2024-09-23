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
 * Test CICS WAIT commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-wait-convid-appc">WAIT Command</a>
 *
 * <p>This class tests all variations of the WAIT command found in the link above.
 */
public class TestCICSWait {
  private static final String CONVID_VALID_ONE = "WAIT CONVID({$varOne}) STATE({$varOne})";

  private static final String CONVID_VALID_TWO = "WAIT CONVID({$varOne})";

  private static final String CONVID_INVALID_ONE =
      "WAIT CONVID(100) STATE(100) {STATE|errorOne}(100)";

  private static final String EVENT_VALID_ONE =
      "WAIT EVENT ECADDR({$varOne}) NAME({$varTwo}) RESP({$varOne})";

  private static final String EVENT_VALID_TWO = "WAIT EVENT ECADDR({$varOne})";

  private static final String EVENT_INVALID_ONE =
      "WAIT EVENT ECADDR(100) {ECADDR|errorOne}(100) NAME(100) RESP(100)";

  private static final String EXTERNAL_VALID_ONE =
      "WAIT EXTERNAL ECBLIST({$varOne}) NUMEVENTS({$varTwo}) PURGEABILITY({$varOne}) NAME({$varOne}) NOHANDLE";

  private static final String EXTERNAL_VALID_TWO =
      "WAIT EXTERNAL ECBLIST({$varOne}) NUMEVENTS({$varTwo})";

  private static final String EXTERNAL_INVALID_ONE =
      "WAIT EXTERNAL ECBLIST(100) NUMEVENTS(100) {PURGEABLE|errorOne} {NOTPURGEABLE|errorTwo}";

  private static final String JOURNALNAME_VALID_ONE =
      "WAIT JOURNALNAME({$varOne}) REQID({$varOne})";

  private static final String JOURNALNUM_VALID_ONE =
      "WAIT JOURNALNUM({$varOne}) REQID({$varOne}) RESP({$varOne})";

  private static final String JOURNALNAME_VALID_TWO = "WAIT JOURNALNAME({$varOne})";

  private static final String JOURNALNAME_INVALID_ONE =
      "WAIT {JOURNALNAME|errorOne}(100) {JOURNALNUM|errorTwo}(100) REQID(100) NOHANDLE";

  private static final String SIGNAL_VALID_ONE = "WAIT SIGNAL RESP({$varOne})";

  private static final String SIGNAL_INVALID_ONE = "WAIT SIGNAL {SIGNAL|errorOne}";

  private static final String TERMINAL_VALID_ONE =
      "WAIT TERMINAL SESSION({$varOne}) RESP({$varOne})";

  private static final String TERMINAL_VALID_TWO = "WAIT TERMINAL";

  private static final String TERMINAL_INVALID_ONE =
      "WAIT TERMINAL {SESSION|errorOne}(100) {CONVID|errorTwo}(100)";

  @Test
  void testConvidValidOne() {
    CICSTestUtils.noErrorTest(CONVID_VALID_ONE);
  }

  @Test
  void testConvidValidTwo() {
    CICSTestUtils.noErrorTest(CONVID_VALID_TWO);
  }

  @Test
  void testConvidInvalidOne() {
    CICSTestUtils.errorTest(
        CONVID_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: STATE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testEventValidOne() {
    CICSTestUtils.noErrorTest(EVENT_VALID_ONE);
  }

  @Test
  void testEventValidTwo() {
    CICSTestUtils.noErrorTest(EVENT_VALID_TWO);
  }

  @Test
  void testEventInvalidOne() {
    CICSTestUtils.errorTest(
        EVENT_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: ECADDR",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testExternalValidOne() {
    CICSTestUtils.noErrorTest(EXTERNAL_VALID_ONE);
  }

  @Test
  void testExternalValidTwo() {
    CICSTestUtils.noErrorTest(EXTERNAL_VALID_TWO);
  }

  @Test
  void testExternalInvalidOne() {
    CICSTestUtils.errorTest(
        EXTERNAL_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: PURGEABLE or PURGEABILITY or NOTPURGEABLE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: PURGEABLE or PURGEABILITY or NOTPURGEABLE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testJournalNameValidOne() {
    CICSTestUtils.noErrorTest(JOURNALNAME_VALID_ONE);
  }

  @Test
  void testJournalNumValidOne() {
    CICSTestUtils.noErrorTest(JOURNALNUM_VALID_ONE);
  }

  @Test
  void testJournalNameValidTwo() {
    CICSTestUtils.noErrorTest(JOURNALNAME_VALID_TWO);
  }

  @Test
  void testJournalNameInvalidOne() {
    CICSTestUtils.errorTest(
        JOURNALNAME_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: JOURNALNAME or JORUNALNUM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: JOURNALNAME or JORUNALNUM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testSignalValidOne() {
    CICSTestUtils.noErrorTest(SIGNAL_VALID_ONE);
  }

  @Test
  void testSignalInvalidOne() {
    CICSTestUtils.errorTest(
        SIGNAL_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: SIGNAL",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testTerminalValidOne() {
    CICSTestUtils.noErrorTest(TERMINAL_VALID_ONE);
  }

  @Test
  void testTerminalValidTwo() {
    CICSTestUtils.noErrorTest(TERMINAL_VALID_TWO);
  }

  @Test
  void testTerminalInvalidOne() {
    CICSTestUtils.errorTest(
        TERMINAL_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: SESSION or CONVID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: SESSION or CONVID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
