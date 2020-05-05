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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.parser.CobolLexer;
import com.ca.lsp.core.cobol.parser.CobolParser;
import com.ca.lsp.core.cobol.parser.CobolParserBaseListener;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolHiddenTokenCollectorListenerImpl;
import lombok.experimental.UtilityClass;
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

@UtilityClass
public class TokenUtils {

  public static String getHiddenTokensToLeft(int tokPos, BufferedTokenStream tokens) {
    return ofNullable(tokens.getHiddenTokensToLeft(tokPos, HIDDEN))
        .map(it -> it.stream().map(Token::getText).collect(joining()))
        .orElse("");
  }

  public static String getTextIncludingHiddenTokens(ParseTree ctx, BufferedTokenStream tokens) {
    CobolHiddenTokenCollectorListenerImpl listener =
        new CobolHiddenTokenCollectorListenerImpl(tokens);
    ParseTreeWalker walker = new ParseTreeWalker();
    walker.walk(listener, ctx);

    return listener.read();
  }

  public static boolean isEOF(TerminalNode node) {
    return Token.EOF == node.getSymbol().getType();
  }

  public static CommonTokenStream retrieveTokens(@Nonnull String code) {
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

  public static List<Position> convertTokensToPositions(
      @Nonnull String uri, CommonTokenStream tokens) {
    return tokens.getTokens().stream().map(toPosition(uri)).collect(toList());
  }

  private static Function<Token, Position> toPosition(@Nonnull String uri) {
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
