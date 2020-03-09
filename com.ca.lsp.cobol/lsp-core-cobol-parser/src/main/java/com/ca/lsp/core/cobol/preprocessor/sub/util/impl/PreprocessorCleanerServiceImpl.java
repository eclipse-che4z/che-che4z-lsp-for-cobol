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
package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolDocumentContext;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorCleanerService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;

public class PreprocessorCleanerServiceImpl implements PreprocessorCleanerService {
  private Deque<CobolDocumentContext> contexts = new ArrayDeque<>();

  public PreprocessorCleanerServiceImpl() {
    contexts.push(new CobolDocumentContext());
  }

  public CobolDocumentContext context() {
    return contexts.peek();
  }

  public void excludeStatementFromText(
      @Nonnull ParserRuleContext ctx, @Nonnull String tag, @Nonnull BufferedTokenStream tokens) {
    pop();
    push();

    String textLeft = TokenUtils.getHiddenTokensToLeft(ctx.start.getTokenIndex(), tokens);
    context().write(textLeft);

    String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens).toUpperCase();
    String linePrefix = BLANK_SEQUENCE_AREA + tag;
    specificTypeExclusion(tag, text, linePrefix);
    String content = context().read();
    pop();

    context().write(content);
  }

  public void specificTypeExclusion(
      @Nonnull String tag, @Nonnull String text, @Nonnull String linePrefix) {
    String[] textSplit = null;
    String lines;

    if (!tag.equals(COMMENT_TAG)) {
      textSplit = text.split("END-EXEC", 2);
      lines = buildLines(textSplit[0] + "END-EXEC", linePrefix);
    } else {
      lines = buildLines(text, linePrefix);
    }

    if (textSplit != null && textSplit.length > 1 && !textSplit[textSplit.length - 1].isEmpty()) {
      context().write(lines + textSplit[1]);
    } else {
      context().write(lines);
    }
  }

  public void visitTerminal(TerminalNode node, BufferedTokenStream tokens) {
    int tokPos = node.getSourceInterval().a;
    context().write(TokenUtils.getHiddenTokensToLeft(tokPos, tokens));

    if (!TokenUtils.isEOF(node)) {
      String text = node.getText();
      context().write(text);
    }
  }

  @Nonnull
  private String buildLines(@Nonnull String text, @Nonnull String linePrefix) {
    StringBuilder sb = new StringBuilder(text.length());
    Scanner scanner = new Scanner(text);
    boolean firstLine = true;

    while (scanner.hasNextLine()) {
      if (!firstLine) {
        sb.append(NEWLINE);
      }

      String line = scanner.nextLine();
      String trimmedLine = line.trim();
      if (!trimmedLine.isEmpty()) {
        String prefixedLine = linePrefix + WS + trimmedLine;
        String suffixedLine = prefixedLine.replaceAll("(?i)(end-exec)", "$1 " + EXEC_END_TAG);
        sb.append(suffixedLine);
      }
      firstLine = false;
    }

    scanner.close();
    return sb.toString();
  }

  /** Pops the current preprocessing context from the stack. */
  @Nullable
  public CobolDocumentContext pop() {
    return contexts.pop();
  }

  /** Pushes a new preprocessing context onto the stack. */
  @Nullable
  public CobolDocumentContext push() {
    CobolDocumentContext cobolDocumentContext = new CobolDocumentContext();
    contexts.push(new CobolDocumentContext());
    return cobolDocumentContext;
  }
}
