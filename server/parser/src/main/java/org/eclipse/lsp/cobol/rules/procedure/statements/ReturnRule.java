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

/** p. 430 */
public class ReturnRule implements LanguageRule {

  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new Statement());
      ctx.consume("RETURN");
      ctx.spaces();
      language.parseRule(IdentifierRule.class, ctx); // file-name-1
      ctx.optional("RECORD");
      ctx.spaces();
      if (ctx.match("INTO")) {
        ctx.consume("INTO");
        ctx.spaces();
        language.parseRule(IdentifierRule.class, ctx);
      }
      if (ctx.match("AT", "END")) {
        ctx.optional("AT");
        ctx.spaces();
        ctx.consume("END");
        ctx.spaces();
        imperativeStatements(ctx, language);
      }
      if (ctx.match("NOT")) {
        ctx.consume("NOT");
        ctx.spaces();
        ctx.optional("AT");
        ctx.spaces();
        ctx.consume("END");
        imperativeStatements(ctx, language);
      }

      ctx.optional("END-RETURN");
      ctx.spaces();
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.match("RETURN");
  }

  private void imperativeStatements(ParsingContext ctx, CobolLanguage language) {
    do {
      language.parseRule(SentenceRule.class, ctx);
    } while (language.tryMatchRule(SentenceRule.class, ctx)
            && !ctx.peek().toText().trim().endsWith("."));
  }

}
