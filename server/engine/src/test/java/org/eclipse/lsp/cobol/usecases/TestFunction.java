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

/** Test function support */
public class TestFunction {

  public static final String BASIC_FUNCTION_DEFINITION =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC.                                   \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC.                                   \n";

  @Test
  void parse_basic_function_definition() {
    UseCaseEngine.runTest(BASIC_FUNCTION_DEFINITION, ImmutableList.of(), ImmutableMap.of());
  }

  public static final String VARIOUS_ALTERNATIVE_FUNCTIONS =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC AS 'funcx'                         \n"
          + "                    ENTRY-INTERFACE STATIC.                 \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC.                                   \n"
          + "                                                            \n"
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC2 AS 'funcx2'                       \n"
          + "                    ENTRY-NAME IS LONGMIXED.                \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC2.                                  \n"
          + "                                                            \n"
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC3 AS 'funcx3' IS PROTOTYPE          \n"
          + "                    ENTRY-NAME IS LONGMIXED.                \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC3.                                  \n";

  @Test
  void parse_various_alternative_functions() {
    UseCaseEngine.runTest(VARIOUS_ALTERNATIVE_FUNCTIONS, ImmutableList.of(), ImmutableMap.of());
  }

  public static final String DISALLOW_FUNCTION_NESTING =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC.                                   \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "                                                            \n"
          + "       {IDENTIFICATION|1} DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC2.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC2.                                  \n"
          + "                                                            \n"
          + "       {END|2} FUNCTION FUNC.                                   \n";

