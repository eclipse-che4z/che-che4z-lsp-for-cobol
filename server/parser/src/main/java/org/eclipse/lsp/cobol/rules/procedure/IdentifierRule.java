/*
 * Copyright (c) 2024 Broadcom.
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
 */
package org.eclipse.lsp.cobol.rules.procedure;

import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/** A rule for Identifier */
public class IdentifierRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("FUNCTION")) {
      function(ctx, language);
      return;
    }
    ctx.consume();
    ctx.spaces();
    while (ctx.match("OF", "IN")) {
      ctx.or("OF", "IN");
      ctx.spaces();
      ctx.consume();
      ctx.spaces();
    }
    if (ctx.match("(")) {
      ctx.consume("(");
      ctx.spaces();
      do {
        ctx.consume(); // indexes
        ctx.spaces();
      } while (!ctx.match(")"));
      ctx.consume(")"); // index
      ctx.spaces();
    }
  }

  private void function(ParsingContext ctx, CobolLanguage language) {
    ctx.consume("FUNCTION");
    ctx.spaces();
    ctx.consume(); // function-name-1
    ctx.spaces();
    if (ctx.match("(")) {
      ctx.consume("(");
      ctx.spaces();
      // consume arguments
      do {
        if (language.tryParseRule(ArithmeticExpressionRule.class, ctx).isPresent()) {
          continue;
        }
        ctx.consume();
        ctx.spaces();
      } while (!ctx.match(")"));
      ctx.consume(")");
      ctx.spaces();
      // TODO: what is reference-modifier?
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("FUNCTION")) {
      return true;
    }
    if (ctx.getLexer().peek().getType() == TokenType.COBOL_WORD) {
      return true;
    }
    return false;
  }
}
