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
package com.ca.lsp.core.cobol.preprocessor.sub.line.transformer;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;

/**
 * Preprocessor which removes lines that contains unsupported features
 *
 * @author teman02
 */
public class CobolUnsupportedFeaturesIgnorerImpl implements CobolLinesTransformation {

  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(\\d.{0,6} +|\\s*)(CBL|PROCESS) .+");

  private PreprocessorListener listener;

  public CobolUnsupportedFeaturesIgnorerImpl(PreprocessorListener listener) {
    this.listener = listener;
  }

  @Override
  public List<CobolLine> transformLines(List<CobolLine> lines) {
    return removeLinesWithCompilerDirectives(lines);
  }

  private List<CobolLine> removeLinesWithCompilerDirectives(List<CobolLine> lines) {
    for (int i = 0; i < lines.size(); i++) {
      CobolLine line = lines.get(i);
      Matcher matcher = COMPILER_DIRECTIVE_LINE.matcher(line.toString());
      if (matcher.matches()) {
        lines.set(i, CobolLine.copyCobolLineWithEmptyContent(line));
        listener.unregisterError(i + 1);
      } else break;
    }
    return lines;
  }
}
