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

/**
 * Test CICS RECEIVE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">RECEIVE
 * Command</a>
 *
 * <p>This class tests all variations of the RECEIVE command found in the link above.
 */
public class TestCicsReceive {
  private static final String DEFAULT_BASE_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*abc} PIC S9 VALUE +100.\n"
          + "       01 {$*def} PIC S9 VALUE +10.\n"
          + "       01 {$*ghi} PIC S9 VALUE +1000.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC CICS \n"
          + "            END-EXEC.";

  private static final String[] DEFAULT_ALL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "MAXLENGTH({$ghi})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_ALL_OPTIONS_VALID_TWO = {
    "RECEIVE", "INTO({$abc})", "FLENGTH({$def})", "MAXFLENGTH({$ghi})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_ALL_OPTIONS_VALID_THREE = {
    "RECEIVE", "SET({$abc})", "LENGTH({$def})", "MAXLENGTH({$ghi})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_ALL_OPTIONS_VALID_FOUR = {
    "RECEIVE", "SET({$abc})", "FLENGTH({$def})", "MAXFLENGTH({$ghi})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_ONE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "MAXLENGTH({$ghi})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_TWO = {
    "RECEIVE", "INTO({$abc})", "FLENGTH({$def})", "MAXFLENGTH({$ghi})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_THREE = {
    "RECEIVE", "SET({$abc})", "LENGTH({$def})", "MAXLENGTH({$ghi})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_FOUR = {
    "RECEIVE", "SET({$abc})", "FLENGTH({$def})", "MAXFLENGTH({$ghi})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_FIVE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_SIX = {
    "RECEIVE", "INTO({$abc})", "FLENGTH({$def})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_SEVEN = {
    "RECEIVE", "SET({$abc})", "LENGTH({$def})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_EIGHT = {
    "RECEIVE", "SET({$abc})", "FLENGTH({$def})"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_NINE = {
    "RECEIVE", "INTO({$abc})", "LENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_TEN = {
    "RECEIVE", "INTO({$abc})", "FLENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_ELEVEN = {
    "RECEIVE", "SET({$abc})", "LENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_PARTIAL_OPTIONS_VALID_TWELVE = {
    "RECEIVE", "SET({$abc})", "FLENGTH({$def})", "NOTRUNCATE"
  };

  private static final String[] DEFAULT_INVALID_ONE = {
    "{RECEIVE|1}", "INTO(100)", "MAXLENGTH(10)", "NOTRUNCATE"
  };

  private static String getTestString(String[] components) {
    for (int i = 0; i < components.length; i++) {
      components[i] = "                " + components[i];
    }
    ArrayList<String> base = new ArrayList<String>(Arrays.asList(DEFAULT_BASE_TEXT.split("\n")));
    base.addAll(base.indexOf("            END-EXEC."), Arrays.asList(components));
    return String.join("\n", base);
  }

  @Test
  void testDefaultReceiveCICSCommand_withAllOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_ALL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withAllOptionsValidTwo() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_ALL_OPTIONS_VALID_TWO), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withAllOptionsValidThree() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_ALL_OPTIONS_VALID_THREE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withAllOptionsValidFour() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_ALL_OPTIONS_VALID_FOUR), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidOne() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_ONE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidTwo() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_TWO), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidThree() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_THREE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidFour() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_FOUR), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidFive() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_FIVE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidSix() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_SIX), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidSeven() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_SEVEN), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidEight() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_EIGHT), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidNine() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_NINE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidTen() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_TEN), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidEleven() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_ELEVEN), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withPartialOptionsValidTwelve() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_PARTIAL_OPTIONS_VALID_TWELVE), ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDefaultReceiveCICSCommand_withAllOptionsInvalidOne() {
    UseCaseEngine.runTest(
        getTestString(DEFAULT_INVALID_ONE),
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'RECEIVE'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }
}
