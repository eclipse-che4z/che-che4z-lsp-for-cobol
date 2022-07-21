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
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks that the second program in one file can use the same name for variable
 * declaration as the first program.
 */
class TestProgramContexts {
  private static final String TEXT_SEQUENTIAL_PROGRAMS =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. FIRST.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME}  PIC X(2).\n"
          + "       Procedure Division.\n"
          + "           move 1 to {$VARNAME}.\n"
          + "       End program FIRST.\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SECOND.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME}  PIC X(20).\n"
          + "       01 {$*VARNAME}  PIC X(2).\n"
          + "       Procedure Division.\n"
          + "           move 1 to {$VARNAME|1}.\n"
          + "       End program SECOND.";

  private static final String TEXT_NESTED_PROGRAMS =
      "       Identification Division.\n"
          + "        Program-Id. 'ACTDCNVO'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       1 {$*a-content-ptr} pointer.\n"
          + "       Procedure Division.\n"
          + "       {@*Mainline} Section.\n"
          + "           DISPLAY {$a-content-ptr}.\n"
          + "       Identification Division.\n"
          + "        Program-Id. 'ACTDCNVC'.\n"
          + "       Data Division.\n"
          + "       Local-Storage Section.\n"
          + "       Linkage Section.\n"
          + "       1 {$*a-content-ptr} pointer.\n"
          + "       Procedure Division.\n"
          + "       {@*Mainline} Section.\n"
          + "           DISPLAY {$a-content-ptr}.\n"
          + "       End Program 'ACTDCNVC'.\n"
          + "       End Program 'ACTDCNVO'.";

  @Test
  void testSequential() {
    UseCaseEngine.runTest(
        TEXT_SEQUENTIAL_PROGRAMS,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(new Position(15, 21), new Position(15, 28)),
                "Duplicated definition for VARNAME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testNested() {
    UseCaseEngine.runTest(TEXT_NESTED_PROGRAMS, ImmutableList.of(), ImmutableMap.of());
  }
}
