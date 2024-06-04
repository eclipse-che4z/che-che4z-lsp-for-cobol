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
package org.eclipse.lsp.cobol.rules.data;

import org.eclipse.lsp.cobol.cst.DataDivision;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/**
 * COBOL language grammar rule class.
 */
public class DataDivisionRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    ctx.spaces();
    ctx.push(new DataDivision());
    ctx.consume("DATA");
    ctx.spaces();
    ctx.consume("DIVISION");
    ctx.consume(".");
    ctx.spaces();
    try {
      while (!CobolLanguageUtils.isNextDivisionEofOrEop(ctx)) {
        ctx.consume();
      }
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return ctx.matchSeq("DATA", "DIVISION", ".");
  }
}
