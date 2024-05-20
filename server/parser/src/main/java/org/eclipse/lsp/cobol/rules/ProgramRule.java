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

import org.eclipse.lsp.cobol.cst.IdentificationDivision;
import org.eclipse.lsp.cobol.cst.ProgramUnit;
import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.data.DataDivisionRule;
import org.eclipse.lsp.cobol.rules.environment.EnvironmentDivisionRule;
import org.eclipse.lsp.cobol.rules.identification.IdentificationDivisionRule;
import org.eclipse.lsp.cobol.rules.procedure.ProcedureDivisionRule;

/** COBOL language grammar rule class. */
public class ProgramRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    try {
      ProgramUnit programUnit = new ProgramUnit();
      ctx.push(programUnit);
      language.parseRule(IdentificationDivisionRule.class, ctx);
      programUnit.setName(
          ((IdentificationDivision) ctx.peek().getChildren().get(0)).getProgramName());
      language.tryParseRule(EnvironmentDivisionRule.class, ctx);
      language.tryParseRule(DataDivisionRule.class, ctx);
      language.tryParseRule(ProcedureDivisionRule.class, ctx);

      if (ctx.matchSeq("ID", "DIVISION", ".") || ctx.matchSeq("IDENTIFICATION", "DIVISION", ".")) {
        ctx.spaces();
        language.parseRule(ProgramRule.class, ctx);
      }

      if (CobolLanguageUtils.isEndOfProgram(ctx)) {
        ctx.spaces();
        ctx.consume("END");
        ctx.spaces();
        ctx.consume("PROGRAM");
        ctx.spaces();
        ctx.consume(); // programId
        ctx.consume(".");
        ctx.spaces();
      }
    } finally {
      ctx.popAndAttach();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    return false;
  }
}
