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
package com.ca.lsp.core.cobol.preprocessor.sub.util;

import java.util.List;

import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.antlr.v4.runtime.tree.TerminalNode;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorLexer;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolHiddenTokenCollectorListenerImpl;

import lombok.experimental.UtilityClass;

@UtilityClass
public class TokenUtils {

  public String getHiddenTokensToLeft(final int tokPos, final BufferedTokenStream tokens) {
    final List<Token> refChannel =
        tokens.getHiddenTokensToLeft(tokPos, CobolPreprocessorLexer.HIDDEN);
    final StringBuilder sb = new StringBuilder();

    if (refChannel != null) {
      for (final Token refToken : refChannel) {
        final String text = refToken.getText();
        sb.append(text);
      }
    }

    return sb.toString();
  }

  public String getTextIncludingHiddenTokens(
      final ParseTree ctx, final BufferedTokenStream tokens) {
    final CobolHiddenTokenCollectorListenerImpl listener =
        new CobolHiddenTokenCollectorListenerImpl(tokens);
    final ParseTreeWalker walker = new ParseTreeWalker();
    walker.walk(listener, ctx);

    return listener.read();
  }

  public boolean isEOF(final TerminalNode node) {
    return Token.EOF == node.getSymbol().getType();
  }
}
