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

/** 464 */
public class UnstringRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("UNSTRING");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
      if (ctx.match("DELIMITED")) {
        delimited(ctx, language);
      }
      ctx.consume("INTO");
      intoIds(ctx, language);
      pointer(ctx, language);
      tallying(ctx, language);
      onOverflow(ctx, language);
      endOfStatement(ctx);
    } finally {
      ctx.popAndAttach();
    }
  }

  private void onOverflow(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("ON", "OVERFLOW")) {
      ctx.optional("ON");
      ctx.spaces();
      ctx.consume("OVERFLOW");
      ctx.spaces();
      imperativeStatements(ctx, language);
    }
    if (ctx.match("NOT")) {
      ctx.consume("NOT");
      ctx.spaces();
      ctx.optional("ON");
      ctx.spaces();
      ctx.consume("OVERFLOW");
      ctx.spaces();
      imperativeStatements(ctx, language);
    }
  }

  private void tallying(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("TALLYING")) {
      ctx.consume("TALLYING");
      ctx.spaces();
      ctx.optional("IN");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
    }
  }

  private void pointer(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("WITH", "POINTER")) {
      ctx.optional("WITH");
      ctx.spaces();
      ctx.consume("POINTER");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
    }
  }

  private void intoIds(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(IdentifierRule.class, ctx);
      if (ctx.match("DELIMITER")) {
        ctx.consume("DELIMITER");
        ctx.spaces();
        ctx.optional("IN");
        ctx.spaces();
        language.parseRule(IdentifierRule.class, ctx);
      }

      if (ctx.match("COUNT")) {
        ctx.consume("COUNT");
        ctx.spaces();
        ctx.optional("IN");
        ctx.spaces();
        language.parseRule(IdentifierRule.class, ctx);
      }

    } while (!ctx.match("WITH", "POINTER", "TALLYING", "ON", "OVERFLOW", "END-UNSTRING", ".")
        && ctx.getLexer().hasMore()
        && !language.tryMatchRule(SentenceRule.class, ctx));
  }

  private void delimited(ParsingContext ctx, CobolLanguage language) {
    ctx.consume("DELIMITED");
    ctx.spaces();
    ctx.optional("BY");
    ctx.spaces();
    ctx.optional("ALL");
    ctx.spaces();
    language.parseRule(IdentifierRule.class, ctx);
    while (ctx.match("OR")) {
      ctx.consume("OR");
      ctx.spaces();
      ctx.optional("ALL");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
    }
  }

  private void endOfStatement(ParsingContext ctx) {
    ctx.optional("END-UNSTRING");
    ctx.spaces();
    ctx.optional(".");
    ctx.spaces();
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("UNSTRING");
  }

  private void imperativeStatements(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(SentenceRule.class, ctx);
    } while (language.tryMatchRule(SentenceRule.class, ctx)
        && !ctx.peek().toText().trim().endsWith("."));
  }
}
