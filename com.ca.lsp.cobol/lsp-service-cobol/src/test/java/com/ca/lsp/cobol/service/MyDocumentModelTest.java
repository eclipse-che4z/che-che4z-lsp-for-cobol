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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

public class MyDocumentModelTest {
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

  private MyDocumentModel model;

  @BeforeEach
  public void createModel() {
    model = new MyDocumentModel(TEXT, AnalysisResult.empty());
  }

  @Test
  public void testGetText() {
    assertEquals(TEXT, model.getText());
  }

  @Test
  public void testGetResolvedRoutes() {
    assertEquals(LINES_NUMBER, model.getLines().size());
  }

  @Test
  public void testGetFirstRoute() {
    assertEquals(retrieveFirstTextLine(), model.getLine(0).getText());
  }

  @Test
  public void testGetSecondRoute() {
    assertEquals(retrieveSecondTextLine(), model.getLine(1).getText());
  }

  @Test
  public void testGetNoLines() {
    assertNull(model.getLine(-1));
  }

  @Test
  public void testGetResolvedLines() {
    assertEquals(LINES_NUMBER, model.getLines().size());
  }

  @Test
  public void testGetTokenEmptyPosition() {
    Position pos = new Position();
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  public void testGetTokenInvalidPosition() {
    Position pos = new Position(-1, -1);
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  public void testGetTokenInvalidPositionWithCorrectLine() {
    Position pos = new Position(3, -19);
    assertEquals("", model.getFullTokenAtPosition(pos));
  }

  @Test
  public void testPositionAtDelimiter() {
    Position pos = new Position(1, 19);
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  public void testGetTokenInvalid() {
    Position pos = new Position(0, -1);
    assertEquals("", model.getTokenBeforePosition(pos));
  }

  @Test
  public void testTokenRetrieving() {
    MyDocumentModel model = new MyDocumentModel("a bc\r\nde", AnalysisResult.empty());
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
