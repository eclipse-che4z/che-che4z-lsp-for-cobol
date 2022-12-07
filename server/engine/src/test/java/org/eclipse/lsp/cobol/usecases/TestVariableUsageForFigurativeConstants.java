/*
 * Copyright (c) 2022 Broadcom.
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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/** This test checks that figurative constants can be used as variables */
public class TestVariableUsageForFigurativeConstants {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  calc2.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.  \n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*PASS-COUNTER}                  PIC 999      VALUE ZERO.\n"
          + "       01  {$*P-OR-F}                  PIC 999      VALUE ZERO.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*PASS}.  MOVE \"PASS \" TO {$P-OR-F}.  ADD 1 TO {$PASS-COUNTER}.            \n"
          + "       {#*SEQ-TEST-GF-7}.                                                    \n"
          + "           IF \"\" < QUOTE PERFORM {#PASS} .                        ";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }
}
