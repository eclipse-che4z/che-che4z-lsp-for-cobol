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
package com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.impl;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.line.rewriter.CobolLineReWriter;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.regex.Pattern;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.COMMENT_TAG;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.WS;
import static com.ca.lsp.core.cobol.preprocessor.sub.util.CobolLineUtils.copyCobolLineWithContentArea;
import static java.util.regex.Pattern.compile;
import static java.util.stream.Collectors.toList;

/**
 * The pre-processor which looks for denormalized lines and rewrites them. A line is a denormalized
 * one if it has no space after an ANTLR comment tag.
 */
public class CobolInlineCommentEntriesNormalizerImpl implements CobolLineReWriter {

  private static final Pattern DENORMALIZED_COMMENT_ENTRY = compile("\\*>[^ ]");

  /**
   * Check all the lines if they have denormalized comment entries and normalize them.
   *
   * @param lines - a list of lines to process
   * @return list of normalized lines
   */
  @Override
  @Nonnull
  public List<CobolLine> processLines(@Nonnull List<CobolLine> lines) {
    return lines.stream().map(this::normalizeLine).collect(toList());
  }

  @Nonnull
  private CobolLine normalizeLine(@Nonnull CobolLine line) {
    if (isNormal(line)) return line;
    String newContentArea = line.getContentArea().replace(COMMENT_TAG, COMMENT_TAG + WS);
    return copyCobolLineWithContentArea(newContentArea, line);
  }

  private boolean isNormal(@Nonnull CobolLine line) {
    return !DENORMALIZED_COMMENT_ENTRY.matcher(line.getContentArea()).find();
  }
}
