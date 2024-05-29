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

/** p. 462 */
public class SubtractRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("SUBTRACT");
      ctx.spaces();
      if (ctx.match("CORR", "CORRESPONDING")) {
        format3(ctx, language);
        onSizeError(ctx, language);
        endOfStatement(ctx);
        return;
      }
      idOrLiteralSequence(ctx, language);
      ctx.consume("FROM");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
      if (ctx.match("GIVING")) {
        // format 2
        ctx.consume("GIVING");
        ctx.spaces();
      }
      idOrLiteralSequence(ctx, language);
      onSizeError(ctx, language);
      endOfStatement(ctx);
    } finally {
      ctx.popAndAttach();
    }
  }

  private static void endOfStatement(ParsingContext ctx) {
    ctx.optional("END-SUBTRACT");
    ctx.spaces();
    ctx.optional(".");
    ctx.spaces();
  }

  private void onSizeError(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("ON", "SIZE")) {
      ctx.optional("ON");
      ctx.spaces();
      ctx.consume("SIZE");
      ctx.spaces();
      ctx.consume("ERROR");
      ctx.spaces();
      imperativeStatements(ctx, language);
    }

    if (ctx.match("NOT")) {
      ctx.consume("NOT");
      ctx.spaces();
      ctx.optional("ON");
      ctx.spaces();
      ctx.consume("SIZE");
      ctx.spaces();
      ctx.consume("ERROR");
      ctx.spaces();
      imperativeStatements(ctx, language);
    }
  }

  private void idOrLiteralSequence(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(IdentifierRule.class, ctx);
      ctx.optional("ROUNDED");
      ctx.spaces();
    } while (!ctx.match("FROM", "GIVING", "ROUNDED", "ON", "SIZE", ".")
        && ctx.getLexer().hasMore()
        && !language.tryMatchRule(SentenceRule.class, ctx));
  }

  private void format3(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("CORR")) {
      ctx.consume("CORR");
    } else {
      ctx.consume("CORRESPONDING");
    }
    ctx.spaces();
    language.parseRule(IdentifierRule.class, ctx);
    ctx.consume("FROM");
    ctx.spaces();
    language.parseRule(IdentifierRule.class, ctx);
    ctx.optional("ROUNDED");
    ctx.spaces();
  }

  private void imperativeStatements(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(SentenceRule.class, ctx);
    } while (language.tryMatchRule(SentenceRule.class, ctx)
        && !ctx.peek().toText().trim().endsWith("."));
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("SUBTRACT");
  }
}
