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
package org.eclipse.lsp.cobol.service.delegates.formations;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.eclipse.lsp4j.TextEdit;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for CapitalFormation
 */
class CapitalFormationTest {
  private static final String TEXT =
            "      *  commented line \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID.xML5.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-storage SECTION.\n"
          + " \n"
          + "       01  {$*REQUEST}.\n"
          + "           06 {$*ROUTE}.\n"
          + "AaAaAa         11 {$*NAME}                  PIC  X(030).                    BbBbBb\n"
          + "               11 {$*VERSION}               PIC  9(004).\n"
          + "           06 {$*QUESTION}.\n"
          + "               11 {$*IDENT}                 PIC  9(009).\n"
          + "               11 {$*XMLFILENAME}           PIC  X(006).\n"
          + "               11 {$*XMLFILEINH}            PIC  X(5000).\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {@*MAINLINE} section.\n"
          + "           MOVE 'serviceRequest' to {$NAME}\n"
          + "           move 1                TO {$VERSION}\n"
          + "           move 111111111        TO {$IDENT}\n"
          + "           move 'FILE-1'         TO {$XMLFILENAME}\n"
          + "           move '<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelop\n"
          + "      -          'e.....<SOAP-ENV:Envelope>' to {$XMLFILEINH}\n"
          + "       \n";
  @Test
  void WhenFormatIsCalledWithNullParam_thenIllegalArgumentException() {
    CapitalFormation formation = new CapitalFormation();
    Assertions.assertThrows(IllegalArgumentException.class, () -> formation.format(null, ImmutableList.of()));
  }

  @Test
  void whenFormatIsCalledEmptyListParam_thenGetEmptyCollection() {
    CapitalFormation formation = new CapitalFormation();
    List<CobolDocumentModel.Line> inputLines = new ArrayList<>();
    List<TextEdit> format = formation.format(inputLines, ImmutableList.of());
    assertEquals(0, format.size());
  }

  @Test
  void whenFormatIsCalledWithEmptyParams_thenGetEmptyCollection() {
    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", TEXT);
    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of());
    assertEquals(0, format.size());
  }

  @Test
  void whenFormatIsCalledWithUppercaseParamsNearLeftBorders_thenGetProperCollection() {
    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", " a    aaaAAA AAA  aaa");
    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));

    assertEquals(2, format.size());

    assertEquals("AA", format.get(0).getNewText());
    assertEquals(new Range(new Position(0, 7), new Position(0, 9)), format.get(0).getRange());

    assertEquals("AAA", format.get(1).getNewText());
    assertEquals(new Range(new Position(0, 18), new Position(0, 21)), format.get(1).getRange());
  }

  @Test
  void whenFormatIsCalledWithUppercaseParamsNearRightBorders_thenGetProperCollection() {
    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", "                                                                      aabb");
    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));

    assertEquals(1, format.size());

    assertEquals("AA", format.get(0).getNewText());
    assertEquals(new Range(new Position(0, 70), new Position(0, 72)), format.get(0).getRange());
  }

  @Test
  void whenFormatIsCalledWithUppercaseParamsNearLiteralVaruable_thenGetProperCollection() {
    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", "          aa'fhjhsdjh'bb");
    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));

    assertEquals(2, format.size());

    assertEquals("AA", format.get(0).getNewText());
    assertEquals(new Range(new Position(0, 10), new Position(0, 12)), format.get(0).getRange());

    assertEquals("BB", format.get(1).getNewText());
    assertEquals(new Range(new Position(0, 22), new Position(0, 24)), format.get(1).getRange());
  }

  @Test
  void whenFormatIsCalledForMultilineProgramId_thenGetProperCollection() {
    String text =
          "       IDENTIFICATION DIVISION.\n"
        + "       PROGRAM-id. \n"
        + "           xml5.\n"
        + "       data DIVISION.\n";

    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", text);

    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));
    assertEquals(2, format.size());

    assertEquals("ID", format.get(0).getNewText());
    assertEquals(new Range(new Position(1, 15), new Position(1, 17)), format.get(0).getRange());

    assertEquals("DATA", format.get(1).getNewText());
    assertEquals(new Range(new Position(3, 7), new Position(3, 11)), format.get(1).getRange());
  }

  @Test
  void whenFormatIsCalledForLiteralValue_thenGetProperCollection() {
    String text = "       DISPLAY '\"'. move A TO B";

    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", text);

    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));
    assertEquals(1, format.size());

    assertEquals("MOVE", format.get(0).getNewText());
    assertEquals(new Range(new Position(0, 20), new Position(0, 24)), format.get(0).getRange());
  }

  @Test
  void whenFormatIsCalledWithUppercaseParams_thenGetProperCollection() {
    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", TEXT);
    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));
    assertEquals(8, format.size());
  }

  @Test
  void whenFormatIsCalledWithUppercaseParamsForInlineComment_thenGetProperCollection() {
    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", "       *>aAA AAA  aaa");
    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));

    assertEquals(0, format.size());
  }

  @Test
  void whenFormatIsCalledWithUppercaseParamsForInlineCommentInTheMiddle_thenGetProperCollection() {
    CapitalFormation formation = new CapitalFormation();
    CobolDocumentModel model = new CobolDocumentModel("", "       aa*>aAA AAA  aaa");
    List<TextEdit> format = formation.format(model.getLines(), ImmutableList.of(CapitalFormation.UPPERCASE));

    assertEquals(1, format.size());

    assertEquals("AA", format.get(0).getNewText());
    assertEquals(new Range(new Position(0, 7), new Position(0, 9)), format.get(0).getRange());
  }
}
