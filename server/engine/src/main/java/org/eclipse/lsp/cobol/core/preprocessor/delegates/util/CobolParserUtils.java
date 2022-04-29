/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;

import java.util.function.Function;

/**
 * The utility class for parsing a text using the CobolParser and an implementation of its listener
 */
@UtilityClass
public class CobolParserUtils {
  /**
   * Parse the text using CobolParser
   *
   * @param text the text to parse
   * @param listenerBuilder a builder for a listener of a required type
   * @param rule the grammar rule that should be used as a parent context
   * @param resultRetriever a function to retrieve a result from the listener
   * @param <T> the type of the listener
   * @param <R> The type of the expected result
   * @return the instance of listener after walking across the parser tree
   */
  public <R, T extends ParseTreeListener> R parse(
      String text,
      Function<BufferedTokenStream, T> listenerBuilder,
      Function<CobolParser, RuleContext> rule,
      Function<T, R> resultRetriever) {

    Lexer lexer = new CobolLexer(CharStreams.fromString(text));
    lexer.removeErrorListeners();

    BufferedTokenStream tokens = new CommonTokenStream(lexer);

    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();

    final T listener = listenerBuilder.apply(tokens);
    new ParseTreeWalker().walk(listener, rule.apply(parser));
    return resultRetriever.apply(listener);
  }
}
