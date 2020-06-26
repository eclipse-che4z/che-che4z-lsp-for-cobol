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

import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorCleanerService;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.google.inject.Inject;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static java.util.Optional.ofNullable;

public class PreprocessorCleanerServiceImpl implements PreprocessorCleanerService {
  private Deque<StringBuilder> contexts = new ArrayDeque<>();
  private TokenUtils tokenUtils;

  @Inject
  public PreprocessorCleanerServiceImpl(TokenUtils tokenUtils) {
    this.tokenUtils = tokenUtils;
    contexts.push(new StringBuilder());
  }

  @Override
  @Nonnull
  public StringBuilder peek() {
    return ofNullable(contexts.peek())
        .orElseThrow(() -> new IllegalStateException("Document structure corrupted"));
  }

  @Override
  @Nullable
  public StringBuilder pop() {
    return contexts.pop();
  }

  @Override
  @Nonnull
  public StringBuilder push() {
    StringBuilder cobolDocumentContext = new StringBuilder();
    contexts.push(cobolDocumentContext);
    return cobolDocumentContext;
  }

  @Override
  public void write(@Nonnull String text) {
    peek().append(text);
  }

  @Override
  public String read() {
    return peek().toString();
  }

  @Override
  public void excludeStatementFromText(
      @Nonnull ParserRuleContext ctx, @Nonnull String tag, @Nonnull BufferedTokenStream tokens) {
    pop();
    StringBuilder documentContext = push();
    documentContext.append(tokenUtils.retrieveHiddenTextToLeft(ctx.start.getTokenIndex(), tokens));

    String linePrefix = BLANK_SEQUENCE_AREA + tag;
    excludeSpecificType(
        tag, tokenUtils.retrieveTextIncludingHiddenTokens(ctx, tokens).toUpperCase(), linePrefix);
    String content = documentContext.toString();
    pop();

    write(content);
  }

  @Override
  public void excludeSpecificType(
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
      write(lines + textSplit[1]);
    } else {
      write(lines);
    }
  }

  @Override
  public void writeToken(TerminalNode node, BufferedTokenStream tokens) {
    int tokPos = node.getSourceInterval().a;
    write(tokenUtils.retrieveHiddenTextToLeft(tokPos, tokens));

    if (tokenUtils.notEOF(node)) {
      write(node.getText());
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
}
