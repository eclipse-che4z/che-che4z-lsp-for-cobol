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
 * Test CICS WAITCICS command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-waitcics">WAITCICS
 * Command</a>
 *
 * <p>This class tests all variations of the WAITCICS command found in the link above.
 */
public class TestCicsWaitCics {
    private static final String WAITCICS_VALID_ALL_OPTIONS_ONE = "WAITCICS ECBLIST({$varOne}) NUMEVENTS({$varTwo}) NAME({$varThree}) PURGEABLE";
    private static final String WAITCICS_VALID_ALL_OPTIONS_TWO = "WAITCICS ECBLIST({$varOne}) NUMEVENTS({$varTwo}) PURGEABILITY({$varFive}) NAME({$varThree})";
    private static final String WAITCICS_VALID_ALL_OPTIONS_THREE = "WAITCICS NUMEVENTS({$varTwo}) ECBLIST({$varOne}) NAME({$varThree}) NOTPURGEABLE";

    private static final String WAITCICS_VALID_SOME_OPTIONS_ONE = "WAITCICS NAME({$varThree}) ECBLIST({$varOne}) NUMEVENTS({$varTwo})";
    private static final String WAITCICS_VALID_SOME_OPTIONS_TWO = "WAITCICS NUMEVENTS({$varTwo}) PURGEABILITY({$varFive}) ECBLIST({$varOne}) ";

    private static final String WAITCICS_VALID_BARE = "WAITCICS NUMEVENTS({$varTwo}) ECBLIST({$varOne})";

    private static final String WAITCICS_INVALID_ONE = "WAITCICS ECBLIST({$varOne}) NUMEVENTS({$varTwo}) {NOTPURGEABLE|error1} {PURGEABLE|error1}";
    private static final String WAITCICS_INVALID_TWO = "WAITCICS ECBLIST({$varOne}) NUMEVENTS({$varTwo}) {PURGEABILITY|error1}({$varFive}) NAME({$varThree}) {PURGEABLE|error1}";
    private static final String WAITCICS_INVALID_THREE = "WAITCICS {PURGEABILITY|error1}({$varFive}) ECBLIST({$varOne}) NUMEVENTS({$varTwo}) {NOTPURGEABLE|error1}";

  @Test
  void testAllValidOne() {
    CICSTestUtils.noErrorTest(WAITCICS_VALID_ALL_OPTIONS_ONE);
  }

  @Test
  void testAllValidTwo() {
    CICSTestUtils.noErrorTest(WAITCICS_VALID_ALL_OPTIONS_TWO);
  }

  @Test
  void testAllValidThree() {
    CICSTestUtils.noErrorTest(WAITCICS_VALID_ALL_OPTIONS_THREE);
  }

  @Test
  void testSomeValidOne() {
    CICSTestUtils.noErrorTest(WAITCICS_VALID_SOME_OPTIONS_ONE);
  }

  @Test
  void testSomeValidTwo() {
    CICSTestUtils.noErrorTest(WAITCICS_VALID_SOME_OPTIONS_TWO);
  }

  @Test
  void testBareValid() {
    CICSTestUtils.noErrorTest(WAITCICS_VALID_BARE);
  }

  @Test
  void testInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: PURGEABLE or NOTPURGEABLE or PURGEABILITY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(WAITCICS_INVALID_ONE, expectedDiagnostic);
  }

  @Test
  void testInvalidTwo() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: PURGEABLE or NOTPURGEABLE or PURGEABILITY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(WAITCICS_INVALID_TWO, expectedDiagnostic);
  }

  @Test
  void testInvalidThree() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: PURGEABLE or NOTPURGEABLE or PURGEABILITY",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(WAITCICS_INVALID_THREE, expectedDiagnostic);
  }
}
