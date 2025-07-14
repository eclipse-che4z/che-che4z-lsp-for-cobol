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
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test for compiler directives */
class TestCobolJavaInteroperabilityCompilerDirectives {
  private static final String TEXT_VALID1 =
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

  private static final String TEXT_VALID2 =
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

  private static final String TEXT_TOO_MANY_SPACES_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {_>>  JAVA-SHAREABLE ON|error1_}\n"
          + "       01 {$*G1}.\n"
          + "         03 {$*N1} PIC S9(9) COMP-5.\n"
          + "         03 {$*G1SUB}.\n"
          + "           05 {$*S1} PIC X(20).\n"
          + "       {_>>  JAVA-SHAREABLE OFF|error2_}\n"
          + "       01 {$*TESTW} pic x(9).\n"
          + "       {_>>  JAVA-CALLABLE|error3_}\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$TESTW}.\n"
          + "           GOBACK.\n";

  private static final String TEXT_TEXT_AFTER_DIRECTIVE_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {_>> JAVA-SHAREABLE ON aaa bbb|error1_}\n"
          + "       01 {$*G1}.\n"
          + "         03 {$*N1} PIC S9(9) COMP-5.\n"
          + "         03 {$*G1SUB}.\n"
          + "           05 {$*S1} PIC X(20).\n"
          + "       {_>> JAVA-SHAREABLE OFF ccc ddd ff|error2_}\n"
          + "       01 {$*TESTW} pic x(9).\n"
          + "       {_>> JAVA-CALLABLE gg hh i|error3_}\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$TESTW}.\n"
          + "           GOBACK.\n";

  private static final String TEXT_WRONG_SECTION_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE \n"
          + "       DIVISION.\n"
          + "       {_>>JAVA-CALLABLE|error1_}\n"
          + "       {_>>JAVA-SHAREABLE ON|error2_}\n"
          + "       {_>>JAVA-SHAREABLE OFF|error3_}\n"
          + "           GOBACK.\n";

  private static final String TEXT_SHAREABLE_ON_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >> JAVA-SHAREABLE ON\n"
          + "       {_>>JAVA-SHAREABLE ON|error1_}\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SHAREABLE_OFF_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {_>>JAVA-SHAREABLE OFF|error1_}\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_OUTPATH =
      "       CBL JAVAIOP(OP('/a/folder'))\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_OUTPATH_INVALID =
      "       CBL JAVAIOP(OP(/{a|error1}/folder{|error2}'))\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_JVMI =
      "       CBL JAVAIOP(JVMI('-Djava.library.path=.'))\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_NOJAVA64 =
      "       CBL JAVAIOP(NOJAVA64)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_JAVA64 =
      "       CBL JAVAIOP(JAVA64)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_NOJAVA64_JAVA64_VALID =
      "       CBL JAVAIOP(NOJAVA64,JAVA64)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_JVMI_VALID =
      "       CBL JAVAIOP(JVMI('-Djava.library.path=.'),NOJVMI)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_OUTPATH_JVMI_VALID =
      "       CBL JAVAIOP(OUTPATH('/a/folder/compdir'),JVMI('-Xms512m'))\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_OUTPATH_JVMI_INVALID =
      "       CBL JAVAIOP(OUTPATH('/a/folder/compdir'),{|error1} JVMI('-Xms512m'))\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_NOJAVAIOP =
      "       CBL NOJAVAIOP\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_SETTING_JAVAIOP_NOJAVAIOP_INVALID =
      "       CBL JAVAIOP({NOJAVAIOP|error1})\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_WITH_COPYBOOK =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       copy {~abc}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.";

  private static final String COPYBOOK_TEXT =
      "       01 {$*varOne}   PIC S9 VALUE +10.\n"
          + "       01 {$*varOne}   PIC S9 VALUE +10.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*varTwo}   PIC S9 VALUE +100.\n"
          + "       01 {$*varThree} PIC S9 VALUE +1000.\n"
          + "       >>JAVA-SHAREABLE OFF\n"
          + "       01 {$*varFour}  PIC X VALUE 'NAME_ONE'.\n"
          + "       01 {$*varFive}  PIC X VALUE 'NAME_TWO'.\n"
          + "       >>JAVA-CALLABLE\n"
          + "       01 {$*varSix}   PIC X VALUE 'NAME_THREE'.";

