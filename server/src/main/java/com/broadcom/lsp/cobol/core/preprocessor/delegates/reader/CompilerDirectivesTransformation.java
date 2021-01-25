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

package com.broadcom.lsp.cobol.core.preprocessor.delegates.reader;

import com.google.inject.Singleton;

import lombok.NonNull;
import java.util.regex.Pattern;

import static com.broadcom.lsp.cobol.core.preprocessor.ProcessingConstants.BLANK_SEQUENCE_AREA;
import static com.broadcom.lsp.cobol.core.preprocessor.ProcessingConstants.WS;

/**
 * This delegate moves the compiler directives to the content area not to let the writer cut the
 * compiler directives, that are allowed in the comment area.
 */
@Singleton
public class CompilerDirectivesTransformation implements CobolLineReaderDelegate {
  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(?i)(.{0,6} +|\\s*)(CBL|PROCESS) .+");

  @NonNull
  @Override
  public String apply(@NonNull String line) {
    return COMPILER_DIRECTIVE_LINE.matcher(line).matches()
        ? moveContentFromCommentArea(cutTooLongString(line))
        : line;
  }

  private String cutTooLongString(String line) {
    return line.length() == 80 ? line.substring(0, 72).trim() : line;
  }

  private String moveContentFromCommentArea(String line) {
    return BLANK_SEQUENCE_AREA + WS + line.substring(getLineContentStart(line));
  }

  private int getLineContentStart(String line) {
    int cbl = line.toUpperCase().indexOf("CBL");
    int process = line.toUpperCase().indexOf("PROCESS");
    int max = Math.max(cbl, process);
    return max == -1 ? 0 : max;
  }
}
