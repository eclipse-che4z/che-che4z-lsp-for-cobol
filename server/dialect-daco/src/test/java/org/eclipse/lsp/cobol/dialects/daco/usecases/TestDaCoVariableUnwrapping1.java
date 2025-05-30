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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Test for DaCo variable unwrapping */
class TestDaCoVariableUnwrapping1 {
  private static final String TEXT =
      "0      IDENTIFICATION DIVISION.\n"
          + "1      PROGRAM-ID.    TEST1.\n"
          + "2      ENVIRONMENT  DIVISION.\n"
          + "3      IDMS-CONTROL SECTION. PROTOCOL. IDMS-RECORDS MANUAL.\n"
          + "4      DATA   DIVISION.\n"
          + "5      WORKING-STORAGE SECTION.\n"
          + "6      01 {$*ROOT}.\n"
          + "7             05 COPY MAID {~CPB1!DaCo} KMK.\n"
          + "8      01  COPY IDMS {~CPB2-XTT!IDMS}.\n"
          + "9      01  {$*MAIN} PIC X(8).\n"
          + "10     PROCEDURE DIVISION.\n"
          + "11         DISPLAY {$L3-B} OF {$L1-X} OF {$ROOT}.\n"
          + "12         DISPLAY {$KMKKLS-XTT}.\n"
          + "13         DISPLAY {_KMKKLS-XTT OF ROOT|1_}.\n";
  private static final String COPYBOOK1 =
      "       01  {$*L1-X}.\n"
          + "           03 {$*L3-B}              PIC S9(9)   VALUE ZERO  COMP.\n";
  private static final String COPYBOOK2 = "       01 {$*KMKKLS-XTT}  PIC X(3)    VALUE SPACE.";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(
            new CobolText("CPB1", DaCoDialect.NAME, COPYBOOK1),
            new CobolText("CPB2-XTT", IdmsDialect.NAME, COPYBOOK2)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Variable KMKKLS-XTT is not defined",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
