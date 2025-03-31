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
 * Test CICS HANDLE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-wsacontext-build">WSACONTEXT  Command</a>
 *
 * <p>This class tests all variations of the WSACONTEXT  command: BUILD, DELETE, and GET.
 */
public class TestCICSWSAContext {
  private static final String WSACONTEXT_BUILD_VALID_ONE =
          "WSACONTEXT BUILD CHANNEL({$varOne}) ACTION({$varTwo})";

  private static final String WSACONTEXT_BUILD_VALID_TWO =
          "WSACONTEXT BUILD EPRTYPE({$varThree}) EPRFIELD({$varFour}) EPRFROM({$varFive}) EPRLENGTH({$varSix}) FROMCCSID({$varSix})";

  private static final String WSACONTEXT_BUILD_INVALID_ONE =
          "WSACONTEXT BUILD RELATESURI({$varOne}) RELATESTYPE({$varTwo}) {FROMCCSID|errorOne}({$varOne}) {FROMCODEPAGE|errorTwo}({$varTwo})";

  private static final String WSACONTEXT_BUILD_INVALID_TWO =
          "WSACONTEXT {_BUILD EPRTYPE({$varOne}) EPRFIELD({$varTwo})|errorOne_}";

  private static final String WSACONTEXT_BUILD_INVALID_THREE =
          "WSACONTEXT {_BUILD EPRLENGTH({$varTwo})|errorOne_}";

  private static final String WSACONTEXT_DELETE_VALID =
          "WSACONTEXT DELETE CHANNEL({$varOne})";

  private static final String WSACONTEXT_DELETE_INVALID =
          "WSACONTEXT {DELETE|errorOne}";

  private static final String WSACONTEXT_GET_VALID_ONE =
          "WSACONTEXT GET CONTEXTTYPE({$varOne}) CHANNEL({$varTwo}) ACTION({$varThree})";

  private static final String WSACONTEXT_GET_VALID_TWO =
          "WSACONTEXT GET CONTEXTTYPE({$varOne}) EPRTYPE({$varSix}) EPRFIELD({$varSix}) EPRINTO({$varSix}) EPRLENGTH({$varSix})";

  private static final String WSACONTEXT_GET_INVALID_ONE =
          "WSACONTEXT {_GET ACTION({$varThree}) {INTOCCSID|errorTwo}({$varTwo}) {INTOCODEPAGE|errorThree}(123)|errorOne_}";

  private static final String WSACONTEXT_GET_INVALID_TWO =
          "WSACONTEXT {_GET CONTEXTTYPE({$varOne}) EPRTYPE({$varTwo}) EPRFIELD({$varThree}) {EPRINTO|errorOne}({$varFour}) {EPRSET|errorTwo}({$varFive}) EPRLENGTH({$varSix})|errorThree_}";

  private static final String WSACONTEXT_GET_INVALID_THREE =
          "WSACONTEXT BUILD CHANNEL({$varOne}) {CHANNEL|errorOne}({$varTwo}) ACTION({$varThree})";

  private static final String WSACONTEXT_GET_INVALID_FOUR =
          "WSACONTEXT GET CONTEXTTYPE({$varOne}) RELATESURI({$varTwo}) {RELATESURI|errorOne}({$varThree})";

  private static final String WSACONTEXT_GET_INVALID_FIVE =
          "WSACONTEXT {_GET CONTEXTTYPE({$varOne}) EPRTYPE({$varSix}) EPRFIELD({$varSix}) EPRLENGTH({$varSix})|errorOne_}";

  @Test
  void testWSAContextBuildValidOne() {
    CICSTestUtils.noErrorTest(WSACONTEXT_BUILD_VALID_ONE);
  }

  @Test
  void testWSAContextBuildValidTwo() {
    CICSTestUtils.noErrorTest(WSACONTEXT_BUILD_VALID_TWO);
  }

  @Test
  void testWSAContextBuildInvalidOne() {
    CICSTestUtils.errorTest(
            WSACONTEXT_BUILD_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROMCCSID or FROMCODEPAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROMCCSID or FROMCODEPAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextBuildInvalidTwo() {
    CICSTestUtils.errorTest(
            WSACONTEXT_BUILD_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "If one option is specified, all options must be present: EPRTYPE, EPRFIELD and EPRFROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextBuildInvalidThree() {
    CICSTestUtils.errorTest(
            WSACONTEXT_BUILD_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: EPRTYPE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextDeleteValid() {
    CICSTestUtils.noErrorTest(WSACONTEXT_DELETE_VALID);
  }

  @Test
  void testWSAContextDeleteInvalid() {
    CICSTestUtils.errorTest(
            WSACONTEXT_DELETE_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: CHANNEL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextGetValidOne() {
    CICSTestUtils.noErrorTest(WSACONTEXT_GET_VALID_ONE);
  }

  @Test
  void testWSAContextGetValidTwo() {
    CICSTestUtils.noErrorTest(WSACONTEXT_GET_VALID_TWO);
  }

  @Test
  void testWSAContextGetInvalidOne() {
    CICSTestUtils.errorTest(
            WSACONTEXT_GET_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: CONTEXTTYPE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTOCCSID or INTOCODEPAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTOCCSID or INTOCODEPAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextGetInvalidTwo() {
    CICSTestUtils.errorTest(
            WSACONTEXT_GET_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EPRINTO or EPRSET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EPRINTO or EPRSET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorThree",
                    new Diagnostic(
                            new Range(),
                            "Invalid parameters combination. Valid combination is: EPRTYPE, EPRFIELD, (EPRINTO or EPRSET) and EPRLENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextBuildDuplicateOptions() {
    CICSTestUtils.errorTest(
            WSACONTEXT_GET_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: CHANNEL",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextGetDuplicateOptions() {
    CICSTestUtils.errorTest(
            WSACONTEXT_GET_INVALID_FOUR,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: RELATESURI",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testWSAContextGetInvalidFive() {
    CICSTestUtils.errorTest(
            WSACONTEXT_GET_INVALID_FIVE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Invalid parameters combination. Valid combination is: EPRTYPE, EPRFIELD, (EPRINTO or EPRSET) and EPRLENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
