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

/** p. 266 */
public class ArithmeticExpressionRule implements LanguageRule {

  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    arithmeticExpression(ctx, language);
  }

  private void arithmeticExpression(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("(")) {
      ctx.consume("(");
      do {
        arithmeticExpression(ctx, language);
      } while (!ctx.match(")"));
      ctx.consume(")");
      ctx.spaces();
      // p. 267
      if (ctx.match("+", "-", "*", "/", "**")) {
        ctx.or("+", "-", "*", "/", "**");
        ctx.spaces();
        arithmeticExpression(ctx, language);
      }
      return;
    }

    if (ctx.getLexer().peek().getType() == TokenType.NUMBER_LITERAL) {
      ctx.consume();
      ctx.spaces();
    } else {
      language.parseRule(IdentifierRule.class, ctx);
    }
    // p. 267
    if (ctx.match("+", "-", "*", "/", "**")) {
      ctx.or("+", "-", "*", "/", "**");
      ctx.spaces();
      arithmeticExpression(ctx, language);
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    //  An arithmetic expression can consist of any of the following items:
    // 1. An identifier described as a numeric elementary item (including numeric functions)
    if (language.tryMatchRule(IdentifierRule.class, ctx)) {
      return true;
    }
    // 2. A numeric literal
    if (ctx.getLexer().peek().getType() == TokenType.NUMBER_LITERAL) {
      return true;
    }
    // 3. The figurative constant ZERO
    if (ctx.match("ZERO")) {
      return true;
    }
    // 4. Identifiers and literals, as defined in items 1, 2, and 3, separated by arithmetic
    // operators
    // 5. Two arithmetic expressions, as defined in items 1, 2, 3, or 4, separated by an arithmetic
    // operator
    // 6. An arithmetic expression, as defined in items 1, 2, 3, 4, or 5, enclosed in parentheses
    if (ctx.match("(")) {
      return true;
    }
    // Any arithmetic expression can be preceded by a unary operator.
    if (ctx.match("+", "-")) {
      return true;
    }
    return false;
  }
}