  private static final String TEXT_SETTING_IN_COPYBOOK =
      "       {_COPY {~abc}.|error1_}\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.";

  private static final String COPYBOOK_WITH_SETTING = "       {CBL|error2} JAVAIOP(JAVA64)\n";

  private static final String TEXT_WITH_COPYBOOK_ERROR =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. ABCDEF.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {_copy {~abc}.|error1_}\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.";

  private static final String COPYBOOK_TEXT_WITH_ERROR =
      "       01 {$*varOne}   PIC S9 VALUE +10.\n"
          + "       01 {$*varOne}   PIC S9 VALUE +10.\n"
          + "       {_>>JAVA-SHAREABLE ON fdgfd|error2_}\n"
          + "       01 {$*varTwo}   PIC S9 VALUE +100.";

  private static final String TEXT_WITH_COPYBOOK_PGM1 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGM1.\n"
          + "       DATA DIVISION.\n"
          + "       >> JAVA-CALLABLE\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >> JAVA-SHAREABLE ON\n"
          + "       >> JAVA-SHAREABLE OFF\n"
          + "       PROCEDURE DIVISION.\n"
          + "               EXIT PROGRAM.\n"
          + "       END PROGRAM PGM1.\n"
          + "       copy {~abc}.";

  private static final String COPYBOOK_TEXT_PGM2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. PGM2.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "               EXIT PROGRAM.\n"
          + "       END PROGRAM PGM2.";

