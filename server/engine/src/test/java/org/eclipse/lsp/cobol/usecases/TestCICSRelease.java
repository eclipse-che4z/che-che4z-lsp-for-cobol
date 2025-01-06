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
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS RELEASE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-release">RELEASE Command</a>
 *
 * <p>This class tests the RELEASE command.
 */
public class TestCICSRelease {
  // RELEASE tests
  private static final String RELEASE_VALID =
          "RELEASE PROGRAM({$varOne})";

  private static final String RELEASE_INVALID_NO_PROGRAM =
          "{_RELEASE|errorOne|errorTwo_}";

  private static final String RELEASE_INVALID_EXTRA_OPTION =
          "RELEASE PROGRAM({$varOne}) {PROGRAM|errorOne}({$varOne})";

  @Test
  void testReleaseValid() {
    CICSTestUtils.noErrorTest(RELEASE_VALID);
  }

  @Test
  void testReleaseInvalidNoProgram() {
    CICSTestUtils.errorTest(
            RELEASE_INVALID_NO_PROGRAM,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(new Position(13, 12), new Position(13, 12)),
                            "Missing required option: PROGRAM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(new Position(13, 12), new Position(13, 20)),
                            "Syntax error on 'END-EXEC'",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testReleaseInvalidExtraOption() {
    CICSTestUtils.errorTest(
            RELEASE_INVALID_EXTRA_OPTION,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: PROGRAM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
