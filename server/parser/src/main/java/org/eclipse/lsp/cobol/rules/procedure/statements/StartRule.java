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

/** p. 455 */
public class StartRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("START");
      ctx.spaces();
      ctx.consume(); // file-name-1
      ctx.spaces();
      if (ctx.match("KEY")) {
        ctx.consume("KEY");
        ctx.spaces();
        ctx.optional("IS");
        ctx.spaces();
        if (ctx.match("=", ">", ">=")) {
          ctx.or("=", ">", ">=");
          ctx.spaces();
        } else if (ctx.match("EQUAL")) {
          ctx.consume("EQUAL");
          ctx.spaces();
          ctx.optional("TO");
          ctx.spaces();
        } else if (ctx.matchSeq("NOT", "<")) {
          ctx.consume("NOT");
          ctx.spaces();
          ctx.consume("<");
          ctx.spaces();
        } else if (ctx.matchSeq("NOT", "LESS")) {
          ctx.consume("NOT");
          ctx.spaces();
          ctx.consume("LESS");
          ctx.spaces();
          ctx.optional("THAN");
          ctx.spaces();
        } else if (ctx.match("GREATER")) {
          ctx.consume("GREATER");
          ctx.spaces();
          ctx.optional("THAN");
          ctx.spaces();
          if (ctx.matchSeq("OR", "EQUAL")) {
            ctx.consume("OR");
            ctx.spaces();
            ctx.consume("EQUAL");
            ctx.spaces();
            ctx.optional("TO");
            ctx.spaces();
          }
        }
        language.parseRule(IdentifierRule.class, ctx); // data-name-1
        ctx.spaces();
      }
      invalidNotInvalidKey(ctx, language);
      ctx.optional("END-START");
      ctx.spaces();
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("START");
  }

  private void invalidNotInvalidKey(ParsingContext ctx, CobolLanguage language) {
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
  }

  private static boolean lastStatementEndsWithDot(ParsingContext ctx) {
    // TODO: it should be a better way to check it.
    return ctx.peek().toText().trim().endsWith(".");
  }
}