  private static final String TEXT_SHAREABLE_ON_VALID =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*N1} PIC X(50) VALUE ' PROCEDURE DIVISION '.\n"
          + "       >> JAVA-SHAREABLE ON\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n";

  private static final String TEXT_NESTED_PROGRAM_VALID =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       >>JAVA-SHAREABLE ON\n"
          + "       01 {$*N1} PIC X(50) VALUE 'DIVISION'.\n"
          + "       >>JAVA-SHAREABLE OFF\n"
          + "       >>JAVA-CALLABLE\n"
          + "       PROCEDURE DIVISION.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST2.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n"
          + "       END PROGRAM TEST2.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST3.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n"
          + "       END PROGRAM TEST3.\n"
          + "       END PROGRAM TEST1.\n";

  private static final String TEXT_NESTED_PROGRAM_INVALID =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST2.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {_>>JAVA-SHAREABLE ON|error1_}\n"
          + "       01 {$*N1} PIC X(50) VALUE 'DIVISION'.\n"
          + "       {_>>JAVA-SHAREABLE OFF|error2_}\n"
          + "       {_>>JAVA-CALLABLE|error3_}\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GOBACK.\n"
          + "       END PROGRAM TEST2.\n"
          + "       END PROGRAM TEST1.\n";

  @Test
  void testValid1() {
    UseCaseEngine.runTest(TEXT_VALID1, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testValid2() {
    UseCaseEngine.runTest(TEXT_VALID2, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testTooManySpacesError() {
    UseCaseEngine.runTest(
        TEXT_TOO_MANY_SPACES_ERROR,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "At most one blank character is allowed after >>.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "At most one blank character is allowed after >>.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "At most one blank character is allowed after >>.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testTextAfterDirectiveError() {
    UseCaseEngine.runTest(
        TEXT_TEXT_AFTER_DIRECTIVE_ERROR,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Line with a compiler directive can only be padded with blanks.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Line with a compiler directive can only be padded with blanks.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "Line with a compiler directive can only be padded with blanks.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testWrongPositionError() {
    UseCaseEngine.runTest(
        TEXT_WRONG_SECTION_ERROR,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "The JAVA-CALLABLE directive can only be specified before the PROCEDURE DIVISION of"
                    + " the first program.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "The JAVA-SHAREABLE directive can only be specified in the DATA DIVISION of a"
                    + " non-nested program.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "The JAVA-SHAREABLE directive can only be specified in the DATA DIVISION of a"
                    + " non-nested program.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testShareableOnError() {
    UseCaseEngine.runTest(
        TEXT_SHAREABLE_ON_ERROR,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "The JAVA-SHAREABLE state was already ON.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testShareableOffError() {
    UseCaseEngine.runTest(
        TEXT_SHAREABLE_OFF_ERROR,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "The JAVA-SHAREABLE state was already OFF.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testSettingOutPath() {
    UseCaseEngine.runTest(TEXT_SETTING_OUTPATH, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingOutPathInvalid() {
    UseCaseEngine.runTest(
        TEXT_SETTING_OUTPATH_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "No viable alternative at input JAVAIOP(OP(a",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "IGYDS1082-E A period was required.",
                DiagnosticSeverity.Error,
                ErrorSource.PREPROCESSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testSettingJvmi() {
    UseCaseEngine.runTest(TEXT_SETTING_JVMI, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingNoJava64() {
    UseCaseEngine.runTest(TEXT_SETTING_NOJAVA64, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingJava64() {
    UseCaseEngine.runTest(TEXT_SETTING_JAVA64, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingNoJava64Java64Valid() {
    UseCaseEngine.runTest(
        TEXT_SETTING_NOJAVA64_JAVA64_VALID, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingJvmiValid() {
    UseCaseEngine.runTest(TEXT_SETTING_JVMI_VALID, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingOutPathJvmiValid() {
    UseCaseEngine.runTest(TEXT_SETTING_OUTPATH_JVMI_VALID, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingOutPathJvmiInvalid() {
    UseCaseEngine.runTest(
        TEXT_SETTING_OUTPATH_JVMI_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(new Position(0, 47), new Position(0, 49)),
                "No space allowed.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testSettingNoJavaIOP() {
    UseCaseEngine.runTest(TEXT_SETTING_NOJAVAIOP, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testSettingJavaIopNoJavaIopInvalid() {
    UseCaseEngine.runTest(
        TEXT_SETTING_JAVAIOP_NOJAVAIOP_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "No viable alternative at input JAVAIOP(NOJAVAIOP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }

  @Test
  void testWithCopybook() {
    UseCaseEngine.runTest(
        TEXT_WITH_COPYBOOK,
        ImmutableList.of(new CobolText("ABC", COPYBOOK_TEXT)),
        ImmutableMap.of());
  }

  @Test
  void testSettingInCopybook() {
    UseCaseEngine.runTest(
        TEXT_SETTING_IN_COPYBOOK,
        ImmutableList.of(new CobolText("ABC", COPYBOOK_WITH_SETTING)),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Errors inside the copybook",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Syntax error on 'CBL'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testWithCopybookError() {
    UseCaseEngine.runTest(
        TEXT_WITH_COPYBOOK_ERROR,
        ImmutableList.of(new CobolText("ABC", COPYBOOK_TEXT_WITH_ERROR)),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "Errors inside the copybook",
                DiagnosticSeverity.Error,
                ErrorSource.COPYBOOK.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Line with a compiler directive can only be padded with blanks.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testWithCopybookError1() {
    UseCaseEngine.runTest(
        TEXT_WITH_COPYBOOK_PGM1,
        ImmutableList.of(new CobolText("ABC", COPYBOOK_TEXT_PGM2)),
        ImmutableMap.of());
  }

  @Test
  void testShareableOnValid() {
    UseCaseEngine.runTest(TEXT_SHAREABLE_ON_VALID, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testNestedProgramValid() {
    UseCaseEngine.runTest(TEXT_NESTED_PROGRAM_VALID, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testNestedProgramInvalid() {
    UseCaseEngine.runTest(
        TEXT_NESTED_PROGRAM_INVALID,
        ImmutableList.of(),
        ImmutableMap.of(
            "error1",
            new Diagnostic(
                new Range(),
                "The JAVA-SHAREABLE directive can only be specified in the DATA DIVISION of a"
                    + " non-nested program.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "The JAVA-SHAREABLE directive can only be specified in the DATA DIVISION of a"
                    + " non-nested program.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "The JAVA-CALLABLE directive can only be specified before the PROCEDURE DIVISION of"
                    + " the first program.",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of());
  }
}
