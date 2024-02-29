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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.impl;

import static java.util.stream.IntStream.range;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.hasToString;

import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.core.AbstractCobolLinePreprocessorTest;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * This test checks the line preprocessing logic. Notice, that if there are less than 6 symbols in a
 * line, one space will be added during the preprocessing as a default indicator. All the symbols
 * after 80 should be removed, and the new syntax error should be registered.
 */
class CobolLineReaderImplTest extends AbstractCobolLinePreprocessorTest {

  @Test
  void testAllIndicators() {
    List<String> lines = createTextToTest();
    String text = reduceLines(lines);

    ResultWithErrors<List<CobolLine>> processed = processText(text);

    assertThat(processed.getResult(), hasSize(lines.size()));
    range(0, lines.size())
        .forEach(i -> assertThat(processed.getResult().get(i), hasToString(lines.get(i))));

    assertThat(processed.getErrors(), hasSize(1));

    SyntaxError error = processed.getErrors().get(0);
    assertThat(
        error.getLocation().getLocation().getRange(),
        is(new Range(new Position(10, 6), new Position(10, 7))));
  }

  @Test
  void testAllIndicatorsForNoSequenceLayout() {
    List<String> lines = creatTextWithNoSequenceArea();
    String text = reduceLines(lines);

    ResultWithErrors<List<CobolLine>> processed = processTextWithNoSequenceArea(text);

    assertThat(processed.getResult(), hasSize(lines.size()));
    range(0, lines.size())
            .forEach(i -> assertThat(processed.getResult().get(i), hasToString(lines.get(i))));

    assertThat(processed.getErrors(), hasSize(1));

    SyntaxError error = processed.getErrors().get(0);
    assertThat(
            error.getLocation().getLocation().getRange(),
            is(new Range(new Position(10, 0), new Position(10, 1))));
  }

  /** Empty string should not be processed. */
  @Test
  void testEmptyLine() {
    ResultWithErrors<List<CobolLine>> processed = processText("");
    assertThat(processed.getResult(), hasSize(0));
    assertThat(processed.getErrors(), hasSize(0));
  }

  @Test
  void testTooShortString() {
    ResultWithErrors<List<CobolLine>> processed = processText("abc");
    assertThat(processed.getResult().get(0), hasToString("abc"));
    assertThat(processed.getErrors(), hasSize(0));
  }

  @Test
  void testOneSpace() {
    ResultWithErrors<List<CobolLine>> processed = processText(" ");
    assertThat(processed.getResult().get(0), hasToString(" "));
    assertThat(processed.getErrors(), hasSize(0));
  }

  @Test
  void testNoSpacesAddedIfIndicatorFieldFilled() {
    String eightSpaces = "        ";
    ResultWithErrors<List<CobolLine>> processed = processText(eightSpaces);
    assertThat(processed.getResult().get(0), hasToString(eightSpaces));

    assertThat(processed.getErrors(), hasSize(0));
  }

  @Test
  void testSkipEmptyLineAtEnd() {
    String firstLine =
        "000000 IDENTIFICATION DIVISION.                                         23323232";
    List<String> lines = Lists.newArrayList(firstLine, "");

    ResultWithErrors<List<CobolLine>> processed = processText(reduceLines(lines));

    assertThat(processed.getResult(), hasSize(1));
    assertThat(processed.getResult().get(0), hasToString(firstLine));
  }

  @Test
  void testEmptyLineAtMiddle() {
    List<String> lines = new ArrayList<>();
    lines.add("000000 IDENTIFICATION DIVISION.                                         23323232");
    lines.add("");
    lines.add("000010 PROGRAM-ID. test1.                                               23323232");

    ResultWithErrors<List<CobolLine>> processed = processText(reduceLines(lines));

    assertThat(processed.getResult().size(), is(3));
    assertThat(processed.getResult().get(1), hasToString(""));

    assertThat(processed.getErrors(), hasSize(0));
  }

  @Test
  void testTooLongStringIsCut() {
    String tooLongString =
        "000000 IDENTIFICATION DIVISION.                                         23323232extra";
    String cutString =
        "000000 IDENTIFICATION DIVISION.                                         23323232";
    ResultWithErrors<List<CobolLine>> processed = processText(tooLongString);
    assertThat(processed.getResult().get(0), hasToString(cutString));

    assertThat(processed.getErrors(), hasSize(1));
    SyntaxError error = processed.getErrors().get(0);
    assertThat(error.getLocation().getLocation().getRange().getStart().getCharacter(), is(80));
  }

  // END @Test methods

  private List<String> createTextToTest() {
    List<String> lines = new ArrayList<>();
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

  private List<String> creatTextWithNoSequenceArea() {
    List<String> lines = new ArrayList<>();
    lines.add(" IDENTIFICATION DIVISION.                                         23323232");
    lines.add(" PROGRAM-ID. test1.                                               23323232");
    lines.add("* AUTHOR. .                                                       23323232");
    lines.add("dINSTALLATION. where.                                             dsfsd");
    lines.add("/DATE-WRITTEN. 07/02/2019.                                        qqwe");
    lines.add(" DATE-COMPILED.07/02/2019.                                        1111");
    lines.add("DSECURITY.                                                        15  1");
    lines.add("-    ENVIRONMENT DIVISION.");
    lines.add(" CONFIGURATION SECTION.                                           22221112");
    lines.add("$SOURCE-COMPUTER. pc.");
    lines.add("pSOURCE-COMPUTER. pc.");
    return lines;
  }
}
