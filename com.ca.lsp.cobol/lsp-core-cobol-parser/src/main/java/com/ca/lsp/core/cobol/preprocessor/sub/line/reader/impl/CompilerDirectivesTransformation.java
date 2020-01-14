/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl;

import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.CobolLineReaderDelegate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CompilerDirectivesTransformation implements CobolLineReaderDelegate {
  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(?i)(.{0,6} +|\\s*)(CBL|PROCESS) .+");

  @Override
  public String apply(String line) {
    final Matcher compilerConstantMatcher = COMPILER_DIRECTIVE_LINE.matcher(line);
    if (!compilerConstantMatcher.matches()) {
      return line;
    }
    line = cutTooLongString(line);
    return moveContentFromCommentArea(line);
  }

  private String cutTooLongString(String line) {
    if (line.length() == 80) {
      line = line.substring(0, 72).trim();
    }
    return line;
  }

  private String moveContentFromCommentArea(String line) {
    int index = getLineContentStart(line);
    return "       " + line.substring(index);
  }

  private int getLineContentStart(String line) {
    int cbl = line.toUpperCase().indexOf("CBL");
    int process = line.toUpperCase().indexOf("PROCESS");
    int max = Math.max(cbl, process);
    return max == -1 ? 0 : max;
  }
}
