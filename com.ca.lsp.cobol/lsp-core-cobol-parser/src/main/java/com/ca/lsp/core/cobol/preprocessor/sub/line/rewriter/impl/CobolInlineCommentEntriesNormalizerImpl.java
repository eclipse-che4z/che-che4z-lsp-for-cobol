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
package com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolInlineCommentEntriesNormalizer;
import com.ca.lsp.core.cobol.preprocessor.sub.util.CobolLineUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;

public class CobolInlineCommentEntriesNormalizerImpl
    implements CobolInlineCommentEntriesNormalizer {

  protected static final String DENORMALIZED_COMMENT_ENTRY_REGEX = "\\*>[^ ]";

  protected final Pattern denormalizedCommentEntryPattern =
      Pattern.compile(DENORMALIZED_COMMENT_ENTRY_REGEX);

  @Override
  public CobolLine processLine(final CobolLine line) {
    final Matcher matcher = denormalizedCommentEntryPattern.matcher(line.getContentArea());
    final CobolLine result;

    if (!matcher.find()) {
      result = line;
    } else {
      final String newContentArea = line.getContentArea().replace(COMMENT_TAG, COMMENT_TAG + WS);
      result = CobolLineUtils.copyCobolLineWithContentArea(newContentArea, line);
    }

    return result;
  }

  @Override
  public List<CobolLine> processLines(final List<CobolLine> lines) {
    final List<CobolLine> result = new ArrayList<>();

    for (final CobolLine line : lines) {
      final CobolLine processedLine = processLine(line);
      result.add(processedLine);
    }

    return result;
  }
}
