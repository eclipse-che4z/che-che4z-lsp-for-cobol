/*
 * Copyright (c) 2020 Broadcom.
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
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.stream.Collectors;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks that performing defined section processed with correct section range */
class TestSectionRange {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. TEST1.\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          PROCEDURE DIVISION.\n"
          + "            PERFORM {@GET-DATA}.\n"
          + "            STOP RUN.\n"
          + "          {@*GET-DATA} SECTION.\n"
          + "            DISPLAY \"\".\n"
          + "            DISPLAY \"\".\n"
          + "            DISPLAY \"\".";

  @Test
  void test() {
    AnalysisResult analysisResult =
        UseCaseEngine.runTest(
            TEXT,
            ImmutableList.of(),
            ImmutableMap.of(),
            ImmutableList.of(),
            AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
    List<Node> sections =
        analysisResult
            .getRootNode()
            .getDepthFirstStream()
            .filter(it -> it.getNodeType().equals(NodeType.PROCEDURE_SECTION))
            .collect(Collectors.toList());
    assertThat(sections.size(), equalTo(1));

    Location location = sections.get(0).getLocality().toLocation();
    assertEquals(new Position(7, 10), location.getRange().getStart());
    assertEquals(new Position(10, 23), location.getRange().getEnd());
  }
}
