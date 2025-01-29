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
 * Test CICS ENABLE PROGRAM command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-enable-program">ENABLE PROGRAM
 * Command</a>
 *
 * <p>This class tests all variations of the ENABLE PROGRAM command found in the link above.
 */
public class TestCicsEnableProgram {
  private static final String TEST_ENABLE_PROGRAM_BARE = "ENABLE PROGRAM({$varOne})";
  private static final String TEST_ENABLE_PROGRAM_SOME_ONE = "ENABLE PROGRAM({$varOne}) ENTRYNAME({$varTwo}) EXIT({$varThree}) FORMATEDF PURGEABLE SHUTDOWN SPI START TASKSTART";
  private static final String TEST_ENABLE_PROGRAM_SOME_TWO = "ENABLE PROGRAM({$varOne}) ENTRY({$varTwo}) EXIT({$varFour}) REQUIRED GAENTRYNAME({$varTwo})";
  private static final String TEST_ENABLE_PROGRAM_SOME_THREE = "ENABLE PROGRAM({$varOne}) THREADSAFE PURGEABLE GALENGTH({$varTwo})";
  private static final String TEST_ENABLE_PROGRAM_SOME_FOUR = "ENABLE PROGRAM({$varOne}) QUASIRENT LINKEDITMODE SHUTDOWN TALENGTH({$varThree})";
  private static final String TEST_ENABLE_PROGRAM_SOME_FIVE = "ENABLE PROGRAM({$varOne}) OPENAPI TALENGTH({$varThree}) GALENGTH({$varFour})";
  private static final String TEST_ENABLE_PROGRAM_ALL_VALID_ONE = "ENABLE PROGRAM({$varOne}) ENTRY({$varTwo}) ENTRYNAME({$varTwo}) EXIT({$varThree}) FORMATEDF "
          + "GALENGTH({$varFour}) GALOCATION({$varFive}) GAEXECUTABLE INDOUBTWAIT LINKEDITMODE THREADSAFE OPENAPI PURGEABLE SHUTDOWN SPI START "
          + "TALENGTH({$varSix}) TAEXECUTABLE TASKSTART";
  private static final String TEST_ENABLE_PROGRAM_ALL_VALID_TWO = "ENABLE PROGRAM({$varOne}) ENTRY({$varTwo}) ENTRYNAME({$varTwo}) EXIT({$varThree}) FORMATEDF "
          + "GAENTRYNAME({$varFour}) INDOUBTWAIT LINKEDITMODE REQUIRED OPENAPI PURGEABLE SHUTDOWN SPI START TALENGTH({$varSix}) TAEXECUTABLE TASKSTART";

  private static final String TEST_ENABLE_PROGRAM_INVALID_MISSING_PROGRAM = "ENABLE {_ENTRYNAME({$varOne}) EXIT({$varTwo})|error1_}";
  private static final String TEST_ENABLE_PROGRAM_INVALID_MISSING_GALENGTH_ONE = "ENABLE PROGRAM({$varOne}) {_GALOCATION|error1_}({$varTwo})";
  private static final String TEST_ENABLE_PROGRAM_INVALID_MISSING_GALENGTH_TWO = "ENABLE PROGRAM({$varOne}) {GAEXECUTABLE|error1}";
  private static final String TEST_ENABLE_PROGRAM_INVALID_GALENGTH_GAENTRYNAME = "ENABLE PROGRAM({$varOne}) {_GALENGTH|error1_}({$varTwo}) {_GAENTRYNAME|error1_}({$varTwo})";
  private static final String TEST_ENABLE_PROGRAM_INVALID_QUASIRENT_ONE = "ENABLE PROGRAM({$varOne}) {QUASIRENT|error1} {OPENAPI|error1}";
  private static final String TEST_ENABLE_PROGRAM_INVALID_QUASIRENT_TWO = "ENABLE PROGRAM({$varOne}) {QUASIRENT|error1} {THREADSAFE|error1}";
  private static final String TEST_ENABLE_PROGRAM_INVALID_QUASIRENT_THREE = "ENABLE PROGRAM({$varOne}) {QUASIRENT|error1} {REQUIRED|error1}";
  private static final String TEST_ENABLE_PROGRAM_INVALID_MISSING_TALENGTH = "ENABLE PROGRAM({$varOne}) {TAEXECUTABLE|error1}";

  @Test
  void testEnableProgramBare() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_BARE, "SP");
  }

  @Test
  void testEnableProgramSomeOne() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_SOME_ONE, "SP");
  }

  @Test
  void testEnableProgramSomeTwo() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_SOME_TWO, "SP");
  }

  @Test
  void testEnableProgramSomeThree() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_SOME_THREE, "SP");
  }

  @Test
  void testEnableProgramSomeFour() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_SOME_FOUR, "SP");
  }

  @Test
  void testEnableProgramSomeFive() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_SOME_FIVE, "SP");
  }

  @Test
  void testEnableProgramAllValidOne() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_ALL_VALID_ONE, "SP");
  }

  @Test
  void testEnableProgramAllValidTwo() {
    CICSTestUtils.noErrorTest(TEST_ENABLE_PROGRAM_ALL_VALID_TWO, "SP");
  }

  @Test
  void testEnableProgramInvalidMissingProgram() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_MISSING_PROGRAM,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Missing required option: PROGRAM",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testEnableProgramInvalidMissingGALengthOne() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_MISSING_GALENGTH_ONE,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: GALOCATION without GALENGTH",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testEnableProgramInvalidMissingGALengthTwo() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_MISSING_GALENGTH_TWO,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: GAEXECUTABLE without GALENGTH",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testEnableProgramInvalidGALengthGAEntryName() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_GALENGTH_GAENTRYNAME,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: GALENGTH or GAENTRYNAME",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testEnableProgramInvalidQuasirentOne() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_QUASIRENT_ONE,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: QUASIRENT or OPENAPI",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testEnableProgramInvalidQuasirentTwo() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_QUASIRENT_TWO,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: QUASIRENT or THREADSAFE or REQUIRED",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testEnableProgramInvalidQuasirentThree() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_QUASIRENT_THREE,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: QUASIRENT or THREADSAFE or REQUIRED",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testEnableProgramInvalidMissingTALength() {
    CICSTestUtils.errorTest(TEST_ENABLE_PROGRAM_INVALID_MISSING_TALENGTH,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: TAEXECUTABLE without TALENGTH",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

}
