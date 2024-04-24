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

import org.eclipse.lsp.cobol.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/**
 * COBOL language grammar rule class.
 */
public class ProcedureDivisionRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    ctx.spaces();
    ctx.push(new ProcedureDivision());
    procedureDivisionHeader(ctx);
    ((ProcedureDivision) ctx.peek()).setBodyStartToken(ctx.getLexer().peek());
    try {
      if (language.tryParseRule(DeclarativesRule.class, ctx).isPresent()) {
        ctx.spaces();
      }
      while (!CobolLanguageUtils.isNextDivisionEofOrEop(ctx) && !CobolLanguageUtils.isEndOfProgram(ctx)) {
        if (language.tryMatchRule(ParagraphRule.class, ctx)) {
          language.parseRule(ParagraphRule.class, ctx);
        } else if (language.tryMatchRule(SectionRule.class, ctx)) {
          language.tryParseRule(SectionRule.class, ctx);
        } else {
          language.parseRule(SentenceRule.class, ctx);
        }
        ctx.spaces();
      }
    } finally {
      ctx.popAndAttach();
    }
  }

  private void procedureDivisionHeader(ParsingContext ctx) {
    ctx.consume("PROCEDURE");
    ctx.spaces();
    ctx.consume("DIVISION");
    ctx.spaces();
    while (!ctx.match(".")) {
      ctx.consume();
    }
    ctx.consume(".");
    ctx.spaces();
  }


  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.matchSeq("PROCEDURE", "DIVISION");
  }
}
