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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer;

import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CompilerDirectives;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;

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
  private static final Pattern BLANK_LINE_PATTERN = Pattern.compile("\\s*");
  private static final String PSEUDO_TEXT_DELIMITER = "=";
  private final MessageService messageService;

  @Inject
  public ContinuationLineTransformation(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public ResultWithErrors<List<CobolLine>> transformLines(
      String documentURI, List<CobolLine> lines) {
    List<CobolLine> result = new ArrayList<>();
    List<SyntaxError> errors = new ArrayList<>();
    CobolLine previousLine = null;
    for (int i = 0; i < lines.size(); i++) {
      CobolLine cobolLine = lines.get(i);

      ofNullable(checkContinuationLine(documentURI, i, cobolLine)).ifPresent(errors::add);
      ofNullable(checkIfStringClosedCorrectly(previousLine, documentURI, i, cobolLine))
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

      adjustBlankOrCommentLines(cobolLine);

      // check if previous statement is a compiler directive statement
      SyntaxError compilerDirectiveContinuedError =
          checkCompilerDirectiveContinued(cobolLine, uri, lineNumber);
      if (Objects.nonNull(compilerDirectiveContinuedError)) {
        return compilerDirectiveContinuedError;
      }

      // invoke method for noContentInAreaA
      return checkContentAreaAWithContinuationLine(cobolLine, uri, lineNumber);
    }
    return null;
  }

  private SyntaxError checkCompilerDirectiveContinued(
      CobolLine cobolLine, String uri, int lineNumber) {
    if (isCompilerDirectiveStatement(cobolLine)) {
      return SyntaxError.syntaxError()
          .errorSource(ErrorSource.PREPROCESSING)
          .severity(ERROR)
          .locality(
              Locality.builder()
                  .uri(uri)
                  .range(
                      new Range(
                          new Position(lineNumber, ProcessingConstants.INDICATOR_AREA),
                          new Position(lineNumber, cobolLine.toString().length())))
                  .recognizer(ContinuationLineTransformation.class)
                  .build())
          .suggestion(
              messageService.getMessage(
                  "ContinuationLineTransformation.compilerDirectiveContinued"))
          .build();
    }
    return null;
  }

  private boolean isCompilerDirectiveStatement(CobolLine line) {
    if (Objects.isNull(line.getPredecessor())) return false;
    String predecessorContentArea = line.getPredecessor().getContentArea();
    return Stream.of(CompilerDirectives.values())
            .map(CompilerDirectives::getDirective)
            .anyMatch(predecessorContentArea.split("\\s+")[0].toUpperCase()::equals)
        || isPseudoDelimiterContinued(line, predecessorContentArea);
  }

  // REF - https://www.ibm.com/support/knowledgecenter/SS6SG3_6.1.0/lr/ref/rlfmtcon.html
  // topic - Continuation of alphanumeric and national literals
  private boolean isPseudoDelimiterContinued(CobolLine line, String predecessorContentArea) {
    return StringUtils.stripEnd(StringUtils.normalizeSpace(predecessorContentArea), ",;")
        .endsWith(PSEUDO_TEXT_DELIMITER)
        && StringUtils.normalizeSpace(line.getContentArea()).startsWith(PSEUDO_TEXT_DELIMITER);
  }

  private void adjustBlankOrCommentLines(CobolLine cobolLine) {
    if (Objects.nonNull(cobolLine.getPredecessor())) {
      while (isBlankLine(cobolLine.getPredecessor())
          || cobolLine.getPredecessor().getType() == CobolLineTypeEnum.COMMENT) {
        CobolLine blankOrCommentLine = cobolLine.getPredecessor();
        cobolLine.setPredecessor(cobolLine.getPredecessor().getPredecessor());
        blankOrCommentLine.setSuccessor(cobolLine.getSuccessor());
        cobolLine.setSuccessor(blankOrCommentLine);
      }
      cobolLine.getPredecessor().setSuccessor(cobolLine);
    }
  }

  private boolean isBlankLine(CobolLine cobolLine) {
    return BLANK_LINE_PATTERN.matcher(cobolLine.toString()).matches();
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
    if (cobolLine.getType() == CobolLineTypeEnum.CONTINUATION && !StringUtils.isBlank(cobolLine.getContentAreaA())) {
      return registerContinuationLineError(uri, lineNumber, countLeadingSpaces(cobolLine.getContentAreaA()));
    }
    return null;
  }

  /** Count number of spaces between INDICATOR_AREA and CONTENT_AREA_A */
  private int countLeadingSpaces(String line) {
    int spaces = 0;
    for (char c : line.toCharArray())
      if (c == ' ')
        spaces++;
      else
        break;
    return spaces;
  }

  /**
   * Check and raise an error if indicator area A of current line is not empty and the previous line
   * doesn't end correctly.
   */
  private SyntaxError checkIfStringClosedCorrectly(
      CobolLine previousCobolLine, String uri, int lineNumber, CobolLine currentCobolLine) {
    if (isBlankLine(currentCobolLine) || currentCobolLine.getType() == CobolLineTypeEnum.COMMENT)
      return null;
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
        SyntaxError.syntaxError().errorSource(ErrorSource.PREPROCESSING)
            .locality(
                Locality.builder()
                    .uri(uri)
                    .range(
                        new Range(
                            new Position(lineNumber - 1, cobolLineTrimmedLength),
                            new Position(lineNumber - 1, cobolLineTrimmedLength + 1)))
                    .recognizer(ContinuationLineTransformation.class)
                    .build())
            .suggestion(messageService.getMessage("ContinuationLineTransformation.periodRequired"))
            .severity(ERROR)
            .build();

    LOG.debug(
        "Syntax error by ContinuationLineTransformation#registerStringClosingError: {}",
        error.toString());
    return error;
  }

  private SyntaxError registerContinuationLineError(String uri, int lineNumber, int countingSpace) {
    int startPosition = ProcessingConstants.INDICATOR_AREA + countingSpace;
    SyntaxError error =
        SyntaxError.syntaxError().errorSource(ErrorSource.PREPROCESSING)
            .locality(
                Locality.builder()
                    .uri(uri)
                    .range(
                        new Range(
                            new Position(lineNumber, startPosition),
                            new Position(
                                lineNumber, ProcessingConstants.START_INDEX_AREA_B)))
                    .recognizer(ContinuationLineTransformation.class)
                    .build())
            .suggestion(
                messageService.getMessage(
                    "ContinuationLineTransformation.continuationLineContentAreaA"))
            .severity(ERROR)
            .build();
    LOG.debug(
        "Syntax error by ContinuationLineTransformation#registerContinuationLineError: {}",
        error.toString());
    return error;
  }
}
