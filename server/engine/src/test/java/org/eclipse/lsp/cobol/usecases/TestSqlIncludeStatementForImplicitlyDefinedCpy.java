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

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.gson.JsonPrimitive;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks sql include statement for implicitly defined SQLCA and SQLCA (for both DB2 and
 * DATACOM formats). All the implicit fields which belong to SQLCA and SQLDA implicit variable
 * structure are resolved by DB2 precompiler or co-processor automatically.
 */
class TestSqlIncludeStatementForImplicitlyDefinedCpy {
  private static final String TEXT_BACKEND_DB2 =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. HELLO-DB2.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "           EXEC SQL INCLUDE {~SQLCA} END-EXEC.\n"
                  + "           EXEC SQL INCLUDE {~SQLDA} END-EXEC.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           MOVE 23 TO {$SQLCAID}  OF  {$SQLCA}.\n"
                  + "           MOVE 63 TO {$SQLCABC} OF  {$SQLCA}.\n"
                  + "           MOVE 00 TO {$SQLCODE} OF  {$SQLCA}.\n"
                  + "           MOVE 144 TO {$SQLN} OF  {$SQLDA}.\n"
                  + "           MOVE 200 TO {$SQLD} OF  {$SQLDA}.\n"
                  + "           IF {$SQLCODE} = ZERO  THEN  DISPLAY \"SUCCESS SQLCODE = \" {$SQLCODE}\n "
                  + "           ELSE DISPLAY \" FAIL SQLEXT = \"  {$SQLEXT}.\n"
                  + "           DISPLAY  {$SQLCABC} .\n"
                  + "           DISPLAY  {$SQLERRMC}.\n"
                  + "           DISPLAY  {$SQLN}.\n"
                  + "           DISPLAY  {$SQLD}.\n";

  private static final String TEXT_BACKEND_DB2_STDSQL =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. HELLO-DB2.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "           EXEC SQL INCLUDE {~SQLCA} END-EXEC.\n"
                  + "           EXEC SQL INCLUDE {~SQLDA} END-EXEC.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           MOVE 23 TO {$SQLCAID}  OF  {$SQLCA}.\n"
                  + "           MOVE 63 TO {$SQLCABC} OF  {$SQLCA}.\n"
                  + "           MOVE 00 TO {$SQLCADE} OF  {$SQLCA}.\n"
                  + "           MOVE 144 TO {$SQLN} OF  {$SQLDA}.\n"
                  + "           MOVE 200 TO {$SQLD} OF  {$SQLDA}.\n"
                  + "           IF {$SQLCADE} = ZERO  THEN  DISPLAY \"SUCCESS SQLCODE = \" {$SQLCADE}\n "
                  + "           ELSE DISPLAY \" FAIL SQLEXT = \"  {$SQLEXT}.\n"
                  + "           DISPLAY  {$SQLSTAT} .\n"
                  + "           DISPLAY  {$SQLERRMC}.\n"
                  + "           DISPLAY  {$SQLN}.\n"
                  + "           DISPLAY  {$SQLD}.\n";

  private static final String TEXT_BACKEND_DATACOM =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. HELLO-DB2.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "           EXEC SQL INCLUDE {~SQLCA} END-EXEC.\n"
                  + "           EXEC SQL INCLUDE {~SQLDA} END-EXEC.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           MOVE 23 TO {$SQLCA-DB-VRS}  OF  {$SQLCA}.\n"
                  + "           MOVE 00 TO {$SQLCA-SQLCODE} OF  {$SQLCA}.\n"
                  + "           MOVE 44 TO {$SQLCA-ERROR-PGM} OF  {$SQLCA}.\n"
                  + "           MOVE 144 TO {$SQLN} OF  {$SQLDA}.\n"
                  + "           MOVE 200 TO {$SQLD} OF  {$SQLDA}.\n"
                  + "           IF {$SQLCA-SQLCODE} = ZERO  THEN \n"
                  + "               DISPLAY \"SUCCESS CODE = \" {$SQLCA-SQLCODE} \n"
                  + "           ELSE DISPLAY \" FAIL CODE = \"  {$SQLCA-ERROR-PGM}.\n"
                  + "           DISPLAY  {$SQLCA-DB-VRS} .\n"
                  + "           DISPLAY  {$SQLN}.\n"
                  + "           DISPLAY  {$SQLD}.\n";

