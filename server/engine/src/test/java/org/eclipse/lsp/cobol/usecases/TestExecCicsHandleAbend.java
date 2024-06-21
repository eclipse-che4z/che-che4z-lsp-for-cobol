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
import org.eclipse.lsp.cobol.implicitDialects.cics.nodes.ExecCicsHandleNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** This test exec cics handle abend */
class TestExecCicsHandleAbend {

  private static final String TEXT0 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID.    CBACT01C.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           EXEC CICS HANDLE ABEND\n"
          + "           END-EXEC.\n";

  private static final String TEXT1 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID.    CBACT01C.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           EXEC CICS HANDLE ABEND CANCEL\n"
          + "           END-EXEC.\n";

  private static final String TEXT2 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID.    CBACT01C.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*PRG}.\n"
          + "            05 {$*WK1} PIC X.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           EXEC CICS HANDLE ABEND PROGRAM({$PRG})\n"
          + "           END-EXEC.\n";

  private static final String TEXT3 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID.    CBACT01C.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           EXEC CICS HANDLE ABEND LABEL({@SEC1})\n"
          + "           END-EXEC.\n"
          + "        {@*SEC1} SECTION.\n";

  private static final String TEXT4 =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID.    CBACT01C.\n"
          + "        PROCEDURE DIVISION.\n"
          + "           EXEC CICS HANDLE ABEND RESET\n"
          + "           END-EXEC.\n";

  private void checkNode(AnalysisResult result, ExecCicsHandleNode.HandleAbendType type) {
    Optional<ExecCicsHandleNode> node = result.getRootNode().getDepthFirstStream()
        .filter(n -> n instanceof ExecCicsHandleNode)
        .map(ExecCicsHandleNode.class::cast)
        .findFirst();

    assertTrue(node.isPresent());
    assertEquals(type, node.get().getType());
  }

  @Test
  void testDefault() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT0, ImmutableList.of(), ImmutableMap.of());
    checkNode(result, ExecCicsHandleNode.HandleAbendType.CANCEL);
  }

  @Test
  void testCancel() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT1, ImmutableList.of(), ImmutableMap.of());
    checkNode(result, ExecCicsHandleNode.HandleAbendType.CANCEL);
  }

  @Test
  void testProgram() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT2, ImmutableList.of(), ImmutableMap.of());
    checkNode(result, ExecCicsHandleNode.HandleAbendType.PROGRAM);
  }

  @Test
  void testLabel() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT3, ImmutableList.of(), ImmutableMap.of());
    checkNode(result, ExecCicsHandleNode.HandleAbendType.LABEL);
  }

  @Test
  void testReset() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT4, ImmutableList.of(), ImmutableMap.of());
    checkNode(result, ExecCicsHandleNode.HandleAbendType.RESET);
  }

}
