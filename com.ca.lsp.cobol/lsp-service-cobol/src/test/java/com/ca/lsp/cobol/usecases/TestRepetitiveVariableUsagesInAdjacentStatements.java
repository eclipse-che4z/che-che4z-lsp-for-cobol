/*
 * Copyright (c) 2020 Broadcom.
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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that document with multi-definitions parsed correctly and all the usages of
 * variables placed in a row retrieved.
 */
public class TestRepetitiveVariableUsagesInAdjacentStatements {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   {$*outer1}. \n"
          + "        02   {$*inner1}      PIC 9(4) Binary. \n"
          + "        02   {$*inner2}      PIC X(10).\n"
          + "       01   {$*outer2}.\n"
          + "        02   {$*inner1}      PIC 9(4) Binary. \n"
          + "        02   {$*inner2}      PIC X(10).\n"
          + "       01   {$*Str}          PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           Perform {#100-Test}.\n"
          + "           Stop Run.\n"
          + "       {#*100-Test}.\n"
          + "           Move {$inner1} of {$outer1} to {$Str}.\n"
          + "           Move {$inner2} of {$outer1} to {$Str}.\n"
          + "           Move {$inner1} of {$outer2} to {$Str}.\n"
          + "           Move {$inner2} of {$outer2} to {$Str}.\n"
          + "       End program ProgramId.";

  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
