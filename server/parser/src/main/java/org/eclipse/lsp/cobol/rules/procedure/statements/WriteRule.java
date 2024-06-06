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

/** p. 471 */
public class WriteRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("WRITE");
      ctx.spaces();
      ctx.consume(); // record-name-1
      ctx.spaces();
      from(ctx, language);
      if (ctx.match("INVALID")) {
        invalidNotInvalidKey(ctx, language);
      } else {
        beforeAfter(ctx, language);
        phrase1(ctx, language);
      }
      ctx.optional("END-WRITE");
      ctx.spaces();
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  private void phrase1(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("AT", "END-OF-PAGE", "EOP")) {
      atAndImp(ctx, language);
    }
    if (ctx.match("NOT")) {
      ctx.consume("NOT");
      ctx.spaces();
      atAndImp(ctx, language);
    }
  }

  private static void atAndImp(ParsingContext ctx, CobolLanguage language) {
    ctx.optional("AT");
    ctx.spaces();
    ctx.or("END-OF-PAGE", "EOP");
    ctx.spaces();
    do {
      language.parseRule(SentenceRule.class, ctx);
    } while (language.tryMatchRule(SentenceRule.class, ctx) && !lastStatementEndsWithDot(ctx));
  }

  private void beforeAfter(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("BEFORE", "AFTER")) {
      ctx.or("BEFORE", "AFTER");
      ctx.spaces();
      ctx.optional("ADVANCING");
      ctx.spaces();
      if (ctx.match("PAGE")) {
        ctx.consume("PAGE");
        ctx.spaces();
        return;
      }
      language.parseRule(IdentifierRule.class, ctx);
      if (ctx.match("LINE", "LINES")) {
        ctx.or("LINE", "LINES");
        ctx.spaces();
      }
    }
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


  private void from(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("FROM")) {
      ctx.consume("FROM");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("WRITE");
  }
}
