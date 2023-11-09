/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests the usage of special registers implicitly introduced by CICS translator. Check {@link
 * org.eclipse.lsp.cobol.core.model.tree.logic.implicit.SRImplicitVariablesGenerator} for complete
 * list of implicit registers.
 */
public class TestCICSGeneratedRegisters {
  public static final String TEXT =
      "       CBL XOPTS(COBOL2)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       LINKAGE SECTION.\n"
          + "000137  01  {$*DFHCOMMAREA}.                                             \n"
          + "000138     03  FILLER  PIC X(01) OCCURS 1 TO 4096 TIMES \n"
          + "           DEPENDING ON {$EIBCALEN}.  \n"
          + "       PROCEDURE DIVISION.\n"
          + "000149     Move 'fred' to {$dfhc0040}\n"
          + "000150     Move length of {$DFHCOMMAREA} to {$dfhb0020}\n"
          + "000151         Call {%'DFHEI1'} using by content x'0e08' by \n"
          + "               reference {$dfhc0040} by reference {$DFHCOMMAREA}\n"
          + "000153     by reference {$dfhb0020} end-call.";

  public static final String TEXT2 =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. EXAMPLE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       CONFIGURATION SECTION.\n"
          + "       DATA DIVISION.\n"
          + "       LINKAGE SECTION.\n"
          + "000137  01  {$*DFHCOMMAREA}.          \n"
          + "000138     03  FILLER  PIC X(01). \n"
          + "       PROCEDURE DIVISION.\n"
          + "000149     Move 'fred' to {dfhc0040|1}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of("DFHEI1"));
  }

  @Test
  void testWhenCicsTranslateIsDiabled() {
    AnalysisConfig analysisConfig =
        new AnalysisConfig(
                CopybookProcessingMode.ENABLED,
            ImmutableList.of(),
            false,
            ImmutableList.of(),
            ImmutableMap.of());

    UseCaseEngine.runTest(
        TEXT2,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable DFHC0040 is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        analysisConfig);
  }
}
