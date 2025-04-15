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
import java.util.Map;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

/**
 * Test CICS COLLECT STATISTICS system command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-collect-statistics">COLLECT
 * STATISTICS Command</a>
 *
 * <p>This class tests all variations of the COLLECT STATISTICS command found in the link above.
 */
public class TestCICSCollectStatisticsSP {
  private static Stream<String> getValidOptions() {
    return Stream.of(
        "COLLECT STATISTICS SET({$varFour})",
        "COLLECT NOHANDLE STATISTICS SET({$varFour}) LASTRESET({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) NOHANDLE LASTRESETHRS({$varFour})"
            + " LASTRESETMIN({$varFour}) LASTRESETSEC({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) AUTOINSTALL",
        "COLLECT STATISTICS SET({$varFour}) CONNECTION({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) DB2CONN",
        "COLLECT STATISTICS SET({$varFour}) DB2ENTRY({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) DISPATCHER",
        "COLLECT STATISTICS SET({$varFour}) ENQUEUE",
        "COLLECT STATISTICS SET({$varFour}) FILE({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) JOURNALNAME({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) JOURNALNUM({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) JVMPROGRAM({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) LSRPOOL({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) MONITOR",
        "COLLECT STATISTICS SET({$varFour}) MONITOR({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) MVSTCB",
        "COLLECT STATISTICS SET({$varFour}) MVSTCB({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) POOL({$varFour}) TARGET({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) PROGAUTO",
        "COLLECT STATISTICS SET({$varFour}) PROGRAM",
        "COLLECT STATISTICS SET({$varFour}) PROGRAM({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) RECOVERY",
        "COLLECT STATISTICS SET({$varFour}) STATS",
        "COLLECT STATISTICS SET({$varFour}) STORAGE",
        "COLLECT STATISTICS SET({$varFour}) STORAGE({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) STREAMNAME",
        "COLLECT STATISTICS SET({$varFour}) STREAMNAME({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) SUBPOOL({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) SYSDUMPCODE",
        "COLLECT STATISTICS SET({$varFour}) SYSDUMPCODE({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TABLEMGR",
        "COLLECT STATISTICS SET({$varFour}) TARGET({$varFour}) NODE({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TASKSUBPOOL",
        "COLLECT STATISTICS SET({$varFour}) TCLASS({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TCPIP",
        "COLLECT STATISTICS SET({$varFour}) TCPIPSERVICE({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TDQUEUE",
        "COLLECT STATISTICS SET({$varFour}) TDQUEUE({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TERMINAL({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TRANCLASS({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TRANDUMPCODE",
        "COLLECT STATISTICS SET({$varFour}) TRANDUMPCODE({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TRANSACTION",
        "COLLECT STATISTICS SET({$varFour}) TRANSACTION({$varFour})",
        "COLLECT STATISTICS SET({$varFour}) TSQUEUE",
        "COLLECT STATISTICS SET({$varFour}) VTAM");
  }

  private static final String COLLECT_STATISTICS_SET_INVALID = "COLLECT {STATISTICS|error}";
  private static final String COLLECT_STATISTICS_HOURS_INVALID =
      "COLLECT {_STATISTICS SET({$varFour}) LASTRESETHRS({$varFour})|error_}";
  private static final String COLLECT_STATISTICS_RESET_INVALID =
      "COLLECT SET({$varFour}) STATISTICS {LASTRESET|error}({$varFour})"
          + " {LASTRESETHRS|error2}({$varFour}) LASTRESETMIN({$varFour}) LASTRESETSEC({$varFour})";
  private static final String COLLECT_STATISTICS_MUTUALEX_INVALID =
      "COLLECT SET({$varFour}) STATISTICS {LSRPOOL|error}({$varFour}) {MONITOR|error2}";
  private static final String COLLECT_STATISTICS_MUTUALEX2_INVALID =
      "COLLECT SET({$varFour}) STATISTICS {RECOVERY|error} {STATS|error2}";
  private static final String COLLECT_STATISTICS_TARGET_INVALID =
      "COLLECT {_SET({$varFour}) STATISTICS TARGET({$varFour})|error_}";
  private static final String COLLECT_STATISTICS_NODE_INVALID =
      "COLLECT {_SET({$varFour}) STATISTICS NODE({$varFour})|error_}";

  @ParameterizedTest
  @MethodSource("getValidOptions")
  void testCollectStatisticsSpAllValid(String valid) {
    CICSTestUtils.noErrorTest(valid, "SP");
  }

