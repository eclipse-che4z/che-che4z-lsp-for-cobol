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
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableType;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

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
            AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));

    VariableNode termsRecord =
        result
            .getRootNode()
            .getDepthFirstStream()
            .filter(Node.hasType(NodeType.PROGRAM))
            .findFirst()
            .map(ProgramNode.class::cast)
            .map(ProgramNode::getVariables)
            .map(variableMap -> variableMap.get("TERMS-RECORD").iterator().next())
            .orElse(null);

    assertNotNull(termsRecord);
    assertEquals(VariableType.GROUP_ITEM, termsRecord.getVariableType());

    List<VariableNode> children =
        termsRecord.getChildren().stream()
            .filter(Node.hasType(NodeType.VARIABLE))
            .map(VariableNode.class::cast)
            .collect(Collectors.toList());

    assertEquals(2, children.size());

    VariableNode child1 = children.get(0);
    VariableNode child2 = children.get(1);

    assertEquals("TERMS-KEY", child1.getName());
    assertEquals("FILLER", child2.getName());
  }
}
