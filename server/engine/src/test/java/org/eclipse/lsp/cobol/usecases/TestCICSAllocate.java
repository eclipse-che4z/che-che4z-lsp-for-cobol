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
 * Test CICS ALLOCATE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-allocate-appc">ALLOCATE Command</a>
 *
 * <p>This class tests all variations of the ALLOCATE command found in the link above.
 */
public class TestCICSAllocate {
  private static final String APPC_ALL_OPTIONS_VALID_ONE =
      "ALLOCATE PARTNER({$varFour}) NOQUEUE STATE({$varFour})";

  private static final String APPC_ALL_OPTIONS_VALID_TWO =
      "ALLOCATE SYSID({$varOne}) PROFILE({$varSix}) NOQUEUE STATE({$varFour})";

  private static final String APPC_INVALID_ONE =
      "ALLOCATE PARTNER({$varFour}) {PROFILE|error1}(100) NOQUEUE STATE(err)";

  private static final String LUT61_ALL_OPTIONS_VALID_ONE =
      "ALLOCATE SESSION({$varFive}) PROFILE({$varSix}) NOQUEUE";

  private static final String LUT61_INVALID_ONE =
      "ALLOCATE SESSION(100) PROFILE(100) {STATE|errorOne}(100)";

  private static final String MRO_ALL_OPTIONS_VALID_ONE =
      "ALLOCATE SYSID({$varOne}) PROFILE({$varSix}) NOQUEUE STATE({$varFour})";

  @Test
  void testAPPCAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(APPC_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testAPPCAllOptionsValidTwo() {
    CICSTestUtils.noErrorTest(APPC_ALL_OPTIONS_VALID_TWO);
  }

  @Test
  void testAPPCInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input PROFILE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(APPC_INVALID_ONE, expectedDiagnostic);
  }

  @Test
  void testLUT61AllOptionsValidOne() {
    CICSTestUtils.noErrorTest(LUT61_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testLUT61InvalidOne() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Extraneous input STATE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(LUT61_INVALID_ONE, expectedDiagnostic);
  }

  @Test
  void testMROAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(MRO_ALL_OPTIONS_VALID_ONE);
  }
}
