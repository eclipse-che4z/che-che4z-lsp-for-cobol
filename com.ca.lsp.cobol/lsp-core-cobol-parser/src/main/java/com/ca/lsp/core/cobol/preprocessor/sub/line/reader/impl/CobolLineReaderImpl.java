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

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
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

  private PreprocessorListener listener;
  private String documentURI;

  public CobolLineReaderImpl(PreprocessorListener listener, String documentURI) {
    this.listener = listener;
    this.documentURI = documentURI;
  }

  @Override
  public List<CobolLine> processLines(
      final String lines, final CobolSourceFormat format, final CobolParserParams params) {

    final List<CobolLine> result = new ArrayList<>();
    try (Scanner scanner = new Scanner(lines)) {
      String currentLine;
      CobolLine lastCobolLine = null;
      int lineNumber = 0;

      while (scanner.hasNextLine()) {
        currentLine = scanner.nextLine();

        final CobolLine currentCobolLine = parseLine(currentLine, lineNumber, format, params);
        currentCobolLine.setPredecessor(lastCobolLine);
        result.add(currentCobolLine);

        lineNumber++;
        lastCobolLine = currentCobolLine;
      }
    }
    return result;
  }

  @Override
  public CobolLine parseLine(
      String line,
      final int lineNumber,
      final CobolSourceFormat format,
      final CobolParserParams params) {
    final Pattern pattern = format.getPattern();

    CobolLine cobolLine = new CobolLine();

    line = getDelegate().apply(line);

    final Matcher matcher = pattern.matcher(line);
    line = checkFormatCorrect(line, lineNumber, format, matcher);

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
    cobolLine.setDialect(params.getDialect());
    cobolLine.setNumber(lineNumber);

    return cobolLine;
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

  private String checkFormatCorrect(
      String line, final int lineNumber, final CobolSourceFormat format, final Matcher matcher) {
    int errorLength = 0;
    int charPosition;
    if (!matcher.matches() && line.length() > INDICATOR_AREA_INDEX) {
      if (matcher.lookingAt()) {
        charPosition = matcher.end();
        errorLength = line.length() - 80;
      } else {
        charPosition =
            INDICATOR_AREA_INDEX; // format error could appear at the indicator area index, for now
      }
      registerFormatError(lineNumber, format, charPosition, errorLength);
      line = line.substring(0, line.length() - errorLength);
    }
    return line;
  }

  private CobolLineReaderDelegate getDelegate() {
    return new CompilerDirectivesTransformation();
  }

  private void registerFormatError(
      int lineNumber, final CobolSourceFormat format, int charPosition, int errorLength) {
    if (listener == null) return;
    listener.syntaxError(
        documentURI,
        lineNumber + 1,
        charPosition,
        "This format is not a " + format.toString() + " format",
        errorLength);
  }
}
