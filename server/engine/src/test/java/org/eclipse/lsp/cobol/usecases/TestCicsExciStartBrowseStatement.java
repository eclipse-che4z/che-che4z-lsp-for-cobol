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
 * https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-startbrowse-activity
 */
public class TestCicsExciStartBrowseStatement {

  // Test Strings
  private static final String STARTBROWSE_ACTIVITY_VALID = "STARTBROWSE ACTIVITY ACTIVITYID(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_CONTAINER_VALID = "STARTBROWSE CONTAINER PROCESS(123) PROCESSTYPE(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_EVENT_VALID = "STARTBROWSE EVENT ACTIVITYID(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_PROCESS_VALID = "STARTBROWSE PROCESS PROCESSTYPE(123) BROWSETOKEN(123)";
  private static final String STARTBROWSE_TIMER_VALID = "STARTBROWSE TIMER(123) BROWSETOKEN(123)";

  private static final String STARTBROWSE_INVALID_CONTAINER = "STARTBROWSE CONTAINER PROCESS(123) PROCESSTYPE(123) {CHANNEL|errorOne}(3) BROWSETOKEN(123)";
  private static final String STARTBROWSE_INVALID_ACTIVITY = "STARTBROWSE {_ACTIVITY ACTIVITYID(123)|errorOne_}";
  private static final String STARTBROWSE_INVALID_EVENT = "STARTBROWSE {_EVENT ACTIVITYID(123)|errorOne_}";
  private static final String STARTBROWSE_INVALID_PROCESS = "STARTBROWSE {_PROCESS BROWSETOKEN(123)|errorOne_}";

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

  // Invalid Tests
  @Test
  void testStartBrowseContainerInvalid() {
    Map<String, Diagnostic> tempDiagnostic = new HashMap<>();
    tempDiagnostic.put("errorOne",
            new Diagnostic(
                    new Range(),
                    "Options \"ACTIVITYID, PROCESS or CHANNEL\" are mutually exclusive.",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(STARTBROWSE_INVALID_CONTAINER, tempDiagnostic);
  }

  @Test
  void testStartBrowseActivityInvalid() {
    Map<String, Diagnostic> tempDiagnostic = new HashMap<>();
    tempDiagnostic.put("errorOne",
            new Diagnostic(
                    new Range(),
                    "Missing required option: BROWSETOKEN",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(STARTBROWSE_INVALID_ACTIVITY, tempDiagnostic);
  }

  @Test
  void testStartBrowseEventInvalid() {
    Map<String, Diagnostic> tempDiagnostic = new HashMap<>();
    tempDiagnostic.put("errorOne",
            new Diagnostic(
                    new Range(),
                    "Missing required option: BROWSETOKEN",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(STARTBROWSE_INVALID_EVENT, tempDiagnostic);
  }

  @Test
  void testStartBrowseProcessInvalid() {
    Map<String, Diagnostic> tempDiagnostic = new HashMap<>();
    tempDiagnostic.put("errorOne",
            new Diagnostic(
                    new Range(),
                    "Missing required option: PROCESSTYPE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(STARTBROWSE_INVALID_PROCESS, tempDiagnostic);
  }
}
