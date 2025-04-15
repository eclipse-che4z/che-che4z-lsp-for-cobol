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

import java.util.*;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test GETNEXT command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-getnext-zos-communications-server-default">GETNEXT
 * Command</a>
 *
 * <p>This class tests all variations of the GETNEXT command found in the link above.
 */
public class TestCicsGetnextStatement {

  // Main Building Blocks
  private static final String BASE_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC CICS \n"
          + "            END-EXEC.";

  private static final String GETNEXT_ACTIVITY_VALID =
      "GETNEXT ACTIVITY({$varOne}) BROWSETOKEN({$varOne}) ACTIVITYID({$varOne}) LEVEL({$varOne})";
  private static final String GETNEXT_CONTAINER_VALID =
      "GETNEXT CONTAINER({$varOne}) BROWSETOKEN({$varOne})";
  private static final String GETNEXT_EVENT_VALID =
      "GETNEXT EVENT({$varOne}) BROWSETOKEN({$varOne}) COMPOSITE({$varOne}) EVENTTYPE({$varOne})"
          + " FIRESTATUS({$varOne}) PREDICATE({$varOne}) TIMER({$varOne})";
  private static final String GETNEXT_PROCESS_VALID =
      "GETNEXT PROCESS({$varOne}) BROWSETOKEN({$varOne}) ACTIVITYID({$varOne})";
  private static final String GETNEXT_TIMER_VALID =
      "GETNEXT TIMER({$varOne}) BROWSETOKEN({$varOne}) ACTIVITYID({$varOne}) EVENT({$varOne})"
          + " STATUS({$varOne}) ABSTIME({$varOne})";

  private static final String GETNEXT_ACTIVITY_INVALID =
      "GETNEXT {_ACTIVITY({$varOne}) LEVEL({$varOne} )|errorOne_}";

  private static final String GETNEXT_EVENT_MISSING_INVALID =
      "GETNEXT {_BROWSETOKEN({$varOne}) COMPOSITE({$varOne}) EVENTTYPE({$varOne})"
          + " FIRESTATUS({$varOne}) PREDICATE({$varOne}) TIMER({$varOne} )|errorOne_}";
  private static final String GETNEXT_TIMER_MISSING_INVALID =
      "GETNEXT {_ABSTIME({$varOne}) BROWSETOKEN({$varOne} )|errorOne_}";

  // Test Functions
  @Test
  void testGetnextActivityValid() {
    CICSTestUtils.noErrorTest(GETNEXT_ACTIVITY_VALID);
  }

  @Test
  void testGetnextContainerValid() {
    CICSTestUtils.noErrorTest(GETNEXT_CONTAINER_VALID);
  }

  @Test
  void testGetnextEventValid() {
    CICSTestUtils.noErrorTest(GETNEXT_EVENT_VALID);
  }

  @Test
  void testGetnextProcessValid() {
    CICSTestUtils.noErrorTest(GETNEXT_PROCESS_VALID);
  }

  @Test
  void testGetnextTimerValid() {
    CICSTestUtils.noErrorTest(GETNEXT_TIMER_VALID);
  }

  // Invalid Tests
  @Test
  void testGetnextActivityInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option: BROWSETOKEN",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GETNEXT_ACTIVITY_INVALID, expectedDiagnostics);
  }

  @Test
  void testGetNextEventMissingInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option: EVENT",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GETNEXT_EVENT_MISSING_INVALID, expectedDiagnostics);
  }

  @Test
  void testGetNextTimerMissingInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option: TIMER",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GETNEXT_TIMER_MISSING_INVALID, expectedDiagnostics);
  }
}
