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
package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.CobolParserBaseListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolHiddenTokenCollectorListenerImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.antlr.v4.runtime.tree.TerminalNode;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.Lexer.HIDDEN;
import static org.antlr.v4.runtime.Token.EOF;

/**
 * This utility class applies operations for tokens needed for syntax analysis, like extracting text
 * from sequences of tokens or retrieving their positions. It uses parsing AST for some operations
 * to collect tokens' texts.
 */
@Singleton
public class TokenUtilsImpl implements TokenUtils {

  @Nonnull
  @Override
  public String retrieveHiddenTextToLeft(int position, @Nonnull BufferedTokenStream tokens) {
    return ofNullable(tokens.getHiddenTokensToLeft(position, HIDDEN))
        .map(it -> it.stream().map(Token::getText).collect(joining()))
        .orElse("");
  }

  @Nonnull
  @Override
  public String retrieveTextIncludingHiddenTokens(
      @Nonnull ParseTree context, @Nonnull BufferedTokenStream tokens) {
    CobolHiddenTokenCollectorListenerImpl listener =
        new CobolHiddenTokenCollectorListenerImpl(this, tokens);
    ParseTreeWalker walker = new ParseTreeWalker();
    walker.walk(listener, context);

    return listener.read();
  }

  @Nonnull
  @Override
  public List<Position> retrievePositionsFromText(@Nonnull String uri, @Nonnull String code) {
    return retrieveTokens(code).getTokens().stream().map(toPosition(uri)).collect(toList());
  }

  @Override
  public boolean notEOF(@Nonnull TerminalNode node) {
    return node.getSymbol().getType() != EOF;
  }

  @Nonnull
  private CommonTokenStream retrieveTokens(@Nonnull String code) {
    CobolLexer lexer = new CobolLexer(CharStreams.fromString(code));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();

    CobolParser.StartRuleContext tree = parser.startRule();

    ParseTreeWalker walker = new ParseTreeWalker();
    walker.walk(new CobolParserBaseListener(), tree);
    return tokens;
  }

  @Nonnull
  private Function<Token, Position> toPosition(@Nonnull String uri) {
    return it ->
        new Position(
            uri,
            it.getStartIndex(),
            it.getStopIndex(),
            it.getLine(),
            it.getCharPositionInLine(),
            it.getText());
  }
}
