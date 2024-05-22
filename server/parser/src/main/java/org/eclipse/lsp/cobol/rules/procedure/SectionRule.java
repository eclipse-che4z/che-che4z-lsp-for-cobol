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
 *
 */
package org.eclipse.lsp.cobol.rules.procedure;

import org.eclipse.lsp.cobol.cst.procedure.Section;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/**
 * COBOL language grammar rule class.
 */
public class SectionRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    ctx.spaces();
    ctx.push(new Section());
    ctx.consume();
    ctx.spaces();
    ctx.consume("SECTION");
    ctx.spaces();
    ctx.optional(TokenType.NUMBER_LITERAL);
    ctx.spaces();
    ctx.consume(".");
    ctx.spaces();
    ((Section) ctx.peek()).setBodyStartToken(ctx.getLexer().peek());
    try {
      while (!CobolLanguageUtils.isNextDivisionEofOrEop(ctx)
              && !language.tryMatchRule(ParagraphRule.class, ctx)
              && !language.tryMatchRule(SectionRule.class, ctx)
              && !CobolLanguageUtils.isEndOfProgram(ctx)) {
        language.parseRule(SentenceRule.class, ctx);
        ctx.spaces();
      }
    } finally {
      ctx.popAndAttach();
    }

  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return (ctx.matchSeq(null, "SECTION", ".")
            || ctx.matchSeq(null, "SECTION", null, "."))
            && CobolLanguageUtils.isInAriaA(ctx.getLexer().peek());
  }
}
