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

/** Move rule at P. 400 */
public class MoveRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    // for now, it will be statement class
    ctx.push(new Statement());
    try {
      ctx.consume("MOVE");
      ctx.spaces();
      if (ctx.match("CORRESPONDING", "CORR")) {
        ctx.consume(); // "CORRESPONDING" or "CORR"
        ctx.spaces();
      }
      ctx.consume(); // id ?
      ctx.spaces();
      ctx.consume("TO");
      ctx.spaces();
      ctx.consume(); // id ?
      ctx.spaces();
      ctx.optional(".");
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.matchSeq("PERFORM");
  }
}
