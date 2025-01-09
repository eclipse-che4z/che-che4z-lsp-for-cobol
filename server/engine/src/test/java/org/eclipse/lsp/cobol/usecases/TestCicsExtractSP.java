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
 * Test CICS EXTRACT System Programming commands. Documentation links:
 * <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-extract-statistics">
 * EXTRACT STATISTICS Command</a>
 * <a href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-extract-exit">
 * EXTRACT EXIT Command</a>
 * <p>This class tests all variations of the EXTRACT System Programming commands found in the links above.
 */
public class TestCicsExtractSP {
  private static final String EXIT_ALL_OPTIONS = "EXTRACT EXIT PROGRAM({$varOne}) ENTRYNAME({$varTwo}) GALENGTH({$varThree}) GASET({$varFour})";
  private static final String EXIT_BARE = "EXTRACT PROGRAM({$varOne}) GASET({$varFour}) EXIT GALENGTH({$varThree})";

  private static final String STATISTICS_ALL_OPTIONS = "EXTRACT STATISTICS RESTYPE({$varOne}) RESID({$varTwo}) RESIDLEN({$varThree}) SET({$varFour})"
          + " SUBRESTYPE({$varFive}) SUBRESID({$varSix}) SUBRESIDLEN({$varOne}) APPLICATION({$varTwo}) APPLMAJORVER({$varThree}) APPLMINORVER({$varFour})"
          + " APPLMICROVER({$varFive}) PLATFORM({$varSix}) LASTRESET({$varThree})";
  private static final String STATISTICS_SOME_ONE = "EXTRACT ASYNCSERVICE SUBRESID({$varSix}) SUBRESIDLEN({$varOne}) SET({$varFour}) STATISTICS SUBRESTYPE({$varFive})";
  private static final String STATISTICS_SOME_TWO = "EXTRACT RESID({$varTwo}) APPLMAJORVER({$varThree}) APPLICATION({$varTwo}) RESTYPE({$varOne}) STATISTICS APPLMINORVER({$varFour}) APPLMICROVER({$varFive}) SET({$varFour}) PLATFORM({$varSix})";
  private static final String STATISTICS_SOME_THREE = "EXTRACT RESIDLEN({$varThree}) STATISTICS LASTRESETMIN({$varFive}) LASTRESETHRS({$varSix}) SET({$varFour}) LASTRESETSEC({$varOne}) TASKSUBPOOL RESID({$varTwo})";
  private static final String STATISTICS_SOME_FOUR = "EXTRACT STATISTICS SET({$varFour}) BUNDLE RESID({$varTwo}) SUBRESID({$varSix}) POLICYRULE";
  private static final String STATISTICS_BARE = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS";

  private static final String EXIT_INVALID_MISSING_EXIT = "EXTRACT {_GASET({$varFour}) GALENGTH({$varThree}) PROGRAM({$varOne})|error_}";
  private static final String EXIT_INVALID_MISSING_PROGRAM = "EXTRACT {_EXIT ENTRYNAME({$varTwo}) GALENGTH({$varThree}) GASET({$varFour})|error_}";
  private static final String EXIT_INVALID_MISSING_GALENGTH = "EXTRACT {_GASET({$varFour}) EXIT PROGRAM({$varOne})|error_}";
  private static final String EXIT_INVALID_MISSING_GASET = "EXTRACT {_PROGRAM({$varOne}) EXIT GALENGTH({$varThree})|error_}";

