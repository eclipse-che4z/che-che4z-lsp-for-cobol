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

import static org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode.ENABLED;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCase;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;

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

  public static final String LITERAL_AFTER_KEYWORD_COMPILER_DIRECTIVE_CICS_TRANSLATOR =
      "       CBL CICS (SP, {'EXCI'|1}) \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  AB01FORE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.";

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
  void testCompilerDirectivesLiteralAfterKeywordCICSTranslatorOptions() {
    UseCaseEngine.runTest(
        LITERAL_AFTER_KEYWORD_COMPILER_DIRECTIVE_CICS_TRANSLATOR,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "No viable alternative at input CICS (SP, 'EXCI'",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
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
        "Syntax error on 'XOPTS'", diagnostics.get(UseCaseUtils.DOCUMENT_URI).get(0).getMessage());
  }

  @ParameterizedTest
  @MethodSource("conflictingOptionsProvider")
  void testConflictingOptionsGenerateWarning(String firstOption, String secondOption) {
    String text =
        String.format(
            "       CBL CICS(%s {%s|1})\n       CBL CICS({%s|2} %s)\n%s",
            firstOption, secondOption, secondOption, firstOption, TEXT);

    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                String.format("Conflicting options detected. %s assumed.", firstOption),
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                String.format("Conflicting options detected. %s assumed.", firstOption),
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  private static Stream<Arguments> conflictingOptionsProvider() {
    return Stream.of(
        Arguments.of("QUOTE", "APOST"),
        Arguments.of("APOST", "QUOTE"),
        Arguments.of("CBLCARD", "NOCBLCARD"),
        Arguments.of("NOCBLCARD", "CBLCARD"),
        Arguments.of("COBOL2", "COBOL3"),
        Arguments.of("COBOL2", "CO3"),
        Arguments.of("CO2", "COBOL3"),
        Arguments.of("CO2", "CO3"),
        Arguments.of("COBOL3", "COBOL2"),
        Arguments.of("COBOL3", "CO2"),
        Arguments.of("CO3", "COBOL2"),
        Arguments.of("CO3", "CO2"),
        Arguments.of("CPSM", "NOCPSM"),
        Arguments.of("NOCPSM", "CPSM"),
        Arguments.of("DEBUG", "NODEBUG"),
        Arguments.of("NODEBUG", "DEBUG"),
        Arguments.of("EDF", "NOEDF"),
        Arguments.of("NOEDF", "EDF"),
        Arguments.of("FEPI", "NOFEPI"),
        Arguments.of("NOFEPI", "FEPI"),
        Arguments.of("LENGTH", "NOLENGTH"),
        Arguments.of("NOLENGTH", "LENGTH"),
        Arguments.of("LINKAGE", "NOLINKAGE"),
        Arguments.of("NOLINKAGE", "LINKAGE"),
        Arguments.of("NUM", "NONUM"),
        Arguments.of("NONUM", "NUM"),
        Arguments.of("OPTIONS", "NOOPTIONS"),
        Arguments.of("NOOPTIONS", "OPTIONS"),
        Arguments.of("SEQ", "NOSEQ"),
        Arguments.of("NOSEQ", "SEQ"),
        Arguments.of("SPIE", "NOSPIE"),
        Arguments.of("NOSPIE", "SPIE"),
        Arguments.of("VBREF", "NOVBREF"),
        Arguments.of("NOVBREF", "VBREF"));
  }

  @ParameterizedTest
  @ValueSource(
      strings = {
        "QUOTE",
        "APOST",
        "CBLCARD",
        "NOCBLCARD",
        "COBOL2",
        "CO2",
        "COBOL3",
        "CO3",
        "CPSM",
        "NOCPSM",
        "DEBUG",
        "NODEBUG",
        "EDF",
        "NOEDF",
        "FEPI",
        "NOFEPI",
        "LENGTH",
        "NOLENGTH",
        "LINKAGE",
        "NOLINKAGE",
        "NUM",
        "NONUM",
        "OPTIONS",
        "NOOPTIONS",
        "SEQ",
        "NOSEQ",
        "SPIE",
        "NOSPIE",
        "VBREF",
        "NOVBREF"
      })
  void testSingleOptionDoesNotGenerateWarning(String option) {
    String text = String.format("       CBL CICS(%s)\n%s", option, TEXT);
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testMultipleConflictingOptionsGenerateWarning1() {
    String text =
        String.format(
            "       CBL CICS(\"{APOST|1}\")\n"
                + "       CBL CICS({APOST|2})\n"
                + "       CBL CICS(QUOTE {APOST|3} QUOTE)\n%s",
            TEXT);

    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Conflicting options detected. QUOTE assumed.",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Conflicting options detected. QUOTE assumed.",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText()),
            "3",
            new Diagnostic(
                new Range(),
                "Conflicting options detected. QUOTE assumed.",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testMultipleConflictingOptionsGenerateWarning2() {
    String text =
        String.format("       CBL CICS(EDF {NOEDF|1})\n       CBL CICS({NOEDF|2} EDF)\n%s", TEXT);

    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Conflicting options detected. EDF assumed.",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Conflicting options detected. EDF assumed.",
                DiagnosticSeverity.Warning,
                ErrorSource.PARSING.getText())));
  }
}
