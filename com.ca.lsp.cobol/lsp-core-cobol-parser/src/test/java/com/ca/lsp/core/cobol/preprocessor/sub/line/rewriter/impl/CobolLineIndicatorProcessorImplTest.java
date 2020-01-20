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
  private CobolLine CONTINUATION_LINE = new CobolLine();
  private CobolLine TRAILING_QUOTE_CONTINUATION_LINE = new CobolLine();
  private CobolLine EMPTY_CONTINUATION_LINE_TO_TEST = new CobolLine();
  private CobolLine SINGLE_CONTINUATION_LINE_TO_TEST = new CobolLine();
  private CobolLine GOOD_CONTINUATION_LINE_TO_TEST = new CobolLine();
  private CobolLine BAD_CONTINUATION_LINE_TO_TEST = new CobolLine();
  private CobolLine COMMENT_LINE_TO_TEST = new CobolLine();
  private CobolLine CONTINUATION_LINE_WITH_END_QUOTES = new CobolLine();
  private CobolLine COMPILER_DIRECTIVE_LINE_TO_TEST = new CobolLine();
  private CobolLine NORMAL_LINE_TO_TEST = new CobolLine();
  private CobolLine DEBUG_LINE_TO_TEST = new CobolLine();

  @Test
  public void processLinesTest() {
    CONTINUATION_LINE.setType(CONTINUATION);
    CONTINUATION_LINE.setIndicatorArea("-");
    CONTINUATION_LINE.setIndicatorAreaOriginal("-");
    CONTINUATION_LINE.setContentAreaAOriginal("        \"CONTINUED LINE ENDS HERE\"     ");
    CONTINUATION_LINE.setContentAreaA("        \"CONTINUED LINE ENDS HERE\"     ");

    GOOD_CONTINUATION_LINE_TO_TEST.setType(CONTINUATION);
    GOOD_CONTINUATION_LINE_TO_TEST.setSuccessor(CONTINUATION_LINE);
    GOOD_CONTINUATION_LINE_TO_TEST.setIndicatorAreaOriginal(WS);
    GOOD_CONTINUATION_LINE_TO_TEST.setContentAreaAOriginal("       \"RANDOM TEXT   ");
    GOOD_CONTINUATION_LINE_TO_TEST.setContentAreaA("       \"RANDOM TEXT   ");
    GOOD_CONTINUATION_LINE_TO_TEST.setContentAreaBOriginal("        ");
    GOOD_CONTINUATION_LINE_TO_TEST.setContentAreaB("        ");

    SINGLE_CONTINUATION_LINE_TO_TEST.setType(CONTINUATION);
    SINGLE_CONTINUATION_LINE_TO_TEST.setSuccessor(CONTINUATION_LINE);
    SINGLE_CONTINUATION_LINE_TO_TEST.setIndicatorAreaOriginal(WS);
    SINGLE_CONTINUATION_LINE_TO_TEST.setContentAreaAOriginal("       'RANDOM TEXT   ");
    SINGLE_CONTINUATION_LINE_TO_TEST.setContentAreaA("       'RANDOM TEXT   ");
    SINGLE_CONTINUATION_LINE_TO_TEST.setContentAreaBOriginal("        ");
    SINGLE_CONTINUATION_LINE_TO_TEST.setContentAreaB("        ");

    TRAILING_QUOTE_CONTINUATION_LINE.setType(CONTINUATION);
    TRAILING_QUOTE_CONTINUATION_LINE.setSuccessor(CONTINUATION_LINE);
    TRAILING_QUOTE_CONTINUATION_LINE.setIndicatorAreaOriginal(WS);
    TRAILING_QUOTE_CONTINUATION_LINE.setContentAreaAOriginal("         \"");
    TRAILING_QUOTE_CONTINUATION_LINE.setContentAreaA("         \"");
    TRAILING_QUOTE_CONTINUATION_LINE.setContentAreaBOriginal("");
    TRAILING_QUOTE_CONTINUATION_LINE.setContentAreaB("");

    BAD_CONTINUATION_LINE_TO_TEST.setType(CONTINUATION);
    BAD_CONTINUATION_LINE_TO_TEST.setPredecessor(GOOD_CONTINUATION_LINE_TO_TEST);
    BAD_CONTINUATION_LINE_TO_TEST.setContentAreaAOriginal("        \"RANDOM TEXT   ");
    BAD_CONTINUATION_LINE_TO_TEST.setContentAreaA("        \"RANDOM TEXT   ");
    BAD_CONTINUATION_LINE_TO_TEST.setContentAreaBOriginal("        ");
    BAD_CONTINUATION_LINE_TO_TEST.setContentAreaB("        ");

    EMPTY_CONTINUATION_LINE_TO_TEST.setType(CONTINUATION);
    EMPTY_CONTINUATION_LINE_TO_TEST.setSuccessor(null);
    EMPTY_CONTINUATION_LINE_TO_TEST.setContentAreaAOriginal("           ");
    EMPTY_CONTINUATION_LINE_TO_TEST.setContentAreaA("           ");
    EMPTY_CONTINUATION_LINE_TO_TEST.setContentAreaBOriginal("           ");
    EMPTY_CONTINUATION_LINE_TO_TEST.setContentAreaB("           ");

    COMMENT_LINE_TO_TEST.setType(COMMENT);
    COMMENT_LINE_TO_TEST.setIndicatorArea("*");
    COMMENT_LINE_TO_TEST.setIndicatorAreaOriginal("*");
    COMMENT_LINE_TO_TEST.setContentAreaA("THIS IS A COMMENT        ");
    COMMENT_LINE_TO_TEST.setContentAreaAOriginal("THIS IS A COMMENT        ");

    COMPILER_DIRECTIVE_LINE_TO_TEST.setType(COMPILER_DIRECTIVE);
    COMPILER_DIRECTIVE_LINE_TO_TEST.setIndicatorArea(WS);
    COMPILER_DIRECTIVE_LINE_TO_TEST.setIndicatorAreaOriginal(WS);
    COMPILER_DIRECTIVE_LINE_TO_TEST.setContentAreaA("DEFINE");
    COMPILER_DIRECTIVE_LINE_TO_TEST.setContentAreaAOriginal("DEFINE");

    NORMAL_LINE_TO_TEST.setType(NORMAL);
    NORMAL_LINE_TO_TEST.setFormat(FIXED);
    NORMAL_LINE_TO_TEST.setIndicatorArea(WS);
    NORMAL_LINE_TO_TEST.setIndicatorAreaOriginal(WS);
    NORMAL_LINE_TO_TEST.setContentAreaA("         RANDOM TEXT ,  ");
    NORMAL_LINE_TO_TEST.setContentAreaAOriginal("         RANDOM TEXT ,  ");

    DEBUG_LINE_TO_TEST.setType(DEBUG);
    DEBUG_LINE_TO_TEST.setIndicatorArea(WS);
    DEBUG_LINE_TO_TEST.setIndicatorAreaOriginal(WS);
    DEBUG_LINE_TO_TEST.setContentAreaA("     DEBUG LINE HERE      ");
    DEBUG_LINE_TO_TEST.setContentAreaAOriginal("     DEBUG LINE HERE      ");

    CONTINUATION_LINE_WITH_END_QUOTES.setType(CONTINUATION);
    CONTINUATION_LINE_WITH_END_QUOTES.setPredecessor(CONTINUATION_LINE);
    CONTINUATION_LINE_WITH_END_QUOTES.setSuccessor(CONTINUATION_LINE);
    CONTINUATION_LINE_WITH_END_QUOTES.setIndicatorAreaOriginal(WS);
    CONTINUATION_LINE_WITH_END_QUOTES.setContentAreaAOriginal("       \"RANDOM TEXT \"  ");
    CONTINUATION_LINE_WITH_END_QUOTES.setContentAreaA("       \"RANDOM TEXT \"  ");
    CONTINUATION_LINE_WITH_END_QUOTES.setContentAreaBOriginal("        ");
    CONTINUATION_LINE_WITH_END_QUOTES.setContentAreaB("        ");

    final List<CobolLine> listOfLines =
        Arrays.asList(
            GOOD_CONTINUATION_LINE_TO_TEST,
            SINGLE_CONTINUATION_LINE_TO_TEST,
            TRAILING_QUOTE_CONTINUATION_LINE,
            CONTINUATION_LINE,
            BAD_CONTINUATION_LINE_TO_TEST,
            EMPTY_CONTINUATION_LINE_TO_TEST,
            COMMENT_LINE_TO_TEST,
            COMPILER_DIRECTIVE_LINE_TO_TEST,
            NORMAL_LINE_TO_TEST,
            DEBUG_LINE_TO_TEST,
            CONTINUATION_LINE_WITH_END_QUOTES);
    CobolLineIndicatorProcessorImpl processor = new CobolLineIndicatorProcessorImpl();
    processor.processLines(listOfLines);

    // assertEquals("RANDOM TEXT",processor.processLine(CONTINUATION_LINE));
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
        WS + " \"RANDOM TEXT \"",
        processor.processLines(listOfLines).get(10).getIndicatorArea()
            + processor.processLines(listOfLines).get(10).getContentArea());
  }
}
