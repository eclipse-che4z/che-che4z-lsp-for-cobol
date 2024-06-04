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

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.cst.Skipped;
import org.eclipse.lsp.cobol.cst.base.CstNode;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.parser.hw.lexer.Token;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;


/**
 * Language related utilities.
 * FIXME: some methods doesn't belong here and should be evicted.
 */
@UtilityClass
public class CobolLanguageUtils {
  /**
   * Checks if token is in aria A.
   *
   * @param token a token to check.
   * @return true if the token is in aria A.
   */
  public boolean isInAriaA(Token token) {
    return token.getStartPositionInLine() >= 7 && token.getStartPositionInLine() <= 10;
  }

  /**
   * Check for the end of the program.
   *
   * @param ctx parsing relater api.
   * @return true if it is the end of the program.
   */
  public boolean isEndOfProgram(ParsingContext ctx) {
    return ctx.matchSeq("END", "PROGRAM");
  }

  /**
   * Mark tokens as skipped.
   * TODO: Probably it shouldn't be in utils.
   *
   * @param ctx   parsing relater api.
   * @param token a token to skip.
   */
  public void skip(ParsingContext ctx, Token token) {
    if (ctx.peek().getChildren().isEmpty()) {
      Skipped s = new Skipped();
      s.getChildren().add(token);
      ctx.peek().getChildren().add(s);
      return;
    }

    CstNode lastChild = ctx.peek().getChildren().get(ctx.peek().getChildren().size() - 1);
    if (lastChild instanceof Skipped) {
      lastChild.getChildren().add(token);
    } else {
      Skipped s = new Skipped();
      s.getChildren().add(token);
      ctx.peek().getChildren().add(s);
    }
  }

  /**
   * Check if next is division start or the end of the program.
   * TODO: Probably it shouldn't be in utils.
   *
   * @param ctx parsing relater api.
   * @return true if it is the division or eop.
   */
  public boolean isNextDivisionEofOrEop(ParsingContext ctx) {
    if (ctx.getLexer().peek().getType() == TokenType.EOF) {
      return true;
    }
    if (CobolLanguageUtils.isEndOfProgram(ctx)) {
      return true;
    }

    if (ctx.matchSeq("ID", "DIVISION", ".")) {
      return true;
    }
    if (ctx.matchSeq("IDENTIFICATION", "DIVISION", ".")) {
      return true;
    }
    if (ctx.matchSeq("ENVIRONMENT", "DIVISION", ".")) {
      return true;
    }
    if (ctx.matchSeq("DATA", "DIVISION", ".")) {
      return true;
    }
    return ctx.matchSeq("PROCEDURE", "DIVISION");
  }

}
