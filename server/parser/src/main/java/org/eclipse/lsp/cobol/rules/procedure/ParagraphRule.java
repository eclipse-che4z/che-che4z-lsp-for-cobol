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
import org.eclipse.lsp.cobol.parser.hw.lexer.Token;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/** COBOL language grammar rule class. */
public class ParagraphRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.spaces();
      ctx.push(new Paragraph());
      ((Paragraph) ctx.peek()).setName(ctx.consume().toText());
      ctx.spaces();
      ctx.consume(".");
      // Altered GO TO
      if (ctx.matchSeq("GO", "TO", ".") || ctx.matchSeq("GO", ".")) {
        ctx.spaces();
        ctx.consume("GO");
        ctx.spaces();
        ctx.optional("TO");
        ctx.spaces();
        ctx.consume(".");
        return;
      }

      ctx.spaces();
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
    /*
     * P.226: A user-defined word that identifies a paragraph.
     * A paragraph-name, because it can be qualified, need not be unique.
     */
    Token nameToken = ctx.getLexer().peek();
    if (!ctx.matchSeq(null, ".")) {
      return false;
    }
    if ("DECLARATIVES".equalsIgnoreCase(nameToken.getLexeme())) {
      return false;
    }
    if (!CobolLanguageUtils.isInAriaA(nameToken)) {
      return false;
    }
    return true;
            // TODO: check if keyword can be paragraph name
//            language.isUserDefinedWord(
//        ctx.getLexer().peekSeq(1, ParsingContext.SKIP_WHITESPACE_AND_NEWLINE).get(0).getLexeme());
  }
}