  private static final String STATISTICS_INVALID_MISSING_RESTYPE = "EXTRACT {_SET({$varFour}) STATISTICS|error_}";
  private static final String STATISTICS_INVALID_MISSING_SET = "EXTRACT {_RESTYPE({$varOne}) STATISTICS|error_}";
  private static final String STATISTICS_INVALID_MISSING_STATISTICS = "EXTRACT {_SET({$varFour}) RESTYPE({$varOne})|error_}";
  private static final String STATISTICS_INVALID_MISSING_RESID_ONE = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS {RESIDLEN|error}({$varThree})";
  private static final String STATISTICS_INVALID_MISSING_RESID_TWO = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS {APPLMAJORVER|errorOne}({$varThree}) {APPLICATION|errorTwo}({$varTwo}) {APPLMINORVER|errorThree}({$varFour}) {APPLMICROVER|errorFour}({$varFive})";
  private static final String STATISTICS_INVALID_MISSING_SUBRESID_ONE = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS {SUBRESIDLEN|errorOne|errorTwo}({$varOne})";
  private static final String STATISTICS_INVALID_MISSING_SUBRESID_TWO = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS {_SUBRESTYPE({$varFive})|error_}";
  private static final String STATISTICS_INVALID_MISSING_SUBRESTYPE = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS {SUBRESID|errorOne}({$varSix}) {SUBRESIDLEN|errorTwo}({$varOne})";
  private static final String STATISTICS_INVALID_APPLCONTEXT_ONE = "EXTRACT {_SET({$varFour}) RESTYPE({$varOne}) STATISTICS PLATFORM({$varSix}) RESID({$varTwo})|error_}";
  private static final String STATISTICS_INVALID_APPLCONTEXT_TWO = "EXTRACT {_SET({$varFour}) RESID({$varTwo}) RESTYPE({$varOne}) STATISTICS APPLICATION({$varSix}) APPLMAJORVER({$varThree}) APPLMINORVER({$varFour}) APPLMICROVER({$varFive})|error_}";
  private static final String STATISTICS_INVALID_LAST_TIME_ONE = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS LASTRESET({$varThree}) {LASTRESETMIN|errorOne}({$varFive}) {LASTRESETHRS|errorTwo}({$varSix}) {LASTRESETSEC|errorThree}({$varOne})";
  private static final String STATISTICS_INVALID_LAST_TIME_TWO = "EXTRACT SET({$varFour}) RESTYPE({$varOne}) STATISTICS {LASTRESET|errorOne}({$varThree}) {LASTRESETABS|errorTwo}({$varOne})";
  private static final String STATISTICS_INVALID_LAST_TIME_THREE = "EXTRACT {_SET({$varFour}) RESTYPE({$varOne}) STATISTICS LASTRESETHRS({$varOne})|error_}";
  private static final String STATISTICS_INVALID_DUPLICATE_RESTYPE_ONE = "EXTRACT SET({$varFour}) {_RESTYPE({$varOne})|error_} STATISTICS {_ATOMSERVICE|error_}";
  private static final String STATISTICS_INVALID_DUPLICATE_RESTYPE_TWO = "EXTRACT SET({$varFour}) {_BUNDLE|error_} STATISTICS {_ASYNCSERVICE|error_}";
  private static final String STATISTICS_INVALID_DUPLICATE_SUBRESTYPE = "EXTRACT SUBRESID({$varSix}) SET({$varFour}) RESTYPE({$varOne}) {SUBRESTYPE|error}({$varFive}) {CAPTURESPEC|error} STATISTICS";
  private static final String STATISTICS_WARNING_DUPLICATE_RESTYPE = "EXTRACT SET({$varFour}) STATISTICS ASYNCSERVICE {ASYNCSERVICE|warning}";

  @Test
  void testAllExitOptions() {
    CICSTestUtils.noErrorTest(EXIT_ALL_OPTIONS, "SP");
  }

  @Test
  void testExitBare() {
    CICSTestUtils.noErrorTest(EXIT_BARE, "SP");
  }

  @Test
  void testAllStatisticsOptions() {
    CICSTestUtils.noErrorTest(STATISTICS_ALL_OPTIONS, "SP");
  }

  @Test
  void testSomeStatisticsOptionsOne() {
    CICSTestUtils.noErrorTest(STATISTICS_SOME_ONE, "SP");
  }

  @Test
  void testSomeStatisticsOptionsTwo() {
    CICSTestUtils.noErrorTest(STATISTICS_SOME_TWO, "SP");
  }

  @Test
  void testSomeStatisticsOptionsThree() {
    CICSTestUtils.noErrorTest(STATISTICS_SOME_THREE, "SP");
  }

  @Test
  void testSomeStatisticsOptionsFour() {
    CICSTestUtils.noErrorTest(STATISTICS_SOME_FOUR, "SP");
  }

