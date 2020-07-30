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
 * variables placed in one line found.
 */
public class TestVariableUsedSeveralTimesInOneStatement {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   {$*PARENT1}. \n"
          + "        02   {$*CHILD}      PIC 9(4) Binary. \n"
          + "       01   {$*PARENT2}.\n"
          + "        02   {$*CHILD}      PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           MOVE {$CHILD} IN {$PARENT1} TO {$CHILD} IN {$PARENT2}.\n"
          + "       End program ProgramId.";

  @Test
  public void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
