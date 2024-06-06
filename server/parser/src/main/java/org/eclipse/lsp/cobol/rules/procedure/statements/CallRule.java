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

/** p. 318 */
public class CallRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("CALL");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx);
      using(ctx, language);
      if (ctx.match("RETURNING")) {
        ctx.consume("RETURNING");
        ctx.spaces();
        language.parseRule(IdentifierRule.class, ctx);
      }
      exceptionPhrases(ctx, language);
      ctx.optional("END-CALL");
      ctx.spaces();
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  private void using(ParsingContext ctx, CobolLanguage language) {
    if (!ctx.match("USING")) {
      ctx.spaces(); // expect no spaces after using call
      return;
    }
    ctx.consume("USING");
    ctx.spaces();
    do {
      ctx.optional("BY");
      ctx.spaces();
      if (ctx.match("VALUE")) {
        usingValue(ctx, language);
      }
      if (ctx.match("CONTENT")) {
        usingContent(ctx, language);
        continue;
      }
      usingReference(ctx, language);

    } while (!language.tryMatchRule(SentenceRule.class, ctx)
        && !ctx.match("OVERFLOW", "RETURNING", "END-CALL")
        && !ctx.matchSeq("ON", "OVERFLOW")
        && ctx.getLexer().hasMore());
  }

  private void usingReference(ParsingContext ctx, CobolLanguage language) {
    ctx.optional("REFERENCE");
    ctx.spaces();
    do {
      if (ctx.match("OMITTED")) {
        ctx.consume("OMITTED");
        ctx.spaces();
        continue;
      }
      addressOffOpt(ctx);
      language.parseRule(IdentifierRule.class, ctx);
      fixedPhrase(ctx);
    } while (!usagePartOver(ctx, language));
    ctx.optional(",");
    ctx.optional(";");
    ctx.spaces();
  }

  private void usingContent(ParsingContext ctx, CobolLanguage language) {
    ctx.consume("CONTENT");
    ctx.spaces();

    do {
      if (ctx.match("OMITTED")) {
        ctx.consume("OMITTED");
        ctx.spaces();
        continue;
      }
      addressOffOpt(ctx);
      lengthOfOpt(ctx);
      language.parseRule(IdentifierRule.class, ctx);
      fixedPhrase(ctx);
    } while (!usagePartOver(ctx, language));
    ctx.optional(",");
    ctx.spaces();
  }

  private void usingValue(ParsingContext ctx, CobolLanguage language) {
    ctx.consume("VALUE");
    ctx.spaces();
    do {
      addressOffOpt(ctx);
      lengthOfOpt(ctx);

      language.parseRule(IdentifierRule.class, ctx);

    } while (!usagePartOver(ctx, language));
    ctx.optional(",");
    ctx.spaces();
  }

  private static boolean usagePartOver(ParsingContext ctx, CobolLanguage language) {
    if (ctx.matchSeq("ADDRESS", "OF")) return false;
    if (ctx.match("OMITTED")) return false;

    if (ctx.getLexer().peek().getType() == TokenType.DOT) return true;
    if (ctx.matchSeq("ON", "OVERFLOW")) return true;
    if (language.tryMatchRule(SentenceRule.class, ctx)) return true;
    return ctx.match(
        "BY", "CONTENT", "VALUE", "REFERENCE", ",", ";", "OVERFLOW", "RETURNING", "END-CALL");
  }

  private static void lengthOfOpt(ParsingContext ctx) {
    if (ctx.matchSeq("LENGTH", "OF")) {
      ctx.consume("LENGTH");
      ctx.spaces();
      ctx.consume("OF");
      ctx.spaces();
    }
  }

  private static void addressOffOpt(ParsingContext ctx) {
    if (ctx.matchSeq("ADDRESS", "OF")) {
      ctx.consume("ADDRESS");
      ctx.spaces();
      ctx.consume("OF");
      ctx.spaces();
    }
  }

  private static void addressOfOpt(ParsingContext ctx) {
    if (ctx.matchSeq("ADDRESS", "OF")) {
      ctx.consume("ADDRESS");
      ctx.spaces();
      ctx.consume("OF");
      ctx.spaces();
    }
  }

  private static void fixedPhrase(ParsingContext ctx) {
    if (ctx.matchSeq("AS", "FIXED", "LENGTH")) {
      ctx.consume("AS");
      ctx.spaces();
      ctx.consume("FIXED");
      ctx.spaces();
      ctx.consume("LENGTH");
      ctx.spaces();
      ctx.consume(); // integer-4
      ctx.spaces();
    }
  }

  private void exceptionPhrases(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("ON", "EXCEPTION", "OVERFLOW")) {
      ctx.optional("ON");
      ctx.spaces();
      if (ctx.match("EXCEPTION")) {
        ctx.consume("EXCEPTION");
        ctx.spaces();
        imperativeStatements(ctx, language);
        if (ctx.match("NOT")) {
          notExceptionPhrase(ctx, language);
        }
      }
      if (ctx.match("OVERFLOW")) {
        ctx.consume("OVERFLOW");
        ctx.spaces();
        imperativeStatements(ctx, language);
      }
    }
  }

  private void notExceptionPhrase(ParsingContext ctx, CobolLanguage language) {
    ctx.consume("NOT");
    ctx.spaces();
    ctx.optional("ON");
    ctx.spaces();
    ctx.consume("EXCEPTION");
    ctx.spaces();
    imperativeStatements(ctx, language);
  }

  private void imperativeStatements(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(SentenceRule.class, ctx);
    } while (language.tryMatchRule(SentenceRule.class, ctx)
        && !ctx.peek().toText().trim().endsWith("."));
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("CALL");
  }
}
