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
 * Test CICS DISABLE PROGRAM command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-disable-program">DISABLE PROGRAM
 * Command</a>
 *
 * <p>This class tests all variations of the DISABLE PROGRAM command found in the link above.
 */
public class TestCicsDisableProgram {
  private static final String TEST_DISABLE_PROGRAM_ALL_VALID = "DISABLE PROGRAM({$varOne}) ENTRYNAME({$varTwo}) EXIT({$varThree}) FORMATEDF PURGEABLE SHUTDOWN SPI STOP TASKSTART";
  private static final String TEST_DISABLE_PROGRAM_VALID_ONE = "DISABLE SHUTDOWN PROGRAM({$varOne}) PURGEABLE EXITALL";
  private static final String TEST_DISABLE_PROGRAM_VALID_TWO = "DISABLE SPI PROGRAM({$varOne}) EXIT({$varTwo})";

  private static final String TEST_DISABLE_MISSING_PROGRAM = "DISABLE {_ENTRYNAME({$varOne}) EXIT({$varTwo})|error1_}";
  private static final String TEST_DISABLE_PROGRAM_INVALID_EXIT = "DISABLE PROGRAM({$varOne}) {EXIT|error1}({$varTwo}) {EXITALL|error1}";


  @Test
  void testCicsDisableProgramAllValid() {
    CICSTestUtils.noErrorTest(TEST_DISABLE_PROGRAM_ALL_VALID, "SP");
  }

  @Test
  void testCicsDisableProgramValidOne() {
    CICSTestUtils.noErrorTest(TEST_DISABLE_PROGRAM_VALID_ONE, "SP");
  }

  @Test
  void testCicsDisableProgramValidTwo() {
    CICSTestUtils.noErrorTest(TEST_DISABLE_PROGRAM_VALID_TWO, "SP");
  }

  @Test
  void testCicsDisableMissingProgram() {
    CICSTestUtils.errorTest(TEST_DISABLE_MISSING_PROGRAM,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(15, 24)),
                    "Missing required option: PROGRAM",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testCicsDisableProgramInvalidExit() {
    CICSTestUtils.errorTest(TEST_DISABLE_PROGRAM_INVALID_EXIT,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: EXIT or EXITALL",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

}
