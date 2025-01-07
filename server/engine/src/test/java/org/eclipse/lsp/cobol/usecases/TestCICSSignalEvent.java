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
 * Test CICS SIGNAL EVENT command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-signal-event">SIGNAL EVENT Command</a>
 *
 * <p>This class tests the SIGNAL EVENT command.
 */
public class TestCICSSignalEvent {
  private static final String SIGNAL_EVENT_VALID_MINIMAL =
          "SIGNAL EVENT({$varOne})";

  private static final String SIGNAL_FROM_INVALID =
          "SIGNAL {FROM(123)|errorOne}";

  private static final String SIGNAL_EVENT_VALID_FROMCHANNEL =
          "SIGNAL EVENT({$varOne}) FROMCHANNEL({$varTwo})";

  private static final String SIGNAL_EVENT_VALID_FROM =
          "SIGNAL EVENT({$varOne}) FROM({$varTwo}) FROMLENGTH({$varThree})";

  private static final String SIGNAL_EVENT_INVALID_BOTH_FROM =
          "SIGNAL EVENT({$varOne}) {FROMCHANNEL|errorOne}({$varTwo}) {FROM|errorTwo}({$varThree})";

  private static final String SIGNAL_EVENT_INVALID_FROMLENGTH_WITHOUT_FROM =
          "SIGNAL {_EVENT({$varOne}) FROMLENGTH(123)|errorOne_}";

  @Test
  void testSignalEventValidMinimal() {
    CICSTestUtils.noErrorTest(SIGNAL_EVENT_VALID_MINIMAL);
  }

  @Test
  void testSignalFromInvalid() {
    CICSTestUtils.errorTest(
            SIGNAL_FROM_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: EVENT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSignalEventValidFromchannel() {
    CICSTestUtils.noErrorTest(SIGNAL_EVENT_VALID_FROMCHANNEL);
  }

  @Test
  void testSignalEventValidFrom() {
    CICSTestUtils.noErrorTest(SIGNAL_EVENT_VALID_FROM);
  }

  @Test
  void testSignalEventInvalidBothFrom() {
    CICSTestUtils.errorTest(
            SIGNAL_EVENT_INVALID_BOTH_FROM,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROMCHANNEL or FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROMCHANNEL or FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSignalEventInvalidFromlengthWithoutFrom() {
    CICSTestUtils.errorTest(
            SIGNAL_EVENT_INVALID_FROMLENGTH_WITHOUT_FROM,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
