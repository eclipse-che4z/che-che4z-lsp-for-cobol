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
 * Test that missed dialect stops processing
 */
class TestMissedDialect {
  private static final String TEXT =
       "{|1}        IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. MIN.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       TEST-DIALECT RELATED SENTENCE\n"
          + "       PROCEDURE DIVISION.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(new Range(), "TESTDIALECT dialect is missing (required for file:///c:/workspace/document.cbl)", DiagnosticSeverity.Error, ErrorSource.DIALECT.getText())),
        ImmutableList.of(),
        new AnalysisConfig(CopybookProcessingMode.ENABLED,
            ImmutableList.of("TESTDIALECT"), false, ImmutableList.of(), ImmutableMap.of()));
  }
}
