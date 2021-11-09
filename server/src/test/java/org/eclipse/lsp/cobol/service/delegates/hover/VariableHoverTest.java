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
package org.eclipse.lsp.cobol.service.delegates.hover;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.*;

/** Test {@link VariableHover} */
class VariableHoverTest {
  private final VariableHover variableHover = new VariableHover();
  private static final String HEADER =
      "       Identification Division.\n"
          + "       Program-id. TEST.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n";

  private static final String FULL_TEXT = HEADER
      + "       01 {$*TEST} PIC 9.\n"
      + "       01 {$*TOP}.\n"
      + "           05 {$*MIDDLE-1}.\n"
      + "           10 {$*LEAF-1} PIC 9.\n"
      + "           05 {$*MIDDLE-2}.\n"
      + "           10 {$*LEAF-2} PIC 9.\n"
      + "           88 {$*COND-ITEM1} VALUE 0.\n"
      + "           88 {$*COND-ITEM2} VALUES 1 THRU 3\n"
      + "                                4 THROUGH 5.";

  @Test
  void getHoverForNullDocument() {
    assertNull(variableHover.getHover(null, getPosition(5, 5)));
  }

  @Test
  void getHoverForNoVariablesInModel() {
    assertNull(variableHover.getHover(getModel(HEADER), getPosition(5, 5)));
  }

  @Test
  void getHoverForPositionOutsideOfVariable() {
    assertNull(variableHover.getHover(getModel(FULL_TEXT), getPosition(4, 5)));
  }

  @Test
  void getHoverForOneVariable() {
    Hover hover = variableHover.getHover(getModel(FULL_TEXT), getPosition(4, 12));
    assertNotNull(hover);
    MarkedString markedString = hover.getContents().getLeft().get(0).getRight();
    assertEquals("cobol", markedString.getLanguage());
    assertEquals("01 TEST PIC 9.", markedString.getValue());
  }

  @Test
  void getHoverForStructure() {
    String result =
        "01 TOP.\n"
            + "  05 MIDDLE-2.\n"
            + "    10 LEAF-2 PIC 9.\n"
            + "      88 COND-ITEM1 VALUE 0.\n"
            + "      88 COND-ITEM2 VALUES 1 THRU 3\n"
            + "                           4 THROUGH 5.";

    Hover hover = variableHover.getHover(getModel(FULL_TEXT), getPosition(8, 16));
    assertNotNull(hover);
    MarkedString markedString = hover.getContents().getLeft().get(0).getRight();
    assertEquals("cobol", markedString.getLanguage());
    assertEquals(result, markedString.getValue());
  }

  private CobolDocumentModel getModel(String text) {
    return new CobolDocumentModel(text, UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of()));
  }

  private TextDocumentPositionParams getPosition(int line, int character) {
    return new TextDocumentPositionParams(new TextDocumentIdentifier(DOCUMENT_URI), new Position(line, character));
  }
}
