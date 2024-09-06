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

package org.eclipse.lsp.cobol.usecases.common;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;

import java.util.*;

/**
 * CICS Test Utils.
 *
 * <p>This class provides helper methods for generating CICS example test strings.
 */
public class CICSTestUtils {
  private static final String GROUP_ONE_BASE_TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*varOne}   PIC S9 VALUE +10.\n"
          + "       01 {$*varTwo}   PIC S9 VALUE +100.\n"
          + "       01 {$*varThree} PIC S9 VALUE +1000.\n"
          + "       01 {$*varFour}  PIC X VALUE 'NAME_ONE'.\n"
          + "       01 {$*varFive}  PIC X VALUE 'NAME_TWO'.\n"
          + "       01 {$*varSix}   PIC X VALUE 'NAME_THREE'.\n"
          + "       PROCEDURE DIVISION.\n"
          + "            EXEC CICS \n"
          + "            END-EXEC.";

  /**
   * Retrieves a formatted test string for CICS command testing
   *
   * @param components Components to add to the EXEC CICS block of the test string
   * @return Formatted test string
   */
  public static String getTestString(String components) {
    List<String> instances = Arrays.asList(components.split("\\s"));
    instances.replaceAll(String.join("", Collections.nCopies(12, " "))::concat);
    ArrayList<String> base = new ArrayList<String>(Arrays.asList(GROUP_ONE_BASE_TEXT.split("\n")));
    base.addAll(base.size() - 1, instances);
    return String.join("\n", base);
  }

  /**
   * Runs a test asserting no errors
   *
   * @param newCommand Command string to test
   */
  public static void noErrorTest(String newCommand) {
    UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), ImmutableMap.of());
  }

  /**
   * Runs a test with asserting error conditions passed as argument
   *
   * @param newCommand Error command to execute
   * @param expectedDiagnostic Errors to match
   */
  public static void errorTest(String newCommand, Map<String, Diagnostic> expectedDiagnostic) {
    UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), expectedDiagnostic);
  }
}
