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
 */
package com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.*;
import static org.junit.Assert.assertEquals;

/** Testing that the cobol lines are formatted correctly before being used for token analysis */
public class CobolLineIndicatorProcessorImplTest {

  private static final String EMPTY_STRING = "";

  /** Testing Debug lines preformatting for Token analysis */
  @Test
  public void debugLineTest() {
    CobolLine debugLine = new CobolLine();
    debugLine.setType(DEBUG);
    debugLine.setIndicatorArea(WS);
    debugLine.setContentAreaA("    ");
    debugLine.setContentAreaB("     DEBUG LINE HERE      ");

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    CobolLine outcome = processor.processLine(debugLine);

    assertEquals(
        WS + "         DEBUG LINE HERE", outcome.getIndicatorArea() + outcome.getContentArea());
  }

  /** Testing normal lines preformatting for Token analysis */
  @Test
  public void normalLineTest() {
    CobolLine normalLine = new CobolLine();
    normalLine.setType(NORMAL);
    normalLine.setIndicatorArea(WS);
    normalLine.setContentAreaA("    ");
    normalLine.setContentAreaB("         RANDOM TEXT ,  ");

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    CobolLine outcome = processor.processLine(normalLine);

    assertEquals(
        WS + "             RANDOM TEXT , ", outcome.getIndicatorArea() + outcome.getContentArea());
  }

  /** Testing Compiler Directive lines preformatting for Token analysis */
  @Test
  public void compilerDirectiveTest() {
    CobolLine compilerDirectiveLine = new CobolLine();
    compilerDirectiveLine.setType(COMPILER_DIRECTIVE);
    compilerDirectiveLine.setIndicatorArea(WS);
    compilerDirectiveLine.setContentAreaA("    ");
    compilerDirectiveLine.setContentAreaB("DEFINE");

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    CobolLine outcome = processor.processLine(compilerDirectiveLine);

    assertEquals(WS + EMPTY_STRING, outcome.getIndicatorArea() + outcome.getContentArea());
  }

  /** Testing comment lines preformatting for Token analysis */
  @Test
  public void commentLineTest() {
    CobolLine commentLine = new CobolLine();
    commentLine.setType(COMMENT);
    commentLine.setIndicatorArea("*");
    commentLine.setContentAreaA("    ");
    commentLine.setContentAreaB("THIS IS A COMMENT        ");

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();

    CobolLine outcome = processor.processLine(commentLine);

    assertEquals(
        COMMENT_TAG + WS + "    THIS IS A COMMENT",
        outcome.getIndicatorArea() + outcome.getContentArea());
  }

  /** Testing normal continuation line preformatting for Token analysis */
  @Test
  public void continuationLineTest() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(WS);
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
        Arrays.asList(startContinuationLine, middleContinuationLine, lastContinuationLine);
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    List<CobolLine> outcomeList = processor.processLines(listOfLines);

    assertEquals(
        WS + "           \"RANDOM TEXT   ",
        outcomeList.get(0).getIndicatorArea() + outcomeList.get(0).getContentArea());
    assertEquals(
        WS + "RANDOM TEXT   ",
        outcomeList.get(1).getIndicatorArea() + outcomeList.get(1).getContentArea());
    assertEquals(
        WS + "\"CONTINUED LINE ENDS HERE\"",
        outcomeList.get(2).getIndicatorArea() + outcomeList.get(2).getContentArea());
  }

  /** Testing empty continuation line preformatting for Token analysis */
  @Test
  public void emptyContinuationLine() {
    CobolLine continuationLine = new CobolLine();
    continuationLine.setType(NORMAL);
    continuationLine.setIndicatorArea(WS);
    continuationLine.setContentAreaA("    ");
    continuationLine.setContentAreaB("       \"RANDOM TEXT   ");

    CobolLine emptyContinuationLine = new CobolLine();
    emptyContinuationLine.setType(CONTINUATION);
    emptyContinuationLine.setIndicatorArea("-");
    emptyContinuationLine.setContentAreaA("    ");
    emptyContinuationLine.setContentAreaB("           ");

    continuationLine.setSuccessor(emptyContinuationLine);

    final List<CobolLine> listOfLines = Arrays.asList(continuationLine, emptyContinuationLine);
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    List<CobolLine> outcomeList = processor.processLines(listOfLines);

    assertEquals(
        WS + "           \"RANDOM TEXT   ",
        outcomeList.get(0).getIndicatorArea() + outcomeList.get(0).getContentArea());
    assertEquals(
        WS + EMPTY_STRING,
        outcomeList.get(1).getIndicatorArea() + outcomeList.get(1).getContentArea());
  }

  /** Testing continuation lines with trailing comma preformatting for Token analysis */
  @Test
  public void trailingCommaContinuationLineTest() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(WS);
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
        Arrays.asList(startContinuationLine, trailingCommaContinuationLine);
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    List<CobolLine> outcomeList = processor.processLines(listOfLines);

    assertEquals(
        WS + "           \"RANDOM TEXT   ",
        outcomeList.get(0).getIndicatorArea() + outcomeList.get(0).getContentArea());
    assertEquals(
        WS + "             ," + WS,
        outcomeList.get(1).getIndicatorArea() + outcomeList.get(1).getContentArea());
  }

  /**
   * Testing a continuation line with no quotes at the start of the line preformatting for Token
   * analysis
   */
  @Test
  public void continuationLineWithoutBeginningQuotes() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(WS);
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

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();

    CobolLine outcome = processor.processLine(lastContinuationLine);

    assertEquals(
        WS + "RANDOM TEXT SINGLE CONTINUATION LINE\"",
        outcome.getIndicatorArea() + outcome.getContentArea());
  }

  /**
   * Testing a continuation line with quotes at the start and end of the line preformatting for
   * Token analysis
   */
  @Test
  public void continuationLineWithOuterQuotes() {
    CobolLine startContinuationLine = new CobolLine();
    startContinuationLine.setType(NORMAL);
    startContinuationLine.setIndicatorArea(WS);
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

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();

    CobolLine outcome = processor.processLine(lastContinuationLine);

    assertEquals(
        WS + "RANDOM TEXT SINGLE CONTINUATION LINE\"",
        outcome.getIndicatorArea() + outcome.getContentArea());
  }
}
