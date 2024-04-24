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
import org.eclipse.lsp.cobol.rules.procedure.ArithmeticExpressionRule;
import org.eclipse.lsp.cobol.rules.procedure.IdentifierRule;
import org.eclipse.lsp.cobol.rules.procedure.SentenceRule;

/** p. 330 */
public class ComputeRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("COMPUTE");
      ctx.spaces();
      ids(ctx, language);
      ctx.or("=", "EQUAL");
      ctx.spaces();
      language.parseRule(ArithmeticExpressionRule.class, ctx);
      onSizeError(ctx, language);
      end(ctx);
    } finally {
      ctx.popAndAttach();
    }
  }

  private void ids(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(IdentifierRule.class, ctx);
      ctx.optional("ROUNDED");
      ctx.spaces();
    } while (!ctx.match("=", "EQUAL") && ctx.getLexer().hasMore());
  }

  private void end(ParsingContext ctx) {
    ctx.optional("END-COMPUTE");
    ctx.spaces();
    ctx.optional(".");
    ctx.spaces();
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("COMPUTE");
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
}
