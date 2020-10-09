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
package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

class CobolDocumentModelTest {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        PROCEDURE DIVISION.\r\n"
          + "           PERFORM VARYING A FROM 10 BY 10 UNTIL A > 40\r\n"
          + "               PERFORM VARYING b FROM 1 BY 1 UNTIL B > 4\r\n"
          + "               END-PERFORM\r\n"
          + "            END-PERFORM.\r\n"
          + "            STOP RUN.";

  private static final int LINES_NUMBER = 10;

  private CobolDocumentModel model;

  @BeforeEach
  void createModel() {
    model = new CobolDocumentModel(TEXT, AnalysisResult.empty());
  }

  @Test
  void testGetText() {
    assertEquals(TEXT, model.getText());
  }

  @Test
  void testGetResolvedRoutes() {
    assertEquals(LINES_NUMBER, model.getLines().size());
  }

  @Test
  void testGetFirstRoute() {
    assertEquals(retrieveFirstTextLine(), model.getLine(0).getText());
  }

  @Test
  void testGetSecondRoute() {
    assertEquals(retrieveSecondTextLine(), model.getLine(1).getText());
  }

  @Test
  void testGetNoLines() {
    assertNull(model.getLine(-1));
  }

  @Test
  void testGetResolvedLines() {
    assertEquals(LINES_NUMBER, model.getLines().size());
  }

  @Test
  void testGetTokenEmptyPosition() {
    Position pos = new Position();
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  void testGetTokenInvalidPosition() {
    Position pos = new Position(-1, -1);
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  void testGetTokenInvalidPositionWithCorrectLine() {
    Position pos = new Position(3, -19);
    assertEquals("", model.getFullTokenAtPosition(pos));
  }

  @Test
  void testPositionAtDelimiter() {
    Position pos = new Position(1, 19);
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  void testGetTokenInvalid() {
    Position pos = new Position(0, -1);
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  void testTokenRetrieving() {
    CobolDocumentModel model = new CobolDocumentModel("a bc\r\nde", AnalysisResult.empty());
    assertEquals("", model.getTokenBeforePosition(new Position(0, 0)));
    assertEquals("a", model.getTokenBeforePosition(new Position(0, 1)));
    assertEquals("bc", model.getTokenBeforePosition(new Position(0, 4)));
    assertEquals("d", model.getTokenBeforePosition(new Position(1, 1)));
    assertEquals("de", model.getTokenBeforePosition(new Position(1, 2)));
  }

  private String retrieveFirstTextLine() {
    return TEXT.substring(0, getFirstLineBreak());
  }

  private String retrieveSecondTextLine() {
    int firstLineLength = getFirstLineBreak() + 2;
    return TEXT.substring(firstLineLength, TEXT.indexOf("\r\n", firstLineLength));
  }

  private int getFirstLineBreak() {
    return TEXT.indexOf("\r\n");
  }
}
