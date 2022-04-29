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

package org.eclipse.lsp.cobol.usecases;

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.Test;

/** This test checks that the semantic analysis is case-insensitive. */
class TestVariablesAreCaseInsensitive {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   {$*outer1}.\n"
          + "        02   {$*INNER1}      PIC 9(4) Binary. \n"
          + "        02   {$*inner2}      PIC X(10).\n"
          + "       01   {$*OUTER2}.\n"
          + "        02   {$*inner1}      PIC 9(4) Binary. \n"
          + "        02   {$*INNER2}      PIC X(10).\n"
          + "       02   {$*Str}          PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           Perform {#100-Test}.\n"
          + "           Stop Run.\n"
          + "       {#*100-Test}.\n"
          + "           Move {$INNER1} of {$OUTER1} to {$Str}.\n"
          + "           Move {$inner2} of {$outer1} to {$STR}.\n"
          + "           Move {$inner1} of {$OUTER2} to {$Str}.\n"
          + "           Move {$INNER2} of {$outer2} to {$Str}.\n"
          + "       End program ProgramId.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
