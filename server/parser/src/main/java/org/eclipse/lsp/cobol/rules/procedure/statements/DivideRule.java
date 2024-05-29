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

/** p. 335 */
public class DivideRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("DIVIDE");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);

      ctx.or("INTO", "BY");
      ctx.spaces();

      if (ctx.matchSeq(null, "GIVING")) {
        language.parseRule(IdentifierRule.class, ctx);
        ctx.consume("GIVING");
        ctx.spaces();
      }
      idRounded(ctx, language);

      if (ctx.match("REMINDER")) {
        ctx.consume("REMINDER");
        ctx.spaces();
        language.parseRule(IdentifierRule.class, ctx);
      }

      onSizeErrorOrNot(ctx, language);
      ctx.optional("END-DIVIDE");
      ctx.spaces();
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  private void format3(ParsingContext ctx, CobolLanguage language) {
    ctx.consume("BY");
    ctx.spaces();
    language.parseRule(IdentifierRule.class, ctx);
    ctx.consume("GIVING");
    ctx.spaces();
    idRounded(ctx, language);
    onSizeErrorOrNot(ctx, language);
  }

  private static void idRounded(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(IdentifierRule.class, ctx);
      ctx.optional("ROUNDED");
      ctx.spaces();
    } while (language.tryMatchRule(IdentifierRule.class, ctx)
            && !ctx.match("REMINDER")
            && !ctx.matchSeq("SIZE", "ERROR")
            && !ctx.matchSeq("ON", "SIZE", "ERROR")
            && !ctx.matchSeq("NOT", "SIZE", "ERROR")
            && !ctx.matchSeq("NOT", "ON", "SIZE", "ERROR")
    );
  }

  private void onSizeErrorOrNot(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("ON", "SIZE")) {
      ctx.optional("ON");
      ctx.spaces();
      ctx.consume("SIZE");
      ctx.spaces();
      ctx.consume("ERROR");
      ctx.spaces();
      do {
        language.parseRule(SentenceRule.class, ctx);
      } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
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
      do {
        language.parseRule(SentenceRule.class, ctx);
      } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
    }
  }

  private static boolean lastStatementEndsWithDot(ParsingContext ctx) {
    // TODO: it should be a better way to check it.
    return ctx.peek().toText().trim().endsWith(".");
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("DIVIDE");
  }
}
