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
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/**
 * This service used to exclude not needed statements from analyzing text. Exclusion applied using
 * comment tags, that shows ANTLR that the following line should not be processed.
 */
public interface PreprocessorCleanerService {

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

  /**
   * Write given token including hidden tokens to left to the current level
   *
   * @param node - node with token to write
   * @param tokens - token stream to find hidden tokens
   */
  void writeToken(TerminalNode node, BufferedTokenStream tokens);
}
