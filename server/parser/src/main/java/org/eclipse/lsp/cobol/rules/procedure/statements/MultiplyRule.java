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
import org.eclipse.lsp.cobol.rules.procedure.IdentifierRule;
import org.eclipse.lsp.cobol.rules.procedure.SentenceRule;

/** p. 406 */
public class MultiplyRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("MULTIPLY");
      ctx.spaces();

      language.parseRule(IdentifierRule.class, ctx);

      ctx.consume("BY");
      ctx.spaces();

      language.parseRule(IdentifierRule.class, ctx);

      ctx.optional("GIVING");
      ctx.spaces();

      if (!ctx.match("ON", "NOT", "SIZE")) {
        do {
          language.parseRule(IdentifierRule.class, ctx);
        } while (ctx.getLexer().peek().getType() != TokenType.DOT
            && ctx.getLexer().hasMore()
            && !ctx.match("ON", "NOT", "SIZE")
            && !language.tryMatchRule(SentenceRule.class, ctx));
      }

      onSizeError(ctx, language);
    } finally {
      ctx.popAndAttach();
    }
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
  }

  private void imperativeStatements(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(SentenceRule.class, ctx);
    } while (language.tryMatchRule(SentenceRule.class, ctx)
        && !ctx.peek().toText().trim().endsWith("."));
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("MULTIPLY");
  }
}
