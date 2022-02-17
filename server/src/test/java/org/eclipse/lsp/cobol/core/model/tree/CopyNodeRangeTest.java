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
package org.eclipse.lsp.cobol.core.model.tree;

import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.RangeUtils;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.analyze;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

/** Check that copy statement produce correct ranges */
class CopyNodeRangeTest {
  private static final String TEXT =
      "       Identification Division.\n"
          + "       Program-Id. 'P1'.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01 FOO PIC 9.\n"
          + "       COPY SQLCA.\n"
          + "       Procedure Division.\n"
          + "       Mainline Section.\n"
          + "           MOVE 6 to FOO.";

  @Test
  void test() {
    AnalysisResult result = analyze(UseCase.builder().text(TEXT).build());
    Position fooUsage = new Position(8, 23);
    Node usageNode =
        RangeUtils.findNodeByPosition(result.getRootNode(), DOCUMENT_URI, fooUsage).orElse(null);
    assertNotNull(usageNode);
    assertEquals(NodeType.VARIABLE_USAGE, usageNode.getNodeType());
    assertEquals("FOO", ((VariableUsageNode) usageNode).getName());
  }
}
