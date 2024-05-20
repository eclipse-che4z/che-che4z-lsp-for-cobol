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
package org.eclipse.lsp.cobol.rules.identification;

import org.eclipse.lsp.cobol.cst.IdentificationDivision;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/** COBOL language grammar rule class. */
public class IdentificationDivisionRule implements LanguageRule {

  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ctx.push(new IdentificationDivision());
      ctx.or("ID", "IDENTIFICATION");
      ctx.spaces();
      ctx.consume("DIVISION");
      ctx.consume(".");
      ctx.spaces();
      ctx.consume("PROGRAM-ID");
      ctx.optional(".");
      ctx.spaces();
      ((IdentificationDivision) ctx.peek()).setProgramName(ctx.getLexer().peek().getLexeme());
      ctx.consume();
      ctx.spaces();
      if (ctx.match("IS")) {
        ctx.consume("IS");
        ctx.spaces();
        ctx.or("RECURSIVE", "INITIAL", "COMMON");
        ctx.spaces();
        ctx.optional("INITIAL");
        ctx.optional("COMMON");
        ctx.optional("PROGRAM");
      } else if (ctx.match("RECURSIVE", "INITIAL")) {
        ctx.spaces();
        ctx.optional("PROGRAM");
      }
      ctx.spaces();
      ctx.optional(".");
      // Consume Identification Division Content
      while (!CobolLanguageUtils.isNextDivisionEofOrEop(ctx)) {
        ctx.consume();
      }
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    // as for now it's detected in Program rule
    return true;
  }
}
