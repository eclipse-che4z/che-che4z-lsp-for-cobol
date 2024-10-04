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
package org.eclipse.lsp.cobol.dialects.ibm;

import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import java.util.List;
import java.util.Optional;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.LineIndicatorProcessor;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/** Testing that the cobol lines formatted correctly before being used for token analysis */
class CobolLineIndicatorProcessorImplTest {

  private static final String EMPTY_STRING = "";
  private final CodeLayoutStore store = mock(CodeLayoutStore.class);

  @BeforeEach
  void setup() {
    when(store.getCodeLayout()).thenReturn(Optional.empty());
  }

  /** Testing Debug lines preformatting for Token analysis */
  @Test
  void debugLineTest() {
    CobolLine debugLine = new CobolLine();
    debugLine.setType(DEBUG);
    debugLine.setIndicatorArea(ProcessingConstants.WS);
    debugLine.setContentAreaA("    ");
    debugLine.setContentAreaB("     DEBUG LINE HERE      ");

    LineIndicatorProcessor processor = new IbmCobolLineIndicatorProcessor(store);
    List<CobolLine> outcome = processor.processLines(ImmutableList.of(debugLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "         DEBUG LINE HERE",
        actual.getIndicatorArea() + actual.getContentArea());
  }


  /** Testing normal lines pre-formatting for Token analysis */
  @Test
  void normalLineTest() {
    CobolLine normalLine = new CobolLine();
    normalLine.setType(NORMAL);
    normalLine.setIndicatorArea(ProcessingConstants.WS);
    normalLine.setContentAreaA("    ");
    normalLine.setContentAreaB("         RANDOM TEXT ,  ");

    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(store);

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(normalLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "             RANDOM TEXT , ",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  @Test
  void normalLineTest_whenCodeLayoutIsDifferent_thenProcessingHappensAsPerLayout() {
    CobolLine normalLine = new CobolLine();
    normalLine.setType(NORMAL);
    normalLine.setIndicatorArea(ProcessingConstants.WS);
    normalLine.setContentAreaA("  ");
    normalLine.setContentAreaB("   RANDOM TEXT ,  ");
    LineIndicatorProcessor processor = new IbmCobolLineIndicatorProcessor(store);

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(normalLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "     RANDOM TEXT , ",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing Compiler Directive lines pre-formatting for Token analysis */
  @Test
  void compilerDirectiveTest() {
    CobolLine compilerDirectiveLine = new CobolLine();
    compilerDirectiveLine.setType(COMPILER_DIRECTIVE);
    compilerDirectiveLine.setIndicatorArea(ProcessingConstants.WS);
    compilerDirectiveLine.setContentAreaA("    ");
    compilerDirectiveLine.setContentAreaB("DEFINE");

    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(store);
    List<CobolLine> outcome = processor.processLines(ImmutableList.of(compilerDirectiveLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + EMPTY_STRING, actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing comment lines pre-formatting for Token analysis */
  @Test
  void commentLineTest() {
    CobolLine commentLine = new CobolLine();
    commentLine.setType(COMMENT);
    commentLine.setIndicatorArea("*");
    commentLine.setContentAreaA("    ");
    commentLine.setContentAreaB("THIS IS A COMMENT        ");

    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(commentLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + EMPTY_STRING, actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing floating comment lines pre-formatting for Token analysis */
  @Test
  void floatingCommentLineTest() {
    CobolLine commentLine = new CobolLine();
    commentLine.setType(NORMAL);
    commentLine.setIndicatorArea(ProcessingConstants.WS);
    commentLine.setContentAreaA("PROGRAM-ID. comments  *> Floating");
    commentLine.setContentAreaB(" comment");

    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(commentLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "PROGRAM-ID. comments  ",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing normal continuation line pre-formatting for Token analysis */
  @Test
  void continuationLineTest() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaA("    ");
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    CobolLine middleContinuationLine = new CobolLine();
    middleContinuationLine.setType(CONTINUATION);
    middleContinuationLine.setIndicatorArea("-");
    middleContinuationLine.setContentAreaA("    ");
    middleContinuationLine.setContentAreaB("        \"RANDOM TEXT   ");

    CobolLine lastContinuationLine = new CobolLine();
    lastContinuationLine.setType(CONTINUATION);
    lastContinuationLine.setIndicatorArea("-");
    lastContinuationLine.setContentAreaA("    ");
    lastContinuationLine.setContentAreaB("        \"CONTINUED LINE ENDS HERE\"     ");

    startContinuationLine.setSuccessor(middleContinuationLine);
    middleContinuationLine.setSuccessor(lastContinuationLine);

    List<CobolLine> listOfLines =
        ImmutableList.of(startContinuationLine, middleContinuationLine, lastContinuationLine);
    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);
    List<CobolLine> outcomeList = processor.processLines(listOfLines);

    assertEquals(
        ProcessingConstants.WS + "           \"RANDOM TEXT   ",
        outcomeList.get(0).getIndicatorArea() + outcomeList.get(0).getContentArea());
    assertEquals("        \"RANDOM TEXT   ", outcomeList.get(1).getContentAreaB());
    assertEquals("        \"CONTINUED LINE ENDS HERE\"", outcomeList.get(2).getContentAreaB());
  }

  /** Testing empty continuation line pre-formatting for Token analysis */
  @Test
  void emptyContinuationLine() {
    CobolLine continuationLine = new CobolLine();
    continuationLine.setType(NORMAL);
    continuationLine.setIndicatorArea(ProcessingConstants.WS);
    continuationLine.setContentAreaA("    ");
    continuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    CobolLine emptyContinuationLine = new CobolLine();
    emptyContinuationLine.setType(CONTINUATION);
    emptyContinuationLine.setIndicatorArea("-");
    emptyContinuationLine.setContentAreaA("    ");
    emptyContinuationLine.setContentAreaB("           ");

    continuationLine.setSuccessor(emptyContinuationLine);

    final List<CobolLine> listOfLines = ImmutableList.of(continuationLine, emptyContinuationLine);
    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);
    List<CobolLine> outcomeList = processor.processLines(listOfLines);

    assertEquals(
        ProcessingConstants.WS + "           \"RANDOM TEXT   ",
        outcomeList.get(0).getIndicatorArea() + outcomeList.get(0).getContentArea());
    assertEquals(
        ProcessingConstants.WS + EMPTY_STRING,
        outcomeList.get(1).getIndicatorArea() + outcomeList.get(1).getContentArea());
  }

  /** Testing continuation lines with trailing comma pre-formatting for Token analysis */
  @Test
  void trailingCommaContinuationLineTest() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaA("    ");
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    CobolLine trailingCommaContinuationLine = new CobolLine();
    trailingCommaContinuationLine.setType(CONTINUATION);
    trailingCommaContinuationLine.setIndicatorArea("-");
    trailingCommaContinuationLine.setContentAreaA("    ");
    trailingCommaContinuationLine.setContentAreaB("         ,");

    startContinuationLine.setSuccessor(trailingCommaContinuationLine);
    trailingCommaContinuationLine.setPredecessor(startContinuationLine);

    List<CobolLine> listOfLines =
        ImmutableList.of(startContinuationLine, trailingCommaContinuationLine);
    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);
    List<CobolLine> outcomeList = processor.processLines(listOfLines);

    assertEquals(
        ProcessingConstants.WS + "           \"RANDOM TEXT   ",
        outcomeList.get(0).getIndicatorArea() + outcomeList.get(0).getContentArea());
    assertEquals(
        ProcessingConstants.WS + "             ," + ProcessingConstants.WS,
        outcomeList.get(1).getIndicatorArea() + outcomeList.get(1).getContentArea());
  }

  /**
   * Testing a continuation line with no quotes at the start of the line pre-formatting for Token
   * analysis
   */
  @Test
  void continuationLineWithoutBeginningQuotes() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    CobolLine quoteContinuationLine = new CobolLine();
    quoteContinuationLine.setType(CONTINUATION);
    quoteContinuationLine.setIndicatorArea("-");
    quoteContinuationLine.setContentAreaA("    ");
    quoteContinuationLine.setContentAreaB("          \"RANDOM TEXT SINGLE CONTINUATION LINE\"");

    CobolLine lastContinuationLine = new CobolLine();
    lastContinuationLine.setType(CONTINUATION);
    lastContinuationLine.setIndicatorArea("-");
    lastContinuationLine.setContentAreaA("    ");
    lastContinuationLine.setContentAreaB("          RANDOM TEXT SINGLE CONTINUATION LINE\"");

    startContinuationLine.setSuccessor(quoteContinuationLine);
    quoteContinuationLine.setSuccessor(lastContinuationLine);

    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(lastContinuationLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "RANDOM TEXT SINGLE CONTINUATION LINE\"",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  /**
   * Testing a continuation line with quotes at the start and end of the line pre-formatting for
   * Token analysis
   */
  @Test
  void continuationLineWithOuterQuotes() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    CobolLine quoteContinuationLine = new CobolLine();
    quoteContinuationLine.setType(CONTINUATION);
    quoteContinuationLine.setIndicatorArea("-");
    quoteContinuationLine.setContentAreaA("    ");
    quoteContinuationLine.setContentAreaB("          \"RANDOM TEXT SINGLE CONTINUATION LINE\"");

    CobolLine lastContinuationLine = new CobolLine();
    lastContinuationLine.setType(CONTINUATION);
    lastContinuationLine.setIndicatorArea("-");
    lastContinuationLine.setContentAreaA("    ");
    lastContinuationLine.setContentAreaB("          \"RANDOM TEXT SINGLE CONTINUATION LINE\"");

    startContinuationLine.setSuccessor(quoteContinuationLine);
    quoteContinuationLine.setSuccessor(lastContinuationLine);

    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(lastContinuationLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "RANDOM TEXT SINGLE CONTINUATION LINE\"",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  /**
   * Test no {@link StringIndexOutOfBoundsException} thrown if the parsing line not formatted and
   * contains '-' in the indicator area.
   */
  @Test
  void noExceptionOnNotFormattedLine() {
    CobolLine notFormattedLine = new CobolLine();
    notFormattedLine.setContentAreaA("END.");
    notFormattedLine.setIndicatorArea("-");
    notFormattedLine.setSequenceArea(" P-ADD");
    notFormattedLine.setType(CONTINUATION);

    LineIndicatorProcessor processor =
        new IbmCobolLineIndicatorProcessor(null);
    List<CobolLine> outcome = processor.processLines(ImmutableList.of(notFormattedLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "END.", actual.getIndicatorArea() + actual.getContentArea());
  }
}
