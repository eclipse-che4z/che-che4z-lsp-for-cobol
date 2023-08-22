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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * This test checks that we collect all multiple definitions for variable.
 */
class TestDuplicatedDefinition {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB01.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME}  PIC X(20).\n"
          + "       01 {$*VARNAME}  PIC X(2).\n"
          + "       Procedure Division.\n"
          + "           move 1 to {$VARNAME|1}.";

  private static final String TEXT_WITHOUT_USAGE =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB02.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME}  PIC X(20).\n"
          + "       01 {$*VARNAME}  PIC X(2).\n";

  private static final String TEXT_DIFFERENT_LEVEL =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB03.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME}  PIC X(20).\n"
          + "       01 {$*DIFFERENT}.\n"
          + "           02 {$*VARNAME}  PIC X(2).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 1 TO {$VARNAME} OF {$DIFFERENT}.\n";

  private static final String TEXT_DIFFERENT_PARENT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB04.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*ROOT1}.\n"
          + "           02 {$*VARNAME}  PIC X(2).\n"
          + "       01 {$*ROOT2}.\n"
          + "           02 {$*VARNAME}  PIC X(2).\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 1 TO {$VARNAME} OF {$ROOT1}.\n";

  private static final String TEXT_RENAME =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB05.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*ROOT}.\n"
          + "           02 {$*VARNAME}.\n"
          + "             03 {$*CHILD} PIC X(2).\n"
          + "       66 {$*RENAME} RENAMES {$VARNAME} THRU {$CHILD} OF {$ROOT}.\n"
          + "       66 {$*RENAME} RENAMES {$CHILD} OF {$ROOT}.\n";

  private static final String TEXT_AMBIGUOUS_PARAGRAPH =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB06.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           PERFORM {PARAG1|1}.\n"
          + "       {#*PARAG1}.\n"
          + "       {#*PARAG1}.";

  private static final String TEXT_AMBIGUOUS_SECTION =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB07.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           PERFORM {SEC1|1}.\n"
          + "       {@*SEC1} SECTION.\n"
          + "       {@*SEC1} SECTION.";

  private static final String TEXT_PARAGRAPH_WITHOUT_USAGE =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB08.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*PARAG1}.\n"
          + "       {#*PARAG1}.";

  private static final String TEXT_DUPLICATED_SECTION_WITHOUT_USAGE =
      "       IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. AMB09.\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          PROCEDURE DIVISION.\n"
          + "          {@*SEC1} SECTION.\n"
          + "          {@*SEC1} SECTION.\n";

  private static final String TEXT_PARAGRAPH_WITH_SECTION =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB10.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GO TO {#PARAG1} OF SECTION-1.\n"
          + "       {#*PARAG1}.\n"
          + "       {@*SECTION-1} SECTION.\n"
          + "       {#*PARAG1}.";

  private static final String TEXT_PARAGRAPH_WITH_SECTION_AMBIGUOUS =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB11.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*SECTION-1} SECTION.\n"
          + "           GO TO {PARAG1|1} OF SECTION-1.\n"
          + "       {#*PARAG1}.\n"
          + "       {#*PARAG1}.";

  private static final String TEXT_PARAGRAPH_FOR_DIFFERENT_SECTIONS =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. AMB12.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*SECTION-1} SECTION.\n"
          + "           GO TO {#PARAG1}.\n"
          + "       {#*PARAG1}.\n"
          + "       {@*SECTION-2} SECTION.\n"
          + "       {#*PARAG1}.";

  private static final String TEXT_PARAGRAPH_FOR_DIFFERENT_SCOPES =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  AMB13.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GO TO {#PARAG1}.\n"
          + "       {#*PARAG1}.\n"
          + "       {@*SECTION-1} SECTION.\n"
          + "       {#*PARAG1}.";

  private static final String TEXT_PARAGRAPH_NOT_DEFINED =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.  AMB14.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           GO TO {PARAG1|1} OF SECTION-1.\n"
          + "       {#*PARAG1}.";

  @Test
  void testUsageCheck() {
    AnalysisResult result = UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Ambiguous reference for VARNAME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
    List<VariableUsageNode> variableUsages = result.getRootNode().getDepthFirstStream()
        .filter(Node.hasType(NodeType.VARIABLE_USAGE)).map(VariableUsageNode.class::cast).collect(Collectors.toList());
    assertEquals(1, variableUsages.size());
    List<Location> expectedLocations = ImmutableList.of(
        new Location(UseCaseUtils.DOCUMENT_URI, new Range(new Position(4, 7), new Position(4, 29))),
        new Location(UseCaseUtils.DOCUMENT_URI, new Range(new Position(5, 7), new Position(5, 28)))
    );
    List<Location> locations = variableUsages.get(0).getDefinitions();
    assertEquals(locations.size(), expectedLocations.size());
    locations.forEach(location -> assertTrue(expectedLocations.contains(location)));
  }

  @Test
  void testNoDuplicationError() {
    UseCaseEngine.runTest(TEXT_WITHOUT_USAGE, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDifferentLevel() {
    UseCaseEngine.runTest(TEXT_DIFFERENT_LEVEL, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDifferentParent() {
    UseCaseEngine.runTest(TEXT_DIFFERENT_PARENT, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testRename() {
    UseCaseEngine.runTest(TEXT_RENAME, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testAmbiguousParagraph() {
    UseCaseEngine.runTest(TEXT_AMBIGUOUS_PARAGRAPH, ImmutableList.of(), ImmutableMap.of(
        "1",
        new Diagnostic(
            new Range(),
            "Ambiguous reference for PARAG1",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText())));
  }

  @Test
  void testAmbiguousSection() {
    UseCaseEngine.runTest(TEXT_AMBIGUOUS_SECTION, ImmutableList.of(), ImmutableMap.of(
        "1",
        new Diagnostic(
            new Range(),
            "Ambiguous reference for SEC1",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText())));
  }

  @Test
  void testParagraph_withoutUsage() {
    UseCaseEngine.runTest(TEXT_PARAGRAPH_WITHOUT_USAGE, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testDuplicatedSection_withoutUsage() {
    UseCaseEngine.runTest(TEXT_DUPLICATED_SECTION_WITHOUT_USAGE, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testParagraph_withSection() {
    UseCaseEngine.runTest(TEXT_PARAGRAPH_WITH_SECTION, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testAmbiguousParagraph_withSection() {
    UseCaseEngine.runTest(TEXT_PARAGRAPH_WITH_SECTION_AMBIGUOUS, ImmutableList.of(), ImmutableMap.of(
        "1",
        new Diagnostic(
            new Range(),
            "Ambiguous reference for PARAG1",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText())));
  }

  @Test
  void testParagraph_forDifferentSections() {
    UseCaseEngine.runTest(TEXT_PARAGRAPH_FOR_DIFFERENT_SECTIONS, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testParagraph_forDifferentScopes() {
    UseCaseEngine.runTest(TEXT_PARAGRAPH_FOR_DIFFERENT_SCOPES, ImmutableList.of(), ImmutableMap.of());
  }

  @Test
  void testParagraph_notDefined() {
    UseCaseEngine.runTest(TEXT_PARAGRAPH_NOT_DEFINED, ImmutableList.of(), ImmutableMap.of(
        "1",
        new Diagnostic(
            new Range(),
            "The following paragraph is not defined: PARAG1",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText())));
  }

}
