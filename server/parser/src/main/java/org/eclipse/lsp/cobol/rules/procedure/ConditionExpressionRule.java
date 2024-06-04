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

import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/** Condition rule */
public class ConditionExpressionRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    // Format 1: general relation condition P.273
    ctx.optional("NOT");
    ctx.spaces();
    conditionOperand(ctx, language);
    ctx.optional("IS");
    ctx.spaces();
    if (ctx.match(">=", "<=")) {
      ctx.or(">=", "<=");
      ctx.spaces();
      ctx.consume(); // operand-2
      ctx.spaces();
      compositeCondition(ctx, language);
      return;
    }
    ctx.optional("NOT");
    ctx.spaces();
    if (ctx.match("GREATER", "LESS")) {
      ctx.or("GREATER", "LESS");
      ctx.spaces();
      ctx.optional("THAN");
      ctx.spaces();
      if (ctx.match("OR")) {
        ctx.consume("OR");
        ctx.spaces();
        ctx.consume("EQUAL");
        ctx.spaces();
        ctx.optional("TO");
        ctx.spaces();
      }
      conditionOperand(ctx, language); // operand-2
      ctx.spaces();
      compositeCondition(ctx, language);
      return;
    }
    ctx.optional("NOT");
    ctx.spaces();
    if (ctx.match("<", ">", "=")) {
      ctx.or("<", ">", "=");
      ctx.spaces();
      ctx.spaces();
      ctx.consume(); // operand-2
      ctx.spaces();
      compositeCondition(ctx, language);
      return;
    }
    if (ctx.match("EQUAL")) {
      ctx.consume("EQUAL");
      ctx.spaces();
      ctx.optional("TO");
      ctx.spaces();
      ctx.consume(); // operand-2
      ctx.spaces();
    }
    compositeCondition(ctx, language);
  }

  private void conditionOperand(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("(")) {
      ctx.consume("(");
      do {
        conditionOperand(ctx, language);
      } while (!ctx.match(")"));
      ctx.consume(")");
      ctx.spaces();
      return;
    }
    if (ctx.match("FUNCTION")) {
      functionIdentifier(ctx);
      return;
    }
    identifier(ctx);
    // p. 267
    if (ctx.match("+", "-", "*", "/", "**")) {
      ctx.or("+", "-", "*", "/", "**");
      ctx.spaces();
      conditionOperand(ctx, language);
    }
  }

  private void compositeCondition(ParsingContext ctx, CobolLanguage language) {
    if (ctx.match("AND", "OR")) {
      ctx.or("AND", "OR");
      ctx.spaces();
      ctx.optional("NOT");
      ctx.spaces();
      conditionOperand(ctx, language); // operand-1
      ctx.optional("IS");
      ctx.spaces();
      if (ctx.match(">=", "<=")) {
        ctx.or(">=", "<=");
        ctx.spaces();
        ctx.consume(); // operand-2
        ctx.spaces();
        compositeCondition(ctx, language);
        return;
      }
      ctx.optional("NOT");
      ctx.spaces();
      if (ctx.match("GREATER", "LESS")) {
        ctx.or("GREATER", "LESS");
        ctx.spaces();
        ctx.optional("THAN");
        ctx.spaces();
        if (ctx.match("OR")) {
          ctx.consume("OR");
          ctx.spaces();
          ctx.consume("EQUAL");
          ctx.spaces();
          ctx.optional("TO");
          ctx.spaces();
        }
        ctx.consume(); // operand-2
        ctx.spaces();
        compositeCondition(ctx, language);
        return;
      }
      ctx.optional("NOT");
      ctx.spaces();
      if (ctx.match("<", ">", "=")) {
        ctx.or("<", ">", "=");
        ctx.spaces();
        ctx.spaces();
        ctx.consume(); // operand-2
        ctx.spaces();
        compositeCondition(ctx, language);
        return;
      }
      if (ctx.match("EQUAL")) {
        ctx.consume("EQUAL");
        ctx.spaces();
        ctx.optional("TO");
        ctx.spaces();
        ctx.consume(); // operand-2
        ctx.spaces();
      }
      compositeCondition(ctx, language);
    }
  }

  private void functionIdentifier(ParsingContext ctx) {
    ctx.consume("FUNCTION");
    ctx.spaces();
    ctx.consume(); // function-name-1
    ctx.spaces();
    if (ctx.match("(")) {
      ctx.spaces();
      while (!ctx.match(")")) {
        ctx.consume(); // argument-1
        ctx.spaces();
      }
      ctx.consume(")");
      ctx.spaces();
    }
    // TODO: optional reference-modifier
  }

  // TODO: move to rule?
  private void identifier(ParsingContext ctx) {
    ctx.consume();
    ctx.spaces();
    if (ctx.match("(")) {
      ctx.consume("(");
      ctx.spaces();
      do {
        ctx.consume(); // indexes
        ctx.spaces();
      } while (!ctx.match(")"));
      ctx.consume(")"); // index
      ctx.spaces();
    }
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
    // TODO TBD
    return isClassCondition(ctx);
  }

  // P. 268
  private boolean isClassCondition(ParsingContext ctx) {
    return true;
  }
}
