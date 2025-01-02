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
 * Test CICS LOAD command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-load">LOAD Command</a>
 *
 * <p>This class tests the LOAD command.
 */
public class TestCICSLoad {
  private static final String LOAD_VALID_MINIMAL =
          "LOAD PROGRAM({$varOne})";

  private static final String LOAD_VALID_FULL =
          "LOAD PROGRAM({$varOne}) SET({$varTwo}) LENGTH({$varThree}) ENTRY({$varFour}) HOLD";

  private static final String LOAD_INVALID_NO_PROGRAM =
          "LOAD {_SET({$varTwo}) HOLD|errorOne_} ";

  private static final String LOAD_INVALID_DUPLICATE_SET =
          "LOAD PROGRAM({$varOne}) SET({$varTwo}) {SET|errorOne}({$varTwo}) HOLD";

  private static final String LOAD_INVALID_DUPLICATE_LENGTH =
          "LOAD PROGRAM({$varOne}) {LENGTH|errorOne} ({$varTwo}){FLENGTH|errorTwo}({$varThree})";

  @Test
  void testLoadValidMinimal() {
    CICSTestUtils.noErrorTest(LOAD_VALID_MINIMAL);
  }

  @Test
  void testLoadValidFull() {
    CICSTestUtils.noErrorTest(LOAD_VALID_FULL);
  }

  @Test
  void testLoadInvalidNoProgram() {
    CICSTestUtils.errorTest(
            LOAD_INVALID_NO_PROGRAM,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: PROGRAM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testLoadInvalidDuplicateSet() {
    CICSTestUtils.errorTest(
            LOAD_INVALID_DUPLICATE_SET,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: SET",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testLoadInvalidDuplicateLength() {
    CICSTestUtils.errorTest(
            LOAD_INVALID_DUPLICATE_LENGTH,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LENGTH or FLENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: LENGTH or FLENGTH",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
