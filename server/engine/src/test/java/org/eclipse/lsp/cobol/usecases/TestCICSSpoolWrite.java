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
 * Test CICS SPOOLWRITE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-spoolwrite">SPOOLWRITE Command</a>
 *
 * <p>This class tests the SPOOLWRITE command.
 */
public class TestCICSSpoolWrite {
  private static final String SPOOLWRITE_VALID_MINIMAL =
          "SPOOLWRITE TOKEN({$varOne}) FROM({$varTwo})";

  private static final String SPOOLWRITE_VALID_FULL =
          "SPOOLWRITE TOKEN({$varOne}) FROM({$varTwo}) FLENGTH({$varThree}) LINE NOHANDLE";

  private static final String SPOOLWRITE_INVALID_NO_TOKEN =
          "SPOOLWRITE {_FROM({$varTwo}) FLENGTH({$varOne}) LINE|errorOne_}";

  private static final String SPOOLWRITE_INVALID_NO_FROM =
          "SPOOLWRITE {_TOKEN({$varOne}) FLENGTH(123)|errorOne_}";

  private static final String SPOOLWRITE_INVALID_BOTH_LINE_PAGE =
          "SPOOLWRITE TOKEN({$varOne}) FROM({$varTwo}) {LINE|errorOne} {PAGE|errorTwo}";

  @Test
  void testSpoolwriteValidMinimal() {
    CICSTestUtils.noErrorTest(SPOOLWRITE_VALID_MINIMAL);
  }

  @Test
  void testSpoolwriteValidFull() {
    CICSTestUtils.noErrorTest(SPOOLWRITE_VALID_FULL);
  }

  @Test
  void testSpoolwriteInvalidNoToken() {
    CICSTestUtils.errorTest(
            SPOOLWRITE_INVALID_NO_TOKEN,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: TOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolwriteInvalidNoFrom() {
    CICSTestUtils.errorTest(
            SPOOLWRITE_INVALID_NO_FROM,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolwriteInvalidBothLinePage() {
    CICSTestUtils.errorTest(
            SPOOLWRITE_INVALID_BOTH_LINE_PAGE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LINE or PAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LINE or PAGE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
