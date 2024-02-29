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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter;

import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.*;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.WS;

import com.google.inject.Inject;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.CobolLineUtils;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;

/**
 * This class processes the indicator area of COBOL lines checking if some operations should be
 * applied on the content area.
 */
public class CobolLineIndicatorProcessorImpl implements CobolLineReWriter {

  private static final String EMPTY_STRING = "";
  private static final String DOUBLE_QUOTE_LITERAL = "\"([^\"]|\"\"|'')*+\"";
  private static final String SINGLE_QUOTE_LITERAL = "'([^']|''|\"\")*+'";
  public static final Pattern FLOATING_COMMENT_LINE =
      Pattern.compile("(?<validText>.*?)(?<floatingComment>\\*>.*)?");

  private final CodeLayoutStore layoutStore;

  @Inject
  public CobolLineIndicatorProcessorImpl(CodeLayoutStore layoutStore) {
    this.layoutStore = layoutStore;
  }

  /**
   * Normalizes the lines by stripping the sequence number and line indicator, and interpreting the
   * line indicator.
   */
  @Override
  public List<CobolLine> processLines(final List<CobolLine> lines) {
    if (lines.isEmpty()) {
      return Collections.emptyList();
    }
    return StreamSupport.stream(lines.get(0).spliterator(), false)
            .map(line -> line.getType() == PREPROCESSED ? line : processLine(line))
            .collect(Collectors.toList());
  }

  private CobolLine processLine(final CobolLine line) {
    CobolLineTypeEnum type = line.getType();
    CobolProgramLayout codeLayout = layoutStore.getCodeLayout();
    if (type == COMMENT || type == COMPILER_DIRECTIVE) {
      return CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(WS, EMPTY_STRING, line, codeLayout);
    }

    String trimmedContentArea = conditionalRightTrimContentArea(line);
    if (type == CONTINUATION) {
      return processContinuationLine(line, trimmedContentArea);
    }

    Matcher matchedLine = FLOATING_COMMENT_LINE.matcher(trimmedContentArea);
    return matchedLine.matches()
            ? CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(WS, matchedLine.group("validText"), line, codeLayout)
            : CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(WS, trimmedContentArea, line, codeLayout);
  }

  private CobolLine processContinuationLine(CobolLine line, String conditionalRightTrimmedContentArea) {
    CobolLine result;
    final String trimmedContentArea = trimLeadingWhitespace(conditionalRightTrimmedContentArea);
    CobolProgramLayout codeLayout = layoutStore.getCodeLayout();
    if (StringUtils.isBlank(conditionalRightTrimmedContentArea)) {
      result = CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(WS, EMPTY_STRING, line, codeLayout);
    }
    /*
     If a line, which is continued on the next line, ends in column 72 with a quotation mark as
     the last character ...
    */
    else if (checkContentAreaEndsWithQuoteMark(line)) {

      /*
       ... the continuation line by specification has to startPosition with two consecutive
       quotation marks.
      */
      if (CobolLineReWriter.checkStringStartsWithQuoteMark(trimmedContentArea)) {
        /*
         We have to remove the first quotation mark of the continuation line, the 1 quotation mark
         from the continued line and the 2 quotations marks from the continuation line become 2
         successive quotation marks.
        */
        result =
            CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(
                WS, trimLeadingChar(trimmedContentArea), line, codeLayout);
      }
      /*
       However there are non-compliant parsers out there without the two consecutive quotation
       marks in the continuation line ...
      */
      else {
        /* ... where we simply remove leading whitespace. */
        result =
            CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(
                WS, trimLeadingWhitespace(conditionalRightTrimmedContentArea), line, codeLayout);
      }
    }
    /* If we are ending with an open literal ... */
    else if (line.getPredecessor() != null && isEndingWithOpenLiteral(line.getPredecessor())) {

      /*
       ... the continuation line might startPosition with a single quotation mark. This indicates,
       that the literal from the continued line stays open ...
       Removing the leading quotation mark to keep the literal open is handled during serialization.
      */
        result =
            CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(
                WS, conditionalRightTrimmedContentArea, line, codeLayout);
    } else {
      result =
          CobolLineUtils.copyCobolLineWithIndicatorAndContentArea(
                  WS, conditionalRightTrimmedContentArea, line, codeLayout);
    }
    return result;
  }

  private String conditionalRightTrimContentArea(final CobolLine line) {
    if (!isNextLineContinuation(line) || !isEndingWithOpenLiteral(line)) {
      return rightTrimContentArea(line.getContentArea());
    } else {
      return line.getContentArea();
    }
  }

  private boolean isEndingWithOpenLiteral(final CobolLine line) {
    final String contentAreaWithoutStringLiterals = removeStringLiterals(line.getContentArea());
    return contentAreaWithoutStringLiterals.contains("\"")
        || contentAreaWithoutStringLiterals.contains("'");
  }

  private boolean isNextLineContinuation(final CobolLine line) {
    return line.getSuccessor() != null
        && CobolLineTypeEnum.CONTINUATION.equals(line.getSuccessor().getType());
  }

  private boolean checkContentAreaEndsWithQuoteMark(CobolLine line) {
    return line.getPredecessor() != null
        && (CobolLineReWriter.checkStringEndsWithQuoteMark(line.getPredecessor().getContentArea()));
  }


  private String removeStringLiterals(final String contentArea) {
    return contentArea
        .replaceAll(DOUBLE_QUOTE_LITERAL, EMPTY_STRING)
        .replaceAll(SINGLE_QUOTE_LITERAL, EMPTY_STRING);
  }

  private String repairTrailingComma(final String contentArea) {
    /*
     * repair trimmed whitespace after comma separator
     */
    return (!contentArea.isEmpty() && (contentArea.endsWith(",") || contentArea.endsWith(";")))
        ? contentArea + WS
        : contentArea;
  }

  private String rightTrimContentArea(final String contentArea) {
    final String contentAreaWithTrimmedTrailingWhitespace = trimTrailingWhitespace(contentArea);
    return repairTrailingComma(contentAreaWithTrimmedTrailingWhitespace);
  }

  private String trimLeadingChar(final String contentArea) {
    return contentArea.substring(1);
  }

  private String trimLeadingWhitespace(final String contentArea) {
    return StringUtils.stripStart(contentArea, " ");
  }

  private String trimTrailingWhitespace(final String contentArea) {
    return StringUtils.stripEnd(contentArea, " ");
  }
}
