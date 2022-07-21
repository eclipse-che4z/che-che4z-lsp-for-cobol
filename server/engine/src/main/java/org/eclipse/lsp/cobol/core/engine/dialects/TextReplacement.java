/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.engine.TextTransformations;
import org.eclipse.lsp4j.Range;
import org.antlr.v4.runtime.tree.TerminalNode;

/**
 * The class for replacing entire ParserRuleContext's with spaces.
 * Must be replaced with TextTransformations
 */
@Deprecated
public class TextReplacement {
  private final String text;
  private TextTransformations textTransformations;
  private int textIndexPointer = 0;
  private final StringBuilder resultingText = new StringBuilder();

  public TextReplacement(TextTransformations textTransformations) {
    this.text = textTransformations.calculateExtendedText();
    this.textTransformations = textTransformations;
  }

  /**
   * Add a context which will be replaced with spaces
   * @param ctx the ANTLR context
   */
  public void addReplacementContext(ParserRuleContext ctx) {
    addReplacementContext(ctx, "");
  }
  /**
   * Add a context which will be replaced with spaces
   * @param token the ANTLR token
   */
  public void addReplacementContext(TerminalNode token) {
    String newText = text
            .substring(token.getSymbol().getStartIndex(), token.getSymbol().getStopIndex() + 1)
            .replaceAll("[^ \n]", " ");
    Range range = DialectUtils.constructRange(token);
    textTransformations.replace(range, newText);
    resultingText
            .append(text, textIndexPointer, token.getSymbol().getStartIndex())
            .append(newText);
    textIndexPointer = token.getSymbol().getStopIndex() + 1;
  }
  /**
   * Add a context which will be replaced with spaces with specified prefix
   * @param ctx the ANTLR context
   * @param prefix the prefix to inserting before the context
   */
  public void addReplacementContext(ParserRuleContext ctx, String prefix) {
    addReplacementContext(ctx, prefix, CobolDialect.FILLER);
  }
  /**
   * Add a context which will be replaced with spaces with specified prefix
   * @param ctx the ANTLR context
   * @param prefix the prefix to inserting before the context
   * @param replacement the replacement string
   */
  public void addReplacementContext(ParserRuleContext ctx, String prefix, String replacement) {
    String newText = prefix + text
            .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
            .replaceAll("[^ \n]", replacement);
    Range range = DialectUtils.constructRange(ctx);
    textTransformations.replace(range, newText);
    resultingText
        .append(text, textIndexPointer, ctx.start.getStartIndex())
        .append(newText);
    textIndexPointer = ctx.stop.getStopIndex() + 1;
  }

  /**
   * Get the text after all replacements
   * @return the replaced text
   */
  public String getResultingText() {
    resultingText.append(text.substring(textIndexPointer));
    return resultingText.toString();
  }

  /**
   * Get accumulated text transformations
   * @return text transformations
   */
  public TextTransformations getTextTransformations() {
    return textTransformations;
  }
}
