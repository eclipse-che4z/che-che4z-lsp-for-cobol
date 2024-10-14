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

import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * Tests CICS STARTBROWSE CONTAINER (EXCI) statement. Ref:
 * https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-link-command-exci
 */
public class TestCicsExciStartBrowseStatement {

  // Main Building Blocks
  private static final String BASE_TEXT =
          "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC CICS \n"
          + "            END-EXEC.";

  private static final String STARTBROWSE_ACTIVITY_VALID = "STARTBROWSE ACTIVITY ACTIVITYID(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_CONTAINER_VALID = "STARTBROWSE CONTAINER PROCESS(123) PROCESSTYPE(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_EVENT_VALID = "STARTBROWSE EVENT ACTIVITYID(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_PROCESS_VALID = "STARTBROWSE PROCESS PROCESSTYPE(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_TIMER_VALID = "STARTBROWSE TIMER(123) BROWSETOKEN(123)";

  private static final String STARTBROWSE_INVALID_PROCESS_CHANNEL = "STARTBROWSE CONTAINER {PROCESS(123)|errorOne} {PROCESSTYPE(123)|errorTwo} CHANNEL(3) BROWSETOKEN(123)";

  // Test Functions
  @Test
  void testStartBrowseActivity() {
    CICSTestUtils.noErrorTest(STARTBROWSE_ACTIVITY_VALID);
  }

  @Test
  void testStartBrowseContainer() {
    CICSTestUtils.noErrorTest(STARTBROWSE_CONTAINER_VALID);
  }

  @Test
  void testStartBrowseEvent() {
    CICSTestUtils.noErrorTest(STARTBROWSE_EVENT_VALID);
  }

  @Test
  void testStartBrowseProcess() {
    CICSTestUtils.noErrorTest(STARTBROWSE_PROCESS_VALID);
  }

  @Test
  void testStartBrowseTimer() {
    CICSTestUtils.noErrorTest(STARTBROWSE_TIMER_VALID);
  }

  // Invalid Test
  @Test
  void testStartBrowseContainerInvalid() {
    Map<String, Diagnostic> tempDiagnostic = new HashMap<>();
    tempDiagnostic.put("errorOne",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: ACTIVITYID or PROCESS",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()));
    tempDiagnostic.put("errorTwo",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: ACTIVITYID or PROCESS",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(STARTBROWSE_INVALID_PROCESS_CHANNEL, tempDiagnostic);
  }
}
