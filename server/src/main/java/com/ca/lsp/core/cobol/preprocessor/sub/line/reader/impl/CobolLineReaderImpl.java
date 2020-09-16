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
package com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl;

import com.ca.lsp.core.cobol.model.Locality;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReader;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReaderDelegate;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nonnull;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import static com.ca.lsp.core.cobol.model.ErrorSeverity.ERROR;
import static com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum.*;
import static java.util.Optional.ofNullable;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entity; analyzes and
 * processes line indicators. This implementation checks if the lines match the given format and
 * raises an error if not.
 *
 * <p>Also, this class uses a compiler directives delegate to apply appropriate transformations.
 */
@Slf4j
public class CobolLineReaderImpl implements CobolLineReader {
  private static final int INDICATOR_AREA_INDEX = 6;
  private static final int MAX_LINE_LENGTH = 80;
  private static final String LONG_LINE_MSG = "Source text cannot go past column 80";
  private static final String INCORRECT_LINE_FORMAT_MSG = "Unexpected indicator area content";
  private static final Map<String, CobolLineTypeEnum> INDICATORS =
      Map.of(
          "*",
          COMMENT,
          "/",
          COMMENT,
          "d",
          DEBUG,
          "D",
          DEBUG,
          "-",
          CONTINUATION,
          "$",
          COMPILER_DIRECTIVE,
          " ",
          NORMAL);

  @Nonnull
  @Override
  public ResultWithErrors<List<CobolLine>> processLines(
      @Nonnull String documentURI, @Nonnull String lines) {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    List<CobolLine> result = new ArrayList<>();
    try (Scanner scanner = new Scanner(lines)) {
      String currentLine;
      CobolLine lastCobolLine = null;
      int lineNumber = 0;

      while (scanner.hasNextLine()) {
        currentLine = scanner.nextLine();

        ResultWithErrors<CobolLine> output = parseLine(currentLine, documentURI, lineNumber);

        CobolLine currentCobolLine = output.getResult();
        accumulatedErrors.addAll(output.getErrors());

        currentCobolLine.setPredecessor(lastCobolLine);
        result.add(currentCobolLine);

        lineNumber++;
        lastCobolLine = currentCobolLine;
      }
    }
    return new ResultWithErrors<>(result, accumulatedErrors);
  }

  @Nonnull
  private ResultWithErrors<CobolLine> parseLine(
      @Nonnull String line, @Nonnull String uri, int lineNumber) {
    CobolLine cobolLine = new CobolLine();
    line = getDelegate().apply(line);

    ResultWithErrors<String> result = checkLineLength(line, uri, lineNumber);
    String adjustedLine = result.getResult();
    List<SyntaxError> errors = new ArrayList<>(result.getErrors());

    if (adjustedLine.length() > 0) {
      for (int i = adjustedLine.length(); i > 0; i--) {
        if (i > 72) {
          cobolLine.setCommentArea(adjustedLine.substring(72, i));
          i = 73;
        } else if (i > 11) {
          cobolLine.setContentAreaB(adjustedLine.substring(11, i));
          i = 12;
        } else if (i > 7) {
          cobolLine.setContentAreaA(adjustedLine.substring(7, i));
          i = 8;
        } else if (i > 6) {
          String indicatorArea = adjustedLine.substring(6, 7);
          ResultWithErrors<CobolLineTypeEnum> type = determineType(indicatorArea, uri, lineNumber);
          cobolLine.setIndicatorArea(indicatorArea);
          cobolLine.setType(type.getResult());
          errors.addAll(type.getErrors());
          i = 7;
        } else {
          cobolLine.setSequenceArea(adjustedLine.substring(0, i));
          i = 0;
        }
      }
    }

    cobolLine.setNumber(lineNumber);

    return new ResultWithErrors<>(cobolLine, errors);
  }

  private ResultWithErrors<CobolLineTypeEnum> determineType(
      String indicatorArea, String uri, int lineNumber) {
    return ofNullable(INDICATORS.get(indicatorArea))
        .map(it -> new ResultWithErrors<>(it, List.of()))
        .orElse(
            new ResultWithErrors<>(
                NORMAL,
                List.of(
                    createError(
                        uri,
                        INCORRECT_LINE_FORMAT_MSG,
                        lineNumber,
                        INDICATOR_AREA_INDEX,
                        INDICATOR_AREA_INDEX + 1))));
  }

  @Nonnull
  private ResultWithErrors<String> checkLineLength(
      @Nonnull String line, @Nonnull String uri, int lineNumber) {
    List<SyntaxError> errors = new ArrayList<>();
    String result = line;
    if (line.length() > MAX_LINE_LENGTH) {
      errors.add(createError(uri, LONG_LINE_MSG, lineNumber, MAX_LINE_LENGTH, line.length()));
      result = line.substring(0, MAX_LINE_LENGTH);
    }
    return new ResultWithErrors<>(result, errors);
  }

  @Nonnull
  private SyntaxError createError(
      @Nonnull String uri, @Nonnull String message, int lineNumber, int start, int stop) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(message)
            .severity(ERROR)
            .locality(
                Locality.builder()
                    .uri(uri)
                    .range(
                        new Range(new Position(lineNumber, start), new Position(lineNumber, stop)))
                    .recognizer(getClass())
                    .build())
            .build();

    LOG.debug("Syntax error by CobolLineReaderImpl#registerFormatError: " + error.toString());
    return error;
  }

  @Nonnull
  private CobolLineReaderDelegate getDelegate() {
    return new CompilerDirectivesTransformation();
  }
}
