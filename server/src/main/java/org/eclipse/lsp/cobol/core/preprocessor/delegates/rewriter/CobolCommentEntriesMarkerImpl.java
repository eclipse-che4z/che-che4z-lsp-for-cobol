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
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.CobolLineUtils;

import lombok.NonNull;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import static java.lang.String.join;
import static java.util.regex.Pattern.CASE_INSENSITIVE;
import static java.util.regex.Pattern.compile;

/**
 * Preprocessor, which escapes the comment entries, i.e. strings that should not be processed by the
 * parser, e.g. author name.
 */
public class CobolCommentEntriesMarkerImpl implements CobolLineReWriter {

  private static final String[] TRIGGERS_START =
      new String[] {"AUTHOR.", "INSTALLATION.", "DATE-WRITTEN.", "DATE-COMPILED.", "SECURITY."};

  private static final Pattern COMMENT_ENTRY_TRIGGER_LINE =
      compile("([ \\t]*)(" + join("|", TRIGGERS_START) + ")(.+)", CASE_INSENSITIVE);

  @Override
  public List<CobolLine> processLines(@NonNull List<CobolLine> lines) {
    return lines.stream().map(this::escapeCommentEntry).collect(Collectors.toList());
  }

  /** Escapes in a given line a potential comment entry. */
  @NonNull
  private CobolLine escapeCommentEntry(@NonNull CobolLine line) {
    Matcher matcher = COMMENT_ENTRY_TRIGGER_LINE.matcher(line.getContentArea());

    if (!matcher.matches()) return line;
    String whitespace = matcher.group(1);
    String trigger = matcher.group(2);
    String commentEntry = matcher.group(3);
    String newContentArea =
        whitespace
            + trigger
            + ProcessingConstants.WS
            + ProcessingConstants.COMMENT_ENTRY_TAG
            + commentEntry;

    return CobolLineUtils.copyCobolLineWithContentArea(newContentArea, line);
  }
}
