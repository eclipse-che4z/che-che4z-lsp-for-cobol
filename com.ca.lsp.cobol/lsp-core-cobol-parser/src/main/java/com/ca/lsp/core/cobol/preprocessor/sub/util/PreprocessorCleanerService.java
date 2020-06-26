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
package com.ca.lsp.core.cobol.preprocessor.sub.util;

import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/**
 * This service used to exclude not needed statements from analyzing text. Exclusion applied using
 * comment tags, that shows ANTLR that the following line should not be processed.
 */
public interface PreprocessorCleanerService {
  /**
   * Exclude the given statement from text using specified comment tag.
   *
   * @param ctx - context of statement to exclude
   * @param tag - comment tag to mark the text as excluded
   * @param tokens - tokens of the processing documents to retrieve the full text of the statement
   */
  void excludeStatementFromText(
      @Nonnull ParserRuleContext ctx, @Nonnull String tag, @Nonnull BufferedTokenStream tokens);

  /**
   * Return the current preprocessing context from the stack.
   *
   * @return the accumulated content of the currently processing document level.
   */
  @Nonnull
  StringBuilder peek();

  /**
   * Pop the current preprocessing context from the stack.
   *
   * @return the accumulated content of the popped document level.
   */
  @Nullable
  StringBuilder pop();

  /**
   * Push a new preprocessing context onto the stack.
   *
   * @return the content of the new added document level.
   */
  @Nonnull
  StringBuilder push();

  /**
   * Append text to the current document level content
   *
   * @param text - string to append
   */
  void write(@Nonnull String text);

  /**
   * Read the accumulated content of the current document level
   *
   * @return string value of the current document level
   */
  String read();

  void excludeSpecificType(@Nonnull String tag, @Nonnull String text, @Nonnull String linePrefix);

  /**
   * Write given token including hidden tokens to left to the current level
   *
   * @param node - node with token to write
   * @param tokens - token stream to find hidden tokens
   */
  void writeToken(TerminalNode node, BufferedTokenStream tokens);
}
