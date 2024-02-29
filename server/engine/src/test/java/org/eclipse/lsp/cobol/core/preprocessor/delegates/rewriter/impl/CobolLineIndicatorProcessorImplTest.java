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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.impl;

import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import java.util.List;
import lombok.val;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.junit.jupiter.api.Test;

/** Testing that the cobol lines formatted correctly before being used for token analysis */
class CobolLineIndicatorProcessorImplTest {

  private static final String EMPTY_STRING = "";

  /** Testing Debug lines preformatting for Token analysis */
  @Test
  void debugLineTest() {
    val debugLine = new CobolLine();
    debugLine.setType(DEBUG);
    debugLine.setIndicatorArea(ProcessingConstants.WS);
    debugLine.setContentAreaA("    ");
    debugLine.setContentAreaB("     DEBUG LINE HERE      ");

    CodeLayoutStore layoutStore = getMockLayoutStore();
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl(layoutStore);
    List<CobolLine> outcome = processor.processLines(ImmutableList.of(debugLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "         DEBUG LINE HERE",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  private CodeLayoutStore getMockLayoutStore() {
    CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
    when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout());
    return layoutStore;
  }

  /** Testing normal lines pre-formatting for Token analysis */
  @Test
  void normalLineTest() {
    val normalLine = new CobolLine();
    normalLine.setType(NORMAL);
    normalLine.setIndicatorArea(ProcessingConstants.WS);
    normalLine.setContentAreaA("    ");
    normalLine.setContentAreaB("         RANDOM TEXT ,  ");

    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(normalLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "             RANDOM TEXT , ",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  @Test
  void normalLineTest_whenCodeLayoutIsDifferent_thenProcessingHappensAsPerLayout() {
    val normalLine = new CobolLine();
    normalLine.setType(NORMAL);
    normalLine.setIndicatorArea(ProcessingConstants.WS);
    normalLine.setContentAreaA("  ");
    normalLine.setContentAreaB("   RANDOM TEXT ,  ");
    CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
    when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout(3, 1, 3, 40, 0));
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl(layoutStore);

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(normalLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "     RANDOM TEXT , ",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing Compiler Directive lines pre-formatting for Token analysis */
  @Test
  void compilerDirectiveTest() {
    val compilerDirectiveLine = new CobolLine();
    compilerDirectiveLine.setType(COMPILER_DIRECTIVE);
    compilerDirectiveLine.setIndicatorArea(ProcessingConstants.WS);
    compilerDirectiveLine.setContentAreaA("    ");
    compilerDirectiveLine.setContentAreaB("DEFINE");

    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());
    List<CobolLine> outcome = processor.processLines(ImmutableList.of(compilerDirectiveLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + EMPTY_STRING, actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing comment lines pre-formatting for Token analysis */
  @Test
  void commentLineTest() {
    val commentLine = new CobolLine();
    commentLine.setType(COMMENT);
    commentLine.setIndicatorArea("*");
    commentLine.setContentAreaA("    ");
    commentLine.setContentAreaB("THIS IS A COMMENT        ");

    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(commentLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + EMPTY_STRING, actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing floating comment lines pre-formatting for Token analysis */
  @Test
  void floatingCommentLineTest() {
    val commentLine = new CobolLine();
    commentLine.setType(NORMAL);
    commentLine.setIndicatorArea(ProcessingConstants.WS);
    commentLine.setContentAreaA("PROGRAM-ID. comments  *> Floating");
    commentLine.setContentAreaB(" comment");

    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(commentLine));
    CobolLine actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "PROGRAM-ID. comments  ",
        actual.getIndicatorArea() + actual.getContentArea());
  }

  /** Testing normal continuation line pre-formatting for Token analysis */
  @Test
  void continuationLineTest() {
    val startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaA("    ");
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    val middleContinuationLine = new CobolLine();
    middleContinuationLine.setType(CONTINUATION);
    middleContinuationLine.setIndicatorArea("-");
    middleContinuationLine.setContentAreaA("    ");
    middleContinuationLine.setContentAreaB("        \"RANDOM TEXT   ");

    val lastContinuationLine = new CobolLine();
    lastContinuationLine.setType(CONTINUATION);
    lastContinuationLine.setIndicatorArea("-");
    lastContinuationLine.setContentAreaA("    ");
    lastContinuationLine.setContentAreaB("        \"CONTINUED LINE ENDS HERE\"     ");

    startContinuationLine.setSuccessor(middleContinuationLine);
    middleContinuationLine.setSuccessor(lastContinuationLine);

    List<CobolLine> listOfLines =
        ImmutableList.of(startContinuationLine, middleContinuationLine, lastContinuationLine);
    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());
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
    val continuationLine = new CobolLine();
    continuationLine.setType(NORMAL);
    continuationLine.setIndicatorArea(ProcessingConstants.WS);
    continuationLine.setContentAreaA("    ");
    continuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    val emptyContinuationLine = new CobolLine();
    emptyContinuationLine.setType(CONTINUATION);
    emptyContinuationLine.setIndicatorArea("-");
    emptyContinuationLine.setContentAreaA("    ");
    emptyContinuationLine.setContentAreaB("           ");

    continuationLine.setSuccessor(emptyContinuationLine);

    final List<CobolLine> listOfLines = ImmutableList.of(continuationLine, emptyContinuationLine);
    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());
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
    val startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaA("    ");
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    val trailingCommaContinuationLine = new CobolLine();
    trailingCommaContinuationLine.setType(CONTINUATION);
    trailingCommaContinuationLine.setIndicatorArea("-");
    trailingCommaContinuationLine.setContentAreaA("    ");
    trailingCommaContinuationLine.setContentAreaB("         ,");

    startContinuationLine.setSuccessor(trailingCommaContinuationLine);
    trailingCommaContinuationLine.setPredecessor(startContinuationLine);

    List<CobolLine> listOfLines =
        ImmutableList.of(startContinuationLine, trailingCommaContinuationLine);
    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());
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
    val startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    val quoteContinuationLine = new CobolLine();
    quoteContinuationLine.setType(CONTINUATION);
    quoteContinuationLine.setIndicatorArea("-");
    quoteContinuationLine.setContentAreaA("    ");
    quoteContinuationLine.setContentAreaB("          \"RANDOM TEXT SINGLE CONTINUATION LINE\"");

    val lastContinuationLine = new CobolLine();
    lastContinuationLine.setType(CONTINUATION);
    lastContinuationLine.setIndicatorArea("-");
    lastContinuationLine.setContentAreaA("    ");
    lastContinuationLine.setContentAreaB("          RANDOM TEXT SINGLE CONTINUATION LINE\"");

    startContinuationLine.setSuccessor(quoteContinuationLine);
    quoteContinuationLine.setSuccessor(lastContinuationLine);

    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());

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
    val startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(ProcessingConstants.WS);
    startContinuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    val quoteContinuationLine = new CobolLine();
    quoteContinuationLine.setType(CONTINUATION);
    quoteContinuationLine.setIndicatorArea("-");
    quoteContinuationLine.setContentAreaA("    ");
    quoteContinuationLine.setContentAreaB("          \"RANDOM TEXT SINGLE CONTINUATION LINE\"");

    val lastContinuationLine = new CobolLine();
    lastContinuationLine.setType(CONTINUATION);
    lastContinuationLine.setIndicatorArea("-");
    lastContinuationLine.setContentAreaA("    ");
    lastContinuationLine.setContentAreaB("          \"RANDOM TEXT SINGLE CONTINUATION LINE\"");

    startContinuationLine.setSuccessor(quoteContinuationLine);
    quoteContinuationLine.setSuccessor(lastContinuationLine);

    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());

    List<CobolLine> outcome = processor.processLines(ImmutableList.of(lastContinuationLine));
    val actual = outcome.get(0);

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
    val notFormattedLine = new CobolLine();
    notFormattedLine.setContentAreaA("END.");
    notFormattedLine.setIndicatorArea("-");
    notFormattedLine.setSequenceArea(" P-ADD");
    notFormattedLine.setType(CONTINUATION);

    CobolLineIndicatorProcessorImpl processor =
        new CobolLineIndicatorProcessorImpl(getMockLayoutStore());
    List<CobolLine> outcome = processor.processLines(ImmutableList.of(notFormattedLine));
    val actual = outcome.get(0);

    assertEquals(
        ProcessingConstants.WS + "END.", actual.getIndicatorArea() + actual.getContentArea());
  }
}
