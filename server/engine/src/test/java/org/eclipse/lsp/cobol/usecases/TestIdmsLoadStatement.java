/*
 * Copyright (c) 2021 Broadcom.
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
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

/** Test IDMS LOAD DML statements */
class TestIdmsLoadStatement {

  private static final String DEFS =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION. \r\n"
          + "        WORKING-STORAGE SECTION. \r\n"
          + "        01 {$*WK_TABLE} PIC X(8).\n"
          + "        01 {$*WK_NODE} PIC X(8).\n"
          + "        01 {$*WK_NAME} PIC X(8).\n"
          + "        01 {$*WK_LOAD} PIC X(8).\n"
          + "        01 {$*WK_1} PIC X(8).\n"
          + "        01 {$*WK_2} PIC X(1).\n"
          + "        PROCEDURE DIVISION.\n";

  private static final String LOAD_LITERALS =
      DEFS
          + "           LOAD TABLE 'TSTTABL' INTO {$WK_1} TO {$WK_2} DICTNODE \r\n"
          + "           'TSTDICT' DICTNAME 'TSTDICT' LOADLIB 'TSTLOAD' NOWAIT.\n";

  private static final String LOAD_VARIABLES =
      DEFS
          + "           MOVE 'TSTTABLE' TO {$WK_TABLE}. MOVE 'TSTDICT' TO {$WK_NAME}.\r\n"
          + "           MOVE 'TSTDICT' TO {$WK_NODE}. MOVE 'TSTLOAD' TO {$WK_LOAD}.\r\n"
          + "           LOAD TABLE {$WK_TABLE} INTO {$WK_1} TO {$WK_2} DICTNODE \r\n"
          + "           {$WK_NAME} DICTNAME {$WK_NODE} LOADLIB {$WK_LOAD} NOWAIT.\n";

  private static final String LOAD_LITERALS_ERROR =
      DEFS
          + "           LOAD TABLE {'TSTTABLXX'|1} INTO {$WK_1} TO {$WK_2} DICTNODE \r\n"
          + "           {'TSTDICTXXX'|2} DICTNAME {'TSTDICTXXX'|3} LOADLIB 'TSTLOAD' NOWAIT.\n";

  private static Stream<String> textsToTest() {
    return Stream.of(LOAD_LITERALS, LOAD_VARIABLES, LOAD_LITERALS_ERROR);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - idms load tests")
  void test(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Max length limit of 8 bytes allowed for table name.",
                Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Max length limit of 8 bytes allowed for node name.",
                Error,
                SourceInfoLevels.ERROR.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Max length limit of 8 bytes allowed for dictionary name.",
                Error,
                SourceInfoLevels.ERROR.getText())),
        ImmutableList.of(),
        DialectConfigs.getIDMSAnalysisConfig());
  }
}
