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
package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorCleanerService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;

/** @author sergiuilie */
public class PreprocessorCleanerServiceImpl implements PreprocessorCleanerService {
  private final Deque<CobolDocumentContext> contexts;

  public PreprocessorCleanerServiceImpl(Deque<CobolDocumentContext> contexts) {
    this.contexts = contexts;
  }

  public CobolDocumentContext context() {
    return contexts.peek();
  }

  public void excludeStatementFromText(
      ParserRuleContext ctx,
      String tag,
      BufferedTokenStream tokens,
      CobolPreprocessor.CobolSourceFormatEnum format) {
    // throw away EXEC SQL terminals
    pop();

    // a new context for the SQL statement
    push();

    final String textLeft = TokenUtils.getHiddenTokensToLeft(ctx.start.getTokenIndex(), tokens);
    context().write(textLeft);

    /*
     * text
     */
    final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
    final String linePrefix = CobolLine.createBlankSequenceArea(format) + tag;
    final String lines = buildLines(text, linePrefix);

    context().write(lines);

    final String content = context().read();
    pop();

    context().write(content);
  }

  private String buildLines(final String text, final String linePrefix) {
    final StringBuilder sb = new StringBuilder(text.length());
    final Scanner scanner = new Scanner(text);
    boolean firstLine = true;

    while (scanner.hasNextLine()) {
      if (!firstLine) {
        sb.append(NEWLINE);
      }

      final String line = scanner.nextLine();
      final String trimmedLine = line.trim();
      final String prefixedLine = linePrefix + WS + trimmedLine;
      final String suffixedLine = prefixedLine.replaceAll("(?i)(end-exec)", "$1 " + EXEC_END_TAG);

      sb.append(suffixedLine);
      firstLine = false;
    }

    scanner.close();
    return sb.toString();
  }

  /** Pops the current preprocessing context from the stack. */
  public CobolDocumentContext pop() {
    return contexts.pop();
  }

  /** Pushes a new preprocessing context onto the stack. */
  public CobolDocumentContext push() {
    CobolDocumentContext cobolDocumentContext = new CobolDocumentContext();
    contexts.push(new CobolDocumentContext());
    return cobolDocumentContext;
  }
}
