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
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.ArrayDeque;
import java.util.Deque;

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
  public void writeToken(TerminalNode node, BufferedTokenStream tokens) {
    int tokPos = node.getSourceInterval().a;
    write(tokenUtils.retrieveHiddenTextToLeft(tokPos, tokens));

    if (tokenUtils.notEOF(node)) {
      write(node.getText());
    }
  }
}
