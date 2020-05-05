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
import static com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils.getHiddenTokensToLeft;
import static com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils.getTextIncludingHiddenTokens;

public class PreprocessorCleanerServiceImpl implements PreprocessorCleanerService {
  private Deque<CobolDocumentContext> contexts = new ArrayDeque<>();

  public PreprocessorCleanerServiceImpl() {
    contexts.push(new CobolDocumentContext());
  }

  public CobolDocumentContext peek() {
    return contexts.peek();
  }

  public void excludeStatementFromText(
      @Nonnull ParserRuleContext ctx, @Nonnull String tag, @Nonnull BufferedTokenStream tokens) {
    pop();
    CobolDocumentContext documentContext = push();
    documentContext.write(getHiddenTokensToLeft(ctx.start.getTokenIndex(), tokens));

    String linePrefix = BLANK_SEQUENCE_AREA + tag;
    specificTypeExclusion(tag, getTextIncludingHiddenTokens(ctx, tokens).toUpperCase(), linePrefix);
    String content = documentContext.read();
    pop();

    peek().write(content);
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
      peek().write(lines + textSplit[1]);
    } else {
      peek().write(lines);
    }
  }

  public void visitTerminal(TerminalNode node, BufferedTokenStream tokens) {
    int tokPos = node.getSourceInterval().a;
    peek().write(getHiddenTokensToLeft(tokPos, tokens));

    if (!TokenUtils.isEOF(node)) {
      peek().write(node.getText());
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
  @Nonnull
  public CobolDocumentContext push() {
    CobolDocumentContext cobolDocumentContext = new CobolDocumentContext();
    contexts.push(cobolDocumentContext);
    return cobolDocumentContext;
  }
}
