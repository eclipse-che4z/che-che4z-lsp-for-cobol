/*
 * Copyright (c) 2023 Broadcom.
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
import org.eclipse.lsp.cobol.common.model.tree.PerformNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Paragraph name can be "CLOSE"
 */
class TestPerformClose {
  private static final String TEXT = "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. CLOSEPAR.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           PERFORM {#CLOSE}.\n"
          + "       {#*CLOSE}.\n"
          + "           DISPLAY 'CLOSE'.\n";

  private static final String TEXT_THRU = "       IDENTIFICATION DIVISION.\n"
      + "       PROGRAM-ID. CLOSEPAR.\n"
      + "       PROCEDURE DIVISION.\n"
      + "           PERFORM {#BP} OF SEC1 THRU {#EP} OF SEC2.\n"
      + "       {@*SEC1} SECTION.\n"
      + "       {#*BP}.\n"
      + "           DISPLAY 'BP'.\n"
      + "       {#*CP}.\n"
      + "           DISPLAY 'CP'.\n"
      + "       {@*SEC2} SECTION.\n"
      + "       {#*EP}.\n"
      + "           DISPLAY 'EP'.\n";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of());
  }

  @Test
  void testPerformThru() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT_THRU, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of());
    PerformNode perform = result.getRootNode().getDepthFirstStream()
        .filter(n -> n.getNodeType() == NodeType.PERFORM)
        .findFirst()
        .map(PerformNode.class::cast)
        .orElseThrow(RuntimeException::new);

    assertEquals("BP", perform.getTarget().getName());
    assertEquals("SEC1", perform.getTarget().getInSection());
    assertEquals("EP", perform.getThru().getName());
    assertEquals("SEC2", perform.getThru().getInSection());
  }

}
