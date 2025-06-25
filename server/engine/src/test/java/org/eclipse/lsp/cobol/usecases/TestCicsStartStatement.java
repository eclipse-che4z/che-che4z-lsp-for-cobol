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
import java.util.*;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test START commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-start">START Command</a>
 *
 * <p>This class tests all variations of the START command found in the link above.
 */
public class TestCicsStartStatement {

  // Test Strings
  private static final String START_TRANSID_VALID_1 = "START TRANSID({$varOne})";
  private static final String START_TRANSID_VALID_2 =
      "START TRANSID({$varOne}) AFTER HOURS({$varOne}) REQID({$varOne}) FROM({$varOne})"
          + " LENGTH({$varOne}) FMH TERMID({$varOne}) SYSID({$varOne}) RTRANSID({$varOne})"
          + " RTERMID({$varOne}) QUEUE({$varOne}) NOCHECK PROTECT";

  private static final String START_ATTACH_VALID_1 = "START TRANSID({$varOne}) ATTACH";
  private static final String START_ATTACH_VALID_2 =
      "START TRANSID({$varOne}) ATTACH FROM({$varOne}) LENGTH({$varOne})";

  private static final String START_BREXIT_VALID_1 = "START TRANSID({$varOne}) BREXIT";
  private static final String START_BREXIT_VALID_2 =
      "START TRANSID({$varOne}) BREXIT({$varOne}) BRDATA({$varOne}) BRDATALENGTH({$varOne})"
          + " USERID({$varOne})";

  private static final String START_CHANNEL_VALID_1 = "START TRANSID({$varOne}) CHANNEL({$varOne})";
  private static final String START_CHANNEL_VALID_2 =
      "START TRANSID({$varOne}) CHANNEL({$varOne}) TERMID({$varOne}) SYSID({$varOne}) NOCHECK"
          + " PROTECT";

  private static final String START_TRANSID_INVALID_1 =
      "START TRANSID({$varOne}) TERMID({$varOne}) {USERID|errorOne}({$varOne})";
  private static final String START_TRANSID_INVALID_2 =
      "START {_TRANSID({$varOne}) LENGTH({$varOne} )|errorOne_}";

  private static final String START_ATTACH_INVALID_1 =
      "START {_TRANSID({$varOne}) ATTACH LENGTH({$varOne} )|errorOne_}";

  private static final String START_BREXIT_INVALID_1 =
      "START {_TRANSID({$varOne}) BREXIT({$varOne}) BRDATALENGTH({$varOne} )|errorOne_}";

  private static final String START_CHANNEL_INVALID_1 =
      "START TRANSID({$varOne}) CHANNEL({$varOne}) TERMID({$varOne}) {USERID|errorOne}({$varOne})";
  private static final String START_TRANSID_TRANS_NOLENGTH_INVALID =
      "START {_TRANSID({$varOne}) FROM({$varOne})|error_}";
  private static final String START_ATTACH_TRANS_NOLENGTH_INVALID =
      "START {_TRANSID({$varOne}) ATTACH FROM({$varOne})|error_}";

  // Test Functions
  @Test
  void testCicsStartTransidValid() {
    CICSTestUtils.noErrorTest(START_TRANSID_VALID_1);
    CICSTestUtils.noErrorTest(START_TRANSID_VALID_2);
  }

  @Test
  void testCicsStartAttachValid() {
    CICSTestUtils.noErrorTest(START_ATTACH_VALID_1);
    CICSTestUtils.noErrorTest(START_ATTACH_VALID_2);
  }

  @Test
  void testCicsStartBrexitValid() {
    CICSTestUtils.noErrorTest(START_BREXIT_VALID_1);
    CICSTestUtils.noErrorTest(START_BREXIT_VALID_2);
  }

  @Test
  void testCicsStartChannelValid() {
    CICSTestUtils.noErrorTest(START_CHANNEL_VALID_1);
    CICSTestUtils.noErrorTest(START_CHANNEL_VALID_2);
  }

  // Invalid Tests
  @Test
  void testCicsStartTransidInvalid_1() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Options \"TERMID or USERID\" are mutually exclusive.",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(START_TRANSID_INVALID_1, expectedDiagnostics);
  }

  @Test
  void testCicsStartTransidInvalid_2() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option: LENGTH without FROM",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(START_TRANSID_INVALID_2, expectedDiagnostics);
  }

  @Test
  void testCicsStartAttachInvalid_1() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option: LENGTH without FROM",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(START_ATTACH_INVALID_1, expectedDiagnostics);
  }

  @Test
  void testCicsStartBrexitInvalid_1() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option for: BRDATALENGTH without BRDATA",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(START_BREXIT_INVALID_1, expectedDiagnostics);
  }

  @Test
  void testCicsStartChannelInvalid_1() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Options \"TERMID or USERID\" are mutually exclusive.",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(START_CHANNEL_INVALID_1, expectedDiagnostics);
  }

  @Test
  void testStartTransIdNoLength() {
    CICSTestUtils.errorTest(
        START_TRANSID_TRANS_NOLENGTH_INVALID,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: LENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }

  @Test
  void testStartAttachNoLength() {
    CICSTestUtils.errorTest(
        START_ATTACH_TRANS_NOLENGTH_INVALID,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: LENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }
}
