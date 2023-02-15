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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Test if variable usage position tracked correctly with line concatenation. */
class TestLineContinuationForVariable {
  private static final String TEXT = "000100 IDENTIFICATION DIVISION. \n"
          + "000200 PROGRAM-ID.                                                      \n"
      + "000300     NC201A.                                                      \n"
      + "002800 ENVIRONMENT DIVISION.                                            \n"
      + "002900 CONFIGURATION SECTION.                                           \n"
      + "003800 DATA DIVISION.                                                   \n"
      + "004300 WORKING-STORAGE SECTION.                                         \n"
      + "018100 01  {$*IF-D36}  PICTURE X(120) VALUE IS    \"ABCDEFGHIJKLMNOPQRSTUVWXY\n"
      + "018200-    \"Z1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLM\n"
      + "018300-    \"NOPQRSTUVWXYZ1234567890ABCDEFGHIJKL\".                     \n"
      + "018400 01  {$*IF-D40} PICTURE 9(5) VALUE 12345                          \n"
      + "018500              COMPUTATIONAL SYNCHRONIZED RIGHT.                   \n"
      + "018600     88 {$*IF-D40A} VALUE ZERO THRU 10000.                            \n"
      + "018700     88 {$*IF-D40B} VALUE 10001 THRU 99999.                           \n"
      + "018800     88 {$*IF-D40C} VALUE 99999.                                      \n"
      + "048600 PROCEDURE DIVISION.                                              \n"
      + "048700 {@*CCVS1} SECTION.                                                   \n";

  @Test
  void test() {
    AnalysisResult result = UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
    List<ElementaryItemNode> variables = result.getRootNode().getDepthFirstStream()
        .filter(node -> node instanceof ElementaryItemNode)
        .map(ElementaryItemNode.class::cast)
        .collect(Collectors.toList());

    Optional<ElementaryItemNode> variable = variables.stream().filter(v -> v.getName().equals("IF-D36")).findFirst();

    assertEquals(2, variables.size());
    assertTrue(variable.isPresent());

    Range range = variable.get().getLocality().getRange();
    assertEquals(new Range(new Position(7, 7), new Position(9, 49)), range);
  }
}
