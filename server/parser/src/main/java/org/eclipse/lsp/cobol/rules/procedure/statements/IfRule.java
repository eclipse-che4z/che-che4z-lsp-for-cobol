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
import org.eclipse.lsp.cobol.rules.procedure.SentenceRule;

/** If rule */
public class IfRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("IF");
      ctx.spaces();
      language.tryParseRule(ConditionExpressionRule.class, ctx);
      ctx.optional("THEN");
      ctx.spaces();
      branch(ctx, language);
      if (ctx.match("ELSE")) {
        ctx.consume("ELSE");
        ctx.spaces();
        branch(ctx, language);
      }
      ctx.optional("END-IF");
      ctx.spaces();
      ctx.optional(".");
    } finally {
      ctx.popAndAttach();
    }
  }

  private static void branch(ParsingContext ctx, CobolLanguage language) {
    if (ctx.matchSeq("NEXT", "SENTENCE")) {
      ctx.consume("NEXT");
      ctx.spaces();
      ctx.consume("SENTENCE");
      ctx.spaces();
    } else {
      do {
        language.parseRule(SentenceRule.class, ctx);
      } while (language.tryMatchRule(SentenceRule.class, ctx)
              && !ctx.match("ELSE")
              && !lastStatementEndsWithDot(ctx));

    }
  }

  private static boolean lastStatementEndsWithDot(ParsingContext ctx) {
    // TODO: it should be a better way to check it.
    return ctx.peek().toText().trim().endsWith(".");
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("IF");
  }
}
