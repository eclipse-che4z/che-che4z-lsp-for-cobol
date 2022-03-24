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
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp4j.DiagnosticSeverity.Error;

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

  private static final String ERR_MESSAGE = "Variable %s is not defined";

  @Test
  void test1() {
    UseCaseEngine.runTest(
        TEXT_BACKEND_DB2,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        AnalysisConfig.defaultConfig(
            new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER)));
  }

  @Test
  void test2() {
    UseCaseEngine.runTest(
        TEXT_BACKEND_DATACOM,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        AnalysisConfig.defaultConfig(
            new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DATACOM_SERVER)));
  }

  @Test
  void test3() {
    UseCaseEngine.runTest(
        TEXT_ERR_PRG,
        ImmutableList.of(),
        ImmutableMap.of(
            "err1",
            new Diagnostic(
                null,
                String.format(ERR_MESSAGE, "SQLCODE"),
                Error,
                SourceInfoLevels.ERROR.getText()),
            "err2",
            new Diagnostic(
                null,
                String.format(ERR_MESSAGE, "SQLEXT"),
                Error,
                SourceInfoLevels.ERROR.getText())),
        ImmutableList.of(),
        AnalysisConfig.defaultConfig(
            new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DATACOM_SERVER)));
  }
}
