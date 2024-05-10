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

import org.eclipse.lsp.cobol.cst.procedure.Statement;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.CobolLanguageUtils;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/**
 * COBOL language grammar rule class.
 */
public class StatementRule implements LanguageRule {

  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    ctx.push(new Statement());
    try {
      while (!ctx.match(".")
              && !CobolLanguageUtils.isNextDivisionEofOrEop(ctx)
              && !language.tryMatchRule(ParagraphRule.class, ctx)
              && !language.tryMatchRule(SectionRule.class, ctx)
              && !CobolLanguageUtils.isEndOfProgram(ctx)) {
        ctx.consume();
      }
      ctx.optional(".");
    } finally {
      ctx.popAndAttach();
    }

  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    // For now, it can be anything.
    return true;
  }
}
