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
package org.eclipse.lsp.cobol.rules;

import org.eclipse.lsp.cobol.cst.SourceUnit;
import org.eclipse.lsp.cobol.parser.hw.*;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.parser.hw.lexer.Token;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;

/**
 * COBOL language grammar rule class.
 */
public class SourceUnitRule implements LanguageRule {

  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    ctx.push(new SourceUnit());
    while (ctx.getLexer().hasMore()) {
      try {
        ctx.spaces();
        if (ctx.matchSeq("IDENTIFICATION", "DIVISION") || ctx.matchSeq("ID", "DIVISION")) {
          language.parseRule(ProgramRule.class, ctx);
        } else {
          Token token = ctx.getLexer().forward();
          CobolLanguageUtils.skip(ctx, token);
          ctx.error(token, "Unknown input: '" + token.getLexeme() + "'");
        }
        ctx.spaces();
      } catch (ParseError error) {
        synchronize(ctx);
      }
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    // this implementation shouldn't be called
    return true;
  }

  private void synchronize(ParsingContext ctx) {
    CobolLexer lexer = ctx.getLexer();
    Token t = lexer.forward();
    while (t.getType() != TokenType.EOF && !isContinuationSymbol(t)) {
      CobolLanguageUtils.skip(ctx, t);
      t = lexer.forward();
    }
    if (t.getType() != TokenType.EOF) {
      CobolLanguageUtils.skip(ctx, t);
    }
  }

  private boolean isContinuationSymbol(Token t) {
    return t.getType() == TokenType.DOT;
  }

}
