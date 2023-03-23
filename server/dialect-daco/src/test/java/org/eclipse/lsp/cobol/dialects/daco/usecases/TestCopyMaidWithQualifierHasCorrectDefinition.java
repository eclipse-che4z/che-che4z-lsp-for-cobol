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
package org.eclipse.lsp.cobol.dialects.daco.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.dialects.daco.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp.cobol.dialects.daco.utils.Fixtures;
import org.eclipse.lsp4j.Diagnostic;
import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.Test;

import static java.util.stream.Collectors.toList;

/** COPY MAID copybook definitions should have correct URIs */
class TestCopyMaidWithQualifierHasCorrectDefinition {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    TEST.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 COPY MAID {~BHTRGL!DaCo`BHTRGL_ABC} ABC.\n"
          + "       01 COPY MAID {~BHTRGL!DaCo`BHTRGL}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           DISPLAY {$BHTRGL1}.\n"
          + "           DISPLAY {$BHTRGL2}.";

  private static final String BHTRGL = "1        01 {$*BHTRGL1} PIC X.\n";
  private static final String BHTRGL_ABC = "1        01 {$*BHTRGL2} PIC X.\n";

  @Test
  void test() {
    CobolText idmsCopybook = Fixtures.subschemaCopy("");
    ImmutableList<CobolText> copybooks = ImmutableList.of(
            new CobolText("BHTRGL", DaCoDialect.NAME, BHTRGL),
            new CobolText("BHTRGL_ABC", DaCoDialect.NAME, BHTRGL_ABC),
            idmsCopybook
    );
    ImmutableMap<String, Diagnostic> diagnostics = ImmutableMap.of();
    MatcherAssert.assertThat(
        UseCaseEngine.runTestForDiagnostics(TEXT, copybooks, diagnostics, ImmutableList.of(),
                        DialectConfigs.getDaCoAnalysisConfig())
            .getRootNode()
            .getDepthFirstStream()
            .filter(it -> it.getNodeType() == NodeType.COPY)
            .map(CopyNode.class::cast)
            .map(CopyNode::getUri)
            .collect(toList()),
        Matchers.containsInAnyOrder(UseCaseUtils.toURI("BHTRGL", "DaCo"),
            UseCaseUtils.toURI("BHTRGL_ABC", "DaCo"),
            UseCaseUtils.toURI(idmsCopybook.getFileName(), IdmsDialect.NAME)));
  }
}
