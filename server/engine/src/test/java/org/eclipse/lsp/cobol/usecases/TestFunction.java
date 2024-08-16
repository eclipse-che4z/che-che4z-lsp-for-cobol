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
//import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
//import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

//import static org.junit.jupiter.api.Assertions.assertEquals;
//import static org.junit.jupiter.api.Assertions.assertNotNull;

/** Tests XML parse statement. */
public class TestFunction {

  public static final String BASIC_FUNCTION_DEFINITION = ""
      // ----+----1----+----2----+----3----+----4----+----5----+----6
      + "       IDENTIFICATION DIVISION.                             \n"
      + "       FUNCTION-ID. FUNC.                                   \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "       END FUNCTION FUNC.                                   \n";

  @Test
  void parse_basic_function_definition() {
    UseCaseEngine.runTest(BASIC_FUNCTION_DEFINITION, ImmutableList.of(), ImmutableMap.of());
  }

  public static final String VARIOUS_ALTERNATIVE_FUNCTIONS = ""
      // ----+----1----+----2----+----3----+----4----+----5----+----6
      + "       IDENTIFICATION DIVISION.                             \n"
      + "       FUNCTION-ID. FUNC AS 'funcx'                         \n"
      + "                    ENTRY-INTERFACE STATIC.                 \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "       END FUNCTION FUNC.                                   \n"
      + "                                                            \n"
      + "       IDENTIFICATION DIVISION.                             \n"
      + "       FUNCTION-ID. FUNC2 AS 'funcx2'                       \n"
      + "                    ENTRY-NAME IS LONGMIXED.                \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "       END FUNCTION FUNC2.                                  \n"
      + "                                                            \n"
      + "       IDENTIFICATION DIVISION.                             \n"
      + "       FUNCTION-ID. FUNC3 AS 'funcx3' IS PROTOTYPE          \n"
      + "                    ENTRY-NAME IS LONGMIXED.                \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "       END FUNCTION FUNC3.                                  \n";

  @Test
  void parse_various_alternative_functions() {
    UseCaseEngine.runTest(VARIOUS_ALTERNATIVE_FUNCTIONS, ImmutableList.of(), ImmutableMap.of());
  }

  public static final String DISALLOW_FUNCTION_NESTING = ""
      // ----+----1----+----2----+----3----+----4----+----5----+----6
      + "       IDENTIFICATION DIVISION.                             \n"
      + "       FUNCTION-ID. FUNC.                                   \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "                                                            \n"
      + "       ${IDENTIFICATION|1} DIVISION.                             \n"
      + "       FUNCTION-ID. FUNC.                                   \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "       END FUNCTION FUNC2.                                  \n"
      + "                                                            \n"
      + "       ${END|2} FUNCTION FUNC.                                   \n";

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

  public static final String DISALLOW_FUNCTION_NESTING_IN_PROGRAMS = ""
      // ----+----1----+----2----+----3----+----4----+----5----+----6
      + "       IDENTIFICATION DIVISION.                             \n"
      + "       PROGRAM-ID. PGM.                                     \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "                                                            \n"
      + "       IDENTIFICATION DIVISION.                             \n"
      + "       FUNCTION-ID. FUNC.                                   \n"
      + "       DATA DIVISION.                                       \n"
      + "       LINKAGE SECTION.                                     \n"
      + "       01  RETVAL.                                          \n"
      + "           05  NUM              PIC X(1234).                \n"
      + "       PROCEDURE DIVISION RETURNING RETVAL.                 \n"
      + "             MOVE 1234 to NUM.                              \n"
      + "       END FUNCTION FUNC2.                                  \n"
      + "                                                            \n"
      + "       ${END|1} PROGRAM PGM.                                     \n";

  @Test
  void parse_disallow_function_nesting_in_programs() {
    // This diagnostic seems suboptimal, but shows A problem.
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
}