  @Test
  void testStatisticsBare() {
    CICSTestUtils.noErrorTest(STATISTICS_BARE, "SP");
  }

  @Test
  void testInvalidNoExit() {
    CICSTestUtils.errorTest(EXIT_INVALID_MISSING_EXIT, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(16, 27)),
                    "Missing required option: EXIT",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidNoProgram() {
    CICSTestUtils.errorTest(EXIT_INVALID_MISSING_PROGRAM, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(17, 26)),
                    "Missing required option: PROGRAM",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidNoGalength() {
    CICSTestUtils.errorTest(EXIT_INVALID_MISSING_GALENGTH, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(16, 27)),
                    "Missing required option: GALENGTH",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidNoGaset() {
    CICSTestUtils.errorTest(EXIT_INVALID_MISSING_GASET, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(16, 30)),
                    "Missing required option: GASET",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidNoRestype() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_RESTYPE, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Missing required option: RESTYPE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidNoSubresid() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_SUBRESID_ONE, ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: SUBRESIDLEN without SUBRESTYPE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: SUBRESIDLEN without SUBRESID",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidNoSubresidTwo() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_SUBRESID_TWO, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: SUBRESTYPE without SUBRESID",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidLastTimeOne() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_LAST_TIME_ONE, ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: LASTRESETMIN with LASTRESET",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: LASTRESETHRS with LASTRESET",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorThree",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: LASTRESETSEC with LASTRESET",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidLastTimeTwo() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_LAST_TIME_TWO, ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: LASTRESET with LASTRESETABS",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: LASTRESETABS with LASTRESET",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidLastTimeThree() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_LAST_TIME_THREE, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(17, 32)),
                    "If one option is specified, all options must be present: LASTRESETHRS, LASTRESETMIN, LASTRESETSEC",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidMissingStatistics() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_STATISTICS, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(15, 27)),
                    "Missing required option: STATISTICS",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidMissingSet() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_SET, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Missing required option: SET",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidMissingResidOne() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_RESID_ONE, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: RESIDLEN without RESID",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidMissingResidTwo() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_RESID_TWO, ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: APPLMAJORVER without RESID",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: APPLICATION without RESID",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorThree",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: APPLMINORVER without RESID",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorFour",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: APPLMICROVER without RESID",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidMissingSubrestype() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_MISSING_SUBRESTYPE, ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: SUBRESID without SUBRESTYPE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                    new Range(),
                    "Invalid option provided: SUBRESIDLEN without SUBRESTYPE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidApplContextOne() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_APPLCONTEXT_ONE, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(18, 25)),
                    "If one option is specified, all options must be present: APPLICATION, APPLMAJORVER, APPLMINORVER, APPLMICROVER, PLATFORM",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidApplContextTwo() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_APPLCONTEXT_TWO, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(new Position(14, 12), new Position(21, 33)),
                    "If one option is specified, all options must be present: APPLICATION, APPLMAJORVER, APPLMINORVER, APPLMICROVER, PLATFORM",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidDuplicateRestypeOne() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_DUPLICATE_RESTYPE_ONE, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Multiple RESTYPE options are not allowed",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidDuplicateRestypeTwo() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_DUPLICATE_RESTYPE_TWO, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Multiple RESTYPE options are not allowed",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void testInvalidDuplicateSubrestype() {
    CICSTestUtils.errorTest(STATISTICS_INVALID_DUPLICATE_SUBRESTYPE, ImmutableMap.of(
            "error",
            new Diagnostic(
                    new Range(),
                    "Exactly one option required, options are mutually exclusive: SUBRESTYPE or CAPTURESPEC or POLICYRULE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())), "SP");
  }

  @Test
  void tesWarningDuplicateRestype() {
    CICSTestUtils.errorTest(STATISTICS_WARNING_DUPLICATE_RESTYPE, ImmutableMap.of(
            "warning",
            new Diagnostic(
                    new Range(),
                    "Excessive options provided for: ASYNCSERVICE",
                    DiagnosticSeverity.Warning,
                    ErrorSource.PARSING.getText())), "SP");
  }

}
