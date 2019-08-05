/*
 * Copyright (c) 2019 Broadcom.
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
package com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.ca.lsp.core.cobol.AbstractCobolLinePreprocessorTest;
import com.ca.lsp.core.cobol.parser.error.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;

/**
 * This test checks the line preprocessing logic. Notice, that if there are less than 6 symbols in a
 * line, one space will be added during the preprocessing as a default indicator. All the symbols
 * after 80 should be removed and the new syntax error should be registered.
 *
 * @author teman02
 */
public class CobolLineReaderImplTest extends AbstractCobolLinePreprocessorTest {

  @Before
  public void eraseListener() {
    super.eraseListener();
  }

  @Test
  public void testAllIndicators() {
    List<String> lines = createTextToTest();
    String text = reduceLines(lines);

    List<CobolLine> processed = processText(text);

    assertEquals(lines.size(), processed.size());
    for (int i = 0; i < lines.size(); i++) {
      assertEquals(lines.get(i), processed.get(i).toString());
    }

    assertEquals(1, listener.getErrorsPipe().size());

    SyntaxError syntaxError = listener.getErrorsPipe().get(0);
    assertEquals(6, syntaxError.getPosition().getStartPosition());
    assertEquals(11, syntaxError.getPosition().getLine());
  }

  /** Empty string should not be processed. */
  @Test
  public void testEmptyLine() {
    List<CobolLine> processed = processText("");
    assertEquals(0, processed.size());

    checkNoErrorsFound();
  }

  @Test
  public void testTooShortString() {
    List<CobolLine> processed = processText("abc");
    assertEquals("abc ", processed.get(0).toString());

    checkNoErrorsFound();
  }

  @Test
  public void testOneSpace() {
    List<CobolLine> processed = processText(" ");
    assertEquals("  ", processed.get(0).toString());

    checkNoErrorsFound();
  }

  @Test
  public void testNoSpacesAddedIfIndicatorFieldFilled() {
    String eightSpaces = "        ";
    List<CobolLine> processed = processText(eightSpaces);
    assertEquals(eightSpaces, processed.get(0).toString());

    checkNoErrorsFound();
  }

  @Test
  public void testSkipEmtyLineAtEnd() {
    String firstLine =
        "000000 IDENTIFICATION DIVISION.                                         23323232";
    List<String> lines = new ArrayList<String>();
    lines.add(firstLine);
    lines.add("");

    List<CobolLine> processed = processText(reduceLines(lines));

    assertEquals(1, processed.size());
    assertEquals(firstLine, processed.get(0).toString());

    checkNoErrorsFound();
  }

  @Test
  public void testEmtyLineAtMiddle() {
    List<String> lines = new ArrayList<String>();
    lines.add("000000 IDENTIFICATION DIVISION.                                         23323232");
    lines.add("");
    lines.add("000010 PROGRAM-ID. test1.                                               23323232");

    List<CobolLine> processed = processText(reduceLines(lines));

    assertEquals(3, processed.size());
    assertEquals(" ", processed.get(1).toString());

    checkNoErrorsFound();
  }

  @Test
  public void testTooLongStringIsCut() {
    String tooLongString =
        "000000 IDENTIFICATION DIVISION.                                         23323232extra";
    String cutString =
        "000000 IDENTIFICATION DIVISION.                                         23323232";
    List<CobolLine> processed = processText(tooLongString);
    assertEquals(cutString, processed.get(0).toString());

    assertEquals(1, listener.getErrorsPipe().size());
    SyntaxError syntaxError = listener.getErrorsPipe().get(0);
    assertEquals(80, syntaxError.getPosition().getStartPosition());
  }

  // END @Test methods

  private List<String> createTextToTest() {
    List<String> lines = new ArrayList<String>();
    lines.add("000000 IDENTIFICATION DIVISION.                                         23323232");
    lines.add("000010 PROGRAM-ID. test1.                                               23323232");
    lines.add("000020* AUTHOR. .                                                       23323232");
    lines.add("000030dINSTALLATION. where.                                             dsfsd");
    lines.add("000040/DATE-WRITTEN. 07/02/2019.                                        qqwe");
    lines.add("000050 DATE-COMPILED.07/02/2019.                                        1111");
    lines.add("000060DSECURITY.                                                        15  1");
    lines.add("000070-    ENVIRONMENT DIVISION.");
    lines.add("000080 CONFIGURATION SECTION.                                           22221112");
    lines.add("000090$SOURCE-COMPUTER. pc.");
    lines.add("000090pSOURCE-COMPUTER. pc.");
    return lines;
  }
}
