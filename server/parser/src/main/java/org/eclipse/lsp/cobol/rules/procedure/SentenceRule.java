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
import org.eclipse.lsp.cobol.rules.procedure.statements.*;

/** COBOL language grammar rule class. */
// TODO: make sure if naming is fine.
public class SentenceRule implements LanguageRule {

  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    if (language.tryParseRule(AddRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(ComputeRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(DivideRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(CallRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(PerformRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(StringRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(EvaluateRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(IfRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(SearchRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(MultiplyRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(SubtractRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(StartRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(ReadRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(UnstringRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(ReturnRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(DeleteRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(WriteRule.class, ctx).isPresent()) {
      return;
    }
    if (language.tryParseRule(RewriteRule.class, ctx).isPresent()) {
      return;
    }
    //    if (language.tryParseRule(MoveRule.class, ctx).isPresent()) {
    //      return;
    //    }
    ctx.push(new Statement());
    try {
      while (!ctx.match(".")
          // This one should go away if we will have all statements implemented
          && !(ctx.match("ELSE", "WHEN") && !ctx.peek().getChildren().isEmpty())
          && !CobolLanguageUtils.isNextDivisionEofOrEop(ctx)
          && !language.tryMatchRule(ParagraphRule.class, ctx)
          && !language.tryMatchRule(SectionRule.class, ctx)
          && !CobolLanguageUtils.isEndOfProgram(ctx)) {
        ctx.consume();
        // next sentence
        if (tryMatch(ctx, language) && isEndToken(ctx)) {
          break;
        }
      }
      ctx.optional(".");
      ctx.spaces();
    } finally {
      ctx.popAndAttach();
    }
  }

  private boolean isEndToken(ParsingContext ctx) {
    return !ctx.match(
        "END-ADD",
        "END-CALL",
        "END-COMPUTE",
        "END-DELETE",
        "END-DIVIDE",
        "END-EVALUATE",
        "END-IF",
        "END-INVOKE",
        "END-JSON",
        "END-MULTIPLY",
        "END-PERFORM",
        "END-READ",
        "END-RETURN",
        "END-REWRITE" + "END-SEARCH",
        "END-START",
        "END-STRING",
        "END-SUBTRACT",
        "END-UNSTRING",
        "END-WRITE",
        "END-XML");
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    //    Decision
    if (language.tryMatchRule(IfRule.class, ctx)) {
      return true;
    }
    if (language.tryMatchRule(EvaluateRule.class, ctx)) {
      return true;
    }

    if (ctx.match("XML") && (ctx.matchSeq("XML", "GENERATE") || ctx.matchSeq("XML", "PARSE"))) {
      return true;
    }

    return ctx.match(
            // Arithmetic
            "ADD",
            "COMPUTE",
            "DIVIDE",
            "MULTIPLY",
            "SUBTRACT",
            // Data movement
            "ACCEPT", // Input-output too
            "INITIALIZE",
            "INSPECT",
            "SET",
            "MOVE",
            "STRING",
            "UNSTRING",
            // Ending
            "GOBACK",
            // Input-output
            "CLOSE",
            "DELETE",
            "DISPLAY",
            "OPEN",
            "READ",
            "REWRITE",
            "START",
            "STOP",
            "WRITE",
            // Ordering
            "ALLOCATE",
            "SORT", //  Format 1 SORT?
            "FREE",
            "MERGE",
            "RELEASE",
            "RETURN",
            // Procedure-branching
            "ALTER",
            "CONTINUE",
            "EXIT", // Format 1 EXIT?
            "PERFORM",
            // Program or method linkage
            "CALL",
            "CANCEL",
            "INVOKE",
            // Table-handling
            // Format 2 SORT (table SORT)
            "SET")
        || ctx.matchSeq("STOP", "RUN")
        || ctx.matchSeq("EXIT", "PROGRAM")
        || ctx.matchSeq("EXIT", "METHOD")
        || ctx.matchSeq("GO", "TO");
  }
}
