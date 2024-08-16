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
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Objects;
import java.util.stream.Collectors;

/** Test CopyNode position in AST when it contains CICS or SQL statements */
public class TestCopynodeInsertionAtCorrectPlaceInAST {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.    CBACT01C.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01 {$*SOME-VAR} pic x.\n"
          + "       01 {$*SOME_VAR_2} pic x.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           IF {$SOME-VAR} > {$SOME_VAR_2} "
          + "             PERFORM {#HANDLE-ABEND}\n"
          + "             COPY {~COPY1}.\n"
          + "             DISPLAY '1'\n"
          + "           END-IF.\n"
          + "       {#*HANDLE-ABEND}.";

  public static final String COPYBOOK_CONTENT =
      "             EXEC CICS HANDLE ABEND LABEL({#HANDLE-ABEND}) END-EXEC";

  @Test
  void test() {
    AnalysisResult result =
        UseCaseEngine.runTest(
            TEXT, ImmutableList.of(new CobolText("COPY1", COPYBOOK_CONTENT)), ImmutableMap.of());

    String astFlatStructure =
        result
            .getRootNode()
            .getDepthFirstStream()
            .map(Node::getNodeType)
            .map(Objects::toString)
            .collect(Collectors.joining("-->"));
    Assertions.assertTrue(
        astFlatStructure.matches(".*SENTENCE-->IF-->.*?-->PERFORM-->.*?-->COPY-->STATEMENT.*"));
  }
}
