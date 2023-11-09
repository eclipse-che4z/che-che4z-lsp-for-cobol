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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.test.engine.UseCase;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;

/**
 * Tests CICS translator options. Refer <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.1?topic=compilation-using-cics-translator">CICS
 * translator</a> for more details.
 */
public class TestCICSTranslatorOptions {
  public static final String PREFIX = "       CBL XOPTS (";
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  AB01FORE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.";

  public static final String MIXED_COMPILER_DIRECTIVE_CICS_TRANSLATOR =
      "       CBL XOPTS (COBOL3 CBLCARD) ADATA, NOADATA AFP(NOVOLATILE)\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  AB01FORE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.";

  private static Stream<String> getOptions() {
    return Stream.of(
        "APOST",
        "CBLCARD",
        "CICS",
        "COBOL2",
        "COBOL3",
        "CPSM",
        "DBCS",
        "DEBUG",
        "DLI",
        "EDF",
        "EXCI",
        "FEPI",
        "FLAG(I)",
        "FLAG(W)",
        "FLAG(E)",
        "FLAG(S)",
        "LENGTH",
        "LINECOUNT(1)",
        "LINECOUNT(2)",
        "LINKAGE",
        "NATLANG",
        "NOCBLCARD",
        "NOCPSM",
        "NODEBUG",
        "NOEDF",
        "NOFEPI",
        "NOLENGTH",
        "NOLINKAGE",
        "NONUM",
        "NOOPTIONS",
        "NOSEQ",
        "NOSPIE",
        "NOVBREF",
        "NUM",
        "OPTIONS",
        "QUOTE",
        "SEQ",
        "SP",
        "SPACE(1)",
        "SPACE(2)",
        "SPACE(3)",
        "SPIE",
        "SYSEIB",
        "VBREF");
  }

  @ParameterizedTest
  @MethodSource("getOptions")
  void testOption(String cblOption) {
    UseCaseEngine.runTest(PREFIX + cblOption + ")\n" + TEXT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testCompilerDirectivesMixedWithCICSTranslatorOptions() {
    UseCaseEngine.runTest(
        MIXED_COMPILER_DIRECTIVE_CICS_TRANSLATOR, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  @Disabled("To be implemented")
  void testCompilerDirectivesMixedWithCICSTranslatorOptionsWhenDisabled() {
    UseCase useCase =
        UseCase.builder()
            .documentUri(UseCaseUtils.DOCUMENT_URI)
            .text(MIXED_COMPILER_DIRECTIVE_CICS_TRANSLATOR)
            .copybooks(ImmutableList.of())
            .sqlBackend(SQLBackend.DB2_SERVER)
            .copybookProcessingMode(ENABLED)
            .dialects(ImmutableList.of())
            .cicsTranslator(false)
            .build();
    AnalysisResult analyze = UseCaseUtils.analyze(useCase);
    Map<String, List<Diagnostic>> diagnostics = analyze.getDiagnostics();
    Assertions.assertEquals(1, diagnostics.get(UseCaseUtils.DOCUMENT_URI).size());
    Assertions.assertEquals(
        "Syntax error on 'XOPTS'",
        diagnostics.get(UseCaseUtils.DOCUMENT_URI).get(0).getMessage());
  }
}
