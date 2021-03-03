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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter;

import org.eclipse.lsp.cobol.core.model.CobolLine;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.CobolLineUtils;

import lombok.NonNull;
import java.util.List;
import java.util.regex.Pattern;

import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.COMMENT_TAG;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.WS;
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
  @NonNull
  public List<CobolLine> processLines(@NonNull List<CobolLine> lines) {
    return lines.stream().map(this::normalizeLine).collect(toList());
  }

  @NonNull
  private CobolLine normalizeLine(@NonNull CobolLine line) {
    if (isNormal(line)) return line;
    String newContentArea = line.getContentArea().replace(COMMENT_TAG, COMMENT_TAG + WS);
    return CobolLineUtils.copyCobolLineWithContentArea(newContentArea, line);
  }

  private boolean isNormal(@NonNull CobolLine line) {
    return !DENORMALIZED_COMMENT_ENTRY.matcher(line.getContentArea()).find();
  }
}
