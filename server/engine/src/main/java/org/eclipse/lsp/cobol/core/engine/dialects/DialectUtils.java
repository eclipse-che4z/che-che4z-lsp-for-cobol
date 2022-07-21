/*
 * Copyright (c) 2022 Broadcom.
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

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Dialect utils class
 */
@UtilityClass
public class DialectUtils {
  /**
   * Construct the range from ANTLR context
   *
   * @param ctx the ANTLR context
   * @return the range
   */
  public Range constructRange(ParserRuleContext ctx) {
    return new Range(
            new Position(
                    ctx.start.getLine() - 1,
                    ctx.start.getCharPositionInLine()),
            new Position(
                    ctx.stop.getLine() - 1,
                    ctx.stop.getCharPositionInLine() + ctx.stop.getStopIndex() - ctx.stop.getStartIndex() + 1)
    );
  }

  /**
   * Construct the range from ANTLR token
   *
   * @param token the ANTLR token
   * @return the range
   */
  public Range constructRange(TerminalNode token) {
    int line = token.getSymbol().getLine();
    int inLine = token.getSymbol().getCharPositionInLine();
    return new Range(
            new Position(line - 1, inLine),
            new Position(
                    line - 1,
                    inLine + token.getSymbol().getStopIndex() - token.getSymbol().getStartIndex() + 1)
    );
  }

  /**
   * Find line column position by string index
   * @param text input string
   * @param pos position in text
   * @return position
   */
  public static Position findPosition(String text, int pos) {
    int c = 1;
    int line = 0;
    int col = 1;
    while (c <= pos) {
      if (text.charAt(c) == '\n') {
        ++line;
        col = 1;
      } else {
        ++col;
      }
      c++;
    }
    return new Position(line, col);
  }
}
