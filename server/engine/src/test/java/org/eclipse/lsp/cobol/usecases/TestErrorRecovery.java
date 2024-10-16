/*
 * Copyright (c) 2024 Broadcom.
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
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.ParagraphNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for parser recovery scenarios
 */
class TestErrorRecovery {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL {VALUES|1}\n"
          + "           END-EXEC.\n"
          + "       {#*PAR1}.\n";

  @Test
  void test() {
    AnalysisResult result = UseCaseEngine.runTest(
        TEXT,
        ImmutableList.of(),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(), "No viable alternative at input VALUES",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));

    String paragraphName = result.getRootNode().findFirstProgramNode()
        .getDepthFirstStream()
        .filter(n -> n instanceof ParagraphNode)
        .map(ParagraphNode.class::cast)
        .findFirst()
        .map(CodeBlockDefinitionNode::getName)
        .orElse("");

    assertEquals("PAR1", paragraphName);
  }

}
