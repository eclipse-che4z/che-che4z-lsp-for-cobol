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
import org.eclipse.lsp.cobol.rules.procedure.IdentifierRule;
import org.eclipse.lsp.cobol.rules.procedure.SentenceRule;

/** p.432 */
public class RewriteRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("REWRITE");
      ctx.spaces();
      ctx.consume(); // record-name-1
      ctx.spaces();
      if (ctx.match("FROM")) {
        ctx.consume("FROM");
        ctx.spaces();
        language.parseRule(IdentifierRule.class, ctx);
      }
      if (ctx.match("INVALID")) {
        ctx.consume("INVALID");
        ctx.spaces();
        ctx.optional("KEY");
        ctx.spaces();
        do {
          language.parseRule(SentenceRule.class, ctx);
        } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
      }

      if (ctx.matchSeq("NOT", "INVALID")) {
        ctx.consume("NOT");
        ctx.spaces();
        ctx.consume("INVALID");
        ctx.spaces();
        ctx.optional("KEY");
        ctx.spaces();
        do {
          language.parseRule(SentenceRule.class, ctx);
        } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
      }
      ctx.optional("END-REWRITE");
      ctx.spaces();
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  private static boolean lastStatementEndsWithDot(ParsingContext ctx) {
    // TODO: it should be a better way to check it.
    return ctx.peek().toText().trim().endsWith(".");
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("REWRITE");
  }
}
