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

import static com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat.FIXED;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_TAG;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.COMMENT;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.COMPILER_DIRECTIVE;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.CONTINUATION;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.NORMAL;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.DEBUG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;
import static org.junit.Assert.assertEquals;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;

import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class CobolLineIndicatorProcessorImplTest {

  private static final String EMPTY_STRING = "";
  CobolLine continuationLine = new CobolLine();
  CobolLine trailingQuoteContinuationLine = new CobolLine();
  CobolLine emptyContinuationLine = new CobolLine();
  CobolLine singleContinuationLine = new CobolLine();
  CobolLine goodContinuationLine = new CobolLine();
  CobolLine badContinuationLine = new CobolLine();
  CobolLine commentLine = new CobolLine();
  CobolLine continuationLineWithEndQuotes = new CobolLine();

  /**
   * Testing preprocessing formatting for COBOL files, making sure that only needed information is
   * being passed to the parser to avoid issues and making token recognition easier
   */
  @Test
  public void processLinesTest() {
    continuationLine.setType(CONTINUATION);
    continuationLine.setIndicatorArea("-");
    continuationLine.setContentAreaA("        \"CONTINUED LINE ENDS HERE\"     ");

    goodContinuationLine.setType(CONTINUATION);
    goodContinuationLine.setSuccessor(continuationLine);
    goodContinuationLine.setIndicatorArea(WS);
    goodContinuationLine.setContentAreaA("       \"RANDOM TEXT   ");
    goodContinuationLine.setContentAreaB("        ");

    singleContinuationLine.setType(CONTINUATION);
    singleContinuationLine.setSuccessor(continuationLine);
    singleContinuationLine.setIndicatorArea(WS);
    singleContinuationLine.setContentAreaA("       'RANDOM TEXT   ");
    singleContinuationLine.setContentAreaB("        ");

    trailingQuoteContinuationLine.setType(CONTINUATION);
    trailingQuoteContinuationLine.setSuccessor(continuationLine);
    trailingQuoteContinuationLine.setIndicatorArea(WS);
    trailingQuoteContinuationLine.setContentAreaA("         \"");
    trailingQuoteContinuationLine.setContentAreaB("");

    badContinuationLine.setType(CONTINUATION);
    badContinuationLine.setPredecessor(goodContinuationLine);
    badContinuationLine.setContentAreaA("        \"RANDOM TEXT   ");
    badContinuationLine.setContentAreaB("        ");

    emptyContinuationLine.setType(CONTINUATION);
    emptyContinuationLine.setSuccessor(null);
    emptyContinuationLine.setContentAreaA("           ");
    emptyContinuationLine.setContentAreaB("           ");

    commentLine.setType(COMMENT);
    commentLine.setIndicatorArea("*");
    commentLine.setContentAreaA("THIS IS A COMMENT        ");

    continuationLineWithEndQuotes.setType(CONTINUATION);
    continuationLineWithEndQuotes.setPredecessor(continuationLine);
    continuationLineWithEndQuotes.setSuccessor(continuationLine);
    continuationLineWithEndQuotes.setIndicatorArea(WS);
    continuationLineWithEndQuotes.setContentAreaA("       \"RANDOM TEXT \"  ");
    continuationLineWithEndQuotes.setContentAreaB("        ");

    final List<CobolLine> listOfLines =
        Arrays.asList(
            goodContinuationLine,
            singleContinuationLine,
            trailingQuoteContinuationLine,
            continuationLine,
            badContinuationLine,
            emptyContinuationLine,
            commentLine,
            continuationLineWithEndQuotes);
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    List<CobolLine> outcomeList = processor.processLines(listOfLines);

    assertEquals(
        WS + "\"RANDOM TEXT           ",
        outcomeList.get(0).getIndicatorArea() + outcomeList.get(0).getContentArea());
    assertEquals(
        WS + "'RANDOM TEXT           ",
        outcomeList.get(1).getIndicatorArea() + outcomeList.get(1).getContentArea());
    assertEquals(
        WS + "\"", outcomeList.get(2).getIndicatorArea() + outcomeList.get(2).getContentArea());
    assertEquals(
        WS + "CONTINUED LINE ENDS HERE\"",
        outcomeList.get(3).getIndicatorArea() + outcomeList.get(3).getContentArea());
    assertEquals(
        WS + "RANDOM TEXT",
        outcomeList.get(4).getIndicatorArea() + outcomeList.get(4).getContentArea());
    assertEquals(
        WS + EMPTY_STRING,
        outcomeList.get(5).getIndicatorArea() + outcomeList.get(5).getContentArea());
    assertEquals(
        COMMENT_TAG + WS + "THIS IS A COMMENT",
        outcomeList.get(6).getIndicatorArea() + outcomeList.get(6).getContentArea());
    assertEquals(
        WS + "RANDOM TEXT \"",
        outcomeList.get(7).getIndicatorArea() + outcomeList.get(7).getContentArea());
  }

  @Test
  public void debugLineTest() {
    CobolLine debugLine = new CobolLine();
    debugLine.setType(DEBUG);
    debugLine.setIndicatorArea(WS);
    debugLine.setContentAreaA("     DEBUG LINE HERE      ");

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    CobolLine outcome = processor.processLine(debugLine);

    assertEquals(
        WS + "     DEBUG LINE HERE", outcome.getIndicatorArea() + outcome.getContentArea());
  }

  @Test
  public void normalLineTest() {
    CobolLine normalLine = new CobolLine();
    normalLine.setType(NORMAL);
    normalLine.setFormat(FIXED);
    normalLine.setIndicatorArea(WS);
    normalLine.setContentAreaA("         RANDOM TEXT ,  ");

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    CobolLine outcome = processor.processLine(normalLine);

    assertEquals(
        WS + "         RANDOM TEXT , ", outcome.getIndicatorArea() + outcome.getContentArea());
  }

  @Test
  public void compilerDirectiveTest() {
    CobolLine compilerDirectiveLine = new CobolLine();
    compilerDirectiveLine.setType(COMPILER_DIRECTIVE);
    compilerDirectiveLine.setIndicatorArea(WS);
    compilerDirectiveLine.setContentAreaA("DEFINE");

    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    CobolLine outcome = processor.processLine(compilerDirectiveLine);

    assertEquals(WS + EMPTY_STRING, outcome.getIndicatorArea() + outcome.getContentArea());
  }
}
