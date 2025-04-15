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
 * Test CICS DISABLE PROGRAM command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-disable-program">DISABLE PROGRAM
 * Command</a>
 *
 * <p>This class tests all variations of the DISABLE PROGRAM command found in the link above.
 */
public class TestCicsDisableProgram {
  private static final String TEST_DISABLE_PROGRAM_ALL_VALID =
      "DISABLE PROGRAM({$varOne}) ENTRYNAME({$varTwo}) EXITALL FORMATEDF PURGEABLE SHUTDOWN SPI"
          + " STOP TASKSTART";
  private static final String TEST_DISABLE_PROGRAM_VALID_ONE =
      "DISABLE SHUTDOWN PROGRAM({$varOne}) PURGEABLE EXITALL";
  private static final String TEST_DISABLE_PROGRAM_VALID_TWO =
      "DISABLE ENTRYNAME({$varTwo}) PROGRAM({$varOne}) EXIT({$varTwo})";
  private static final String TEST_DISABLE_PROGRAM_VALID_THREE =
      "DISABLE PROGRAM({$varOne}) ENTRYNAME({$varTwo}) FORMATEDF PURGEABLE TASKSTART";
  private static final String TEST_DISABLE_PROGRAM_VALID_FOUR =
      "DISABLE PROGRAM({$varOne}) ENTRYNAME({$varTwo}) STOP SPI";
  private static final String TEST_DISABLE_PROGRAM_VALID_FIVE =
      "DISABLE PROGRAM({$varOne}) TASKSTART SHUTDOWN";
  private static final String TEST_DISABLE_PROGRAM_VALID_SIX =
      "DISABLE PROGRAM({$varOne}) EXITALL ";

  private static final String TEST_DISABLE_MISSING_PROGRAM =
      "DISABLE {_ENTRYNAME({$varOne}) EXIT({$varTwo})|error1_}";
  private static final String TEST_DISABLE_MISSING_EXIT =
      "DISABLE {_PROGRAM({$varOne}) ENTRYNAME({$varTwo})|error1_}";
  private static final String TEST_DISABLE_PROGRAM_INVALID_EXIT_ONE =
      "DISABLE PROGRAM({$varOne}) {EXIT|error1}({$varTwo}) {EXITALL|error1}";
  private static final String TEST_DISABLE_PROGRAM_INVALID_EXIT_TWO =
      "DISABLE PROGRAM({$varOne}) {EXIT|error1}({$varTwo}) {FORMATEDF|error1}";
  private static final String TEST_DISABLE_PROGRAM_INVALID_EXIT_THREE =
      "DISABLE PROGRAM({$varOne}) {EXIT|error1}({$varTwo}) ENTRYNAME({$varTwo}) {PURGEABLE|error1}";
  private static final String TEST_DISABLE_PROGRAM_INVALID_EXIT_FOUR =
      "DISABLE PROGRAM({$varOne}) {EXIT|error1}({$varTwo}) ENTRYNAME({$varTwo}) {SHUTDOWN|error1}";
  private static final String TEST_DISABLE_PROGRAM_INVALID_EXIT_FIVE =
      "DISABLE PROGRAM({$varOne}) {EXIT|error1}({$varTwo}) ENTRYNAME({$varTwo}) {SPI|error1}";
  private static final String TEST_DISABLE_PROGRAM_INVALID_EXIT_SIX =
      "DISABLE PROGRAM({$varOne}) {EXIT|error1}({$varTwo}) ENTRYNAME({$varTwo}) {TASKSTART|error1}";

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
  void testCicsDisableProgramValidThree() {
    CICSTestUtils.noErrorTest(TEST_DISABLE_PROGRAM_VALID_THREE, "SP");
  }

  @Test
  void testCicsDisableProgramValidFour() {
    CICSTestUtils.noErrorTest(TEST_DISABLE_PROGRAM_VALID_FOUR, "SP");
  }

  @Test
  void testCicsDisableProgramValidFive() {
    CICSTestUtils.noErrorTest(TEST_DISABLE_PROGRAM_VALID_FIVE, "SP");
  }

  @Test
  void testCicsDisableProgramValidSix() {
    CICSTestUtils.noErrorTest(TEST_DISABLE_PROGRAM_VALID_SIX, "SP");
  }

  @Test
  void testCicsDisableMissingProgram() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_MISSING_PROGRAM,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Missing required option: PROGRAM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }

  @Test
  void testCicsDisableMissingExit() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_MISSING_EXIT,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Must include one or more of the following: EXIT or EXITALL or FORMATEDF or"
                    + " PURGEABLE or SHUTDOWN or SPI or STOP or TASKSTART",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }

  @Test
  void testCicsDisableProgramInvalidExitOne() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_PROGRAM_INVALID_EXIT_ONE,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: EXIT or EXITALL",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }

  @Test
  void testCicsDisableProgramInvalidExitTwo() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_PROGRAM_INVALID_EXIT_TWO,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: EXIT or FORMATEDF",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }

  @Test
  void testCicsDisableProgramInvalidExitThree() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_PROGRAM_INVALID_EXIT_THREE,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: EXIT or PURGEABLE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }

  @Test
  void testCicsDisableProgramInvalidExitFour() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_PROGRAM_INVALID_EXIT_FOUR,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: EXIT or SHUTDOWN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }

  @Test
  void testCicsDisableProgramInvalidExitFive() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_PROGRAM_INVALID_EXIT_FIVE,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: EXIT or SPI",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }

  @Test
  void testCicsDisableProgramInvalidExitSix() {
    CICSTestUtils.errorTest(
        TEST_DISABLE_PROGRAM_INVALID_EXIT_SIX,
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: EXIT or TASKSTART",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "SP");
  }
}
