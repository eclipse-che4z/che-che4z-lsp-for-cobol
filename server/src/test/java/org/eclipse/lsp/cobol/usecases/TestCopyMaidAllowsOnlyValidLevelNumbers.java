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
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.DialectType;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.junit.jupiter.api.Test;

/** Test that COPY MAID statement allows only 01-49 level numbers */
class TestCopyMaidAllowsOnlyValidLevelNumbers {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       {_44 COPY MAID {~PMOREC}.|1_}\n"
          + "       {50|2} COPY MAID {~PMOREC}.\n"
          + "       Procedure Division.";

  private static final String COPYBOOK_CONTENT =
      "       {01^44}  {$*ABC|1}.\n" + "           {05^49} {$*DEF}     PIC S9(4) COMP.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(new CobolText("PMOREC", DialectType.MAID.name(), COPYBOOK_CONTENT)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "ABC: Only 01, 66 and 77 level numbers are allowed at the highest level",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                null,
                "Syntax error on '50' expected {CBL, END, EXEC, FILE, ID, IDENTIFICATION, LINKAGE, "
                    + "LOCAL-STORAGE, PROCEDURE, PROCESS, WORKING-STORAGE, '01-49', '66', '77', '88'}",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
