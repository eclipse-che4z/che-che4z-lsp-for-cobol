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
package org.eclipse.lsp.cobol.core.engine.flavors;

import org.antlr.v4.runtime.ParserRuleContext;

import java.util.ArrayList;
import java.util.List;

/**
 * The class for replacing entire ParserRuleContext's with spaces.
 */
public class TextReplacement {
  private final String text;
  private List<ParserRuleContext> contexts = new ArrayList<>();

  public TextReplacement(String text) {
    this.text = text;
  }

  /**
   * Add a context which will be replaced with spaces
   * @param ctx the ANTLR context
   */
  public void addReplacementContest(ParserRuleContext ctx) {
    contexts.add(ctx);
  }

  /**
   * Get the text after all replacements
   * @return the replaced text
   */
  public String getResultingText() {
    int textIndexPointer = 0;
    StringBuilder resultingText = new StringBuilder();
    for (ParserRuleContext ctx: contexts) {
      resultingText
          .append(text, textIndexPointer, ctx.start.getStartIndex())
          .append(text
              .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
              .replaceAll("[^\n]", " "));
      textIndexPointer = ctx.stop.getStopIndex() + 1;
    }
    resultingText.append(text.substring(textIndexPointer));
    return resultingText.toString();
  }
}
