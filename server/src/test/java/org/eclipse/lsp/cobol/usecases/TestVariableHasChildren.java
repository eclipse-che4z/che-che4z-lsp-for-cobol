/*
 * Copyright (c) 2021 Broadcom.
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
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.variables.*;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessorListenerImpl;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks that the variable structure is built correctly */
class TestVariableHasChildren {
  private static final String TEXT =
      "000010 IDENTIFICATION DIVISION.\n"
          + "000020 PROGRAM-ID.            VARIABLES.\n"
          + "000100 DATA DIVISION.\n"
          + "000190 WORKING-STORAGE SECTION.\n"
          + "000200 01  {$*TERMS-RECORD}.\n"
          + "000210     05  {$*TERMS-KEY}                          Pic 9(3).\n"
          + "000220     05  filler                             PICTURE X(69).\n"
          + "000330 PROCEDURE DIVISION.";

  @Test
  void test() {
    AnalysisResult result =
        UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER)));
    List<Variable> actualGroupItemChildren =
        result.getVariables().stream()
            .filter(it -> it.getName().equals("TERMS-RECORD"))
            .findFirst()
            .map(StructuredVariable.class::cast)
            .map(StructuredVariable::getChildren)
            .orElse(null);

    final ImmutableList<ElementItem> expected = expectedGroupItemChildren();
    assertEquals(expected, actualGroupItemChildren);
  }

  private ImmutableList<ElementItem> expectedGroupItemChildren() {
    GroupItem group =
        new GroupItem(
            1,
            "TERMS-RECORD",
            Locality.builder()
                .uri(UseCaseUtils.DOCUMENT_URI)
                .range(new Range(new Position(4, 11), new Position(4, 23)))
                .token("TERMS-RECORD")
                .recognizer(GrammarPreprocessorListenerImpl.class)
                .build(),
            false,
            null);
    ElementItem child1 =
        new ElementItem(
            5,
            "TERMS-KEY",
            Locality.builder()
                .uri(UseCaseUtils.DOCUMENT_URI)
                .range(new Range(new Position(5, 15), new Position(5, 24)))
                .token("TERMS-KEY")
                .recognizer(GrammarPreprocessorListenerImpl.class)
                .build(),
            false,
            group,
            "9(3)",
            "",
            UsageFormat.UNDEFINED);
    ElementItem child2 =
        new ElementItem(
            5,
            "FILLER",
            Locality.builder()
                .uri(UseCaseUtils.DOCUMENT_URI)
                .range(new Range(new Position(6, 11), new Position(6, 64)))
                .token("05")
                .recognizer(GrammarPreprocessorListenerImpl.class)
                .build(),
            false,
            group,
            "X(69)",
            "",
            UsageFormat.UNDEFINED);
    group.addChild(child1);
    group.addChild(child2);

    return ImmutableList.of(child1, child2);
  }
}
