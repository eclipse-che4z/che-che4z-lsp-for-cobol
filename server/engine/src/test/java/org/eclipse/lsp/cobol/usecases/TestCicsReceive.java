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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Test CICS RECEIVE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">RECEIVE
 * Command</a>
 *
 * <p>This class tests all variations of the RECEIVE command found in the link above.
 */
public class TestCicsReceive {
  private static final String GROUP_ONE_BASE_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*abc} PIC S9 VALUE +100.\n"
          + "       01 {$*def} PIC S9 VALUE +10.\n"
          + "       01 {$*ghi} PIC S9 VALUE +1000.\n"
          + "       01 {$*jkl} PIC X VALUE 'NAME'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC CICS \n"
          + "            END-EXEC.";

  private static final String[] GROUP_ONE_ALL_OPTIONS_VALID_ONE = {
    "RECEIVE",
    "INTO({$abc})",
    "LENGTH({$def})",
    "MAXLENGTH({$ghi})",
    "ASIS",
    "BUFFER",
    "NOTRUNCATE",
    "LEAVEKB"
  };

  private static final String[] GROUP_ONE_ALL_OPTIONS_VALID_TWO = {
    "RECEIVE",
    "INTO({$abc})",
    "FLENGTH({$def})",
    "MAXFLENGTH({$ghi})",
    "ASIS",
    "BUFFER",
    "NOTRUNCATE",
    "LEAVEKB"
  };

  private static final String[] GROUP_ONE_ALL_OPTIONS_VALID_THREE = {
    "RECEIVE",
    "SET({$abc})",
    "LENGTH({$def})",
    "MAXLENGTH({$ghi})",
    "ASIS",
    "BUFFER",
    "NOTRUNCATE",
    "LEAVEKB"
  };

  private static final String[] GROUP_ONE_ALL_OPTIONS_VALID_FOUR = {
    "RECEIVE",
    "SET({$abc})",
    "FLENGTH({$def})",
    "MAXFLENGTH({$ghi})",
    "ASIS",
    "BUFFER",
    "NOTRUNCATE",
    "LEAVEKB"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "MAXLENGTH({$ghi})", "ASIS", "BUFFER"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_TWO = {
    "RECEIVE", "INTO({$abc})", "FLENGTH({$def})", "MAXFLENGTH({$ghi})", "NOTRUNCATE", "LEAVEKB"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_THREE = {
    "RECEIVE", "SET({$abc})", "LENGTH({$def})", "MAXLENGTH({$ghi})"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_FOUR = {
    "RECEIVE", "SET({$abc})", "FLENGTH({$def})", "MAXFLENGTH({$ghi})"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_FIVE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_SIX = {
    "RECEIVE", "INTO({$abc})", "FLENGTH({$def})"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_SEVEN = {
    "RECEIVE", "SET({$abc})", "LENGTH({$def})"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_EIGHT = {
    "RECEIVE", "SET({$abc})", "FLENGTH({$def})"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_NINE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_TEN = {
    "RECEIVE", "INTO({$abc})", "FLENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_ELEVEN = {
    "RECEIVE", "SET({$abc})", "LENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_TWELVE = {
    "RECEIVE", "SET({$abc})", "FLENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_THIRTEEN = {
    "RECEIVE", "LENGTH({$def})", "MAXLENGTH({$ghi})", "NOTRUNCATE"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_FOURTEEN = {
    "RECEIVE", "FLENGTH({$def})", "MAXFLENGTH({$ghi})", "NOTRUNCATE"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_FIFTEEN = {
    "RECEIVE", "LENGTH({$def})"
  };

  private static final String[] GROUP_ONE_PARTIAL_OPTIONS_VALID_SIXTEEN = {
    "RECEIVE", "FLENGTH({$def})"
  };

  private static final String[] GROUP_ONE_INVALID_ONE = {
    "{RECEIVE|error1}", "INTO(100)", "MAXLENGTH(10)", "NOTRUNCATE"
  };

  private static final String[] GROUP_TWO_APPC_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE",
    "CONVID({$abc})",
    "INTO({$abc})",
    "LENGTH({$def})",
    "MAXLENGTH({$ghi})",
    "NOTRUNCATE",
    "STATE({$jkl})"
  };

  private static final String[] GROUP_TWO_APPC_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "CONVID({$abc})", "INTO({$abc})", "LENGTH({$def})"
  };

  private static final String[] GROUP_TWO_LUTYPE6_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE",
    "SESSION({$abc})",
    "INTO({$abc})",
    "LENGTH({$def})",
    "MAXLENGTH({$ghi})",
    "NOTRUNCATE",
  };

  private static final String[] GROUP_TWO_LUTYPE6_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "NOTRUNCATE",
  };

  private static final String[] GROUP_TWO_MRO_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE",
    "SESSION({$abc})",
    "INTO({$abc})",
    "LENGTH({$def})",
    "MAXLENGTH({$ghi})",
    "NOTRUNCATE",
    "STATE({$jkl})"
  };

  private static final String[] GROUP_TWO_MRO_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "STATE({$jkl})",
  };

  private static final String[] GROUP_TWO_INVALID_ONE = {
    "{RECEIVE|error1}",
    "SESSION(failure)",
    "LENGTH(10)",
    "MAXLENGTH(1000)",
    "NOTRUNCATE",
    "STATE(incomplete)"
  };

  private static final String[] R2980_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "MAXLENGTH({$ghi})", "NOTRUNCATE", "PASSBK"
  };

  private static final String[] R2980_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "LENGTH({$def})", "PASSBK"
  };

  private static final String[] R2980_INVALID_ONE = {
    "{RECEIVE|error1}", "SESSION(failure)", "MAXLENGTH(1000)", "NOTRUNCATE", "STATE(incomplete)"
  };

  private static final String[] NON_Z_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "FLENGTH({$ghi})", "MAXLENGTH(1000)", "NOTRUNCATE"
  };

  private static final String[] NON_Z_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "LENGTH({$def})", "FLENGTH({$ghi})", "NOTRUNCATE"
  };

  private static final String[] NON_Z_INVALID_ONE = {
    "RECEIVE", "INTO(100)", "LENGTH(1)", "{FLENGTH|error1}(100)", "MAXLENGTH(1000)",
  };

  private static final String[] PARTN_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "ASIS"
  };

  private static final String[] PARTN_PARTIAL_OPTIONS_VALID_ONE = {"RECEIVE", "LENGTH({$def})"};

  private static final String[] PARTN_INVALID_ONE = {
    "{RECEIVE|error1}", "SET(100)", "{ASIS|error2}"
  };

  private static final String[] MAP_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE",
    "MAP({$abc})",
    "MAPSET({$abc})",
    "INTO({$abc})",
    "TERMINAL",
    "ASIS",
    "INPARTN({$abc})"
  };

  private static final String[] MAP_PARTIAL_OPTIONS_VALID_ONE = {"RECEIVE", "MAP({$abc})"};

  private static final String[] MAP_INVALID_ONE = {"{RECEIVE|error1}", "TERMINAL"};

  private static final String[] MAP_MAPPINGDEV_FULL_OPTIONS_VALID_ONE = {
    "RECEIVE",
    "MAP({$abc})",
    "MAPPINGDEV({$def})",
    "FROM({$abc})",
    "LENGTH({$def})",
    "MAPSET({$abc})",
    "INTO({$abc})"
  };

  private static final String[] MAP_MAPPINGDEV_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "MAP({$abc})", "MAPPINGDEV({$def})", "FROM({$abc})",
  };

  private static final String[] MAP_MAPPINGDEV_INVALID_ONE = {
    "RECEIVE", "MAP(1)", "FROM(1)", "{MAPSET|error1}(1)"
  };

  private static String getTestString(String[] components) {
    List<String> instances = Arrays.asList(components);
    instances.replaceAll(String.join("", Collections.nCopies(12, " "))::concat);
    ArrayList<String> base = new ArrayList<String>(Arrays.asList(GROUP_ONE_BASE_TEXT.split("\n")));
    base.addAll(base.size() - 1, instances);
    return String.join("\n", base);
  }

  @Test
  void testGroupOneReceiveCICSCommand_withAllOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_ALL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withAllOptionsValidTwo() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_ALL_OPTIONS_VALID_TWO), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withAllOptionsValidThree() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_ALL_OPTIONS_VALID_THREE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withAllOptionsValidFour() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_ALL_OPTIONS_VALID_FOUR), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidTwo() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_TWO), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidThree() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_THREE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidFour() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_FOUR), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidFive() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_FIVE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidSix() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_SIX), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidSeven() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_SEVEN),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidEight() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_EIGHT),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidNine() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_NINE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidTen() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_TEN), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidEleven() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_ELEVEN),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidTwelve() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_TWELVE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidThirteen() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_THIRTEEN),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidFourteen() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_FOURTEEN),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidFifteen() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_FIFTEEN),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withPartialOptionsValidSixteen() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_PARTIAL_OPTIONS_VALID_SIXTEEN),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupOneReceiveCICSCommand_withAllOptionsInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_ONE_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'RECEIVE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testGroupTwoAppcFullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_TWO_APPC_FULL_OPTIONS_VALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupTwoAppcPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_TWO_APPC_PARTIAL_OPTIONS_VALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupTwoLTSixFullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_TWO_LUTYPE6_FULL_OPTIONS_VALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupTwoLTSixPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_TWO_LUTYPE6_PARTIAL_OPTIONS_VALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupTwoMROFullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_TWO_MRO_FULL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testGroupTwoMROPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_TWO_MRO_PARTIAL_OPTIONS_VALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testGroupTwoInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(GROUP_TWO_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'RECEIVE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testR2980FullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(R2980_FULL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testR2980PartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(R2980_PARTIAL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testR2980InvalidOne() {
    UseCaseEngine.runTest(
        getTestString(R2980_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'RECEIVE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testNonZFullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(NON_Z_FULL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testNonZ0PartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(NON_Z_PARTIAL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testNonZInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(NON_Z_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'FLENGTH'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testPartNFullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(PARTN_FULL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testPartNPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(PARTN_PARTIAL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testPartNInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(PARTN_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'RECEIVE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Extraneous input 'ASIS'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testMapFullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(MAP_FULL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testMapPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(MAP_PARTIAL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testMapInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(MAP_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'RECEIVE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testMapMappingDevFullOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(MAP_MAPPINGDEV_FULL_OPTIONS_VALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testMapMappingDevPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(MAP_MAPPINGDEV_PARTIAL_OPTIONS_VALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of());
  }

  @Test
  void testMapMappingDevInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(MAP_MAPPINGDEV_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'MAPSET'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }
}