  private static final String TEXT_ERR_PRG =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. HELLO-DB2.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "           EXEC SQL INCLUDE {~SQLCA} END-EXEC.\n"
                  + "           EXEC SQL INCLUDE {~SQLDA} END-EXEC.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           MOVE 23 TO {$SQLCABC}  OF  {$SQLCA}.\n"
                  + "           MOVE 63 TO {$SQLCABC} OF  {$SQLCA}.\n"
                  + "           MOVE 200 TO {$SQLD} OF  {$SQLDA}.\n"
                  + "           IF {SQLCODE|err1} = ZERO  THEN  DISPLAY \"SUCCESS  \"\n "
                  + "           ELSE DISPLAY \" FAILED \"  {SQLEXT|err2}.\n"
                  + "           DISPLAY  {$SQLCABC} .\n"
                  + "           DISPLAY  {$SQLD}.\n";

  private static final String TEXT_BACKEND_DB2_IMPLICIT =
          "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. HELLO-DB2.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           IF {$SQLCODE} = ZERO  THEN  DISPLAY \"SUCCESS SQLCODE = \" {$SQLCODE}\n "
                  + "           ELSE DISPLAY \" FAIL SQLEXT = \"  {$SQLEXT}.\n";

  private static final String TEXT_BACKEND_DB2_2 =
                    "       IDENTIFICATION DIVISION.\n"
                  + "       PROGRAM-ID. HELLO-DB2.\n"
                  + "       DATA DIVISION.\n"
                  + "       WORKING-STORAGE SECTION.\n"
                  + "       EXEC SQL\n"
                  + "         INCLUDE {~SQLCA}\n"
                  + "       END-EXEC.\n"
                  + "       PROCEDURE DIVISION.\n"
                  + "           IF {$SQLCODE} = ZERO  THEN  DISPLAY \"SUCCESS SQLCODE = \" {$SQLCODE}\n "
                  + "           ELSE DISPLAY \" FAIL SQLEXT = \"  {$SQLEXT}.\n";

  private static final String ERR_MESSAGE = "Variable %s is not defined";

  @Test
  void test1() {
    UseCaseEngine.runTest(
            TEXT_BACKEND_DB2,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(
            TEXT_BACKEND_DATACOM,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            new AnalysisConfig(
                    CopybookProcessingMode.ENABLED,
                    ImmutableList.of(), true,
                    ImmutableList.of(),
                    ImmutableMap.of("target-sql-backend", new JsonPrimitive("DATACOM_SERVER"))));
  }

  @Test
  void test3() {
    UseCaseEngine.runTest(
            TEXT_ERR_PRG,
            ImmutableList.of(),
            ImmutableMap.of(
                    "err1",
                    new Diagnostic(
                            new Range(),
                            String.format(ERR_MESSAGE, "SQLCODE"),
                            Error,
                            ErrorSource.PARSING.getText()),
                    "err2",
                    new Diagnostic(
                            new Range(),
                            String.format(ERR_MESSAGE, "SQLEXT"),
                            Error,
                            ErrorSource.PARSING.getText())),
            ImmutableList.of(),
            new AnalysisConfig(
                    CopybookProcessingMode.ENABLED,
                    ImmutableList.of(), true,
                    ImmutableList.of(),
                    ImmutableMap.of("target-sql-backend", new JsonPrimitive("DATACOM_SERVER"))));
  }

  @Test
  void test4() {
    UseCaseEngine.runTest(
            TEXT_BACKEND_DB2_IMPLICIT,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
  }

  @Test
  void test5() {
    UseCaseEngine.runTest(
            TEXT_BACKEND_DB2_2,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
  }

  @Test
  void testStdSql() {
    AnalysisConfig analysisConfig = new AnalysisConfig(
            CopybookProcessingMode.ENABLED,
            ImmutableList.of(), true,
            ImmutableList.of(),
            ImmutableMap.of("target-sql-backend", new JsonPrimitive("DB2_SERVER")));
    analysisConfig.getCompilerOptions().add("STDSQL(YES)");

    UseCaseEngine.runTest(
            TEXT_BACKEND_DB2_STDSQL,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            analysisConfig);
  }
}
