package com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl;

import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.COMMENT;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.COMPILER_DIRECTIVE;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.CONTINUATION;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.NORMAL;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.DEBUG;
import static org.junit.Assert.assertEquals;

import com.ca.lsp.core.cobol.AbstractCobolLinePreprocessorTest;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.CobolLineWriter;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.impl.CobolLineWriterImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReader;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class CobolLineIndicatorProcessorImplTest {

  @Test
  public void processLinesTest() {
    CobolLine CONTINUATION_LINE = new CobolLine();
    CONTINUATION_LINE.setType(CONTINUATION);

    CobolLine GOOD_CONTINUATION_LINE_TO_TEST = new CobolLine();
    GOOD_CONTINUATION_LINE_TO_TEST.setType(CONTINUATION);
    GOOD_CONTINUATION_LINE_TO_TEST.setSuccessor(CONTINUATION_LINE);

    CobolLine COMMENT_LINE_TO_TEST = new CobolLine();
    COMMENT_LINE_TO_TEST.setType(COMMENT);

    CobolLine COMPILER_DIRECTIVE_LINE_TO_TEST = new CobolLine();
    COMPILER_DIRECTIVE_LINE_TO_TEST.setType(COMPILER_DIRECTIVE);

    CobolLine NORMAL_LINE_TO_TEST = new CobolLine();
    NORMAL_LINE_TO_TEST.setType(NORMAL);

    CobolLine DEBUG_LINE_TO_TEST = new CobolLine();
    DEBUG_LINE_TO_TEST.setType(DEBUG);
  }

}