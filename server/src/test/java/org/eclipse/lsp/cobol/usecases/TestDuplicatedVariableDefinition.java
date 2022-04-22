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
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This test checks that we collect all multiple definitions for variable.
 */
public class TestDuplicatedVariableDefinition {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. FIRST.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*VARNAME}  PIC X(20).\n"
          + "       01 {$*VARNAME}  PIC X(2).\n"
          + "       Procedure Division.\n"
          + "           move 1 to {$VARNAME|1}.";

  @Test
  void run() {
    AnalysisResult result = UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                null,
                "Duplicated definition for VARNAME",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
    List<VariableUsageNode> variableUsages = result.getRootNode().getDepthFirstStream()
        .filter(Node.hasType(NodeType.VARIABLE_USAGE)).map(VariableUsageNode.class::cast).collect(Collectors.toList());
    assertEquals(1, variableUsages.size());
    List<Location> expectedLocations = ImmutableList.of(
        new Location(UseCaseUtils.DOCUMENT_URI, new Range(new Position(4, 7), new Position(4, 29))),
        new Location(UseCaseUtils.DOCUMENT_URI, new Range(new Position(5, 7), new Position(5, 28)))
    );
    List<Location> locations = variableUsages.get(0).getDefinitions();
    assertEquals(expectedLocations, locations);
  }
}
