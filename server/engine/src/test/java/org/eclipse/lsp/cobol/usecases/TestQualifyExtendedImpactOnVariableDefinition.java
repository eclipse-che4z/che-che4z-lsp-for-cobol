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
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Tests if there is only one 01 level with a given name, that name can be referenced even if it is
 * not unique when the QUALIFY(EXTEND) option is in effect.
 *
 * <p>Ref - https://www.ibm.com/docs/en/cobol-zos/6.3?topic=reference-qualification
 */
public class TestQualifyExtendedImpactOnVariableDefinition {
  private static final String TEXT_PROGRAM_WITH_NO_CD =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'demo' RECURSIVE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       LOCAL-STORAGE SECTION.\n"
          + "       LINKAGE SECTION.\n"
          + "       1 {$*s}.\n"
          + "         3 {$*data1}.\n"
          + "           5 {$*value1} USAGE POINTER.\n"
          + "           5 {$*size1} PIC S9(9) COMP-5.\n"
          + "           5 {$*capacity} PIC S9(9) COMP-5.\n"
          + "       1 {$*value1}.\n"
          + "         3 {$*ptr} USAGE POINTER.\n"
          + "         3 {$*siz} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION USING {$s} {$value1}.\n"
          + "           >>CALLINTERFACE STATIC\n"
          + "           CALL {%\"something\"} USING {$data1} IN {$s} {$value1}\n"
          + "           >>CALLINTERFACE DYNAMIC\n"
          + "           GOBACK.\n"
          + "       END PROGRAM 'demo'.\n";

  public static final String TEXT_WITH_EXTENDED_OPTION =
      "PROCESS PGMN(LM),DYNAM,QUALIFY(EXTEND),SSRANGE(ZLEN)\n" + "\n" + TEXT_PROGRAM_WITH_NO_CD;

  public static final String TEXT_WITHOUT_EXTENDED_OPTION =
      "PROCESS PGMN(LM),DYNAM,SSRANGE(ZLEN)\n"
          + "\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'demo' RECURSIVE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       LOCAL-STORAGE SECTION.\n"
          + "       LINKAGE SECTION.\n"
          + "       1 {$*s}.\n"
          + "         3 {$*data1}.\n"
          + "           5 {$*value1} USAGE POINTER.\n"
          + "           5 {$*size1} PIC S9(9) COMP-5.\n"
          + "           5 {$*capacity} PIC S9(9) COMP-5.\n"
          + "       1 {$*value1}.\n"
          + "         3 {$*ptr} USAGE POINTER.\n"
          + "         3 {$*siz} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION USING {$s} {$value1|1}.\n"
          + "           >>CALLINTERFACE STATIC\n"
          + "           CALL {%\"something\"} USING {$data1} IN {$s} {$value1|2}\n"
          + "           >>CALLINTERFACE DYNAMIC\n"
          + "           GOBACK.\n"
          + "       END PROGRAM 'demo'.\n";
  private static final String TEXT_WITH_EXTENDED_OPTION_WITHOUT_01_LEVEL =
      "PROCESS PGMN(LM),DYNAM,QUALIFY(EXTEND),SSRANGE(ZLEN)\n"
          + "\n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. 'demo' RECURSIVE.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "       DATA DIVISION.\n"
          + "       FILE SECTION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       LOCAL-STORAGE SECTION.\n"
          + "       LINKAGE SECTION.\n"
          + "       1 {$*s}.\n"
          + "         3 {$*data1}.\n"
          + "           5 {$*value1} USAGE POINTER.\n"
          + "           5 {$*size1} PIC S9(9) COMP-5.\n"
          + "           5 {$*capacity} PIC S9(9) COMP-5.\n"
          + "       1 {$*value1}.\n"
          + "         3 {$*size1} USAGE POINTER.\n"
          + "         3 {$*ptr} USAGE POINTER.\n"
          + "         3 {$*siz} PIC S9(9) COMP-5.\n"
          + "       PROCEDURE DIVISION USING {$s} {$value1}.\n"
          + "           >>CALLINTERFACE STATIC\n"
          + "           CALL {%\"something\"} USING {$data1} IN {$s} {$size1|1}\n"
          + "           >>CALLINTERFACE DYNAMIC\n"
          + "           GOBACK.\n"
          + "       END PROGRAM 'demo'.\n";

  @Test
  void whenQualifyExtendedOptionActiveWithMultipleDefinitionThenConsider01LevelAsDefinition() {
    UseCaseEngine.runTest(
        TEXT_WITH_EXTENDED_OPTION,
        ImmutableList.of(),
        ImmutableMap.of(),
        ImmutableList.of("SOMETHING"));
  }

  @Test
  void whenQualifyExtendedOptionActiveFromConfigurationWithMultipleDefinitionThenConsider01LevelAsDefinition() {
    AnalysisConfig analysisConfig = new AnalysisConfig(
            CopybookProcessingMode.ENABLED,
            ImmutableList.of(), true, ImmutableList.of(), ImmutableMap.of());
    analysisConfig.getCompilerOptions().add("QUALIFY(EXTEND)");
    UseCaseEngine.runTest(
            TEXT_PROGRAM_WITH_NO_CD,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of("SOMETHING"),
            analysisConfig);
  }

  @Test
  void whenQualifyExtendedOptionActiveWithMultipleDefinitionThrowErrorIfDefNot01() {
    UseCaseEngine.runTest(
        TEXT_WITH_EXTENDED_OPTION_WITHOUT_01_LEVEL,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Ambiguous reference for SIZE1",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of("SOMETHING"));
  }

  @Test
  void whenQualifyExtendedOptionInActiveWithMultipleDefinitionThenGiveError() {
    UseCaseEngine.runTest(
        TEXT_WITHOUT_EXTENDED_OPTION,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Ambiguous reference for VALUE1",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Ambiguous reference for VALUE1",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        ImmutableList.of("SOMETHING"));
  }
}
