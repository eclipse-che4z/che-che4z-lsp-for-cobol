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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReader;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReaderDelegate;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static java.util.regex.Pattern.compile;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entities; analyzes and
 * processes line indicators. This implementation checks if the lines match the given format and
 * raises an error if not.
 *
 * <p>Also, this class uses a compiler directives delegate to apply appropriate transformations.
 */
public class CobolLineReaderImpl implements CobolLineReader {
  private static final int INDICATOR_AREA_INDEX = 6;
  private static final Pattern FIXED_FORMAT_PATTERN =
      compile("^(.{6})" + INDICATOR_FIELD + "(.{0,4})(.{0,61})(.{0,8})");

  @Nonnull
  @Override
  public ResultWithErrors<List<CobolLine>> processLines(
      @Nullable String documentURI, @Nonnull String lines) {
    List<SyntaxError> errors = new ArrayList<>();
    List<CobolLine> result = new ArrayList<>();
    try (Scanner scanner = new Scanner(lines)) {
      String currentLine;
      CobolLine lastCobolLine = null;
      int lineNumber = 0;

      while (scanner.hasNextLine()) {
        currentLine = scanner.nextLine();

        ResultWithErrors<CobolLine> output = parseLine(currentLine, documentURI, lineNumber);

        CobolLine currentCobolLine = output.getResult();
        errors.addAll(output.getErrors());

        currentCobolLine.setPredecessor(lastCobolLine);
        result.add(currentCobolLine);

        lineNumber++;
        lastCobolLine = currentCobolLine;
      }
    }
    return new ResultWithErrors<>(result, errors);
  }

  @Nonnull
  private ResultWithErrors<CobolLine> parseLine(
      @Nonnull String line, @Nullable String uri, int lineNumber) {
    CobolLine cobolLine = new CobolLine();

    line = getDelegate().apply(line);

    Matcher matcher = FIXED_FORMAT_PATTERN.matcher(line);
    ResultWithErrors<String> result = checkFormatCorrect(line, uri, lineNumber, matcher);
    line = result.getResult();

    if (line.length() > 0) {
      for (int i = line.length(); i > 0; i--) {
        if (i > 72) {
          cobolLine.setCommentArea(line.substring(72, i));
          i = 73;
        } else if (i > 11) {
          cobolLine.setContentAreaB(line.substring(11, i));
          i = 12;
        } else if (i > 7) {
          cobolLine.setContentAreaA(line.substring(7, i));
          i = 8;
        } else if (i > 6) {
          String indicatorArea = line.substring(6, 7);
          cobolLine.setIndicatorArea(indicatorArea);
          cobolLine.setType(determineType(indicatorArea));
          i = 7;
        } else {
          cobolLine.setSequenceArea(line.substring(0, i));
          i = 0;
        }
      }
    }

    cobolLine.setNumber(lineNumber);

    return new ResultWithErrors<>(cobolLine, result.getErrors());
  }

  @Nonnull
  private CobolLineTypeEnum determineType(@Nonnull String indicatorArea) {
    CobolLineTypeEnum result;

    switch (indicatorArea) {
      case CHAR_D_UPPER:
      case CHAR_D_LOWER:
        result = CobolLineTypeEnum.DEBUG;
        break;
      case CHAR_MINUS:
        result = CobolLineTypeEnum.CONTINUATION;
        break;
      case CHAR_ASTERISK:
      case CHAR_SLASH:
        result = CobolLineTypeEnum.COMMENT;
        break;
      case CHAR_DOLLAR_SIGN:
        result = CobolLineTypeEnum.COMPILER_DIRECTIVE;
        break;
      case WS:
      default:
        result = CobolLineTypeEnum.NORMAL;
        break;
    }

    return result;
  }

  @Nonnull
  private ResultWithErrors<String> checkFormatCorrect(
      @Nonnull String line, @Nullable String uri, int lineNumber, @Nonnull Matcher matcher) {
    int errorLength = 0;
    int charPosition;
    List<SyntaxError> errors = new ArrayList<>();
    if (!matcher.matches() && line.length() > INDICATOR_AREA_INDEX) {
      if (matcher.lookingAt()) {
        charPosition = matcher.end();
        errorLength = line.length() - 80;
      } else {
        charPosition =
            INDICATOR_AREA_INDEX; // format error could appear at the indicator area index, for now
      }
      errors.add(registerFormatError(uri, lineNumber, charPosition, errorLength));
      line = line.substring(0, line.length() - errorLength);
    }
    return new ResultWithErrors<>(line, errors);
  }

  @Nonnull
  private CobolLineReaderDelegate getDelegate() {
    return new CompilerDirectivesTransformation();
  }

  @Nonnull
  private SyntaxError registerFormatError(
      @Nullable String uri, int lineNumber, int charPosition, int errorLength) {
    return SyntaxError.syntaxError()
        .suggestion("The line doesn't match the fixed format")
        .severity(1)
        .position(
            new Position(
                uri, charPosition, (charPosition + errorLength), lineNumber + 1, charPosition))
        .build();
  }
}
