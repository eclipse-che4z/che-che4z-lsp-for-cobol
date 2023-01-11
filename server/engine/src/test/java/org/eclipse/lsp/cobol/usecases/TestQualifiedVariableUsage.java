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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/** Test different combinations of qualified variable usage */
public class TestQualifiedVariableUsage {
  public static final String HEADER_TEXT =
      "PROCESS PGMN(LM),DYNAM,QUALIFY(EXTEND),SSRANGE(ZLEN) \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'TEST' RECURSIVE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       LOCAL-STORAGE SECTION.\n"
          + "       LINKAGE SECTION.\n"
          + "       1 {$*value1} USAGE FUNCTION-POINTER.\n";
  public static final String CASE1 =
      HEADER_TEXT
          + "       1 {$*zl_return}.\n"
          + "         3 {$*key1}.\n"
          + "           5 {$*data1}.\n"
          + "             7 {$*value1} USAGE POINTER.\n"
          + "         3 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "       PROCEDURE DIVISION USING {$zl_return} {$value1}.\n"
          + "           SET {$value1} IN {$zl_return} TO {$value1}.\n"
          + "       END PROGRAM 'TEST'.";
  public static final String CASE2 =
      HEADER_TEXT
          + "       1 {$*zl_return}.\n"
          + "         3 {$*key1}.\n"
          + "           5 {$*data1}.\n"
          + "             7 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "         3 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "       PROCEDURE DIVISION USING {$zl_return} {$value1}.\n"
          + "           SET {$value1} IN {$data1} in {$key1} IN {$zl_return} TO {$value1}.\n"
          + "       END PROGRAM 'TEST'.";

  public static final String CASE3 =
      HEADER_TEXT
          + "       1 {$*zl_return}.\n"
          + "         3 {$*key1}.\n"
          + "           5 {$*data1}.\n"
          + "             7 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "             7 {$*size1} PIC S9(9) COMP-5.\n"
          + "             7 {$*capacity} PIC S9(9) COMP-5.\n"
          + "         3 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "       PROCEDURE DIVISION USING {$zl_return} {$value1}.\n"
          + "           SET {$value1} IN {$data1} IN {$zl_return} TO {$value1}.\n"
          + "       END PROGRAM 'TEST'.";

  public static final String CASE4 =
      HEADER_TEXT
          + "       1 {$*zl_return}.\n"
          + "         3 {$*key1}.\n"
          + "           5 {$*data1}.\n"
          + "             7 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "           5 {$*data2}.\n"
          + "             7 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "         3 {$*value1} USAGE FUNCTION-POINTER.\n"
          + "       PROCEDURE DIVISION USING {$zl_return} {$value1}.\n"
          + "           SET {_{$value1} IN {$key1} IN {$zl_return}|1_} TO {$value1}.\n"
          + "       END PROGRAM 'TEST'.";

  private static Stream<String> textsToTest() {
    return Stream.of(CASE1, CASE2, CASE3);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - testing qualified variable usage")
  void positiveTest(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void negativeTest() {
    UseCaseEngine.runTest(
        CASE4,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Ambiguous reference for VALUE1",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
