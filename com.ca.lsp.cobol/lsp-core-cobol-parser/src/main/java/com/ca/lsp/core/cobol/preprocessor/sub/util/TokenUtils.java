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

package com.ca.lsp.core.cobol.preprocessor.sub.util;

import com.broadcom.lsp.domain.common.model.Position;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import java.util.List;

/**
 * This utility class applies operations for tokens needed for syntax analysis, like extracting text
 * from sequences of tokens or retrieving their positions
 */
public interface TokenUtils {
  /**
   * Retrieve hidden tokens, e.g spaces and line breaks to the left of the token position in the
   * tokens stream
   *
   * @param position - token position inside the given token stream
   * @param tokens - stream of tokens
   * @return string that contains hidden tokens' text
   */
  @Nonnull
  String retrieveHiddenTextToLeft(int position, @Nonnull BufferedTokenStream tokens);

  /**
   * Retrieve the full text of the given context including hidden tokens
   *
   * @param context - context to process
   * @param tokens - stream that contains relative tokens
   * @return string that contains full text of context
   */
  @Nonnull
  String retrieveTextIncludingHiddenTokens(
      @Nonnull ParseTree context, @Nonnull BufferedTokenStream tokens);

  /**
   * Split text into tokens and retrieve their positions
   *
   * @param uri - document URI to fill-in positions
   * @param code - text to parse
   * @return List of positions of the given text
   */
  @Nonnull
  List<Position> retrievePositionsFromText(@Nonnull String uri, @Nonnull String code);

  /**
   * Check the given node in not end of file
   *
   * @param node - terminal node to check
   * @return true if this node is not end of file
   */
  boolean notEOF(@Nonnull TerminalNode node);
}
