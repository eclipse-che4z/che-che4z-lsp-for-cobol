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

  /**
   * Testing preprocessing formatting for COBOL files, making sure that only needed information is
   * being passed to the parser to avoid issues and making token recognition easier
   */
  @Test
  public void processLinesTest() {
    final String EMPTY_STRING = "";
    CobolLine continuationLine = new CobolLine();
    CobolLine trailingQuoteContinuationLine = new CobolLine();
    CobolLine emptyContinuationLineToTest = new CobolLine();
    CobolLine singleContinuationLineToTest = new CobolLine();
    CobolLine goodContinuationLineToTest = new CobolLine();
    CobolLine badContinuationLineToTest = new CobolLine();
    CobolLine commentLineToTest = new CobolLine();
    CobolLine continuationLineWithEndQuotes = new CobolLine();
    CobolLine compilerDirectiveLineToTest = new CobolLine();
    CobolLine normalLineToTest = new CobolLine();
    CobolLine debugLineToTest = new CobolLine();
    continuationLine.setType(CONTINUATION);
    continuationLine.setIndicatorArea("-");
    continuationLine.setContentAreaA("        \"CONTINUED LINE ENDS HERE\"     ");

    goodContinuationLineToTest.setType(CONTINUATION);
    goodContinuationLineToTest.setSuccessor(continuationLine);
    goodContinuationLineToTest.setIndicatorArea(WS);
    goodContinuationLineToTest.setContentAreaA("       \"RANDOM TEXT   ");
    goodContinuationLineToTest.setContentAreaB("        ");

    singleContinuationLineToTest.setType(CONTINUATION);
    singleContinuationLineToTest.setSuccessor(continuationLine);
    singleContinuationLineToTest.setIndicatorArea(WS);
    singleContinuationLineToTest.setContentAreaA("       'RANDOM TEXT   ");
    singleContinuationLineToTest.setContentAreaB("        ");

    trailingQuoteContinuationLine.setType(CONTINUATION);
    trailingQuoteContinuationLine.setSuccessor(continuationLine);
    trailingQuoteContinuationLine.setIndicatorArea(WS);
    trailingQuoteContinuationLine.setContentAreaA("         \"");
    trailingQuoteContinuationLine.setContentAreaB("");

    badContinuationLineToTest.setType(CONTINUATION);
    badContinuationLineToTest.setPredecessor(goodContinuationLineToTest);
    badContinuationLineToTest.setContentAreaA("        \"RANDOM TEXT   ");
    badContinuationLineToTest.setContentAreaB("        ");

    emptyContinuationLineToTest.setType(CONTINUATION);
    emptyContinuationLineToTest.setSuccessor(null);
    emptyContinuationLineToTest.setContentAreaA("           ");
    emptyContinuationLineToTest.setContentAreaB("           ");

    commentLineToTest.setType(COMMENT);
    commentLineToTest.setIndicatorArea("*");
    commentLineToTest.setContentAreaA("THIS IS A COMMENT        ");

    compilerDirectiveLineToTest.setType(COMPILER_DIRECTIVE);
    compilerDirectiveLineToTest.setIndicatorArea(WS);
    compilerDirectiveLineToTest.setContentAreaA("DEFINE");

    normalLineToTest.setType(NORMAL);
    normalLineToTest.setFormat(FIXED);
    normalLineToTest.setIndicatorArea(WS);
    normalLineToTest.setContentAreaA("         RANDOM TEXT ,  ");

    debugLineToTest.setType(DEBUG);
    debugLineToTest.setIndicatorArea(WS);
    debugLineToTest.setContentAreaA("     DEBUG LINE HERE      ");

    continuationLineWithEndQuotes.setType(CONTINUATION);
    continuationLineWithEndQuotes.setPredecessor(continuationLine);
    continuationLineWithEndQuotes.setSuccessor(continuationLine);
    continuationLineWithEndQuotes.setIndicatorArea(WS);
    continuationLineWithEndQuotes.setContentAreaA("       \"RANDOM TEXT \"  ");
    continuationLineWithEndQuotes.setContentAreaB("        ");

    final List<CobolLine> listOfLines =
        Arrays.asList(
            goodContinuationLineToTest,
            singleContinuationLineToTest,
            trailingQuoteContinuationLine,
            continuationLine,
            badContinuationLineToTest,
            emptyContinuationLineToTest,
            commentLineToTest,
            compilerDirectiveLineToTest,
            normalLineToTest,
            debugLineToTest,
            continuationLineWithEndQuotes);
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    processor.processLines(listOfLines);

    assertEquals(
        WS + "\"RANDOM TEXT           ",
        processor.processLines(listOfLines).get(0).getIndicatorArea()
            + processor.processLines(listOfLines).get(0).getContentArea());
    assertEquals(
        WS + "'RANDOM TEXT           ",
        processor.processLines(listOfLines).get(1).getIndicatorArea()
            + processor.processLines(listOfLines).get(1).getContentArea());
    assertEquals(
        WS + "\"",
        processor.processLines(listOfLines).get(2).getIndicatorArea()
            + processor.processLines(listOfLines).get(2).getContentArea());
    assertEquals(
        WS + "CONTINUED LINE ENDS HERE\"",
        processor.processLines(listOfLines).get(3).getIndicatorArea()
            + processor.processLines(listOfLines).get(3).getContentArea());
    assertEquals(
        WS + "RANDOM TEXT",
        processor.processLines(listOfLines).get(4).getIndicatorArea()
            + processor.processLines(listOfLines).get(4).getContentArea());
    assertEquals(
        WS + EMPTY_STRING,
        processor.processLines(listOfLines).get(5).getIndicatorArea()
            + processor.processLines(listOfLines).get(5).getContentArea());
    assertEquals(
        COMMENT_TAG + WS + "THIS IS A COMMENT",
        processor.processLines(listOfLines).get(6).getIndicatorArea()
            + processor.processLines(listOfLines).get(6).getContentArea());
    assertEquals(
        WS + EMPTY_STRING,
        processor.processLines(listOfLines).get(7).getIndicatorArea()
            + processor.processLines(listOfLines).get(7).getContentArea());
    assertEquals(
        WS + "         RANDOM TEXT , ",
        processor.processLines(listOfLines).get(8).getIndicatorArea()
            + processor.processLines(listOfLines).get(8).getContentArea());
    assertEquals(
        WS + "     DEBUG LINE HERE",
        processor.processLines(listOfLines).get(9).getIndicatorArea()
            + processor.processLines(listOfLines).get(9).getContentArea());
    assertEquals(
        WS + "RANDOM TEXT \"",
        processor.processLines(listOfLines).get(10).getIndicatorArea()
            + processor.processLines(listOfLines).get(10).getContentArea());
  }
}
