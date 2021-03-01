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

package org.eclipse.lsp.cobol.service.delegates.formations;

import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import lombok.NonNull;
import org.eclipse.lsp4j.TextEdit;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test {@link TrimFormation}
 */
class TrimFormationTest {
  private static final String TEXT =
      "A sample text line-0 \r\n"
          + "A sample text line-1\r\n"
          + "A sample text line-2 \t               \r\n"
          + "A sample text line-3 \r\n"
          + "A sample text line-4   ";

  @Test
  void WhenFormatIsCalledWithNullParam_thenIllegalArgumentException() {
    TrimFormation trimFormation = new TrimFormation();
    Assertions.assertThrows(IllegalArgumentException.class, () -> trimFormation.format(null));
  }

  @Test
  void whenFormatIsCalledEmptyListParam_thenGetEmptyCollection() {
    TrimFormation trimFormation = new TrimFormation();
    @NonNull List<CobolDocumentModel.Line> inputLines = new ArrayList<>();
    List<TextEdit> format = trimFormation.format(inputLines);
    assertEquals(0, format.size());
  }

  @Test
  void whenFormatIsCalledValidListParam_thenGetTextLines() {
    TrimFormation trimFormation = new TrimFormation();
    CobolDocumentModel model = new CobolDocumentModel(TEXT);
    List<CobolDocumentModel.Line> lines = model.getLines();
    List<TextEdit> format = trimFormation.format(lines);
    assertEquals(5, format.size());
    for (int i = 0; i < format.size(); i++) {
      assertEquals("A sample text line-" + i, format.get(i).getNewText());
      assertEquals(
          lines.get(i).getText().length(), format.get(i).getRange().getEnd().getCharacter());
      assertEquals(0, format.get(i).getRange().getStart().getCharacter());
    }
  }
}
