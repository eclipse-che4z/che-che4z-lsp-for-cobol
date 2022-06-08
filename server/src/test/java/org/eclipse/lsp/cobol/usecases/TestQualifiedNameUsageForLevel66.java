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
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** This test checks that level 66 variable can be used with qualified names. */
public class TestQualifiedNameUsageForLevel66 {
  private static final String PREFIX =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "008500 01  {$*A-GLOB}.                                                      \n"
          + "008600     02 {$*B-LEVEL}.                                                  \n"
          + "008700         03 {$*C-LEVEL}.                                              \n"
          + "008800             04 {$*D-LEVEL}.                                          \n"
          + "008900                 05 {$*TOM}           PICTURE XXX  VALUE \"UUU\".       \n"
          + "009000                 05 {$*DICK}          PICTURE XXXX VALUE \"UUUU\".      \n"
          + "009100             04  {$*DD-LEVEL}.                                        \n"
          + "009200                 05 {$*HARRY-A}       PICTURE XX   VALUE \"UU\".        \n"
          + "009300                 05 {$*HARRY-B}       PICTURE XXX  VALUE \"UUU\".       \n"
          + "009400             04 {$*DDD-LEVEL}.                                        \n"
          + "009500                 05 {$*JOE}           PICTURE XXX  VALUE \"UUU\".       \n"
          + "009600     02 {$*AL}                        PICTURE XX   VALUE \"UU\".        \n"
          + "009700     02 {$*BB-LEVEL}.                                           \n"
          + "009800             04 {$*BOB}               PICTURE XXX  VALUE \"UUU\".       \n";
  private static final String SUFFIX =
      "010000     66 {$*HARRY} RENAMES {$HARRY-A} THRU {$HARRY-B}.                       \n"
          + "       PROCEDURE DIVISION.\n"
          + "           IF       {$AL-BOB} OF {$A-GLOB}   EQUAL TO \"UUUUU\"      \n"
          + "           MOVE     \"ssd\"       TO {$TOM}. ";
  private static final String TEXT =
      PREFIX
          + "009900      66         {$*AL-BOB} RENAMES {$AL} IN {$A-GLOB} THRU {$BOB} OF {$A-GLOB}.  \n"
          + SUFFIX;
  private static final String TEXT2 =
      PREFIX
          + "009900     66 {$*AL-BOB} RENAMES {$D-LEVEL} IN {$B-LEVEL} THRU {$BOB} OF {$BB-LEVEL}.  \n"
          + SUFFIX;

  private static final String TEXT3 =
      PREFIX
          + "009900     66 {$*AL-BOB|1} RENAMES {$D-LEVEL} IN TOM THRU {$BOB} OF {$BB-LEVEL}.  \n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test3() {
    UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of("1",
            new Diagnostic(
                    null, "The data entry with the name TOM not found", DiagnosticSeverity.Error, SourceInfoLevels.ERROR.getText())));
  }


}
