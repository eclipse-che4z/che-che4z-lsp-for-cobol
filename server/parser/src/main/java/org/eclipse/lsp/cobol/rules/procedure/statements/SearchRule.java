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
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.LanguageRule;
import org.eclipse.lsp.cobol.rules.procedure.ConditionExpressionRule;
import org.eclipse.lsp.cobol.rules.procedure.IdentifierRule;
import org.eclipse.lsp.cobol.rules.procedure.SentenceRule;

/** p. 434 */
public class SearchRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("SEARCH");
      ctx.spaces();
      if (ctx.match("ALL")) {
        ctx.consume("ALL");
        ctx.spaces();
        format2(ctx, language);
      } else {
        format1(ctx, language);
      }
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  private void format1(ParsingContext ctx, CobolLanguage language) {
    language.parseRule(IdentifierRule.class, ctx);
    if (ctx.match("VARYING")) {
      ctx.consume("VARYING");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
    }
    atEnd(ctx, language);
    do {
      ctx.consume("WHEN");
      ctx.spaces();
      language.parseRule(ConditionExpressionRule.class, ctx);
      if (ctx.matchSeq("NEXT", "SENTENCE")) {
        ctx.consume("NEXT");
        ctx.spaces();
        ctx.consume("SENTENCE");
        ctx.spaces();
      } else {
        do {
          language.parseRule(SentenceRule.class, ctx);
        } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
      }
    } while (ctx.match("WHEN"));
    ctx.optional("END-SEARCH");
  }

  private void format2(ParsingContext ctx, CobolLanguage language) {
    language.parseRule(IdentifierRule.class, ctx);
    atEnd(ctx, language);
    ctx.consume("WHEN");
    ctx.spaces();
    // TODO: im not sure if it's really condition exptession here
    language.parseRule(ConditionExpressionRule.class, ctx);
    if (ctx.matchSeq("NEXT", "SENTENCE")) {
      ctx.consume("NEXT");
      ctx.spaces();
      ctx.consume("SENTENCE");
      ctx.spaces();
    } else {
      do {
        language.parseRule(SentenceRule.class, ctx);
      } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
    }
    ctx.optional("END-SEARCH");
  }

  private static boolean lastStatementEndsWithDot(ParsingContext ctx) {
    // TODO: it should be a better way to check it.
    return ctx.peek().toText().trim().endsWith(".");
  }

  private static void atEnd(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("AT", "END")) {
      ctx.optional("AT");
      ctx.spaces();
      ctx.consume("END");
      ctx.spaces();
      do {
        language.parseRule(SentenceRule.class, ctx);
      } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("SEARCH");
  }
}
