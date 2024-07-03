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
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.implicitDialects.cics.nodes.ExecCicsHandleNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

/** Tests the CICS implicit dialect node position **/
class TestImplicitDialectsPosition {

  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    CBACT01C.\n"
      + "       PROCEDURE DIVISION.\n"
      + "           IF 2 > 1 THEN\n"
      + "             EXEC CICS HANDLE ABEND LABEL({#HANDLE-ABEND})\n"
      + "             END-EXEC.\n"
      + "             GO TO {#HANDLE-ABEND}\n"
      + "           END-IF.\n"
      + "       {#*HANDLE-ABEND}.\n";

  private static final String TEXT_WITH_COPY = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID.    CBACT01C.\n"
      + "       PROCEDURE DIVISION.\n"
      + "           IF 2 > 1 \n"
      + "             PERFORM {#HANDLE-ABEND}\n"
      + "             COPY {~COPY1}.\n"
      + "             DISPLAY '1'\n"
      + "           END-IF.\n"
      + "       {#*HANDLE-ABEND}.\n";

  private static final String COPY1 = "             EXEC CICS HANDLE ABEND LABEL({#HANDLE-ABEND}) END-EXEC\n";

  @Test
  void test() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
    Node ifNode = result.getRootNode().getDepthFirstStream()
        .filter(n -> n.getNodeType() == NodeType.IF)
        .findFirst()
        .orElse(null);

    assertNotNull(ifNode);
    Node execCicsNode = ifNode.getChildren().get(2);
    assertTrue(execCicsNode instanceof ExecCicsHandleNode);
  }

//  @Test
//  void testCopy() {
//    AnalysisResult result = UseCaseEngine.runTest(TEXT_WITH_COPY,
//        ImmutableList.of(new CobolText("COPY1", COPY1)),
//        ImmutableMap.of());
//    Node ifNode = result.getRootNode().getDepthFirstStream()
//        .filter(n -> n.getNodeType() == NodeType.IF)
//        .findFirst()
//        .orElse(null);
//
//    assertNotNull(ifNode);
//    Node execCicsNode = ifNode.getChildren().get(3);
//    assertTrue(execCicsNode instanceof ExecCicsHandleNode);
//  }

}
