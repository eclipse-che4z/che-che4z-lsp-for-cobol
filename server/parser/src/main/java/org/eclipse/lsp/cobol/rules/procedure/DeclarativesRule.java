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
package org.eclipse.lsp.cobol.rules.procedure;

import org.eclipse.lsp.cobol.cst.procedure.Declaratives;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/**
 * Declaratives Rule
 */
// TODO: add link to language reference document.
public class DeclarativesRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    ctx.spaces();
    ctx.push(new Declaratives());
    ctx.consume("DECLARATIVES");
    ctx.spaces();
    ctx.consume(".");
    ctx.spaces();
    try {
      while (!isDeclarativesEnd(ctx)) {
        ctx.consume();
        ctx.spaces();
      }
      ctx.spaces();
      ctx.consume("END");
      ctx.spaces();
      ctx.consume("DECLARATIVES");
      ctx.spaces();
      ctx.consume(".");
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.matchSeq("DECLARATIVES", ".")
            && CobolLanguageUtils.isInAriaA(ctx.getLexer().peek());
  }

  private boolean isDeclarativesEnd(ParsingContext ctx) {
    return ctx.matchSeq("END", "DECLARATIVES", ".");
  }
}
