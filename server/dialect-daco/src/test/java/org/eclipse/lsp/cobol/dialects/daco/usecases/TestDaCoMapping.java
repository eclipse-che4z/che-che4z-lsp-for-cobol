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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test DaCo dialect mapping
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

  private static final String TEXT_MISSING_COPY = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    BMVV171M.\n"
      + "       ENVIRONMENT  DIVISION.\n"
      + "       IDMS-CONTROL SECTION.\n"
      + "       PROTOCOL.    MODE IS BATCH DEBUG\n"
      + "                    IDMS-RECORDS MANUAL.\n"
      + "       DATA   DIVISION.\n"
      + "      *     COMMENTED LINE \n"
      + "      -  \n"
      + "       WORKING-STORAGE SECTION.\n"
      + "       01  COPY IDMS {~SUBSCHEMA-NAMES!IDMS}.\n"
      + "       LINKAGE SECTION.\n"
      + "       01  COPY MAID {~LDVV171M!DaCo|1} INP.";

  private static final String COPY = "      *   * This copybook remains empty,\n"
      + "      *   * because the content is of no interest while editing COBOL\n"
      + "       01  FILLER                      PIC X(0).\n";

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
                DiagnosticSeverity.Warning,
                "COBOL Language Support (dialect)")),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }

  @Test
  void testMissingCopy() {
    UseCaseEngine.runTestForDiagnostics(
        TEXT_MISSING_COPY,
        ImmutableList.of(new CobolText("SUBSCHEMA-NAMES", IdmsDialect.NAME, COPY, "url", true)),
        ImmutableMap.of("1", new Diagnostic(new Range(), "LDVV171M_INP: Copybook not found",
            DiagnosticSeverity.Error, ErrorSource.DIALECT.getText(), "missing copybook")),
        ImmutableList.of(),
        DialectConfigs.getDaCoAnalysisConfig());
  }

}
