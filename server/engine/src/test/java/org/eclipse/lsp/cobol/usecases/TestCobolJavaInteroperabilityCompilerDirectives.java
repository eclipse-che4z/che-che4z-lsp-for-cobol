/*
 * Copyright (c) 2025 Broadcom.
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

/**
 * Test for compiler directives
 */
class TestCobolJavaInteroperabilityCompilerDirectives {
  private static final String TEXT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       >>JAVA-SHAREABLE ON\n"
                  + "       01 {$*G1}.\n"
                  + "         03 {$*N1} PIC S9(9) COMP-5.\n"
                  + "         03 {$*G1SUB}.\n"
                  + "           05 {$*S1} PIC X(20).\n"
                  + "       >>JAVA-SHAREABLE OFF\n"
                  + "       01 {$*TESTW} pic x(9).\n"
                  + "       >>JAVA-CALLABLE\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$TESTW}.\n"
                  + "           GOBACK.\n";

  private static final String TEXT1 =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       >> JAVA-SHAREABLE ON\n"
                  + "       01 {$*G1}.\n"
                  + "         03 {$*N1} PIC S9(9) COMP-5.\n"
                  + "         03 {$*G1SUB}.\n"
                  + "           05 {$*S1} PIC X(20).\n"
                  + "       >> JAVA-SHAREABLE OFF\n"
                  + "       01 {$*TESTW} pic x(9).\n"
                  + "       >> JAVA-CALLABLE\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$TESTW}.\n"
                  + "           GOBACK.\n";

  private static final String TEXT_ERROR2 =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       >>  {_JAVA-SHAREABLE ON|error1_}\n"
                  + "       01 {$*G1}.\n"
                  + "         03 {$*N1} PIC S9(9) COMP-5.\n"
                  + "         03 {$*G1SUB}.\n"
                  + "           05 {$*S1} PIC X(20).\n"
                  + "       >>  {_JAVA-SHAREABLE OFF|error2_}\n"
                  + "       01 {$*TESTW} pic x(9).\n"
                  + "       >>  {JAVA-CALLABLE|error3}\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$TESTW}.\n"
                  + "           GOBACK.\n";

  private static final String TEXT_ERROR3 =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       >> JAVA-SHAREABLE ON {_aaa bbb|error1_}\n"
                  + "       01 {$*G1}.\n"
                  + "         03 {$*N1} PIC S9(9) COMP-5.\n"
                  + "         03 {$*G1SUB}.\n"
                  + "           05 {$*S1} PIC X(20).\n"
                  + "       >> JAVA-SHAREABLE OFF {_ccc ddd ff|error2_}\n"
                  + "       01 {$*TESTW} pic x(9).\n"
                  + "       >> JAVA-CALLABLE {_gg hh i|error3_}\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           DISPLAY {$TESTW}.\n"
                  + "           GOBACK.\n";

  private static final String TEXT_ERROR =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       >>{_JAVA-SHAREABLE ON|error1_}\n"
                  + "       01 {$*N1} PIC S9(9) COMP-5.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           GOBACK{.|error2}\n";

  private static final String TEXT_ERROR1 =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. TEST1.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "       >>{_JAVA-SHAREABLE ON|error1_}\n"
                  + "           GOBACK{.|error2}\n";
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void test1() {
    UseCaseEngine.runTest(TEXT1, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testError2() {
    UseCaseEngine.runTest(
            TEXT_ERROR2,
            ImmutableList.of(),
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "An invalid directive was found: JAVA-SHAREABLE ON",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "An invalid directive was found: JAVA-SHAREABLE OFF",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error3",
                    new Diagnostic(
                            new Range(),
                            "An invalid directive was found: JAVA-CALLABLE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())),
            ImmutableList.of());
  }


  @Test
  void testError3() {
    UseCaseEngine.runTest(
            TEXT_ERROR3,
            ImmutableList.of(),
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "An invalid directive was found: aaa bbb",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "An invalid directive was found: ccc ddd ff",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error3",
                    new Diagnostic(
                            new Range(),
                            "An invalid directive was found: gg hh i",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())),
            ImmutableList.of());
  }
//  @Test
//  void testError() {
//    UseCaseEngine.runTest(
//            TEXT_ERROR,
//            ImmutableList.of(),
//            ImmutableMap.of(
//                    "error1",
//                    new Diagnostic(
//                            new Range(),
//                            "Missing token JAVA-SHAREABLE OFF for the JAVA-SHAREABLE block ",
//                            DiagnosticSeverity.Error,
//                            ErrorSource.PARSING.getText()),
//                    "error2",
//                    new Diagnostic(
//                            new Range(),
//                            "Unexpected end of file .",
//                            DiagnosticSeverity.Error,
//                            ErrorSource.PARSING.getText())),
//            ImmutableList.of());
//  }
//
//  @Test
//  void testError1() {
//    UseCaseEngine.runTest(
//            TEXT_ERROR1,
//            ImmutableList.of(),
//            ImmutableMap.of(
//                    "error1",
//                    new Diagnostic(
//                            new Range(new Position(6, 21), new Position(6, 21)),
//                            "This compiler directive statement is allowed only in WORKING-STORAGE SECTION",
//                            DiagnosticSeverity.Error,
//                            ErrorSource.PARSING.getText()),
//                    "error2",
//                    new Diagnostic(
//                            new Range(),
//                            "Unexpected end of file .",
//                            DiagnosticSeverity.Error,
//                            ErrorSource.PARSING.getText())),
//            ImmutableList.of());
//  }
}
