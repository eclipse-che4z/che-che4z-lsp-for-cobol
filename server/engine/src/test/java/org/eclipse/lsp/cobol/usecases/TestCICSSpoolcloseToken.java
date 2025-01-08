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
 * Test CICS SPOOLCLOSE TOKEN command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-spoolread">SPOOLCLOSE TOKEN Command</a>
 *
 * <p>This class tests the SPOOLCLOSE TOKEN command.
 */
public class TestCICSSpoolcloseToken {
  private static final String SPOOLCLOSE_TOKEN_VALID_MINIMAL =
          "SPOOLCLOSE TOKEN({$varOne})";

  private static final String SPOOLCLOSE_TOKEN_VALID_KEEP =
          "SPOOLCLOSE TOKEN({$varOne}) KEEP";

  private static final String SPOOLCLOSE_TOKEN_VALID_DELETE =
          "SPOOLCLOSE TOKEN({$varOne}) DELETE NOHANDLE";

  private static final String SPOOLCLOSE_TOKEN_INVALID_NO_TOKEN =
          "SPOOLCLOSE {NOHANDLE|errorOne}";

  private static final String SPOOLCLOSE_TOKEN_INVALID_BOTH_KEEP_DELETE =
          "SPOOLCLOSE TOKEN({$varOne}) {KEEP|errorOne} {DELETE|errorTwo}";

  @Test
  void testSpoolcloseTokenValidMinimal() {
    CICSTestUtils.noErrorTest(SPOOLCLOSE_TOKEN_VALID_MINIMAL);
  }

  @Test
  void testSpoolcloseTokenValidKeep() {
    CICSTestUtils.noErrorTest(SPOOLCLOSE_TOKEN_VALID_KEEP);
  }

  @Test
  void testSpoolcloseTokenValidDelete() {
    CICSTestUtils.noErrorTest(SPOOLCLOSE_TOKEN_VALID_DELETE);
  }

  @Test
  void testSpoolcloseTokenInvalidNoToken() {
    CICSTestUtils.errorTest(
            SPOOLCLOSE_TOKEN_INVALID_NO_TOKEN,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: TOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolcloseTokenInvalidBothKeepDelete() {
    CICSTestUtils.errorTest(
            SPOOLCLOSE_TOKEN_INVALID_BOTH_KEEP_DELETE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: KEEP or DELETE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: KEEP or DELETE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
