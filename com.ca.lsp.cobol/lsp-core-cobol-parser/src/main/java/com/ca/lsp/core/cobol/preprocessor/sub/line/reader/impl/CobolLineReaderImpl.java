/*
 * Copyright (c) 2019 Broadcom.
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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReader;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReaderDelegate;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;

public class CobolLineReaderImpl implements CobolLineReader {
  private static final int INDICATOR_AREA_INDEX = 6;

  private String documentURI;

  public CobolLineReaderImpl(String documentURI) {
    this.documentURI = documentURI;
  }

  @Override
  public ResultWithErrors<List<CobolLine>> processLines(
      final String lines, final CobolSourceFormat format) {
    final List<SyntaxError> errors = new ArrayList<>();
    final List<CobolLine> result = new ArrayList<>();
    try (Scanner scanner = new Scanner(lines)) {
      String currentLine;
      CobolLine lastCobolLine = null;
      int lineNumber = 0;

      while (scanner.hasNextLine()) {
        currentLine = scanner.nextLine();

        ResultWithErrors<CobolLine> output = parseLine(currentLine, lineNumber, format);

        final CobolLine currentCobolLine = output.getResult();
        errors.addAll(output.getErrors());

        currentCobolLine.setPredecessor(lastCobolLine);
        result.add(currentCobolLine);

        lineNumber++;
        lastCobolLine = currentCobolLine;
      }
    }
    return new ResultWithErrors<>(result, errors);
  }

  private ResultWithErrors<CobolLine> parseLine(
      String line, final int lineNumber, final CobolSourceFormat format) {
    final Pattern pattern = format.getPattern();

    CobolLine cobolLine = new CobolLine();

    line = getDelegate().apply(line);

    final Matcher matcher = pattern.matcher(line);
    ResultWithErrors<String> result = checkFormatCorrect(line, lineNumber, format, matcher);
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

    cobolLine.setFormat(format);
    cobolLine.setDialect(null);
    cobolLine.setNumber(lineNumber);

    return new ResultWithErrors<>(cobolLine, result.getErrors());
  }

  private CobolLineTypeEnum determineType(final String indicatorArea) {
    final CobolLineTypeEnum result;

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

  private ResultWithErrors<String> checkFormatCorrect(
      String line, final int lineNumber, final CobolSourceFormat format, final Matcher matcher) {
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
      errors.add(registerFormatError(lineNumber, format, charPosition, errorLength));
      line = line.substring(0, line.length() - errorLength);
    }
    return new ResultWithErrors<>(line, errors);
  }

  private CobolLineReaderDelegate getDelegate() {
    return new CompilerDirectivesTransformation();
  }

  private SyntaxError registerFormatError(
      int lineNumber, final CobolSourceFormat format, int charPosition, int errorLength) {
    return SyntaxError.syntaxError()
        .suggestion("This format is not a " + format.toString() + " format")
        .severity(1)
        .position(
            new Position(
                documentURI,
                charPosition,
                (charPosition + errorLength),
                lineNumber + 1,
                charPosition))
        .build();
  }
}
