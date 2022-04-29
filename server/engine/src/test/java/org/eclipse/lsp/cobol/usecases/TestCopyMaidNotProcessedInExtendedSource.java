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

import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.junit.jupiter.api.Test;

import static java.util.stream.Collectors.groupingBy;
import static org.eclipse.lsp.cobol.core.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.COPY;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.DISABLED;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** COPY MAID processing should follow usual disabling rules */
class TestCopyMaidNotProcessedInExtendedSource {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 COPY MAID PMOREC.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           COPY MAID PMOREC.";

  @Test
  void test() {
    final AnalysisResult res =
        UseCaseUtils.analyze(UseCase.builder().text(TEXT).copybookProcessingMode(DISABLED).build());
    assertTrue(res.getDiagnostics().get(DOCUMENT_URI).isEmpty());
    assertTrue(
        res.getRootNode()
            .getDepthFirstStream()
            .filter(hasType(COPY))
            .map(CopyNode.class::cast)
            .filter(it -> !it.getUsages().isEmpty())
            .collect(groupingBy(CopyNode::getName))
            .keySet()
            .isEmpty());
  }
}
