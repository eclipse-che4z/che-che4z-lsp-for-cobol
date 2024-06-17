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
package org.eclipse.lsp.cobol.rules.procedure.statements;

import org.eclipse.lsp.cobol.cst.procedure.Statement;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.LanguageRule;
import org.eclipse.lsp.cobol.rules.procedure.ArithmeticExpressionRule;
import org.eclipse.lsp.cobol.rules.procedure.ConditionExpressionRule;
import org.eclipse.lsp.cobol.rules.procedure.IdentifierRule;
import org.eclipse.lsp.cobol.rules.procedure.SentenceRule;

/** Evaluate rule p. 340 */
public class EvaluateRule implements LanguageRule {

  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("EVALUATE");
      ctx.spaces();
      do {
        operand(ctx, language);
      } while (ctx.match("ALSO"));

      do {
        ctx.consume("WHEN");
        ctx.spaces();
        phrase(ctx, language);
        while (ctx.match("ALSO")) {
          phrase(ctx, language);
        }
        if (ctx.match("WHEN")) {
          continue;
        }
        imperativeStatments(ctx, language);
      } while (ctx.match("WHEN"));
      if (ctx.matchSeq("WHEN", "OTHER")) {
        ctx.consume("WHEN");
        ctx.spaces();
        ctx.consume("OTHER");
        ctx.spaces();
        imperativeStatments(ctx, language); // imperative-statement-2
      }
      ctx.optional("END-EVALUATE");
      ctx.spaces();
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  private static void imperativeStatments(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(SentenceRule.class, ctx);
    } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
  }

  private void operand(ParsingContext ctx, CobolLanguage language) {
    if (language.tryParseRule(ConditionExpressionRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(IdentifierRule.class, ctx).isPresent()) {
      return;
    }
    TokenType tokenType = ctx.getLexer().peek().getType();
    if (tokenType == TokenType.NUMBER_LITERAL || tokenType == TokenType.STRING_LITERAL) {
      ctx.consume();
      ctx.spaces();
    }
  }

  private void phrase(ParsingContext ctx, CobolLanguage language) {
    if (ctx.matchSeq("ANY", "TRUE", "FALSE")) {
      ctx.or("ANY", "TRUE", "FALSE");
      ctx.spaces();
      return;
    }

    language.tryParseRule(ConditionExpressionRule.class, ctx);

    ctx.optional("NOT");
    ctx.spaces();

    if (ctx.match("THROUGH", "THRU")) {
      ctx.or("THROUGH", "THRU");
      ctx.spaces();
      language.parseRule(ArithmeticExpressionRule.class, ctx);
    }
  }

  private void idOrExpr(ParsingContext ctx) {
    if (ctx.match("(")) {
      ctx.consume("(");
      ctx.spaces();
      idOrExpr(ctx);
      ctx.consume(")");
      ctx.spaces();
      return;
    }
    // p. 267
    if (ctx.match("+", "-", "*", "/", "**")) {
      ctx.or("+", "-", "*", "/", "**");
      ctx.spaces();
      idOrExpr(ctx);
      return;
    }
    ctx.consume();
    ctx.spaces();
  }

  private static boolean lastStatementEndsWithDot(ParsingContext ctx) {
    // TODO: it should be a better way to check it.
    return ctx.peek().toText().trim().endsWith(".");
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("EVALUATE");
  }
}
