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
 * Test CICS INVOKE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-invoke-application">INVOKE Command</a>
 *
 * <p>This class tests all variations of the INVOKE command: APPLICATION and SERVICE.
 */
public class TestCICSInvoke {
  private static final String INVOKE_APPLICATION_VALID_ONE =
          "INVOKE APPLICATION({$varOne}) OPERATION({$varTwo}) PLATFORM({$varThree})";

  private static final String INVOKE_APPLICATION_VALID_TWO =
          "INVOKE APPLICATION({$varOne}) OPERATION({$varTwo}) COMMAREA({$varThree}) LENGTH({$varFour})";

  private static final String INVOKE_APPLICATION_INVALID_ONE =
          "INVOKE APPLICATION({$varOne}) {APPLICATION|errorOne}({$varTwo}) OPERATION({$varThree})";

  private static final String INVOKE_APPLICATION_INVALID_TWO =
          "INVOKE APPLICATION({$varOne}) OPERATION({$varTwo}) MAJORVERSION({$varTwo}) MINORVERSION({$varTwo}) {EXACTMATCH|errorOne} {MINIMUM|errorTwo}";

  private static final String INVOKE_APPLICATION_INVALID_THREE =
          "INVOKE {_APPLICATION({$varOne}) OPERATION({$varTwo}) LENGTH(123)|errorOne_}";

  private static final String INVOKE_SERVICE_VALID_ONE =
          "INVOKE SERVICE({$varOne}) CHANNEL({$varTwo}) OPERATION({$varThree}) URI({$varFour})";

  private static final String INVOKE_SERVICE_VALID_TWO =
          "INVOKE SERVICE({$varOne}) CHANNEL({$varTwo}) OPERATION({$varThree}) URIMAP({$varFour}) SCOPE({$varFive}) SCOPELEN({$varSix})";

  private static final String INVOKE_SERVICE_INVALID_ONE =
          "INVOKE SERVICE({$varOne}) CHANNEL({$varTwo}) OPERATION({$varThree}) {URI|errorOne}({$varFour}) {URIMAP|errorTwo}({$varFive})";

  private static final String INVOKE_SERVICE_INVALID_TWO =
          "INVOKE {_SERVICE({$varOne}) CHANNEL({$varTwo}) OPERATION({$varThree}) SCOPELEN(123)|errorOne_}";

  private static final String INVOKE_SERVICE_INVALID_THREE =
          "INVOKE {SERVICE|errorOne}({$varOne}) {WEBSERVICE|errorTwo}({$varOne}) CHANNEL({$varTwo}) OPERATION({$varThree}) URI({$varFour})";

  @Test
  void testInvokeApplicationValidOne() {
    CICSTestUtils.noErrorTest(INVOKE_APPLICATION_VALID_ONE);
  }

  @Test
  void testInvokeApplicationValidTwo() {
    CICSTestUtils.noErrorTest(INVOKE_APPLICATION_VALID_TWO);
  }

  @Test
  void testInvokeApplicationInvalidOne() {
    CICSTestUtils.errorTest(
            INVOKE_APPLICATION_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: APPLICATION",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testInvokeApplicationInvalidTwo() {
    CICSTestUtils.errorTest(
            INVOKE_APPLICATION_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EXACTMATCH or MINIMUM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EXACTMATCH or MINIMUM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testInvokeApplicationInvalidThree() {
    CICSTestUtils.errorTest(
            INVOKE_APPLICATION_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: COMMAREA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testInvokeServiceValidOne() {
    CICSTestUtils.noErrorTest(INVOKE_SERVICE_VALID_ONE);
  }

  @Test
  void testInvokeServiceValidTwo() {
    CICSTestUtils.noErrorTest(INVOKE_SERVICE_VALID_TWO);
  }

  @Test
  void testInvokeServiceInvalidOne() {
    CICSTestUtils.errorTest(
            INVOKE_SERVICE_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: URI or URIMAP",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: URI or URIMAP",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testInvokeServiceInvalidTwo() {
    CICSTestUtils.errorTest(
            INVOKE_SERVICE_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: SCOPE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testInvokeServiceInvalidThree() {
    CICSTestUtils.errorTest(
            INVOKE_SERVICE_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: SERVICE or WEBSERVICE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: SERVICE or WEBSERVICE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