  @Test
  void parse_disallow_function_nesting() {
    UseCaseEngine.runTest(
        DISALLOW_FUNCTION_NESTING,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'IDENTIFICATION'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Syntax error on 'END'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  public static final String DISALLOW_FUNCTION_NESTING_IN_PROGRAMS =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       PROGRAM-ID. PGM.                                     \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "                                                            \n"
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC.                                   \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC.                                   \n"
          + "                                                            \n"
          + "       {END|1} PROGRAM PGM.                                     \n";

  @Test
  void parse_disallow_function_nesting_in_programs() {
    UseCaseEngine.runTest(
        DISALLOW_FUNCTION_NESTING_IN_PROGRAMS,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Syntax error on 'END'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  public static final String DIAGNOSE_MISSING_FUNCTION =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       PROGRAM-ID. PGM.                                     \n"
          + "       ENVIRONMENT DIVISION.                                \n"
          + "       CONFIGURATION SECTION.                               \n"
          + "       REPOSITORY.                                          \n"
          + "               FUNCTION {FUNC1|1}.                              \n"
          + "       DATA DIVISION.                                       \n"
          + "       WORKING-STORAGE SECTION.                             \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE FUNCTION {FUNC1|2} TO {$NUM}.                    \n"
          + "       END PROGRAM PGM.                                     \n";

  @Test
  void diagnose_missing_function() {
    UseCaseEngine.runTest(
        DIAGNOSE_MISSING_FUNCTION,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Expected a function name, but found 'FUNC1'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Expected a function name, but found 'FUNC1'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  public static final String FUNCTION_FOUND =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       {$$*IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC1.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*UNRELATED-STUFF}.                                 \n"
          + "           05  {$*NUM}         PIC X(1234).                     \n"
          + "       PROCEDURE DIVISION RETURNING {$UNRELATED-STUFF}.        \n"
          + "       END FUNCTION FUNC1.}                                  \n"
          + "                                                            \n"
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       PROGRAM-ID. PGM.                                     \n"
          + "       ENVIRONMENT DIVISION.                                \n"
          + "       CONFIGURATION SECTION.                               \n"
          + "       REPOSITORY.                                          \n"
          + "               FUNCTION {$$FUNC1}.                              \n"
          + "       DATA DIVISION.                                       \n"
          + "       WORKING-STORAGE SECTION.                             \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION.                                  \n"
          + "             MOVE FUNCTION {$$func1} TO {$RETVAL}.                    \n"
          + "       END PROGRAM PGM.                                     \n";

  @Test
  void function_found() {
    UseCaseEngine.runTest(FUNCTION_FOUND, ImmutableList.of(), ImmutableMap.of());
  }

  public static final String FUNCTION_REDEFINED =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC1.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC1.                                  \n"
          + "                                                            \n"
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       {FUNCTION-ID. FUNC1.|1}                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC1.                                  \n";

  @Test
  void function_redefined() {
    UseCaseEngine.runTest(
        FUNCTION_REDEFINED,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Function 'FUNC1' redefined",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  public static final String DIAGNOSE_DEFINED_AFTER =
      ""
          // ----+----1----+----2----+----3----+----4----+----5----+----6
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       PROGRAM-ID. PGM.                                     \n"
          + "       DATA DIVISION.                                       \n"
          + "       WORKING-STORAGE SECTION.                             \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE FUNCTION {_{$$FUNC1}|1_} TO {$RETVAL}.                 \n"
          + "       END PROGRAM PGM.                                     \n"
          + "                                                            \n"
          + "       {$$*IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC1.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*RETVAL}.                                          \n"
          + "           05  {$*NUM}              PIC X(1234).                \n"
          + "       PROCEDURE DIVISION RETURNING {$RETVAL}.                 \n"
          + "             MOVE 1234 to {$NUM}.                              \n"
          + "       END FUNCTION FUNC1.}                                  \n";

  @Test
  void diagnose_defined_after() {
    // This diagnostic seems suboptimal, but shows A problem.
    UseCaseEngine.runTest(
        DIAGNOSE_DEFINED_AFTER,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Expected a function name, but found 'FUNC1'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  public static final String NEGATIVE_ALL_INTRINSIC_FUNCTIONS_CANT_HAVE_OTHER_FUNCTION =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       repository.\n"
          + "           FUNCTION ALL {HEX-OF|1} INTRINSIC.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*so-data}.\n"
          + "           05 {$*HEX-OF1} pic 9.\n"
          + "       PROCEDURE DIVISION.";

  @Test
  void test_declared_all_intrinsic_functions_cant_have_other_function() {
    UseCaseEngine.runTest(
        NEGATIVE_ALL_INTRINSIC_FUNCTIONS_CANT_HAVE_OTHER_FUNCTION,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Extraneous input 'HEX-OF'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  // positive
  public static final String POSITIVE_DECLARE_ALL_INTRINSIC_NO_NEED_FUNCTION_KEYWORD_WHEN_CALLING =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       repository.\n"
          + "           FUNCTION ALL INTRINSIC.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*so-data}.\n"
          + "           05 {$*HEX-OF1} pic 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           display {$$HEX-OF}({$HEX-OF1}).";

  @Test
  void test_positive_declare_all_intrinsic_no_need_function_keyword_when_calling() {
    UseCaseEngine.runTest(
        POSITIVE_DECLARE_ALL_INTRINSIC_NO_NEED_FUNCTION_KEYWORD_WHEN_CALLING,
        ImmutableList.of(),
        ImmutableMap.of());
  }

  // negative
  public static final String WHEN_COMPILED_CANT_BE_DECLARED =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       repository.\n"
          + "           FUNCTION {_{$$WHEN-COMPILED}|1_} INTRINSIC.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*so-data}.\n"
          + "           05 {$*HEX-OF1} pic 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           display FUNCTION {$$HEX-OF}({$HEX-OF1}).";

  @Test
  void test_when_compiled_cant_be_declared() {
    UseCaseEngine.runTest(
        WHEN_COMPILED_CANT_BE_DECLARED,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "WHEN-COMPILED can not be specified in the FUNCTION clause of the REPOSITORY paragraph",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  // positive
  public static final String DECLARED_FUNCTION_NEED_NO_FUNCTION_PREFIX =
      "        IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       repository.\n"
          + "           FUNCTION {$$HEX-OF} INTRINSIC.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*so-data}.\n"
          + "           05 {$*HEX-OF1} pic 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           display {$$HEX-OF}({$HEX-OF1}).";

  @Test
  void test_declared_function_need_no_function_prefix() {
    UseCaseEngine.runTest(
        DECLARED_FUNCTION_NEED_NO_FUNCTION_PREFIX, ImmutableList.of(), ImmutableMap.of());
  }

  //
  public static final String USER_DEFINED_DECLARED_FUNCTION_NEED_NO_FUNCTION_PREFIX =
      "       {$$*IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC1.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*UNRELATED-STUFF}.                                 \n"
          + "           05  {$*NUM}         PIC X(1234).                     \n"
          + "       PROCEDURE DIVISION RETURNING {$UNRELATED-STUFF}.        \n"
          + "       END FUNCTION FUNC1.}                                  \n"
          + "       \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       repository.\n"
          + "           FUNCTION {$$FUNC1}\n"
          + "           FUNCTION ALL INTRINSIC.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*so-data}.\n"
          + "           05 {$*HEX-OF1} pic 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           display {$$HEX-OF}({$HEX-OF1}) .\n"
          + "           display {$$func1}.\n"
          + "           display \"hello\".";

  @Test
  void test_user_defined_declared_function_need_no_function_prefix() {
    UseCaseEngine.runTest(
        USER_DEFINED_DECLARED_FUNCTION_NEED_NO_FUNCTION_PREFIX,
        ImmutableList.of(),
        ImmutableMap.of());
  }

  //
  public static final String NON_DECLARED_FUNCTION_NAME_CAN_BE_USED_AS_VAR_NAME =
      "       {$$*IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC1.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*UNRELATED-STUFF}.                                 \n"
          + "           05  {$*NUM}         PIC X(1234).                     \n"
          + "       PROCEDURE DIVISION RETURNING {$UNRELATED-STUFF}.        \n"
          + "       END FUNCTION FUNC1.}                                  \n"
          + "       \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*so-data}.\n"
          + "           05 {$*func1} pic 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           display {$func1}.\n"
          + "           display function {$$func1}.\n"
          + "           display \"hello\".";

  @Test
  void test_non_declared_function_name_can_be_used_as_var_name() {
    UseCaseEngine.runTest(
        NON_DECLARED_FUNCTION_NAME_CAN_BE_USED_AS_VAR_NAME, ImmutableList.of(), ImmutableMap.of());
  }

  //
  public static final String DECLARED_FUNCTION_NAME_CANT_BE_USED_AS_VAR_NAME =
      "       {$$*IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC1.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*UNRELATED-STUFF}.                                 \n"
          + "           05  {$*NUM}         PIC X(1234).                     \n"
          + "       PROCEDURE DIVISION RETURNING {$UNRELATED-STUFF}.        \n"
          + "       END FUNCTION FUNC1.}                                  \n"
          + "       \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       repository.\n"
          + "           FUNCTION {$$func1}\n"
          + "           FUNCTION ALL Intrinsic.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*so-data}.\n"
          + "           05 {$*func1|1} pic 9.\n"
          + "           05 {$*hex-of|2} pic 9.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           display {$$func1}.\n"
          + "           display function {$$func1}.\n"
          + "           display \"hello\".";

  @Test
  void test_declared_function_name_cant_be_used_as_var_name() {
    UseCaseEngine.runTest(
        DECLARED_FUNCTION_NAME_CANT_BE_USED_AS_VAR_NAME,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable name FUNC1 is not allowed",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Variable name HEX-OF is not allowed",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  public static final String USE_DECLARED_FUNCTION_IN_NESTED_PROGRAM =
      "       {$$*IDENTIFICATION DIVISION.                             \n"
          + "       FUNCTION-ID. FUNC1.                                  \n"
          + "       DATA DIVISION.                                       \n"
          + "       LINKAGE SECTION.                                     \n"
          + "       01  {$*UNRELATED-STUFF}.                                 \n"
          + "           05  {$*NUM}         PIC X(1234).                     \n"
          + "       PROCEDURE DIVISION RETURNING {$UNRELATED-STUFF}.        \n"
          + "       END FUNCTION FUNC1.}                                  \n"
          + "\n"
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       PROGRAM-ID. PGM.                                     \n"
          + "       ENVIRONMENT DIVISION.                                \n"
          + "       CONFIGURATION SECTION.                               \n"
          + "       REPOSITORY.                                          \n"
          + "               FUNCTION {$$FUNC1}.                              \n"
          + "       DATA DIVISION.                                       \n"
          + "       WORKING-STORAGE SECTION.                             \n"
          + "       PROCEDURE DIVISION.\n"
          + "       IDENTIFICATION DIVISION.                             \n"
          + "       PROGRAM-ID. PGM1.                                            \n"
          + "       DATA DIVISION.                                       \n"
          + "       WORKING-STORAGE SECTION.                                      \n"
          + "       PROCEDURE DIVISION.                                  \n"
          + "             display {$$func1}.               \n"
          + "       END PROGRAM PGM1.                                                       \n"
          + "       END PROGRAM PGM. ";

  @Test
  void test_use_declared_function_in_nested_program() {
    UseCaseEngine.runTest(USE_DECLARED_FUNCTION_IN_NESTED_PROGRAM, ImmutableList.of(), ImmutableMap.of());
  }

  public static final String
      MULTIPLE_PROGRAM_IN_COMPILE_UNIT_REFERS_CORRECTLY_TO_FUNCTION_DECLARATION =
          "       {$$*IDENTIFICATION DIVISION.                             \n"
              + "       FUNCTION-ID. FUNC1.                                  \n"
              + "       DATA DIVISION.                                       \n"
              + "       LINKAGE SECTION.                                     \n"
              + "       01  {$*UNRELATED-STUFF}.                                 \n"
              + "           05  {$*NUM}         PIC X(1234).                     \n"
              + "       PROCEDURE DIVISION RETURNING {$UNRELATED-STUFF}.        \n"
              + "       END FUNCTION FUNC1.}                                  \n"
              + "\n"
              + "       IDENTIFICATION DIVISION.                             \n"
              + "       PROGRAM-ID. PGM.                                     \n"
              + "       ENVIRONMENT DIVISION.                                \n"
              + "       CONFIGURATION SECTION.                               \n"
              + "       REPOSITORY.                                          \n"
              + "               FUNCTION {$$FUNC1}.                              \n"
              + "       DATA DIVISION.                                       \n"
              + "       WORKING-STORAGE SECTION.                             \n"
              + "       PROCEDURE DIVISION.       \n"
              + "           display {$$func1}.                                           \n"
              + "       END PROGRAM PGM. \n"
              + "\n"
              + "       IDENTIFICATION DIVISION.                             \n"
              + "       PROGRAM-ID. PGM1.                                            \n"
              + "       DATA DIVISION.                                       \n"
              + "       WORKING-STORAGE SECTION.                                      \n"
              + "       PROCEDURE DIVISION.                                  \n"
              + "             display {func1|1}.               \n"
              + "       END PROGRAM PGM1. ";

  @Test
  void test_multiple_program_in_compile_unit_refers_correctly_to_function_declaration() {
    UseCaseEngine.runTest(MULTIPLE_PROGRAM_IN_COMPILE_UNIT_REFERS_CORRECTLY_TO_FUNCTION_DECLARATION, ImmutableList.of(), ImmutableMap.of("1",
            new Diagnostic(
                    new Range(),
                    "Variable FUNC1 is not defined",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }
}
