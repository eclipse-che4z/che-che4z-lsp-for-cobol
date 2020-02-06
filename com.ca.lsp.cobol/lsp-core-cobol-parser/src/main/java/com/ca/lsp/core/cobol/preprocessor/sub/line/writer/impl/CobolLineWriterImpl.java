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
package com.ca.lsp.core.cobol.preprocessor.sub.line.writer.impl;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.CobolLineWriter;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.stream.IntStream;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.BLANK_SEQUENCE_AREA;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.NEWLINE;

public class CobolLineWriterImpl implements CobolLineWriter {

  @Override
  public String serialize(final List<CobolLine> lines) {
    final StringBuilder sb = new StringBuilder();
    int counter = 0;

    for (final CobolLine line : lines) {
      final boolean isContinuationLine = CobolLineTypeEnum.CONTINUATION.equals(line.getType());

      if (!isContinuationLine) {
        if (line.getNumber() > 0) {
          sb.append(NEWLINE);
        }
        counter = 0;
        sb.append(BLANK_SEQUENCE_AREA);
        sb.append(line.getIndicatorArea());
        sb.append(line.getContentArea());
      }

      /*
       * check if there is any continuation line and try to concatenate all of them
       * without error message to be on a wrong paragraph by adding a newline for each
       * concatenated line at the end of concatenated string
       */
      if (isContinuationLine) {
        ++counter;
        sb.append(removeStartingQuote(line));
        removeIntermediateLinebreaks(sb, counter);
        appendNewLinesAtEnd(sb, counter);
      }
    }

    return sb.toString();
  }
  /**
   * We need to remove the opening quote from a continuation line to concatenate string correctly
   */
  private String removeStartingQuote(final CobolLine line) {
    String continuation = StringUtils.stripStart(line.getContentArea(), null);
    if (continuation.startsWith("'") || continuation.startsWith("\""))
      continuation = continuation.substring(1);
    return continuation;
  }

  /**
   * Delete the newlines which are between lines for multiple continuation lines and append to the
   */
  private void removeIntermediateLinebreaks(final StringBuilder sb, int counter) {
    if (counter > 1)
      IntStream.range(0, counter - 1)
          .forEach(
              i -> sb.delete(sb.lastIndexOf(NEWLINE), sb.lastIndexOf(NEWLINE) + NEWLINE.length()));
  }

  /** Append the number of newlines at the end of concatenated string */
  private void appendNewLinesAtEnd(StringBuilder sb, int counter) {
    IntStream.range(0, counter).forEach(i -> sb.append(NEWLINE));
  }
}
