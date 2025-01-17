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
 * Test CICS RETRIEVE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-retrieve">RETRIEVE Command</a>
 *
 * <p>This class tests all variations of the RETRIEVE command: standard, REATTACH EVENT, and SUBEVENT.
 */
public class TestCICSRetrieve {
  // RETRIEVE standard tests
  private static final String RETRIEVE_STANDARD_VALID_ONE =
          "RETRIEVE INTO({$varOne}) LENGTH({$varTwo}) RTRANSID({$varThree})";

  private static final String RETRIEVE_STANDARD_VALID_TWO =
          "RETRIEVE SET({$varOne}) QUEUE({$varTwo}) WAIT";

  private static final String RETRIEVE_STANDARD_INVALID =
          "RETRIEVE {INTO|errorOne}({$varOne}) {SET|errorTwo}({$varTwo})";

  // RETRIEVE REATTACH EVENT tests
  private static final String RETRIEVE_REATTACH_VALID =
          "RETRIEVE REATTACH EVENT({$varOne}) EVENTTYPE({$varTwo})";

  private static final String RETRIEVE_REATTACH_INVALID =
          "RETRIEVE {EVENT(123)|errorOne}";

  // RETRIEVE SUBEVENT tests
  private static final String RETRIEVE_SUBEVENT_VALID =
          "RETRIEVE SUBEVENT({$varOne}) EVENT({$varTwo}) EVENTTYPE({$varThree})";

  private static final String RETRIEVE_SUBEVENT_INVALID =
          "RETRIEVE {_SUBEVENT({$varOne}) EVENTTYPE(123)|errorOne_}";

  @Test
  void testRetrieveStandardValidOne() {
    CICSTestUtils.noErrorTest(RETRIEVE_STANDARD_VALID_ONE);
  }

  @Test
  void testRetrieveStandardValidTwo() {
    CICSTestUtils.noErrorTest(RETRIEVE_STANDARD_VALID_TWO);
  }

  @Test
  void testRetrieveStandardInvalid() {
    CICSTestUtils.errorTest(
            RETRIEVE_STANDARD_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTO or SET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTO or SET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testRetrieveReattachValid() {
    CICSTestUtils.noErrorTest(RETRIEVE_REATTACH_VALID);
  }

  @Test
  void testRetrieveReattachInvalid() {
    CICSTestUtils.errorTest(
            RETRIEVE_REATTACH_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: REATTACH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testRetrieveSubeventValid() {
    CICSTestUtils.noErrorTest(RETRIEVE_SUBEVENT_VALID);
  }

  @Test
  void testRetrieveSubeventInvalid() {
    CICSTestUtils.errorTest(
            RETRIEVE_SUBEVENT_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: EVENT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
