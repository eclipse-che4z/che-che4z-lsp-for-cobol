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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.line.transformer;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.model.ErrorSeverity.ERROR;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.CONT_LINE_NO_AREA_A_REGEX;

/**
 * Process continuation lines. Any sentence, entry, clause, or phrase that requires more than one
 * line can be continued in Area B of the next line that is neither a comment line nor a blank line.
 *
 * <p>The line being continued is a continued line; the succeeding lines are continuation lines.
 * Area A of a continuation line must be blank.
 *
 * <p>If there is no hyphen (-) in the indicator area (column 7) of a line, the last character of
 * the preceding line is assumed to be followed by a space.
 */
@Slf4j
public class ContinuationLineTransformation implements CobolLinesTransformation {
  private static final int START_INDEX_AREA_A = 4;
  private static final int END_INDEX_CONTENT_AREA_A = 10;
  private static final Pattern CONTINUATION_LINE_PATTERN =
      Pattern.compile(CONT_LINE_NO_AREA_A_REGEX);

  @Override
  public ResultWithErrors<List<CobolLine>> transformLines(
      String documentURI, List<CobolLine> lines) {
    List<CobolLine> result = new ArrayList<>();
    List<SyntaxError> errors = new ArrayList<>();
    CobolLine previousLine = null;
    for (int i = 0; i < lines.size(); i++) {
      CobolLine cobolLine = lines.get(i);

      Optional.ofNullable(checkContinuationLine(documentURI, i, cobolLine)).ifPresent(errors::add);
      Optional.ofNullable(checkIfStringClosedCorrectly(previousLine, documentURI, i, cobolLine))
          .ifPresent(errors::add);

      previousLine = cobolLine;
      result.add(cobolLine);
    }
    return new ResultWithErrors<>(result, errors);
  }

  /**
   * Check if line is a continuation one and performs pattern check
   *
   * @return a SyntaxError if there is a continuation line error or null if not
   */
  private SyntaxError checkContinuationLine(String uri, int lineNumber, CobolLine cobolLine) {
    if (CobolLineTypeEnum.CONTINUATION.equals(cobolLine.getType())) {

      // invoke method for noContentInAreaA
      return checkContentAreaAWithContinuationLine(cobolLine, uri, lineNumber);
    }
    return null;
  }

  /**
   * Method that check if the rule for fixed format is respected: when there is a continuation line
   * the content area A (7-11) should be blank.
   *
   * @param cobolLine line - a line to be processed
   * @param uri - URI of the processing document
   * @param lineNumber - number of the currently processing line
   * @return error if found or null
   */
  private SyntaxError checkContentAreaAWithContinuationLine(
      CobolLine cobolLine, String uri, int lineNumber) {
    String line = cobolLine.toString();
    Matcher continuationLineMatcher = CONTINUATION_LINE_PATTERN.matcher(line);
    if (!continuationLineMatcher.matches()) {
      return registerContinuationLineError(uri, lineNumber, countAreaASpaces(line));
    }
    return null;
  }

  /** Count number of spaces between INDICATOR_AREA and CONTENT_AREA_A */
  private int countAreaASpaces(String line) {
    return line.substring(START_INDEX_AREA_A, END_INDEX_CONTENT_AREA_A)
        .replaceAll("[^ ]", "")
        .length();
  }

  /**
   * Check and raise an error if indicator area A of current line is not empty and the previous line
   * doesn't end correctly.
   */
  private SyntaxError checkIfStringClosedCorrectly(
      CobolLine previousCobolLine, String uri, int lineNumber, CobolLine currentCobolLine) {
    if (checkIfLineHasUnclosedString(previousCobolLine)
        && !CobolLineTypeEnum.CONTINUATION.equals(currentCobolLine.getType())) {
      // there is a string not closed correctly - I'll raise an error
      return registerStringClosingError(
          uri, lineNumber, getCobolLineTrimmedLength(previousCobolLine));
    }
    return null;
  }

  /** Check with a good pattern if there is an unclosed string */
  private boolean checkIfLineHasUnclosedString(CobolLine cobolLine) {
    if (cobolLine == null) return false;
    if (CobolLineTypeEnum.COMMENT.equals(cobolLine.getType()))
      return false; // Do not process comment lines

    String cobolLineToCheck = cobolLine.getContentAreaA() + cobolLine.getContentAreaB();
    String startChar = findQuoteOpeningChar(cobolLineToCheck);

    if (startChar == null) return false;
    return isStringMatchOdd(cobolLineToCheck, startChar);
  }

  private String findQuoteOpeningChar(String cobolLineToCheck) {
    int indexOfSingle = cobolLineToCheck.indexOf('\'');
    int indexOfDouble = cobolLineToCheck.indexOf('"');

    if (indexOfSingle == indexOfDouble) return null;

    if (indexOfSingle != -1 && indexOfDouble == -1) return "'";
    if (indexOfSingle == -1) return "\"";
    return indexOfSingle > indexOfDouble ? "\"" : "'";
  }

  private boolean isStringMatchOdd(String cobolLineToCheck, String substring) {
    return StringUtils.countMatches(cobolLineToCheck, substring) % 2 != 0;
  }

  /**
   * The syntax error should be thrown in the content area B, so it is necessary to remove the
   * comment area from the Cobol line
   *
   * @param lastCobolLine - CobolLine that was processed before the current one
   * @return content length without spaces
   */
  private int getCobolLineTrimmedLength(CobolLine lastCobolLine) {
    return (lastCobolLine.getSequenceArea()
                + lastCobolLine.getIndicatorArea()
                + lastCobolLine.getContentAreaA()
                + lastCobolLine.getContentAreaB())
            .trim()
            .length()
        - 1;
  }

  private SyntaxError registerStringClosingError(
      String uri, int lineNumber, int cobolLineTrimmedLength) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .position(
                new Position(
                    uri,
                    cobolLineTrimmedLength,
                    cobolLineTrimmedLength,
                    lineNumber,
                    cobolLineTrimmedLength,
                    null))
            .suggestion("IGYDS1082-E A period was required.")
            .severity(ERROR)
            .build();

    LOG.debug(
        "Syntax error by ContinuationLineTransformation#registerStringClosingError: "
            + error.toString());
    return error;
  }

  private SyntaxError registerContinuationLineError(String uri, int lineNumber, int countingSpace) {
    int startPosition = END_INDEX_CONTENT_AREA_A - (START_INDEX_AREA_A - countingSpace) + 1;
    SyntaxError error =
        SyntaxError.syntaxError()
            .position(
                new Position(
                    uri, startPosition, END_INDEX_CONTENT_AREA_A, lineNumber, startPosition, null))
            .suggestion("A continuation line cannot contain values in the Content Area A")
            .severity(ERROR)
            .build();
    LOG.debug(
        "Syntax error by ContinuationLineTransformation#registerContinuationLineError: "
            + error.toString());
    return error;
  }
}
