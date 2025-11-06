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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.DiagnosticTag;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

/** Check detection of unused variables */
class TestUnusedVariables {
  private static final String SIMPLE_VARIABLE =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          {_01 {$*VAR1} PIC X.|unused1_}\n";
  private static final String SIMPLE_STRUCT =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          01 {$*STRUCT}.\n"
          + "          {_03 {$*VAR1} PIC X.|unused1_}\n";
  private static final String EXTERNAL_STRUCT =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          01 {$*STRUCT} EXTERNAL.\n"
          + "            03 {$*VAR1} PIC X.\n";
  private static final String VALUE =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          01 {$*VAR1} PIC X.\n"
          + "            {_88 {$*VAL1} VALUE 'A'.|unused1_}\n";
  private static final String FILLER =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          01 {$*STRUCT} EXTERNAL.\n"
          + "            03 FILLER PIC X.\n";
  private static final String REDEFINES =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          01 {$*STRUCT}.\n"
          + "            03 {$*VAR1} PIC X.\n"
          + "            {_03 {$*VAR2} REDEFINES {$VAR1}.|unused1_}\n";
  private static final String RENAMES =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          01 {$*STRUCT}.\n"
          + "            03 {$*VAR1} PIC X.\n"
          + "          {_66 {$*VAR2} RENAMES {$VAR1}.|unused1_}\n";
  private static final String TABLE =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          {_01 {$*VAR1} PIC X OCCURS 10.|unused1_}\n";
  private static final String STRUCT_TABLE =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          01 {$*STRUCT} OCCURS 10.\n"
          + "          {_03 {$*VAR1} PIC X.|unused1_}\n";
  private static final String IN_COPY =
      ""
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. UNUSED.\n"
          + "       DATA DIVISION. \n"
          + "       WORKING-STORAGE SECTION.\n"
          + "          COPY {~BOOK}.\n";
  private static final String IN_COPY_BOOK = "" + "          01 {$*VAR1} PIC X.\n";

  static AnalysisConfig getConfig() {
    final AnalysisConfig result = AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED);
    result.getUnusedVariableSeverity().severity = ErrorSeverity.ERROR;
    return result;
  }

  @ParameterizedTest
  @ValueSource(
      strings = {SIMPLE_VARIABLE, SIMPLE_STRUCT, VALUE, REDEFINES, RENAMES, TABLE, STRUCT_TABLE})
  void testUnused(String text) {
    final Diagnostic diag =
        new Diagnostic(
            new Range(),
            "Unused variable",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText());
    diag.setTags(ImmutableList.of(DiagnosticTag.Unnecessary));

    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of("unused1", diag),
        ImmutableList.of(),
        getConfig(),
        CobolLanguageId.COBOL,
        ImmutableMap.of());
  }

  @ParameterizedTest
  @ValueSource(strings = {EXTERNAL_STRUCT, FILLER})
  void testNoUnused(String text) {
    UseCaseEngine.runTest(
        text,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of(),
        getConfig(),
        CobolLanguageId.COBOL,
        ImmutableMap.of());
  }

  @Test
  void testCopybook() {
    UseCaseEngine.runTest(
        IN_COPY,
        ImmutableList.of(new CobolText("BOOK", IN_COPY_BOOK)),
        ImmutableMap.of(),
        ImmutableList.of(),
        getConfig(),
        CobolLanguageId.COBOL,
        ImmutableMap.of());
  }
}
