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
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test line concatenation with mapping
 */
public class TestDaCoMapping {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT  DIVISION.\n"
          + "       IDMS-CONTROL SECTION.\n"
          + "       PROTOCOL.    MODE IS IDMS-DC-NONAUTO DEBUG\n"
          + "                    IDMS-RECORDS MANUAL.\n"
          + "       DATA   DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*ROOT}.\n"
          + "            05 {$*VAR}                         VALUE\n"
          + "           'RQS50  CV=01                                      ¦ M A I D\n"
          + "      -    '      entity-report'.\n"
          + "               07 FILLER               PIC X(10).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           WRITE REPORT TABCD FROM {$VAR} LENGTH {79|1} AFTER PAGE\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Allowed range is 80 to 200",
                DiagnosticSeverity.Error,
                "COBOL Language Support (dialect)")),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }
}