  @Test
  void testCollectStatisticsSetInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(COLLECT_STATISTICS_SET_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCollectStatisticsHoursInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "If one option is specified, all options must be present: LASTRESETHRS,"
                    + " LASTRESETMIN, LASTRESETSEC",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(COLLECT_STATISTICS_HOURS_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCollectStatisticsResetMutualExInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LASTRESET or"
                    + " LASTRESETHRS",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LASTRESET or"
                    + " LASTRESETHRS",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(COLLECT_STATISTICS_RESET_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCollectStatisticsMutualExInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: AUTOINSTALL or "
                    + " CONNECTION or  DB2CONN or DB2ENTRY or  DISPATCHER or  ENQUEUE or  FILE or "
                    + " JOURNALNAME or  JOURNALNUM or JVMPROGRAM or  LSRPOOL or  MONITOR or  MVSTCB"
                    + " or POOL or PROGAUTO or  PROGRAM or  RECOVERY or  STATS or  STORAGE or "
                    + " STREAMNAME or SUBPOOL or  SYSDUMPCODE or  TABLEMGR or NODE or TASKSUBPOOL"
                    + " or TCLASS or  TCPIP or  TCPIPSERVICE or  TDQUEUE or  TERMINAL or  TRANCLASS"
                    + " or TRANDUMPCODE or  TRANSACTION or  TSQUEUE or  VTAM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: AUTOINSTALL or "
                    + " CONNECTION or  DB2CONN or DB2ENTRY or  DISPATCHER or  ENQUEUE or  FILE or "
                    + " JOURNALNAME or  JOURNALNUM or JVMPROGRAM or  LSRPOOL or  MONITOR or  MVSTCB"
                    + " or POOL or PROGAUTO or  PROGRAM or  RECOVERY or  STATS or  STORAGE or "
                    + " STREAMNAME or SUBPOOL or  SYSDUMPCODE or  TABLEMGR or NODE or TASKSUBPOOL"
                    + " or TCLASS or  TCPIP or  TCPIPSERVICE or  TDQUEUE or  TERMINAL or  TRANCLASS"
                    + " or TRANDUMPCODE or  TRANSACTION or  TSQUEUE or  VTAM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(COLLECT_STATISTICS_MUTUALEX_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCollectStatisticsMutualEx2Invalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: AUTOINSTALL or "
                    + " CONNECTION or  DB2CONN or DB2ENTRY or  DISPATCHER or  ENQUEUE or  FILE or "
                    + " JOURNALNAME or  JOURNALNUM or JVMPROGRAM or  LSRPOOL or  MONITOR or  MVSTCB"
                    + " or POOL or PROGAUTO or  PROGRAM or  RECOVERY or  STATS or  STORAGE or "
                    + " STREAMNAME or SUBPOOL or  SYSDUMPCODE or  TABLEMGR or NODE or TASKSUBPOOL"
                    + " or TCLASS or  TCPIP or  TCPIPSERVICE or  TDQUEUE or  TERMINAL or  TRANCLASS"
                    + " or TRANDUMPCODE or  TRANSACTION or  TSQUEUE or  VTAM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: AUTOINSTALL or "
                    + " CONNECTION or  DB2CONN or DB2ENTRY or  DISPATCHER or  ENQUEUE or  FILE or "
                    + " JOURNALNAME or  JOURNALNUM or JVMPROGRAM or  LSRPOOL or  MONITOR or  MVSTCB"
                    + " or POOL or PROGAUTO or  PROGRAM or  RECOVERY or  STATS or  STORAGE or "
                    + " STREAMNAME or SUBPOOL or  SYSDUMPCODE or  TABLEMGR or NODE or TASKSUBPOOL"
                    + " or TCLASS or  TCPIP or  TCPIPSERVICE or  TDQUEUE or  TERMINAL or  TRANCLASS"
                    + " or TRANDUMPCODE or  TRANSACTION or  TSQUEUE or  VTAM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(COLLECT_STATISTICS_MUTUALEX2_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCollectStatisticsTargetInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "If one option is specified, all options must be present: NODE and TARGET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(COLLECT_STATISTICS_TARGET_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCollectStatisticsNodeInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "If one option is specified, all options must be present: NODE and TARGET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(COLLECT_STATISTICS_NODE_INVALID, expectedDiagnostic, "SP");
  }
}
