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
 * Test CICS LINK commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-link">LINK Command</a>
 *
 * <p>This class tests all variations of the LINK command: PROGRAM, ACQPROCESS, and ACTIVITY.
 */
public class TestCICSLink {
  private static final String LINK_PROGRAM_VALID_ONE =
          "LINK PROGRAM({$varOne}) COMMAREA({$varTwo}) LENGTH({$varThree})";

  private static final String LINK_PROGRAM_VALID_TWO =
          "LINK PROGRAM({$varOne}) CHANNEL({$varTwo}) INPUTMSG({$varThree}) INPUTMSGLEN({$varFour})";

  private static final String LINK_PROGRAM_INVALID_ONE =
          "LINK {COMMAREA(123)|errorOne}";

  private static final String LINK_PROGRAM_INVALID_TWO =
          "LINK PROGRAM({$varOne}) {COMMAREA|errorOne}({$varTwo}) {CHANNEL|errorTwo}({$varThree})";

  private static final String LINK_PROGRAM_INVALID_THREE =
          "LINK PROGRAM({$varOne}) {INPUTMSG|errorOne}({$varTwo}) {SYSID|errorTwo}({$varThree})";

  private static final String LINK_ACQPROCESS_VALID =
          "LINK ACQPROCESS INPUTEVENT({$varOne})";

  private static final String LINK_ACQPROCESS_INVALID =
          "LINK {INPUTEVENT(123)|errorOne}";

  private static final String LINK_ACTIVITY_VALID_ONE =
          "LINK ACTIVITY({$varOne}) INPUTEVENT({$varTwo})";

  private static final String LINK_ACTIVITY_VALID_TWO =
          "LINK ACQACTIVITY INPUTEVENT({$varTwo})";

  private static final String LINK_ACTIVITY_INVALID =
          "LINK {ACTIVITY|errorOne}({$varOne}) {ACQACTIVITY|errorTwo}";

  @Test
  void testLinkProgramValidOne() {
    CICSTestUtils.noErrorTest(LINK_PROGRAM_VALID_ONE);
  }

  @Test
  void testLinkProgramValidTwo() {
    CICSTestUtils.noErrorTest(LINK_PROGRAM_VALID_TWO);
  }

  @Test
  void testLinkProgramInvalidOne() {
    CICSTestUtils.errorTest(
            LINK_PROGRAM_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: PROGRAM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testLinkProgramInvalidTwo() {
    CICSTestUtils.errorTest(
            LINK_PROGRAM_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: COMMAREA or CHANNEL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: COMMAREA or CHANNEL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testLinkProgramInvalidThree() {
    CICSTestUtils.errorTest(
            LINK_PROGRAM_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INPUTMSG or SYSID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INPUTMSG or SYSID",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testLinkAcqprocessValid() {
    CICSTestUtils.noErrorTest(LINK_ACQPROCESS_VALID);
  }

  @Test
  void testLinkAcqprocessInvalid() {
    CICSTestUtils.errorTest(
            LINK_ACQPROCESS_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: ACQPROCESS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testLinkActivityValidOne() {
    CICSTestUtils.noErrorTest(LINK_ACTIVITY_VALID_ONE);
  }

  @Test
  void testLinkActivityValidTwo() {
    CICSTestUtils.noErrorTest(LINK_ACTIVITY_VALID_TWO);
  }

  @Test
  void testLinkActivityInvalid() {
    CICSTestUtils.errorTest(
            LINK_ACTIVITY_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
