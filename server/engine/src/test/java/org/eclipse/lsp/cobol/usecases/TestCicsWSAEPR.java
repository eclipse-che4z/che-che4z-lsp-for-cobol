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
 * Test CICS WSAEPR CREATE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-wsaepr-create">WSAEPR CREATE
 * Command</a>
 *
 * <p>This class tests all variations of the WSAEPR CREATE command found in the link above.
 */
public class TestCicsWSAEPR {
  private static final String WSAEPR_CREATE_ALL_OPTIONS_VALID = "WSAEPR CREATE EPRINTO(1) EPRLENGTH(1) ADDRESS(2) FROMCCSID(1)"
      + "  REFPARMS(1) REFPARMSLEN(1) METADATA(1) METADATALEN(1)";

  private static final String WSAEPR_CREATE_SOME_OPTIONS_VALID_ONE = "WSAEPR EPRLENGTH(1) CREATE ADDRESS(2) EPRSET(1) FROMCODEPAGE(1)";
  private static final String WSAEPR_CREATE_SOME_OPTIONS_VALID_TWO = "WSAEPR CREATE FROMCODEPAGE(3) EPRLENGTH(1) REFPARMS(2) EPRSET(1)";
  private static final String WSAEPR_CREATE_SOME_OPTIONS_VALID_THREE = "WSAEPR EPRINTO(1) EPRLENGTH(1) METADATA(2) CREATE METADATALEN(2)";

  private static final String WSAEPR_CREATE_BARE_VALID = "WSAEPR CREATE EPRINTO(2) EPRLENGTH(1) METADATA(1)";

  private static final String WSAEPR_CREATE_INVALID_ONE = "WSAEPR CREATE {EPRINTO|error1}(1) EPRLENGTH(1) {EPRSET|error1}(1) ADDRESS(2)";
  private static final String WSAEPR_CREATE_INVALID_TWO = "WSAEPR {REFPARMSLEN|error1}(2) CREATE EPRLENGTH(1) EPRSET(1) ADDRESS(2)";
  private static final String WSAEPR_CREATE_INVALID_THREE = "WSAEPR EPRINTO(1) EPRLENGTH(1) {METADATALEN|error1}(2) CREATE REFPARMS(2)";
  private static final String WSAEPR_CREATE_INVALID_FOUR = "WSAEPR EPRSET(1) EPRLENGTH(1) METADATA(2) CREATE {FROMCCSID|error1}(1)"
          + " {FROMCODEPAGE|error1}(2)";

  @Test
  void testWSAEPRCreateAllOptionsValid() {
    CICSTestUtils.noErrorTest(WSAEPR_CREATE_ALL_OPTIONS_VALID);
  }

  @Test
  void testWSAEPRCreateSomeOptionsValidOne() {
    CICSTestUtils.noErrorTest(WSAEPR_CREATE_SOME_OPTIONS_VALID_ONE);
  }

  @Test
  void testWSAEPRCreateSomeOptionsValidTwo() {
    CICSTestUtils.noErrorTest(WSAEPR_CREATE_SOME_OPTIONS_VALID_TWO);
  }

  @Test
  void testWSAEPRCreateSomeOptionsValidThree() {
    CICSTestUtils.noErrorTest(WSAEPR_CREATE_SOME_OPTIONS_VALID_THREE);
  }

  @Test
  void testWSAEPRCreateBareValid() {
    CICSTestUtils.noErrorTest(WSAEPR_CREATE_BARE_VALID);
  }

  @Test
  void testWSAEPRCreateInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: EPRINTO or EPRSET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(WSAEPR_CREATE_INVALID_ONE, expectedDiagnostic);
  }

  @Test
  void testWSAEPRCreateInvalidTwo() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Invalid option provided: REFPARMSLEN without REFPARMS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(WSAEPR_CREATE_INVALID_TWO, expectedDiagnostic);
  }

  @Test
  void testWSAEPRCreateInvalidThree() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Invalid option provided: METADATALEN without METADATA",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(WSAEPR_CREATE_INVALID_THREE, expectedDiagnostic);
  }

  @Test
  void testWSAEPRCreateInvalidFour() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: FROMCCSID or FROMCODEPAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(WSAEPR_CREATE_INVALID_FOUR, expectedDiagnostic);
  }
}
