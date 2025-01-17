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
 * Test CICS SPOOLREAD command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-spoolread">SPOOLREAD Command</a>
 *
 * <p>This class tests the SPOOLREAD command.
 */
public class TestCICSSpoolread {
  private static final String SPOOLREAD_VALID_MINIMAL =
          "SPOOLREAD TOKEN({$varOne}) INTO({$varTwo})";

  private static final String SPOOLREAD_VALID_FULL =
          "SPOOLREAD TOKEN({$varOne}) INTO({$varTwo}) MAXFLENGTH({$varThree}) TOFLENGTH({$varFour}) NOHANDLE";

  private static final String SPOOLREAD_INVALID_NO_TOKEN =
          "SPOOLREAD {_INTO({$varTwo}) TOFLENGTH({$varOne}) NOHANDLE|errorOne_}";

  private static final String SPOOLREAD_INVALID_NO_INTO =
          "SPOOLREAD {_TOKEN({$varOne}) MAXFLENGTH({$varTwo}) NOHANDLE|errorOne_}";

  @Test
  void testSpoolreadValidMinimal() {
    CICSTestUtils.noErrorTest(SPOOLREAD_VALID_MINIMAL);
  }

  @Test
  void testSpoolreadValidFull() {
    CICSTestUtils.noErrorTest(SPOOLREAD_VALID_FULL);
  }

  @Test
  void testSpoolreadInvalidNoToken() {
    CICSTestUtils.errorTest(
            SPOOLREAD_INVALID_NO_TOKEN,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: TOKEN",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testSpoolreadInvalidNoInto() {
    CICSTestUtils.errorTest(
            SPOOLREAD_INVALID_NO_INTO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: INTO",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
