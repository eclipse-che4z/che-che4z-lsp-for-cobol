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

/** Perform rule at P. 412 */
public class PerformRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    // for now, it will be statement class
    ctx.push(new Statement());
    try {
      ctx.consume("PERFORM");
      ctx.spaces();

      // basic inline case
      if (language.tryMatchRule(SentenceRule.class, ctx)) {
        consumeUntilEndPerform(ctx);
        return;
      }

      if (isTimesPrefix(ctx)) {
        inlineTimes(ctx, language);
        consumeUntilEndPerform(ctx);
        return;
      }

      if (isVaryingPhrase1(ctx)) {
        phraseVarying1(ctx, language);
        consumeUntilEndPerform(ctx);
        return;
      }

      if (isUntilPhrase1(ctx)) {
        untilPhrase1(ctx, language);
        consumeUntilEndPerform(ctx);
        return;
      }

      // Out of the line case
      procedureName(ctx); // procedure-name-1 or imperative-statement-1 or integer-1
      if (ctx.match("THROUGH", "THRU")) {
        ctx.or("THROUGH", "THRU"); // "THROUGH" or "THRU"
        ctx.spaces();
        procedureName(ctx); // procedure-name-2
      }

      if (isTimesPrefix(ctx)) {
        // identifier-1 or integer-1
        language.parseRule(IdentifierRule.class, ctx);
        ctx.consume("TIMES");
        ctx.spaces();
        ctx.optional(".");
        ctx.spaces();
        return;
      }

      if (isUntilPhrase1(ctx)) {
        untilPhrase1(ctx, language);
        ctx.optional(".");
        ctx.spaces();
        return;
      }

      if (isVaryingPhrase1(ctx)) {
        phraseVarying1(ctx, language);
        // I didn't find it in language reference, but code samples show that phrase2 is optional
        if (ctx.match("AFTER")) {
          phraseVarying2(ctx, language);
        }
        ctx.optional(".");
        return;
      }

      // basic case
      ctx.optional(".");
    } finally {
      ctx.popAndAttach();
    }
  }

  private static void consumeUntilEndPerform(ParsingContext ctx) {
    while (!ctx.match("END-PERFORM")) {
      ctx.consume();
    }
    ctx.consume("END-PERFORM");
    ctx.spaces();
    ctx.optional(".");
    ctx.spaces();
  }

  private void inlineTimes(ParsingContext ctx, CobolLanguage language) {
    // identifier-1 or integer-1
    language.parseRule(IdentifierRule.class, ctx);
    ctx.consume("TIMES");
    ctx.spaces();
  }

  private static boolean isTimesPrefix(ParsingContext ctx) {
    return ctx.matchSeq(null, "TIMES") || ctx.matchSeq(null, "(", null, ")", "TIMES");
  }

  private static boolean isVaryingPhrase1(ParsingContext ctx) {
    return ctx.match("VARYING")
        || ctx.matchSeq("TEST", null, "VARYING")
        || ctx.matchSeq("WITH", "TEST", null, "VARYING");
  }

  private static boolean isUntilPhrase1(ParsingContext ctx) {
    return ctx.match("UNTIL")
        || ctx.matchSeq("TEST", null, "UNTIL")
        || ctx.matchSeq("WITH", "TEST", null, "UNTIL");
  }

  private void procedureName(ParsingContext ctx) {
    ctx.consume();
    ctx.spaces();
    if (ctx.match("OF", "IN")) {
      ctx.or("OF", "IN");
      ctx.spaces();
      ctx.consume();
      ctx.spaces();
    }
  }

  private void untilPhrase1(ParsingContext ctx, CobolLanguage language) {
    withTestBeforeAfter(ctx);
    ctx.consume("UNTIL");
    ctx.spaces();
    if (ctx.match("EXIT")) {
      ctx.consume("EXIT");
      ctx.spaces();
    } else {
      language.parseRule(ConditionExpressionRule.class, ctx);
    }
  }

  private void withTestBeforeAfter(ParsingContext ctx) {
    boolean expectTest = false;
    if (ctx.match("WITH")) {
      ctx.consume("WITH");
      ctx.spaces();
      expectTest = true;
    }
    if (ctx.match("TEST") || expectTest) {
      ctx.consume("TEST");
      ctx.spaces();
      ctx.or("BEFORE", "AFTER");
      ctx.spaces();
    }
  }

  private void phraseVarying1(ParsingContext ctx, CobolLanguage language) {
    withTestBeforeAfter(ctx);
    ctx.consume("VARYING");
    ctx.spaces();
    // identifier-2 or index-name-1
    language.parseRule(IdentifierRule.class, ctx);
    ctx.consume("FROM");
    ctx.spaces();
    // identifier-3 or index-name-2 or literal-1
    language.parseRule(IdentifierRule.class, ctx);
    ctx.consume("BY");
    ctx.spaces();
    // identifier-4 or literal-2
    language.parseRule(IdentifierRule.class, ctx);
    ctx.consume("UNTIL");
    ctx.spaces();
    language.parseRule(ConditionExpressionRule.class, ctx); // condition-1
  }

  private void phraseVarying2(ParsingContext ctx, CobolLanguage language) {
    do {
      ctx.consume("AFTER");
      ctx.spaces();
      ctx.consume(); // identifier-5 or index-name-3
      ctx.spaces();
      ctx.consume("FROM");
      ctx.spaces();
      ctx.consume(); // identifier-6 or index-name-4 or literal-3
      ctx.spaces();
      phraseVarying3(ctx, language);
    } while ((ctx.match("AFTER")));
  }

  private void phraseVarying3(ParsingContext ctx, CobolLanguage language) {
    ctx.consume("BY");
    ctx.spaces();
    ctx.consume(); // identifier-7 or literal-4
    ctx.spaces();
    ctx.consume("UNTIL");
    ctx.spaces();
    language.parseRule(ConditionExpressionRule.class, ctx); // condition-2
  }


  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.matchSeq("PERFORM");
  }
}
