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
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.AlterNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test for ALTER statement
 */
class TestAlterStatement {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       PROCEDURE DIVISION.\r\n";

  private static final String ALTER_FROM =
            "           ALTER {#PAR1} OF SEC1 TO PROCEED TO {#PAR2} OF SEC1.\r\n"
          + "       {@*SEC1} SECTION.\r\n"
          + "       {#*PAR1}.\r\n"
          + "       {#*PAR2}.\r\n";

  @Test
  void testAlterFrom() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT + ALTER_FROM, ImmutableList.of(), ImmutableMap.of());

    AlterNode alterNode = result.getRootNode().getDepthFirstStream()
        .filter(n -> n.getNodeType() == NodeType.ALTER)
        .map(AlterNode.class::cast)
        .findFirst()
        .orElse(null);

    assertNotNull(alterNode);
    assertEquals("PAR1", alterNode.getFrom().getName());
    assertEquals("SEC1", alterNode.getFrom().getInSection());
    assertEquals("PAR2", alterNode.getTo().getName());
    assertEquals("SEC1", alterNode.getTo().getInSection());
  }
}
