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

import org.eclipse.lsp.cobol.cst.procedure.Paragraph;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.parser.hw.Token;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/**
 * COBOL language grammar rule class.
 */
public class ParagraphRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    ctx.spaces();
    ctx.push(new Paragraph());
    ((Paragraph) ctx.peek()).setName(ctx.consume().get(0).getLexeme());
    ctx.spaces();
    ctx.consume(".");
    try {
      ctx.spaces();
      while (!CobolLanguageUtils.isNextDivisionEofOrEop(ctx)
              && !language.tryMatchRule(ParagraphRule.class, ctx)
              && !language.tryMatchRule(SectionRule.class, ctx)
              && !CobolLanguageUtils.isEndOfProgram(ctx)) {
        language.parseRule(StatementRule.class, ctx);
        ctx.spaces();
      }
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    Token nameToken = ctx.getLexer().peek(null).get(0);
    if (!ctx.matchSeq(null, ".")) {
      return false;
    }
    if ("DECLARATIVES".equalsIgnoreCase(nameToken.getLexeme())) {
      return false;
    }
    if (!CobolLanguageUtils.isInAriaA(nameToken)) {
      return false;
    }
    return  true;
  }
}
