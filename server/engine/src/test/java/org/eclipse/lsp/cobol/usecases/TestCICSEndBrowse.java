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
 * Test CICS ENDBR & ENDBROWSE  commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-endbrowse-activity">ENDBROWSE Command</a>
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-endbr">ENDBR Command</a>
 *
 * <p>This class tests all variations of the ENDBR & ENDBROWSE command found in the link above.
 */
public class TestCICSEndBrowse {
  //  ENDBR
  private static final String ENDBR_FILE_VALID = "ENDBR  FILE({$varFour})";
  private static final String ENDBR_FILE_REQID_VALID = "ENDBR FILE({$varFour}) REQID({$varOne})";
  private static final String ENDBR_FILE_SYSID_VALID = "ENDBR FILE({$varFour}) SYSID({$varOne})";
  private static final String ENDBR_FILE_REQID_SYSID_VALID = "ENDBR FILE({$varFour}) REQID({$varOne}) SYSID({$varFive})";

  //  ENDBROWSE
  private static final String ENDBROWSE_ACTIVITY_VALID = "ENDBROWSE ACTIVITY BROWSETOKEN({$varOne})";
  private static final String ENDBROWSE_ACTIVITY_INVALID = "ENDBROWSE ACTIVITY {ACTIVITY|error1} BROWSETOKEN({$varOne})";
  private static final String ENDBROWSE_ACTIVITY_CONTAINER_INVALID = "ENDBROWSE {ACTIVITY|error1} {CONTAINER|error2} BROWSETOKEN({$varOne})";
  private static final String ENDBROWSE_CONTAINER_VALID = "ENDBROWSE CONTAINER BROWSETOKEN({$varOne})";
  private static final String ENDBROWSE_EVENT_VALID = "ENDBROWSE EVENT BROWSETOKEN({$varOne})";
  private static final String ENDBROWSE_EVENT_TIMER_INVALID = "ENDBROWSE {EVENT|error1} {TIMER|error2} BROWSETOKEN({$varOne})";
  private static final String ENDBROWSE_TIMER_VALID = "ENDBROWSE TIMER BROWSETOKEN({$varOne})";
  private static final String ENDBROWSE_PROCESS_VALID = "ENDBROWSE PROCESS BROWSETOKEN({$varOne})";

  @Test
  void testEndbrFileValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_VALID);
  }

  @Test
  void testEndbrFileReqidValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_REQID_VALID);
  }

  @Test
  void testEndbrFileSysidValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_SYSID_VALID);
  }

  @Test
  void testEndbrFileReqidSysidValid() {
    CICSTestUtils.noErrorTest(ENDBR_FILE_REQID_SYSID_VALID);
  }


  @Test
  void testEndbrowseActivityValid() {
    CICSTestUtils.noErrorTest(ENDBROWSE_ACTIVITY_VALID);
  }

  @Test
  void testEndbrowseActivityInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: ACTIVITY",
                            DiagnosticSeverity.Warning,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ENDBROWSE_ACTIVITY_INVALID, expectedDiagnostics);
  }

  @Test
  void testEndbrowseActivityContainerInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or CONTAINER or EVENT or PROCESS or TIMER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or CONTAINER or EVENT or PROCESS or TIMER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ENDBROWSE_ACTIVITY_CONTAINER_INVALID, expectedDiagnostics);
  }

  @Test
  void testEndbrowseContainerValid() {
    CICSTestUtils.noErrorTest(ENDBROWSE_CONTAINER_VALID);
  }

  @Test
  void testEndbrowseEventValid() {
    CICSTestUtils.noErrorTest(ENDBROWSE_EVENT_VALID);
  }

  @Test
  void testEndbrowseEventTimerInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or CONTAINER or EVENT or PROCESS or TIMER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or CONTAINER or EVENT or PROCESS or TIMER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ENDBROWSE_EVENT_TIMER_INVALID, expectedDiagnostics);
  }

  @Test
  void testEndbrowseProcessValid() {
    CICSTestUtils.noErrorTest(ENDBROWSE_PROCESS_VALID);
  }

  @Test
  void testEndbrowseTimerValid() {
    CICSTestUtils.noErrorTest(ENDBROWSE_TIMER_VALID);
  }
}
