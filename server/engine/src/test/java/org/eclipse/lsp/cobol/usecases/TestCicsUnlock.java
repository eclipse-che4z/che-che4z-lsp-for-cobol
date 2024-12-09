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
 * Test CICS UNLOCK command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-unlock">UNLOCK
 * Command</a>
 *
 * <p>This class tests all variations of the UNLOCK command found in the link above.
 */
public class TestCicsUnlock {
  private static final String ALL_OPTIONS =
          "UNLOCK FILE({$varOne}) TOKEN({$varTwo}) SYSID({$varThree})";

  private static final String SOME_OPTIONS_ONE =
          "UNLOCK TOKEN({$varTwo}) DATASET({$varOne})";
  private static final String SOME_OPTIONS_TWO =
          "UNLOCK SYSID({$varThree}) FILE({$varOne})";

  private static final String BARE_OPTIONS =
          "UNLOCK DATASET({$varOne})";

  private static final String INVALID = "UNLOCK {_SYSID({$varThree})|error_}";
  private static final String INVALID_FILE = "UNLOCK {FILE|error}({$varOne}) {DATASET|error}({$varOne})";

  @Test
  void testAllOptions() {
    CICSTestUtils.noErrorTest(ALL_OPTIONS);
  }

  @Test
  void testSomeOptionsOne() {
    CICSTestUtils.noErrorTest(SOME_OPTIONS_ONE);
  }

  @Test
  void testSomeOptionsTwo() {
    CICSTestUtils.noErrorTest(SOME_OPTIONS_TWO);
  }

  @Test
  void testBareOptions() {
    CICSTestUtils.noErrorTest(BARE_OPTIONS);
  }

  @Test
  void testInvalid() {
    CICSTestUtils.errorTest(INVALID, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(12, 12), new Position(13, 27)),
                    "Missing required option: FILE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void testInvalidFile() {
    CICSTestUtils.errorTest(INVALID_FILE, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: FILE or DATASET",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }
}
