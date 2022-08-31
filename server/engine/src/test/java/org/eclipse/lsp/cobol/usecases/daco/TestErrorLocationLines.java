/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.usecases.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test for empty lines shift in copybooks
 */
class TestErrorLocationLines {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. SMP.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  COPY IDMS {~CB!IDMS}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           OBTAIN FIRST {A|A} WITHIN {B|B}.\n";
  private static final String CB = "\n\n\n\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(new CobolText("CB", IdmsDialect.NAME, CB)),
            ImmutableMap.of(
                    "A",
                    new Diagnostic(
                            new Range(new Position(10, 24), new Position(10, 25)),
                            "Variable A is not defined",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "B",
                    new Diagnostic(
                            new Range(new Position(10, 33), new Position(10, 34)),
                            "Variable B is not defined",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())),
            ImmutableList.of(),
            DialectConfigs.getDaCoAnalysisConfig());
  }
}
