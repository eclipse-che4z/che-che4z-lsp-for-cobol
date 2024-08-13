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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.writer;

import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.NEWLINE;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.WS;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedTextLine;
import org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineReWriter;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * This interface describes a class that should convert a list of COBOL lines to a String for the
 * further processing
 */
public abstract class CobolLineWriter {

  /**
   * Convert a list of COBOL lines into one string
   *
   * @param lines       - list of lines
   * @param documentUri - uri of the document
   * @return a string representation of the COBOL program
   */
  public ExtendedDocument serialize(List<CobolLine> lines, String documentUri) {
    final StringBuilder sb = new StringBuilder();
    final Map<Range, ExtendedTextLine> acc = new HashMap<>();
    ExtendedTextLine clSb = null;
    Position start = null;
    lines.sort(Comparator.comparingInt(CobolLine::getNumber));
    for (final CobolLine line : lines) {
      final boolean isContinuationLine = CobolLineTypeEnum.CONTINUATION.equals(line.getType());

      if (!isContinuationLine) {
        if (start != null) {
          Position stop =
                  new Position(line.getNumber() - 1, sb.length() - sb.lastIndexOf("\n") - 1);
          Range range = new Range(start, stop);
          acc.put(range, clSb);
          clSb = null;
          start = null;
        }
        process(sb, line);
      }

      /*
       * check if there is any continuation line and try to concatenate all result them
       * without error message to be on a wrong paragraph by adding a newline for each
       * concatenated line at the end result concatenated string
       */
      if (isContinuationLine) {
        if (start == null) {
          CobolLine predecessor = line.getPredecessor();
          int col = lineString(predecessor).length();
          start = new Position(predecessor.getNumber(), col);
        }
        process(sb, line);
        String unquotedContinuedLine = removeStartingQuote(line);
        Position unquotedExtendedLinePOsition = new Position(line.getNumber(), line.toString().indexOf(unquotedContinuedLine));
        ExtendedTextLine extendedTextLine = new ExtendedTextLine(unquotedContinuedLine, unquotedExtendedLinePOsition, documentUri);
        if (Objects.nonNull(clSb))  {
          clSb.append(extendedTextLine);
        } else {
          clSb = extendedTextLine;
        }
      }
    }

    ExtendedDocument result = new ExtendedDocument(sb.toString(), documentUri);
    acc.forEach(result::replace);
    if (start != null) {
      CobolLine lastLine = lines.get(lines.size() - 1);
      Position stop = new Position(lastLine.getNumber(), sb.length() - sb.lastIndexOf("\n") - 1);
      Range range = new Range(start, stop);
      result.replace(range, clSb.toString());
    }
    result.commitTransformations();
    return result;
  }

  protected abstract CobolProgramLayout getLayout();

  private void process(StringBuilder sb, CobolLine line) {
    if (line.getNumber() > 0) {
      sb.append(NEWLINE);
    }
    sb.append(lineString(line));
  }

  private String lineString(CobolLine line) {
    StringBuilder sb = new StringBuilder();
    if (line.getType() != CobolLineTypeEnum.PREPROCESSED) {
      String blankSequenceArea = StringUtils.repeat(WS, getLayout().getSequenceLength());
      sb.append(blankSequenceArea);
    }
    sb.append(line.getIndicatorArea());
    sb.append(line.getContentArea());
    return sb.toString();
  }

  /**
   * We need to remove the opening quote from a continuation line to concatenate string correctly
   */
  private String removeStartingQuote(CobolLine line) {
    String continuation = StringUtils.stripStart(line.getContentArea(), null);
    if (CobolLineReWriter.checkStringStartsWithQuoteMark(continuation)
            && !isContinuedLineQuoted(line)) {
      continuation = continuation.substring(1);
    }
    return continuation;
  }

  private boolean isContinuedLineQuoted(CobolLine line) {
    return CobolLineReWriter.checkStringEndsWithQuoteMark(line.getPredecessor().getContentArea());
  }
}
